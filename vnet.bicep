targetScope = 'resourceGroup'

param name string
param location string
param vnetPrefix string  // Hardcoded VNet address space
param infraSubnetPrefix string  // Hardcoded infra subnet
param storageSubnetPrefix string  // Hardcoded storage subnet

resource vnet 'Microsoft.Network/virtualNetworks@2023-02-01' = {
  name: name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetPrefix  // Uses the hardcoded value (e.g., '10.1.0.0/16')
      ]
    }
    subnets: [
      {
        name: 'infra'
        properties: {
          addressPrefix: infraSubnetPrefix  // e.g., '10.1.1.0/24'
        }
      }
      {
        name: 'storage'
        properties: {
          addressPrefix: storageSubnetPrefix  // e.g., '10.1.2.0/24'
        }
      }
    ]
  }
}

output vnetId string = vnet.id
