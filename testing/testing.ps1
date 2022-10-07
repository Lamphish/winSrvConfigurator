
Add-Type -AssemblyName PresentationFramework[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Name="Window" Height="300" Width="500" Title="VM Creater">
    <Grid Margin="10">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition/>
            <ColumnDefinition Width="Auto"/>
        </Grid.ColumnDefinitions>

        <Label Margin="3" Grid.Row="0" Grid.Column="0" Content="Available VM Switches: " Padding="10, 0, 0, 0"/>
        <TextBlock Margin="3" Grid.Row="0" Grid.Column="1" Name="output_VWSwitches" Text="test"/>

        <Label Margin="0" Grid.Row="1" Grid.Column="0" Content="VM Name: " Padding="10, 0, 0, 0" VerticalAlignment="Center"/>
        <TextBox Margin="3" Grid.Row="1" Grid.Column="1" Name="input_vmName" Text="" VerticalAlignment="Center" Background="LightGray"/>

        <Label Margin="0" Grid.Row="2" Grid.Column="0" Content="VM RAM: " Padding="10, 0, 0, 0" VerticalAlignment="Center"/>
        <TextBox Margin="3" Grid.Row="2" Grid.Column="1" Name="input_Ram" Text="" VerticalAlignment="Center"/>

        <Label Margin="0" Grid.Row="3" Grid.Column="0" Content="VM Bootdevice: " Padding="10, 0, 0, 0" VerticalAlignment="Center"/>
        <TextBox Margin="3" Grid.Row="3" Grid.Column="1" Name="input_vmBootDevice" Text="" VerticalAlignment="Center" Background="LightGray"/>

        <Label Margin="0" Grid.Row="4" Grid.Column="0" Content="VHD Path: " Padding="10, 0, 0, 0" VerticalAlignment="Center"/>
        <TextBox Margin="3" Grid.Row="4" Grid.Column="1" Name="input_vmVHDPath" Text="" VerticalAlignment="Center"/>

        <Label Margin="0" Grid.Row="5" Grid.Column="0" Content="VHD Config Path: " Padding="10, 0, 0, 0" VerticalAlignment="Center"/>
        <TextBox Margin="3" Grid.Row="5" Grid.Column="1" Name="input_configPath" Text="" VerticalAlignment="Center" Background="LightGray"/>

        <Label Margin="0" Grid.Row="6" Grid.Column="0" Content="VHD Generation: " Padding="10, 0, 0, 0" VerticalAlignment="Center"/>
        <TextBox Margin="3" Grid.Row="6" Grid.Column="1" Name="input_vmGeneration" Text="" VerticalAlignment="Center"/>

        <Label Margin="0" Grid.Row="7" Grid.Column="0" Content="VM Switch: " Padding="10, 0, 0, 0" VerticalAlignment="Center"/>
        <TextBox Margin="3" Grid.Row="7" Grid.Column="1" Name="input_vmSwitch" Text="" VerticalAlignment="Center" Background="LightGray"/>
    </Grid>
</Window>
"@

#   Read $Xaml file and load the Objects
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$window.ShowDialog()
