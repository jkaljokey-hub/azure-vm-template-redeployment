# azure-vm-attach-osdisk
Overview
This project to deploy Azure using ARM templates demonstrates how Virtual Machines:

Deploying a region**

Deploy in two scenarios VM in the **samedifferent regioning a VM in a ****

Attaching an existing OS disk to a new VM (specialized VM deployment)

The goal is to show how Infrastructure‑as‑Code (IaC) can disaster‑recovery automate VM recovery, migration, and scenarios using Azure Resource Manager (ARM) templates.

Architecture covers three deployment Summary
This project1. Deploy a VM in patterns:

** the same region**
A standard ARMnet

Network Security deployment that creates:

Virtual Network

Sub Group

Public

Virtual Machine IP

Network Interface (from image or existing disk)

**2. different region scenario where:
Deploy a VM in a**
A cross‑region- The OS disk is copied to another region

A new the target region VM is deployed in

The copied OS as the VM’s OS disk disk is attached

This simulates** or **region migration OS disk to a new a disaster recovery workflow.

3. Attach an existing VM
This scenario uses:

createOption: Attach

No osProfile

No imageReference

This creates a specialized VM an existing OS disk Used
