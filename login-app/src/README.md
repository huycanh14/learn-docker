B1: Tạo image
`docker build -t front_image:1 --force-rm -f Dockerfile .`
-t ====> tag
front_image:1 ===> tên image và version
--force-rm ====> Tự động xóa vùng chứa, các layer trung gian sau khi build xong

B2: Chạy 1 trong 2 lệnh sau
docker run --name "front_container" -p 1003:3000 --network dbms front_image:1
docker run -it --name "front_container" -p 1003:3000 --network dbms front_image:1