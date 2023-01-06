
#variables

$current_color = (get-itemproperty 'hkcu:\control panel\desktop\' -name wallpaper).wallpaper
$flip_a = $false
$flip_b = $false
    
$time_z_color = $null
$blinks = 2

$time_a_mod = 2
$time_a_color = (get-childitem -path "pink.png").fullname

$time_b_mod = 10
$time_b_color = (get-childitem -path "blue.png").fullname
    
#functions

function set-wallpaper($image) 
{
<#
    https://www.joseespitia.com/2017/09/15/set-wallpaper-powershell-function/

    .SYNOPSIS
    Applies a specified wallpaper to the current user's desktop
    .PARAMETER Image
    Provide the exact path to the image
    .EXAMPLE
    Set-WallPaper -Image "C:\Wallpaper\Default.jpg"
#>
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
  
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02
    $fWinIni = $UpdateIniFile -bor $SendChangeEvent
    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}

function flash-color($color) 
{
    for($i=$blinks;$i-gt0;$i--)
    {
    set-wallpaper -image $color
    set-wallpaper -image $current_color
    }
}

#main loop
while($true)
{
$time = (get-date).minute

Write-Host $time  $flip_a $flip_b

$time_z_color = $null

if($time % $time_a_mod -eq 0 -and $flip_a -eq $false)
    {
    $time_z_color = $time_a_color
    $flip_a = $true
    }

if($time % $time_a_mod -ne 0)
    {
    $flip_a = $false
    }

if($time % $time_b_mod -eq 0 -and $flip_b -eq $false)
    {
    $time_z_color = $time_b_color
    $flip_b = $true
    }

if($time % $time_b_mod -ne 0)
    {
    $flip_b = $false
    }

if($time_z_color -ne $null)
    {
    flash-color -color $time_z_color
    }

start-sleep -seconds 1
}












 

