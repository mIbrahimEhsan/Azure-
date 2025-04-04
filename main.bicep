param location string = 'eastus'
param rgName string

module vnet1 './vnet.bicep' = {
  name: 'vnetModule1'
  scope: resourceGroup(rgName)
  params: {
    name: 'vnet-east'
    location: location
    vnetPrefix: '10.1.0.0/16'  // Hardcoded for VNet1
    infraSubnetPrefix: '10.1.1.0/24'  // Hardcoded infra subnet
    storageSubnetPrefix: '10.1.2.0/24'  // Hardcoded storage subnet
  }
}

module vnet2 './vnet.bicep' = {
  name: 'vnetModule2'
  scope: resourceGroup(rgName)
  params: {
    name: 'vnet-west'
    location: location
    vnetPrefix: '10.2.0.0/16'  // Hardcoded for VNet2
    infraSubnetPrefix: '10.2.1.0/24'  // Hardcoded infra subnet
    storageSubnetPrefix: '10.2.2.0/24'  // Hardcoded storage subnet
  }
}
