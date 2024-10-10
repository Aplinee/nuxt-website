# 使用官方Node.js运行时作为父镜像
FROM node:latest AS build

# 设置工作目录
WORKDIR /app
# 将你的Docusaurus项目的所有文件复制到容器的/app目录下

# 生产环境镜像
FROM nginx:stable-alpine

# 移除默认的Nginx配置文件
RUN rm /etc/nginx/conf.d/default.conf

# 复制新的Nginx配置文件到容器中，这个配置应该暴露你的Docusaurus站点的正确目录
COPY dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d

# 曝露默认的HTTP端口
EXPOSE 3080

# 定义容器启动命令
CMD ["nginx", "-g", "daemon off;"]
