<#
Default Parameters

Name                          Type                       Value
============================  =========================  ==========
adminUsername                 String                     Andrew
adminPassword                 SecureString
domainName                    String                     corp.UKTSTDOM.local
dnsPrefix                     String                     mywan
vmSize                        String                     Standard_D2s_v3
_artifactsLocation            String                     https://raw.githubusercontent.com/tayhall/Azure-DC/master/azuredeploy.json
_artifactsLocationSasToken    SecureString
location                      String                     eastus
virtualMachineName            String                     adVM
virtualNetworkName            String                     adVNET
virtualNetworkAddressRange    String                     10.0.0.0/16
inboundNatRulesName           String                     adRDPvm
networkInterfaceName          String                     adNic
privateIPAddress              String                     
subnetName                    String                     adSubnet
subnetRange                   String                     10.0.0.0/24
publicIPAddressName           String                     adPublicIP
availabilitySetName           String                     adAvailabiltySet
loadBalancerName              String                     adLoadBalancer

#>

# Inital Variables

#$projectName = Read-Host -Prompt "Enter a project name that is used to generate resource group name"
$location = "eastus"
$adminUsername = "Andrew"
$adminPassword = Read-Host -Prompt "Enter the admin password" -AsSecureString
$resourceGroupName = Read-Host -Prompt "Enter Resource Group Name"
$dnsLabelPrefix = "mbsrv1"
$existingVNETName = "adVNET"
$existingSubnetName = "adSubnet"

$templateUri = "https://raw.githubusercontent.com/tayhall/vmDomJoin/master/azuredeploy.json"

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateURI $templateUri `
    -domainPassword $adminPassword `
    -vmAdminPassword $adminPassword
    
