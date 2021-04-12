+Ở folder \src\main\webapp\WEB-INF\views, lưu các file jsp theo phần của bản thân. Ví dụ làm về đăng nhập thì chỉ được thay đổi file trong folde login.

+Ở folder \src\main\webapp\WEB-INF\template, lưu các file css, js, ảnh,....

+package controller lưu các file java controller.

+package services viết các class thao tác dữ liệu, để trả dữ liệu về cho Controller

+Luồng dữ liệu: entity->services->controller.

+Khi code cho package services phải viết 1 interfaces ở package interface chứa các hành động sẽ thực hiện và implement ở package implementation.

+Vào file src/main/resources/hibernate.cfg.xml sửa lại thông tin database theo máy
