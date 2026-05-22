FROM nginx:alpine

# 删除默认配置
RUN rm /etc/nginx/conf.d/default.conf

# 复制自定义配置
COPY docker/nginx.conf /etc/nginx/conf.d/

# 复制静态文件
COPY . /usr/share/nginx/html/

# 将入口文件重命名为index.html
RUN mv /usr/share/nginx/html/profit-calculator.html /usr/share/nginx/html/index.html

# 暴露端口
EXPOSE 80

# 启动nginx
CMD ["nginx", "-g", "daemon off;"]
