# This script will get user details from one azure subscription and add these(users and users in respective groups) in another subscription 

# Define old subscription details from which you want to get user details
$tenantId_old = "enter-tenantId"
$subscriptionId_old = "enter-subscriptionId"
$resourceGroupName_old = "enter-resourceGroup-name"
$serviceName_old = "enter-APIM-name"

# Define new subscription details in which you want to add user details
$tenantId_new = "enter-tenantId"
$subscriptionId_new = "enter-subscriptionId"
$resourceGroupName_new = "enter-resourceGroup-name"
$serviceName_new = "enter-APIM-name"

# Connect to old subscription and set context
Update-AzConfig -DefaultSubscriptionForLogin $subscriptionId_old;
Connect-AzAccount -TenantId $tenantId_old
Set-AzContext -TenantId $tenantId_old -SubscriptionId $subscriptionId_old
$apimContext_old = New-AzApiManagementContext -ResourceGroupName $resourceGroupName_old -ServiceName $serviceName_old

# Get users and their group details from old API Management instance
$users = Get-AzApiManagementUser -Context $apimContext_old
$userGroupDetails = @()

foreach ($user in $users) {
    $userGroups = Get-AzApiManagementGroup -Context $apimContext_old -UserId $user.UserId

    $userDetail = [PSCustomObject]@{
        UserId   = $user.UserId
        UserName = $user.Name
        Email    = $user.Email
        FirstName = $user.FirstName
        LastName  = $user.LastName
        Groups   = $userGroups | Select-Object -Property GroupName, GroupId
    }

    $userGroupDetails += $userDetail
}

# Switch to new subscription and set context
Update-AzConfig -DefaultSubscriptionForLogin $subscriptionId_new;
Connect-AzAccount -TenantId $tenantId_new
Set-AzContext -TenantId $tenantId_new -SubscriptionId $subscriptionId_new
$apimContext_new = New-AzApiManagementContext -ResourceGroupName $resourceGroupName_new -ServiceName $serviceName_new

# Function to ensure user exists in the new instance
function Ensure-UserExists {
    param (
        [Parameter(Mandatory = $true)]
        [PSCustomObject] $user,
        
        [Parameter(Mandatory = $true)]
        [Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementContext] $apimContext
    )

    try {
        $existingUser = Get-AzApiManagementUser -Context $apimContext -UserId $user.UserId
    } catch {
        $existingUser = $null
    }

    if ($null -eq $existingUser) {
        Write-Output "Creating user $($user.UserId) in the new subscription."

        try {
            New-AzApiManagementUser -Context $apimContext -UserId $user.UserId -Email $user.Email -FirstName $user.FirstName -LastName $user.LastName -Password (ConvertTo-SecureString -String "TemporaryPassword123!" -AsPlainText -Force)
            Write-Output "User $($user.UserId) created successfully in the new subscription."
        } catch {
            Write-Error "Failed to create user $($user.UserId) in the new subscription: $_"
        }
    } else {
        Write-Output "User $($user.UserId) already exists in the new subscription."
    }
}

# Loop through each user and add them to the new instance
foreach ($userDetail in $userGroupDetails) {
    Ensure-UserExists -user $userDetail -apimContext $apimContext_new

    foreach ($group in $userDetail.Groups) {
        try {
            Add-AzApiManagementUserToGroup -Context $apimContext_new -UserId $userDetail.UserId -GroupId $group.GroupId
            Write-Output "Added user $($userDetail.UserId) to group $($group.GroupName) in the new subscription."
        } catch {
            Write-Error "Failed to add user $($userDetail.UserId) to group $($group.GroupName) in the new subscription: $_"
        }
    }
}