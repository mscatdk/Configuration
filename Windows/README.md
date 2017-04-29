# Windows
This page contain Windows related information.

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
