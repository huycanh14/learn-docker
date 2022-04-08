# Nối 2 container lại với nhau

# 1. Chạy Mysql pull từ docker hub về
# Tạo container: docker run -p 2012:3306 --name mysqldocker -e MYSQL_ROOT_PASSWORD=123456 -d mysql
# d : ta chạy mysql ở 1 container khác không cùng với app ở trên. Nó chạy riêng biệt
# p : là port để ta có thể truy cập vào mysql. Ở máy local ta có thể truy cập bằng port 2012. Nhưng nếu ở máy khác hoặc một ứng dụng khác thì dùng port 3306
# 5.7.26 : version của mysql

# 2. Cài đặt Chạy Spring Boot
# spring.datasource.driver-class-name=com.mysql.jdbc.Driver 
# spring.datasource.url=jdbc:mysql://mysqldocker:3306/library 
# spring.datasource.username=root 
# spring.datasource.password=123456

# Alpine Linux with OpenJDK JRE 
FROM openjdk:8-jre-alpine 
# Cài đặt JDK cho container . Mình cài từ openjdk 
#copy WAR into image 
COPY spring-boot-app-0.0.1-SNAPSHOT.war /app.war 
#Mình copy file war từ folder dự án và đổi tên thành app.war 
#run application with this command line 
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/app.war"] 
#Run command để chạy file jar như bình thường 

# Kết nối Spring boot đến mysql
# docker run -t --name springboot-mysql-container --link mysqldocker:mysql -p 8087:8080 spring-boot-app 

