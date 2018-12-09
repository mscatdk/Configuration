# Windows

This page contain Windows related information.

## PowerShell

Send HTTP Request

```bash
# Send GET request
Invoke-WebRequest -UseBasicParsing -Uri [URL]
```

## CMD

```bash
# List sharing permissions for a folder
icacls [file name]
```

## List all open ports

Must be run as administrator

```bash
netstat -a -b
```

Find PID associated with a given open port (here port 80)

```bash
netstat -ano | find "80"
```

## Processes

List running processes with PID

```bash
Tasklist /svc /fo list
```

Kill a process (here the process with PID 123)

```bash
taskkill /F /PID 123
```

## DNS

Clear DNS cache

```bash
ipconfig /flushdns
```

## Manual install JDK

1. Download JDK installation file from Oracle
2. Open the *.exe using e.g. 7z
3. Locate the tool.zip file in a path similar to \.rsrc\1033\JAVA_CAB10\111\
4. Extract the content of tool.zip to desired JDK location
5. Run the below command from the new JDK location 
    a. for /r %x in (*.pack) do .\bin\unpack200 -r "%x" "%~dx%~px%~nx.jar"
6. The JDK can now be zip and distributed if needed

## Ad groups

wildcard search can be done using the tool
"C:\Windows\System32\rundll32.exe" dsquery.dll,OpenQueryWindow
