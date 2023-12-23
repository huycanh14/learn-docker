# Step 1: Xác định image cần sử dụng và version
FROM node:16.16.0-alpine

# Step 2: tạo directory sẽ làm việc trong container
ENV APP_ROOT /usr/src/login-app
RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

# step 3: Copy file package.json từ host vào directory vừa tạo
COPY package*.json ${APP_ROOT}

# Step 4: install các thư viện 
RUN npm install 


# Step 5 copy source code vao trong docker 
COPY . ${APP_ROOT}

# Step 6.1 Điền các environment
ENV PG_HOST postgresql
ENV PG_USER postgres
ENV PG_PORT 5432
ENV PG_PASSWORD admin@123
ENV PG_DATABASE Test1

#step 6.2 Mở port của container
EXPOSE 3000

# step 6: run command khi container start
CMD ["npm", "run", "dev"]


