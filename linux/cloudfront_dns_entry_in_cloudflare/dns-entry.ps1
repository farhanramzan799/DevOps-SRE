# This script needs to be called or triggered whenever a new domain is added in cloudfront.
# Cloudflare API credentials
$email="ammar93butt@gmail.com"
$apiKey="CLOUDFLARE_API_KEY"
$zoneId="CLOUDFLARE_ZONEID"

# DNS record details
$recordType="A"
$name="$DOMAIN_NAME"  # The domain name
$content="IP_ADDRESS"  # The IP address
$ttl=120  # TTL in seconds

# Cloudflare API endpoint
$url = "https://api.cloudflare.com/client/v4/zones/$zoneId/dns_records"

# Constructing the request body
$body = @{
    type = $recordType
    name = $name
    content = $content
    ttl = $ttl
} | ConvertTo-Json

# Sending the request to Cloudflare's API
$response = Invoke-RestMethod -Uri $url -Method Post -Headers @{
    "Content-Type" = "application/json"
    "X-Auth-Email" = $email
    "X-Auth-Key" = $apiKey
} -Body $body

# Checking the response
if ($response.success -eq $true) {
    Write-Host "DNS record added successfully."
} else {
    Write-Host "Failed to add DNS record."
    Write-Host "Error message: $($response.errors[0].message)"
}
