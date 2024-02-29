import-module activedirectory
$ComputerList=Get-ADComputer -filter "*"
$Credential=Get-Credential
ForEach($Computer in $ComputerList){
    $ComputerName=$Computer.Name
    Invoke-COmmand -ComputerName $ComputerName -Credential $Credential -Scriptblock { Get-BitlockerVolume -MountPoint "C:" | Select ComputerName, ProtectionStatus }
}
