###     Installing Hyper-V Feature | Creating VM Switches | Creating, configuring and starting of a VM ###

#   Install Hyper-V Feature
Install-WindowsFeature -Name Hyper-V -ComputerName $env:COMPUTERNAME -IncludeManagementTools -Restart

#   Get VM Switches select the Name property and Convert it to Raw string
Get-VMSwitch | Select-Object -ExpandProperty Name #Get the names of the configured switches

# create new Switch
New-VMSwitch 
-name $vmSwitchType `   #   configure Switch Type <ExternalSwtich/InternalSwitch/PrivateSwitch>
-NetAdapterName $vmSwitchName ` #   configure Switch Name <string>
# -AllowManagementOS $true  #   only used when ExternalSwitch is used

#   create new VM
New-VM  
-Name $vmName ` #   Name of the Virtual machine <string>
-MemoryStartupBytes $vmMemory ` #   Available Memory of the virtual machine <xGB>
-BootDevice $vmBootDevice ` #   the devices the VM start when booting <CD, Floppy, IDE, LegacyNetworkAdapter, Network Adapter, VHD>
-VHDPath $vmVhdPath `   #   Location of the VM <path>. "-NewVHDPath" to create a new VHD. Need for "-NewVHDSizeBytes <xGB>"to configure the size of the VHD
-Path $vmConfigPath ` #   Loaction of the VM config File <path>
-Generation $vmGeneration ` #   Generation of the VM <1, 2>
-Switch $vmSwitchName   #   Select Switch for the vm <string>

#   Start VM and connect
Start-VM -Name $vmName
vmcompute.exe
