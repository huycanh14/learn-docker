# Chay tren OS nao:
FROM node:alpine
# Copy tất cả các file ở thư mục hiện tại vào đâu
COPY . /app
# Tao một thư mục và copy tất cả các file vào thư mục đó
WORKDIR /app
# Câu lệnh thực thi
CMD node server.js

# Tạo image => docker build -t tên_image .
# chạy docker image => docker run tên_image