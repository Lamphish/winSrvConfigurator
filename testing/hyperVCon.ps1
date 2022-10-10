# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a new form
$vmCreator = New-Object System.Windows.Forms.Form

# Define Size, title and background color of the Object
$vmCreator.ClientSize = "600, 300"
$vmCreator.Text = "Hyper V Configurator"
$vmCreator.BackColor = "#ffffff"

# Label vmName
$vmName = New-Object System.Windows.Forms.Label
$vmName.Text = "VM Name: "
$vmName.location = New-Object System.Drawing.Point(10,10)
$vmName.Size = "200, 25"
$vmName.Font = "Segoe UI, 12"
$vmName.BackColor = "#f00088"
$vmName.BorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

# Textbox vmName
$vmNameTxtbox = New-Object system.Windows.Forms.TextBox
$vmNameTxtbox.location = New-Object System.Drawing.Point(220,10)
$vmNameTxtbox.Size = "370, 25"
$vmNameTxtbox.Font = 'Segoe UI ,12'
$vmNameTxtbox.Visible = $true
$vmNameTxtbox.multiline = $false

# Label vmRAM
$vmRam = New-Object System.Windows.Forms.Label
$vmRam.Text = "VM RAM: "
$vmRam.location = New-Object System.Drawing.Point(10, 41)
$vmRam.Size = "200, 25"
$vmRam.Font = "Segoe UI, 12"
$vmRam.BackColor = "#f00088"
$vmRam.BorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

# Textbox vmRAM
$vmRamTxtbox = New-Object system.Windows.Forms.TextBox
$vmRamTxtbox.location = New-Object System.Drawing.Point(220, 41)
$vmRamTxtbox.Size = "370, 25"
$vmRamTxtbox.Font = 'Segoe UI ,12'
$vmRamTxtbox.Visible = $true
$vmRamTxtbox.multiline = $false

# Label vmBootDevice
$vmBootDevice = New-Object System.Windows.Forms.Label
$vmBootDevice.Text = "VM BootDevice: "
$vmBootDevice.location = New-Object System.Drawing.Point(10, 72)
$vmBootDevice.Size = "200, 25"
$vmBootDevice.Font = "Segoe UI, 12"
$vmBootDevice.BackColor = "#f00088"
$vmBootDevice.BorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

# Dropdown vmBootDevice
$vmBootDeviceCmbBox                     = New-Object system.Windows.Forms.ComboBox
$vmBootDeviceCmbBox.text                = "test"
$vmBootDeviceCmbBox.Size                = "370, 25"
@('CD', 'Floppy', 'IDE', 'LegacyNetworkAdapter', 'Network Adapter', 'VHD') | 
ForEach-Object {[void] $vmBootDeviceCmbBox.Items.Add($_)}
$vmBootDeviceCmbBox.SelectedIndex       = 0
$vmBootDeviceCmbBox.location            = New-Object System.Drawing.Point(220,73)
$vmBootDeviceCmbBox.Font                = 'Microsoft Sans Serif,10'
$vmBootDeviceCmbBox.Visible             = $true

# Label vhdPath
$vhdPath = New-Object System.Windows.Forms.Label
$vhdPath.Text = "VHD Path: "
$vhdPath.location = New-Object System.Drawing.Point(10, 103)
$vhdPath.Size = "200, 25"
$vhdPath.Font = "Segoe UI, 12"
$vhdPath.BackColor = "#f00088"
$vhdPath.BorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

# Textbox vhdPath
$vhdPathTxtbox = New-Object system.Windows.Forms.TextBox
$vhdPathTxtbox.location = New-Object System.Drawing.Point(220, 103)
$vhdPathTxtbox.Size = "370, 25"
$vhdPathTxtbox.Font = 'Segoe UI ,12'
$vhdPathTxtbox.Visible = $true
$vhdPathTxtbox.multiline = $false

# Label vhdConfigPath
$vhdConfigPath = New-Object System.Windows.Forms.Label
$vhdConfigPath.Text = "VHD Config Path: "
$vhdConfigPath.location = New-Object System.Drawing.Point(10, 134)
$vhdConfigPath.Size = "200, 25"
$vhdConfigPath.Font = "Segoe UI, 12"
$vhdConfigPath.BackColor = "#f00088"
$vhdConfigPath.BorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

# Textbox vhdConfigPath
$vhdConfigPathTxtbox = New-Object system.Windows.Forms.TextBox
$vhdConfigPathTxtbox.location = New-Object System.Drawing.Point(220, 134)
$vhdConfigPathTxtbox.Size = "370, 25"
$vhdConfigPathTxtbox.Font = 'Segoe UI ,12'
$vhdConfigPathTxtbox.Visible = $true
$vhdConfigPathTxtbox.multiline = $false

# Label vhdGeneration
$vhdGeneration = New-Object System.Windows.Forms.Label
$vhdGeneration.Text = "VHD Generation: "
$vhdGeneration.location = New-Object System.Drawing.Point(10, 165)
$vhdGeneration.Size = "200, 25"
$vhdGeneration.Font = "Segoe UI, 12"
$vhdGeneration.BackColor = "#f00088"
$vhdGeneration.BorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

# Checkbox Generation 1 vhdGeneration
$vhdGenerationCheckBoxOne = New-Object System.Windows.Forms.CheckBox
$vhdGenerationCheckBoxOne.location = New-Object System.Drawing.Point(260, 165)
$vhdGenerationCheckBoxOne.Size = "15, 25"
$vhdGenerationCheckBoxOne.Font = 'Segoe UI ,12'
$vhdGenerationCheckBoxOne.DataBindings.DefaultDataSourceUpdateMode = 0
$vhdGenerationCheckBoxOne.Add_CheckStateChanged({
    $_
})

# Label vhdGeneration "Generation 1"
$vhdGenerationOne = New-Object System.Windows.Forms.Label
$vhdGenerationOne.Text = "Generation 1"
$vhdGenerationOne.location = New-Object System.Drawing.Point(275, 165)
$vhdGenerationOne.AutoSize = $true
$vhdGenerationOne.Font = "Segoe UI, 12"

# Checkbox Generation 2 vhdgeneration
$vhdGenerationCheckBoxTwo = New-Object System.Windows.Forms.CheckBox
$vhdGenerationCheckBoxTwo.location = New-Object System.Drawing.Point(390, 165)
$vhdGenerationCheckBoxTwo.Size = "15, 25"
$vhdGenerationCheckBoxTwo.Font = 'Segoe UI ,12'
$vhdGenerationCheckBoxTwo.Checked = $true

# Label vhdGeneration "Generation 2"
$vhdGenerationTwo = New-Object System.Windows.Forms.Label
$vhdGenerationTwo.Text = "Generation 2"
$vhdGenerationTwo.location = New-Object System.Drawing.Point(405, 165)
$vhdGenerationTwo.AutoSize = $true
$vhdGenerationTwo.Font = "Segoe UI, 12"

# Label vmSwitch
$vmSwitch = New-Object System.Windows.Forms.Label
$vmSwitch.Text = "VM Switch: "
$vmSwitch.location = New-Object System.Drawing.Point(10, 196)
$vmSwitch.Size = "200, 25"
$vmSwitch.Font = "Segoe UI, 12"
$vmSwitch.BackColor = "#f00088"

$vmCreator.Controls.AddRange(@(`
                                $vmName,                $vmNameTxtbox, `
                                $vmRam,                 $vmRamTxtbox, `
                                $vmBootDevice,          $vmBootDeviceCmbBox, `
                                $vhdPath,               $vhdPathTxtbox, `
                                $vhdConfigPath,         $vhdConfigPathTxtbox, `
                                $vhdGeneration,`
                                $vhdGenerationCheckBoxOne, $vhdGenerationOne,  `
                                $vhdGenerationCheckBoxTwo, $vhdGenerationTwo, `
                                $vmSwitch
                            ))


[void]$vmCreator.ShowDialog()