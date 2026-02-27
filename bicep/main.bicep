param vmName string
param location string = resourceGroup().location
param existingOsDiskId string
param nicName string
param vmSize string = 'Standard_B2s'
param osType string = 'Windows' // or 'Linux'

resource existingNic 'Microsoft.Network/networkInterfaces@2023-05-01' existing = {
  name: nicName
}

resource vm 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: vmName
  location: location

  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }

    securityProfile: {
      securityType: 'TrustedLaunch'
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
    }

   storageProfile: {
  osDisk: {
    createOption: 'Attach'
    osType: osType
    caching: 'ReadWrite'
    managedDisk: {
      id: existingOsDiskId
    }
  }
}

    networkProfile: {
      networkInterfaces: [
        {
          id: existingNic.id
        }
      ]
    }
  }
}
