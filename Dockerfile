# Khai báo sử dụng từ image nào
FROM ubuntu

# maintainer - người duy trì
LABEL org.opencontainers.image.authors="huycanh14@gmal.com"

# Một số cài đặt thêm cho image
RUN apt-get update
RUN apt-get install -y nginx

# Thực hiện câu lệnh CMD
CMD ["echo", "Image created"]

# tạo image bằng câu lệnh: docker build -t ImageName:TageName dir
# t: tham số tag cho image
# ImageName: Tên của image
# TageName: Tên Tag của image
# dir: Folder nơi chưa Docker File
# docker build -t myimage:0.1 . 
# dấu "." chỉ folder hiện tại
