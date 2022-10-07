###     Installing Hyper-V Feature | Creating VM Switches | Creating, configuring and starting of a VM ###

Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window">
    <Grid x:Name="Grid">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="Auto"/>
        </Grid.ColumnDefinitions>
        <TextBox x:Name = "PathTextBox"
            Width="150"
            Grid.Column="0"
            Grid.Row="0"
        />
        <Button x:Name = "ValidateButton"
            Content="Validate"
            Grid.Column="1"
            Grid.Row="0"
        />
        <Button x:Name = "RemoveButton"
            Content="Remove"
            Grid.Column="0"
            Grid.Row="1"
        />
    </Grid>
</Window>
"@
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)
$NULL = $window.ShowDialog()



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
-Path $vmPath ` #   Loaction of the VM config File <path>
-Generation $vmGeneration ` #   Generation of the VM <1, 2>
-Switch $vmSwitchName   #   Select Switch for the vm <string>


#   Start VM and connect
Start-VM -Name $vmName
vmcompute.exe
