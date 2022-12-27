$IP = (get-vm -VmName Win10 | Get-VMNetworkAdapter).IpAddresses[0]

mstsc /l
$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Remote Desktop Connection')
Sleep 1
$wshell.SendKeys('^c')
Sleep 1
$rdptext = Get-ClipBoard
Sleep 1
$wshell.SendKeys('{ENTER}')

foreach ($line in $rdptext) {
    if ($line -like '*2560 x 1440; (4480*') {
        $parts = $line -split ':'
        # The number is the first element of the array
        $primary_monitor = $parts[0]
        Write-Output "Primary (Middle): $primary_monitor"
    }
    
    if ($line -like '*2560 x 1440; (1920*') {
        $parts = $line -split ':'
        # The number is the first element of the array
        $left_monitor = $parts[0]
        Write-Output "Secondary (left): $left_monitor"
    }
    
    if ($line -like '*2560 x 1440; (7040*') {
        $parts = $line -split ':'
        # The number is the first element of the array
        $right_monitor = $parts[0]
        Write-Output "Secondary (right): $right_monitor"
    }
}

@"
screen mode id:i:2
session bpp:i:32
winposstr:s:0,1,2776,93,4032,884
compression:i:1
keyboardhook:i:2
audiocapturemode:i:0
videoplaybackmode:i:1
connection type:i:6
networkautodetect:i:0
bandwidthautodetect:i:1
displayconnectionbar:i:0
enableworkspacereconnect:i:0
disable wallpaper:i:0
allow font smoothing:i:1
allow desktop composition:i:1
disable full window drag:i:0
disable menu anims:i:0
disable themes:i:0
disable cursor setting:i:0
bitmapcachepersistenble:i:1
audiomode:i:1
redirectprinters:i:1
redirectcomports:i:0
redirectsmartcards:i:1
redirectclipboard:i:1
redirectposdevices:i:0
autoreconnection enabled:i:1
authentication level:i:2
prompt for credentials:i:0
negotiate security layer:i:1
remoteapplicationmode:i:0
alternate shell:s:
shell working directory:s:
gatewayhostname:s:
gatewayusagemethod:i:4
gatewaycredentialssource:i:4
gatewayprofileusagemethod:i:0
promptcredentialonce:i:0
gatewaybrokeringtype:i:0
use redirection server name:i:0
rdgiskdcproxy:i:0
kdcproxyname:s:
drivestoredirect:s:
enablecredsspsupport:i:0
use multimon:i:1
maximizetocurrentdisplays:i:1
full address:s:$IP
selectedmonitors:s:$primary_monitor,$left_monitor,$right_monitor

"@ | Out-File vm_auto.rdp
