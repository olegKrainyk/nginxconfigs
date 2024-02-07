server{ 
        listen 80;

        location / {
            proxy_pass  http://10.241.104.202:4141;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_cache_bypass $http_upgrade;   
        }

        server_name 10.241.104.202:80;
}