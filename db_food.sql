DROP DATABASE IF EXISTS db_food;
CREATE DATABASE db_food;
USE db_food;


CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Thức uống');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Thức ăn nhanh');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Món nước');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Ăn vặt'),
(5, 'Chay');

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Coke', 'https://medicare.vn/wp-content/uploads/2021/01/0063149.jpg', 5, 'coca cola', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(2, 'Heniken', 'https://minhcaumart.vn/media/com_eshop/products/8934822212339.jpg', 10, 'đây là bia', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(3, 'Burger', 'https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/r/crunchy_whp-min_1.jpg', 7, 'hum bơ gơ', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(4, 'Hủ tiếu', 'https://daubepgiadinh.vn/wp-content/uploads/2018/05/hinh-hu-tiu-nam-vang.jpg', 30, 'hủ tiếu gõ', 3),
(5, 'Bún bò', 'https://i.ytimg.com/vi/A_o2qfaTgKs/maxresdefault.jpg', 50, 'bún bòa', 3),
(6, 'Khoai tây chiên', 'http://icdn.dantri.com.vn/zoom/1200_630/2017/khoai-tay-chien-1497363342895.jpg', 100, 'potato', 2),
(7, 'Sandwich', 'https://monngonmoingay.com/wp-content/uploads/2020/12/sandwich-kep-cha-tom-500.jpg', 2, 'san quýt', 2),
(8, 'Đồ chay', 'https://cdn.tgdd.vn/Files/2022/03/21/1421421/tong-hop-16-cach-lam-mon-chay-thanh-dam-dinh-duong-tai-nha-202203211050443101.jpg', 1, 'đây là đồ ăn chay', 5),
(9, 'Bánh tráng', 'https://res.klook.com/image/upload/q_85/c_fill,w_750/v1596008298/blog/eibedalo0wncojkerkpg.jpg', 33, 'bánh cháng', 4),
(10, 'xúc xích', 'https://www.tvpfood.com/image/cache/catalog/product/san-pham-xien-que-tiec/xuc-xich-berlin-03-1024x1024.png', 22, 'sút sít', 4);



INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'Tony', 'tony@gmail.com', '1234');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(2, 'John wick', 'john@gmail.com', '1234');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(3, 'Peter', 'pi@gmail.com', '1234');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(4, 'Kang', 'kang@gmail.com', '1234'),
(5, 'movie 3', 'phim số 3', '123456'),
(6, '', '', ''),
(7, 'abc', 'abc@gmail.com', '$2b$10$tkFIqg.QZbwr33SBNaf4re0HXC6bIrRf/49PwDWa.ulh/8bkXVKXy'),
(8, 'graphql', 'grap@gmail.com', '1234'),
(9, 'graphql', 'grap@gmail.com', '1234'),
(12, 'graphql', 'grap@gmail.com', '1234');


INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'Phúc Long', 'https://static.mservice.io/placebrand/s/momo-upload-api-200218150929-637176353692616410.jpg', 'pl');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(2, 'KFC', '/public/img/1659847246771_test.mp4', 'kfc');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(3, 'Kichi kichi', 'https://aeonmall-haiphong-lechan.com.vn/wp-content/uploads/2020/09/25.-kichi-kichi.jpg', 'kckc');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2022-01-01 09:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2022-01-01 09:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 3, '2022-01-01 09:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2022-01-01 09:00:00'),
(2, 3, '2022-01-01 09:00:00'),
(3, 1, '2022-01-01 09:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 3, '', '[1,2]');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 2, '', '[4,5]');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 1, 1, '', '');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 4, 1, '', ''),
(3, 5, 5, '', ''),
(3, 8, 10, '', ''),
(3, 9, 10, '', '[1,2,3]'),
(3, 10, 10, '', '');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 2, 4, '2022-01-01 09:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 3, 5, '2022-01-01 09:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 1, 3, '2022-01-01 09:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 3, 3, '2022-01-01 09:00:00');



INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Hành phi', 1, 4);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Hành phi', 1, 5);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Hành phi', 1, 8);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Trân châu', 2, 1),
(5, 'Trân châu', 2, 2),
(6, 'tương ớt', 2, 3),
(7, 'tương ớt', 2, 10);




