# terasology chocolatey package

## local test and build

to install use powershell, administrative.

```
choco pack
choco install terasology --force --pre --source .

choco apikey --key xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx --source https://push.chocolatey.org/
choco push terasology.5.4.0-rc1.nupkg --source https://push.chocolatey.org/ --timeout 600
```

