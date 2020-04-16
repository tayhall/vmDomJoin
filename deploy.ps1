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
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"
$adminUsername = Read-Host -Prompt "Enter the virtual machine admin username"
$adminPassword = Read-Host -Prompt "Enter the admin password" -AsSecureString
#$dnsLabelPrefix = Read-Host -Prompt "Enter the DNS label prefix. The load balancers name for the PIP"
#$resourceGroupName = "${projectName}rg"

$templateUri = "https://raw.githubusercontent.com/tayhall/vmDomJoin/master/azuredeploy.json"

New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix `
    -TemplateURI $templateUri
