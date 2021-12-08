net start > C:\Users\JSatterfield\Desktop\net_start.txt
Powershell.exe -command Compare-Object $(Get-Content C:\Users\JSatterfield\Desktop\\Def_service.txt) $(Get-Content C:\Users\JSatterfield\Desktop\net_start.txt) > C:\Users\JSatterfield\Desktop\Service_Diff.txt
echo "=> means there is a non default service running" >> C:\Users\JSatterfield\Desktop\Service_Diff.txt
echo "<= means that a default service is not running" >> C:\Users\JSatterfield\Desktop\Service_Diff.txt
netsh advfirewall set allprofiles state on
secedit /import /db C:\Users\JSatterfield\Desktop\123.sdb /cfg C:\Users\JSatterfield\Desktop\CyberPatriot.inf
secedit /configure /db C:\Users\JSatterfield\Desktop\123.sdb /cfg C:\Users\JSatterfield\Desktop\CyberPatriot.inf
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f
wmic useraccount where name='administrator' rename user
wmic useraccount where name='guest' rename user2
net localgroup Administrators > C:\Users\JSatterfield\Desktop\users.txt
net localgroup Guests >> C:\Users\JSatterfield\Desktop\users.txt
net localgroup Users >> C:\Users\JSatterfield\Desktop\\users.txt
findstr /v "Members Comment Alias successfully ----------------" C:\Users\JSatterfield\Desktop\users.txt > C:\Users\JSatterfield\Desktop\users2.txt
PAUSE
FOR /F "tokens=1 delims=," %%a IN (C:\Users\JSatterfield\Desktop\users2.txt) DO CALL net user %%a CyberPatriot!
PAUSE