#!/bin/sh
VERSION=2.3.0
curl "https://codeload.github.com/mempool/mempool/tar.gz/refs/tags/v$VERSION" --output "mempool-$VERSION.tar.gz"
tar -xf "./mempool-$VERSION.tar.gz"

cp -rf ./mempool-$VERSION/docker/frontend/* "./mempool-$VERSION/frontend" || exit
cp -rf ./mempool-$VERSION/nginx-mempool.conf "./mempool-$VERSION/frontend" || exit
cp -rf ./mempool-$VERSION/nginx.conf "./mempool-$VERSION/frontend" || exit

sed -i "s/127.0.0.1:80/0.0.0.0:__MEMPOOL_FRONTEND_HTTP_PORT__/g" "./mempool-$VERSION/frontend/nginx.conf"
sed -i "s/127.0.0.1/0.0.0.0/g" "./mempool-$VERSION/frontend/nginx.conf"
sed -i "s/user nobody;//g" "./mempool-$VERSION/frontend/nginx.conf"
sed -i "s!/etc/nginx/nginx-mempool.conf!/etc/nginx/conf.d/nginx-mempool.conf!g" "./mempool-$VERSION/frontend/nginx.conf"
sed -i "s/127.0.0.1:8999/__MEMPOOL_BACKEND_MAINNET_HTTP_HOST__:__MEMPOOL_BACKEND_MAINNET_HTTP_PORT__/g" "./mempool-$VERSION/frontend/nginx-mempool.conf"

docker build -t btcplus/mempool-frontend:$VERSION "./mempool-$VERSION/frontend"
