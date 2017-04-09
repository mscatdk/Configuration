# NGINX
This page contain NGINX related information.

## reverse proxy
The below configuration creates reverse proxy on [hostname] to [target_hostname] at port [target_port]. The values in square brackets must be replaced.
```bash
server {
    listen 9000;
    server_name [hostname];

    location / {
        auth_basic "Restricted";
        auth_basic_user_file che.htpasswd;
 
        proxy_pass http://[target_hostname]:[target_port]/;
        proxy_set_header    Host            $http_host;
        proxy_set_header    X-Real-IP       $remote_addr;
        proxy_set_header    X-Forwarded-for $remote_addr;
        # Enable WebSocket proxying
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }

}
```
