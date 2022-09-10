clear



while(1 -eq 1){

clear









    $nl = ($n).tostring().length
    $arr = [int[]](($n -split '') -ne '')

    Write-Output "Number: $n" 
    Write-Output "Length: $nl"
    Write-Output "Array: $arr"


















Write-Output ""

$A = $arr

$index = 0
$line = 0

#Lines Per Seven Segment Output
$segline = "","",""


#Seven Segment Charters
$seg0 = “ _ ”,”| |”,"|_|"
$seg1 = “   ”,”  |”,"  |"
$seg2 = “ _ ”,” _|”,"|_ "
$seg3 = “ _ ”,” _|”," _|"
$seg4 = “   ”,”|_|”,"  |"
$seg5 = “ _ ”,”|_ ”," _|"
$seg6 = “ _ ”,”|_ ”,"|_|"
$seg7 = “ _ ”,”  |”,"  |"
$seg8 = “ _ ”,”|_|”,"|_|"
$seg9 = " _ ”,"|_|”,"  |"
$sevseg = $seg0,$seg1,$seg2,$seg3,$seg4,$seg5,$seg6,$seg7,$seg8,$seg9









while($index -lt $nl){
    #clear

    $indexnum = $A[$index]
    #Write-Output $indexnum
    
    $segline[0] = $segline[0] + $sevseg[$indexnum][0]
    $segline[1] = $segline[1] + $sevseg[$indexnum][1]
    $segline[2] = $segline[2] + $sevseg[$indexnum][2]

    $index += 1

}








    Write-Output $segline[0]
    Write-Output $segline[1]
    Write-Output $segline[2]

    Write-Output ""

    Start-Sleep -Milliseconds 1000


    $x = Get-Random -Minimum 1 -Maximum 999999999999
    #$y = Get-Random -Minimum 1 -Maximum 999999999999
    #$z = Get-Random -Minimum 1 -Maximum 999999999999
    $n = $x


}


