B1: Tạo image
`docker build -t api_image:1 --force-rm -f Dockerfile .`
-t ====> tag
api_image:1 ===> tên image và version
--force-rm ====> Tự động xóa vùng chứa, các layer trung gian sau khi build xong

B2: Chạy 1 trong 2 lệnh sau
docker run --name "api_container" -p 1003:3000 --network dbms api_image:1
docker run -it --name "api_container" -p 1003:3000 --network dbms api_image:1