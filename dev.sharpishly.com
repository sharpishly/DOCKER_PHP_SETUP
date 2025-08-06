server {
    listen 80;
    server_name dev.sharpishly.com;
    location /.well-known/acme-challenge/ {
        root /var/www/letsencrypt/dev-challenge;
        allow all;
    }
    location / {
        return 301 https://$host$request_uri;
    }
}
server {
    listen 443 ssl;
    server_name dev.sharpishly.com;
    ssl_certificate /etc/letsencrypt/live/dev.sharpishly.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/dev.sharpishly.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    location / {
        proxy_pass http://localhost:8001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}