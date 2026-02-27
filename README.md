azure-vm-template-redeployment
This project demonstrates how to deploy Azure Virtual Machines using both Bicep and ARM templates, including two deployment scenarios:

1.Deploy a new VM from an image
This scenario creates a fresh VM using a marketplace image (Windows or Linux).
It requires:

A NIC

A VNet/Subnet

Admin credentials

A VM size available in the selected region

Files:

main.bicep

main.bicepparam

2.Deploy a VM by attaching an existing OS disk (specialized VM)
This scenario recreates a VM from an existing managed OS disk.
Useful for:

VM recovery

VM migration

Rebuilding a deleted VM

Requirements:

The OS disk must be unattached

The VM size must match the disk’s generation (Gen1/Gen2)

Security type must match (Trusted Launch or Standard)

NIC must be in the same region

Files:

templateVm.json

parametersFile.json

Deployment Commands
Bicep:
bash

az deployment group create \
  --resource-group <rg> \
  --template-file main.bicep \
  --parameters main.bicepparam
  
ARM:
bash
az deployment group create \

  --resource-group <rg> \
  --template-file templateVm.json \
  --parameters parametersFile.json

Notes
Trusted Launch VMs require Gen2 OS disks.

Standard security VMs require Gen1 OS disks.

A NIC cannot be attached to more than one VM.

A managed OS disk must be unattached before redeployment.
