# first you have to get the distribution config file using command

# Set variables
$distributionId = "distributionId"
$domainToAdd = "domain"
$configFilePath = "PATH"


# Update CloudFront distribution configuration
aws cloudfront update-distribution --id $distributionId --distribution-config file://distribution-config.json
