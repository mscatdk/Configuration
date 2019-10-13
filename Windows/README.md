# Windows

This page contain Windows related information.

## PowerShell

Send HTTP Request

```POWERSHELL
# Send GET request
Invoke-WebRequest -UseBasicParsing -Uri [URL]
```

## CMD

```CMD
REM List sharing permissions for a folder
icacls [file name]
```

### List all open ports

Must be run as administrator

```CMD
netstat -a -b
```

Find PID associated with a given open port (here port 80)

```CMD
netstat -ano | find "80"
```

### Processes

List running processes with PID

```CMD
Tasklist /svc /fo list
```

Kill a process (here the process with PID 123)

```CMD
taskkill /F /PID 123
```

### DNS

Clear DNS cache

```CMD
ipconfig /flushdns
```

### Base64 encode and decode

```cmd
REM Base64 encode file
certutil -encode [filename] tmp.b64 && findstr /v /c:- tmp.b64 > data.b64

REM decode Base64 file 
certutil -decode [filename] data.txt
```

### Download file

```cmd
REM Download the URL
certutil.exe -urlcache -split -f [URL]
```

## Manual install JDK

1. Download JDK installation file from Oracle
2. Open the *.exe using e.g. 7z
3. Locate the tool.zip file in a path similar to \.rsrc\1033\JAVA_CAB10\111\
4. Extract the content of tool.zip to desired JDK location
5. Run the below command from the new JDK location 
    a. for /r %x in (*.pack) do .\bin\unpack200 -r "%x" "%~dx%~px%~nx.jar"
6. The JDK can now be zip and distributed if needed

## Ad information

wildcard search can be done using the tool
"C:\Windows\System32\rundll32.exe" dsquery.dll,OpenQueryWindow

CMD

```cmd
net user [user name] /dom
net group [group name] /dom
```

PowerShell

```powershell
whoami /groups
```

## List all saved passwords

````CMD
rundll32.exe keymgr.dll,KRShowKeyMgr
````
