# Writes the converted template to stdout

#!/bin/sh

# @see https://stackoverflow.com/questions/584894/environment-variable-substitution-in-sed
# @see https://www.nginx.com/blog/websocket-nginx/
sed -e "s|%PROXY_ADDRESS%|${PROXY_ADDRESS}|g" virtual-site.template