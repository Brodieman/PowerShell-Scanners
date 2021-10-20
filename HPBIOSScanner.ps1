#Connect to the HP_BIOSSetting WMI class
$HPBiosSettings = Get-WmiObject -Namespace root\HP\InstrumentedBIOS -Class HP_BIOSSetting
 
#Return a list of all settings
$settings = $HPBiosSettings | Select-Object Name,Value,CurrentValue,IsSet | Where-Object {$_.Name -ne " "}

ForEach ($setting in $settings) {
        [PSCustomObject]@{
            HPBIOSSettingName = $setting.Name
            HPBIOSCurrentValue = $setting.CurrentValue
            HPBIOSIsSet = $setting.IsSet
            HPBIOSPossibleValues = $setting.Value
        }
}