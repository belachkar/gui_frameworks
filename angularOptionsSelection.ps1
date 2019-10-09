function ngCreate() {
  param(
    [string]$ProjectInitName = '',
    [switch]$Simulation,
    [string]$N,
    [switch]$S
  )

  Clear-Host
  #region begin Parameters Initialisation
  if ($S -or $Simulation) {
    $Simulation = $true
  }
  if (!$ProjectInitName -and $N) {
    $ProjectInitName = $N
  }
  #endregion Parameters Initialisation

  Add-Type -AssemblyName System.Windows.Forms
  [System.Windows.Forms.Application]::EnableVisualStyles()

  #region begin GUI{
  $Form = New-Object system.Windows.Forms.Form
  $Form.ClientSize = '600,600'
  $Form.text = "Angular Options"
  $Form.TopMost = $false
  $Form.MinimizeBox = $False
  $Form.MaximizeBox = $False
  $Form.WindowState = "Normal"
  $Form.SizeGripStyle = "Hide"
  $Form.ShowInTaskbar = $False

  $flags = New-Object system.Windows.Forms.Groupbox
  $flags.height = 55
  $flags.width = 520
  $flags.text = "Flags"
  $flags.location = New-Object System.Drawing.Point(40, 252)

  $dependencies = New-Object system.Windows.Forms.Groupbox
  $dependencies.height = 98
  $dependencies.width = 520
  $dependencies.text = "Dependencie"
  $dependencies.location = New-Object System.Drawing.Point(40, 331)

  $Title = New-Object system.Windows.Forms.Label
  $Title.text = "Angular Creation new project options"
  $Title.BackColor = "transparent"
  $Title.AutoSize = $false
  $Title.width = 520
  $Title.height = 25
  $Title.location = New-Object System.Drawing.Point(40, 36)
  $Title.Font = 'Microsoft Sans Serif,15,style=Bold'
  $Title.ForeColor = "#ad3232"
  $Title.TextAlign = "MiddleCenter"

  $Label1 = New-Object system.Windows.Forms.Label
  $Label1.text = "Project Name :"
  $Label1.AutoSize = $true
  $Label1.width = 25
  $Label1.height = 10
  $Label1.location = New-Object System.Drawing.Point(40, 193)
  $Label1.Font = 'Microsoft Sans Serif,10'

  $OKButton = New-Object system.Windows.Forms.Button
  $OKButton.text = "OK"
  $OKButton.width = 60
  $OKButton.height = 30
  $OKButton.location = New-Object System.Drawing.Point(200, 541)
  $OKButton.Font = 'Microsoft Sans Serif,10'

  $CancelButton = New-Object system.Windows.Forms.Button
  $CancelButton.text = "Cancel"
  $CancelButton.width = 60
  $CancelButton.height = 30
  $CancelButton.location = New-Object System.Drawing.Point(305, 541)
  $CancelButton.Font = 'Microsoft Sans Serif,10'

  $sass = New-Object system.Windows.Forms.CheckBox
  $sass.text = "Sass"
  $sass.AutoSize = $false
  $sass.width = 60
  $sass.height = 20
  $sass.location = New-Object System.Drawing.Point(25, 22)
  $sass.Font = 'Microsoft Sans Serif,10'

  $tests = New-Object system.Windows.Forms.CheckBox
  $tests.text = "Skip tests"
  $tests.AutoSize = $false
  $tests.width = 85
  $tests.height = 20
  $tests.location = New-Object System.Drawing.Point(90, 22)
  $tests.Font = 'Microsoft Sans Serif,10'

  $routing = New-Object system.Windows.Forms.CheckBox
  $routing.text = "Generate routing module"
  $routing.AutoSize = $false
  $routing.width = 180
  $routing.height = 20
  $routing.location = New-Object System.Drawing.Point(185, 22)
  $routing.Font = 'Microsoft Sans Serif,10'

  $enableIvy = New-Object system.Windows.Forms.CheckBox
  $enableIvy.text = "Enable ivy"
  $enableIvy.AutoSize = $false
  $enableIvy.width = 90
  $enableIvy.height = 20
  $enableIvy.location = New-Object System.Drawing.Point(375, 22)
  $enableIvy.Font = 'Microsoft Sans Serif,10'

  $vscode = New-Object system.Windows.Forms.CheckBox
  $vscode.text = "Open in VS Code after creation"
  $vscode.AutoSize = $false
  $vscode.width = 250
  $vscode.height = 20
  $vscode.location = New-Object System.Drawing.Point(40, 456)
  $vscode.Font = 'Microsoft Sans Serif,10'

  $browser = New-Object system.Windows.Forms.CheckBox
  $browser.text = "Open in the browser"
  $browser.AutoSize = $false
  $browser.width = 158
  $browser.height = 20
  $browser.enabled = $false
  $browser.location = New-Object System.Drawing.Point(233, 486)
  $browser.Font = 'Microsoft Sans Serif,10'

  $liveServer = New-Object system.Windows.Forms.CheckBox
  $liveServer.text = "Start live server"
  $liveServer.AutoSize = $false
  $liveServer.width = 148
  $liveServer.height = 20
  $liveServer.location = New-Object System.Drawing.Point(40, 486)
  $liveServer.Font = 'Microsoft Sans Serif,10'

  $projectName = New-Object system.Windows.Forms.TextBox
  $projectName.multiline = $false
  $projectName.width = 520
  $projectName.height = 20
  $projectName.location = New-Object System.Drawing.Point(40, 213)
  $projectName.Font = 'Microsoft Sans Serif,10'

  $npm = New-Object system.Windows.Forms.Label
  $npm.text = ""
  $npm.AutoSize = $true
  $npm.width = 500
  $npm.height = 10
  $npm.location = New-Object System.Drawing.Point(10, 45)
  $npm.Font = 'Arial,7'
  $npm.ForeColor = "#81ff00"

  $ng = New-Object system.Windows.Forms.Label
  $ng.text = ""
  $ng.AutoSize = $true
  $ng.width = 500
  $ng.height = 10
  $ng.location = New-Object System.Drawing.Point(10, 15)
  $ng.Font = 'Arial,7'
  $ng.ForeColor = "#81ff00"

  $cdk = New-Object system.Windows.Forms.CheckBox
  $cdk.text = "@angular/cdk"
  $cdk.AutoSize = $false
  $cdk.width = 125
  $cdk.height = 20
  $cdk.location = New-Object System.Drawing.Point(25, 25)
  $cdk.Font = 'Microsoft Sans Serif,10'

  $material = New-Object system.Windows.Forms.CheckBox
  $material.text = "@angular/material"
  $material.AutoSize = $false
  $material.width = 135
  $material.height = 20
  $material.location = New-Object System.Drawing.Point(183, 25)
  $material.Font = 'Microsoft Sans Serif,10'

  $flexLayout = New-Object system.Windows.Forms.CheckBox
  $flexLayout.text = "@angular/flex-layout"
  $flexLayout.AutoSize = $false
  $flexLayout.width = 155
  $flexLayout.height = 20
  $flexLayout.location = New-Object System.Drawing.Point(349, 25)
  $flexLayout.Font = 'Microsoft Sans Serif,10'

  $hammerjs = New-Object system.Windows.Forms.CheckBox
  $hammerjs.text = "hammerjs"
  $hammerjs.AutoSize = $false
  $hammerjs.width = 100
  $hammerjs.height = 20
  $hammerjs.location = New-Object System.Drawing.Point(25, 61)
  $hammerjs.Font = 'Microsoft Sans Serif,10'

  $momentjs = New-Object system.Windows.Forms.CheckBox
  $momentjs.text = "@angular/material-moment-adapter"
  $momentjs.AutoSize = $false
  $momentjs.width = 250
  $momentjs.height = 20
  $momentjs.location = New-Object System.Drawing.Point(183, 58)
  $momentjs.Font = 'Microsoft Sans Serif,10'

  $serve = New-Object system.Windows.Forms.Label
  $serve.text = ""
  $serve.AutoSize = $true
  $serve.width = 500
  $serve.height = 10
  $serve.location = New-Object System.Drawing.Point(10, 75)
  $serve.Font = 'Arial,7'
  $serve.ForeColor = "#81ff00"

  $server = New-Object system.Windows.Forms.Panel
  $server.height = 94
  $server.width = 520
  $server.BackColor = "#000000"
  $server.location = New-Object System.Drawing.Point(39, 82)

  $changeDir = New-Object system.Windows.Forms.Label
  $changeDir.text = ""
  $changeDir.AutoSize = $true
  $changeDir.width = 25
  $changeDir.height = 10
  $changeDir.location = New-Object System.Drawing.Point(10, 30)
  $changeDir.Font = 'Arial,7'
  $changeDir.ForeColor = "#81ff00"

  $code = New-Object system.Windows.Forms.Label
  $code.text = ""
  $code.AutoSize = $true
  $code.width = 500
  $code.height = 10
  $code.location = New-Object System.Drawing.Point(10, 60)
  $code.Font = 'Arial,7'
  $code.ForeColor = "#81ff00"

  $flags.controls.AddRange(@($sass, $routing, $tests, $enableIvy))
  $server.controls.AddRange(@($npm, $ng, $serve, $changeDir, $code))
  $dependencies.controls.AddRange(@($cdk, $material, $flexLayout, $hammerjs, $momentjs))
  $Form.controls.AddRange(@($flags, $server, $dependencies, $Title, $Label1, $OKButton, $CancelButton, $vscode, $browser, $liveServer, $projectName))

  #region gui events {
  $liveServer.Add_CheckedChanged( { updateBrowserState })
  $projectName.Add_TextChanged( { projectNameGlobalActivation })    
  $Flags.Controls.ForEach( { $_.Add_CheckedChanged( { updateOptions('ng')})})
  $dependencies.Controls.ForEach( { $_.Add_CheckedChanged( { updateOptions('npm')})})
  $vscode.Add_CheckedChanged( { updateOptions('vscode')})
  @($liveServer, $browser).ForEach( { $_.Add_CheckedChanged( { updateOptions('liveServer')})})
  #endregion events }
  #endregion GUI }

  #region begin Variables Initialisation
  $Form.KeyPreview = $true
  $Form.StartPosition = "CenterScreen"
  $Form.Add_KeyDown( { 
      if ($_.KeyCode -eq "Enter") {
        $OKButton.PerformClick()
      } elseif ($_.KeyCode -eq "Escape") {
        $CancelButton.PerformClick()
      }
  })
  $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
  $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel

  $controls = @($Flags, $dependencies, $vscode, $liveServer, $browser)
  $labels = @($ng, $changeDir, $npm, $code, $serve)

  $configParams = @{
    ProjectName    = $ProjectInitName
    ConfigFile       = 'angOptionsConfig.json'
    ProjectsFolder = $env:UserProfile
  }

  $startPSTerminal = @{
    WorkingDirectory = ""
    FilePath         = "Powershell"
    ArgumentList     = "Write-Error 'Start Live Server Failed'"
  }
  #endregion Variables Initialisation

  #begin region FUNCTIONS
  function executeCmds ($Cmds) {
    $startTimeScript = Get-Date
    Write-Host "`r";
    $Cmds.ForEach( {
        if ($($_.text)) {
          Write-Host -ForegroundColor Green "| $($_.text)"
          Start-Sleep -m 300;
        }
      })
    Write-Host "`r";
    try {
      if (!$Simulation) {       
        $Cmds.ForEach({
            if ($($_.text)) {
              if ($($_.text).Contains('serve')) {
                $startPSTerminal['ArgumentList'] = "$($_.text); Pause;"
                Start-Process @startPSTerminal
                continue
              }
              Invoke-Expression $($_.text)
            }
          })
      }
      Write-Host "Operation SUCCEED`r" -ForegroundColor Green
      $endTimeScript = Get-Date
      $totalTimeScript = ($endTimeScript - $startTimeScript).TotalSeconds
      Write-Host "Time Execution Script : $totalTimeScript s." -ForegroundColor Red
    } catch {
      $ErrorMessage = $_.Exception.Message
      $FailedItem = $_.Exception.ItemName    
      #Send-MailMessage -From 'belachkarali@gmail.com' -Credential  -To 'belachkarali@gmail.com' -Subject "AngularOptionSelection script Error" -SmtpServer 'smtp.gmail.com' -Port 465  -Body "We failed to read file $FailedItem. The error message was $ErrorMessage"
      Write-Host "Error on the script $FailedItem"
      Write-Host $ErrorMessage
      Write-Error "Operation FAILED!"
      break
    }
  }

  function displayForm {
    [void]$Form.Add_Shown( { $Form.Activate() })
    return $Form.ShowDialog()
  }

  function getAngularProjectsFolder {
    $path = getParamFormConfigFile -file $configParams['ConfigFile'] -param 'Path'
    if (!$path) {
      $path = selectFolderDialog("`tSelect the Angular Projects Default Folder.")
      if ($path) {        
        $file = @{path = $path}
        $file | ConvertTo-Json | Set-Content $configParams['ConfigFile']
      }
    }
    return $path
  }

  function actions ($Result) {
    if ($Result -eq [System.Windows.Forms.DialogResult]::OK) {
      if ($($projectName.text.Trim())) {
        $projectFolder = getAngularProjectsFolder
        $configParams['ProjectName'] = $($projectName.text.Trim())
        if ($projectFolder) {
          $configParams['ProjectsFolder'] = $projectFolder          
        }
        $startPSTerminal['WorkingDirectory'] = Join-Path $configParams['ProjectsFolder'] $configParams['ProjectName']
        $configParams
        Write-Host `r
        $cd = @{text = "cd $($configParams['ProjectsFolder'])"}
        $cmds = @()
        $cmdFields = @($cd, $labels)
        $cmdFields.ForEach({
            if ($_.text) {
              $cmds += $_
            }
          })
        executeCmds($cmds)
      }
    } elseif ($Result -eq [System.Windows.Forms.DialogResult]::Cancel) {
      Write-Host "Operation Canceled."
    }
  }

  function initialisation {
    $sass.Checked = $true
    $tests.Checked = $true
    $routing.Checked = $true
    $enableIvy.Checked = $true
    $vscode.checked = $true
    $liveServer.checked = $true
    if ($projectName.CanFocus) {
      $projectName.Focus()      
    } else {
      $projectName.Select()
    }
    updateProjectNameFieldValue
    @('ng', 'npm', 'vscode', 'liveServer').ForEach( { updateOptions($_) })
    projectNameGlobalActivation
  }
  function updateProjectNameFieldValue {
    $ProjectInitNameTrimmed = $ProjectInitName.Trim()
    if ($ProjectInitName -and $($ProjectInitNameTrimmed)) {        
      $projectName.text = $ProjectInitNameTrimmed
    }  
  }
  function updateBrowserState {
    if ($liveServer.checked) {
      $browser.Enabled = $true
    } else {
      $browser.Checked = $false
      $browser.Enabled = $false
    }
  }
  function enableAllControls {
    @($controls).ForEach( { $_.enabled = $true })        
    @('npm', 'vscode', 'liveServer').ForEach( { updateOptions($_) })
    updateBrowserState
  }
  function disableAllCtrls {
    @($controls).ForEach( { $_.enabled = $false })
    @($labels).ForEach( { $_.text = ""})
  }
  function projectNameGlobalActivation {
    $projectName.text = $projectName.text.Trim()
    $projectName.Select($projectName.text.Length, 0)
    # $projectName.scrollToCaret()
    updateOptions('ng')
    if ($($sass.Enabled -eq $false) -and $($($projectName.Text.Length) -gt 0)) {
      enableAllControls
    } elseif ($($projectName.Text.Length) -lt 1) {
      disableAllCtrls
    }
  }
  function updateOptions($param) {
    $options = ""
    switch ($param) {
      'ng' {
        if ($sass.Checked) {
          $options += " --style=scss"
        }
        if ($tests.Checked) {
          $options += " --skip-tests"
        }
        if ($routing.Checked) {
          $options += " --routing"
        }
        if ($enableIvy.Checked) {
          $options += " --enable-ivy"
        }
        $ng.Text = "ng new $($projectName.Text) $options"
        $changeDir.text = "cd $($projectName.text)"
        break
      }
      'npm' {
        $npm.Text = ""
        $dependencies.Controls.ForEach( {
            if ($_.Checked) {
              $options += " $($_.text)"
            }
          })
        if ($options) {
          $npm.Text = "npm i$options"
        }
        break
      }
      'vscode' {
        $code.Text = ''
        if ($vscode.Checked) {
          $code.Text = "code ."
        } break
      }
      'liveServer' {
        if ($liveServer.Checked) {
          $options += "ng serve"
        }
        if ($($browser.Checked) -and $($browser.Enabled)) {
          $options += " -o"
        } 
        $serve.Text = $options
        break
      }
      Default {
        Write-Host "No Option with the name : $param"
      }
    }
  }
  #endregion FUNCTIONS
  initialisation
  actions(displayForm)  
}


function isFileExists($path) {
  if ($path -and (Test-path $path -PathType Leaf)) {
    return $true
  }
  return $false
}
function isDirectoryExists($path) {
  if ($path -and (Test-path $path -PathType Container)) {
    return $true
  }
  return $false
}
function getParamFormConfigFile($File, $Param) {
  if (isFileExists $File) {
    Write-Host "File Found : $File"
    $content = Get-Content -Path $File -Raw | ConvertFrom-Json
    $value = $content.$Param
    if ($value) {
      Write-Host "$Param Found : $value"      
      return $value
    } else {
      Write-Host "$Param Not Found In The File : `t$File"
    }
  } else {
    Write-Host "File Not Found : `t$File"
  }
  return $false
}
function selectFolderDialog {
  param (
    [string]$Description = "Select folder"
  )  
  $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
  $FolderBrowser.Description = $Description
  $FolderBrowser.RootFolder = 'MyComputer'

  $result = $FolderBrowser.ShowDialog()

  if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $path = $FolderBrowser.SelectedPath
    if (Test-Path $path -PathType Container) {
      return $path
    } else {
      Write-Host "Path invalid"
    }
  } else {
    Write-Host "No directory selected"
    # return $configParams['ProjectFolder']
  }
  return $false
}
