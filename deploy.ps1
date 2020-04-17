<#
The following script deploys a Windows 2016 datacentre server and joins it to the domain.

Default Parameters below. Set the parameter under initial variables and pass with NewResourceGroup
 deployment to chnage the defaults i.e. $vmSize = "Standard_D2s_v2" and then use -vmSize $vmSize

Name                          Type                       Value
============================  =========================  ==========
vmAdminUsername               String                     Andrew
domainUsername                String                     Andrew
vmAdminPassword               SecureString
domainPassword                SecureString
domainName                    String                     corp.UKTSTDOM.local
dnsPrefix                     String                     mywan
vmSize                        String                     Standard_D2s_v3
_artifactsLocation            String                     https://raw.githubusercontent.com/tayhall/Azure-DC/master/azuredeploy.json
_artifactsLocationSasToken    SecureString
location                      String                     Defaults to resource group location
virtualMachineName            String                     dnsLabelPrefix
existingVNETName              String                     adVNET
privateIPAddress              String                     
existingSubnetName            String                     adSubnet


#>

# Inital Variables

# Uncomment to change default settings

# $location = "eastus"
# $vmSize = "Standard_D2s_v2"
$adminUsername = "Andrew"
$adminPassword = Read-Host -Prompt "Enter the admin password" -AsSecureString
$resourceGroupName = Read-Host -Prompt "Enter Resource Group Name"
$dnsLabelPrefix = "mbsrv2"
# $existingVNETName = "adVNET"
# $existingSubnetName = "adSubnet"

$templateUri = "https://raw.githubusercontent.com/tayhall/vmDomJoin/master/azuredeploy.json"

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateURI $templateUri `
    -dnsLabelPrefix $dnsLabelPrefix `
    -domainPassword $adminPassword `
    -vmAdminPassword $adminPassword
    
