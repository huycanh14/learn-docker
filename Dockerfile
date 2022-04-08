FROM ubuntu

# CMD ["echo", "hello world"]

# tạo image phiên bản lates: docker build -t="mynewdemo" .
# tạo container image:  docker run mynewdemo



# Câu lệnh entrypoint => giống cmd nhưng không cho phép truyền dữ liệu động
# ab: tham số truyền vào

# RUN apt-get update && \
# 	apt-get install -y apache2-utils && \
# 	rm -rf /var/lib/apt/lists/*
# CMD ab 

# docker build -t="mynewdemo" .
# docker run mynewdemo ab https://levunguyen.com/devops/2022/01/07/docker-command/



# Câu lệnh env
# ENV var1=Tutorial var2=point
# docker run -it envdemo /bin/bash
# env



# WORKDIR dirname: chỉ tên folder đang làm việc với container
WORKDIR /newtemp 
CMD pwd
