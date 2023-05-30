/*
	Создаю примерную базу данных на основе сервиcа "Auto.ru". В состав базы данных включил следующие таблицы:
- пользователи;
- профиль пользователей;
- отдельная таблица для фотографий пользователей;
- отдельная таблица для фотографий транспортных средств;
- для видео транспортных средств;
- с легковыми транспортыми средстсвами;
- с грузовыми транспортыми средстсвами;
- c мотоциклами;
- с частными объявлениями;
- c сообщениями, которые пользователь может написать продавцу;
- c "гаражом", в котором пользователь может разместить информацию о своем ТC;
*/

-- 1.ТАБЛИЦА ПОЛЬЗОВАТЕЛЕЙ, необходима для аутентификации пользователей:
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  id SERIAL PRIMARY KEY,
  login VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL UNIQUE,
  created_at DATE
);

-- 2.ТАБЛИЦА ПРОФИЛЕЙ, в которой хранится подробная информация о пользователях:
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	id_user INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(120)UNIQUE,
	phone VARCHAR(15)UNIQUE,
	driving_experience SMALLINT,
	personal_information VARCHAR (300),
	main_foto_id INT UNIQUE,
	created_at DATE,
	
	CONSTRAINT user_id_fk FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3.ТАБЛИЦА ФОТОГРАФИЙ ПОЛЬЗОВАТЕЛЕЙ, здесь будет храниться информация о фотографиях в профилях пользоватлей:
DROP TABLE IF EXISTS users_photo;
CREATE TABLE users_photo(
	id SERIAL PRIMARY KEY,
	owner_id INT NOT NULL,
	url VARCHAR(250) NOT NULL,
	description VARCHAR(250) NOT NULL,
	uploaded_at DATE NOT NULL,
	size INT NOT NULL,
	
	CONSTRAINT owner_id_fk FOREIGN KEY (owner_id) REFERENCES profiles(main_foto_id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- 4.ТАБЛИЦА ФОТОГРАФИЙ ТРАНСПОРТНЫХ СРЕДСТВ:
DROP TABLE IF EXISTS vehicles_photo;
CREATE TABLE vehicles_photo(
	id SERIAL PRIMARY KEY,
	owner_id INT NOT NULL,
	url VARCHAR(250) NOT NULL,
	description VARCHAR(250) NOT NULL,
	uploaded_at DATE NOT NULL,
	size INT NOT NULL,
	
	CONSTRAINT owner_id_fk FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 6.ТАБЛИЦА ЛЕГКОВЫХ ТРАНСПОРТНЫХ СРЕДСТВ:
DROP TABLE IF EXISTS light_vehicles;
CREATE TABLE light_vehicles(
	id SERIAL PRIMARY KEY,
	car_brand VARCHAR(100) NOT NULL,
	car_name VARCHAR(100) NOT NULL,
	car_color VARCHAR(100) NOT NULL,
	engine_power VARCHAR(50) NOT NULL,
	gearbox VARCHAR(50) NOT NULL,
	car_body VARCHAR(50) NOT NULL,
	year_of_issue DATE NOT NULL,
	created_at DATE NOT NULL
);



-- 7.ТАБЛИЦА ГРУЗОВЫХ ТРАНСПОРТНЫХ СРЕДСТВ:
DROP TABLE IF EXISTS freight_vehicles;
CREATE TABLE freight_vehicles(
	id SERIAL PRIMARY KEY,
	car_brand VARCHAR(100) NOT NULL,
	car_name VARCHAR(100) NOT NULL,
	car_color VARCHAR(100) NOT NULL,
	engine_power VARCHAR(50) NOT NULL,
	gearbox VARCHAR(50) NOT NULL,
	car_body VARCHAR(50) NOT NULL,
	year_of_issue DATE NOT NULL,
	created_at DATE NOT NULL
);



-- 8.ТАБЛИЦА МОТОЦИКЛОВ:
DROP TABLE IF EXISTS motorcycles;
CREATE TABLE motorcycles(
	id SERIAL PRIMARY KEY,
	moto_brand VARCHAR(100) NOT NULL,
	moto_name VARCHAR(100) NOT NULL,
	moto_color VARCHAR(100) NOT NULL,
	engine_power VARCHAR(50) NOT NULL,
	gearbox VARCHAR(50) NOT NULL,
	moto_body VARCHAR(50) NOT NULL,
	year_of_issue DATE NOT NULL,
	created_at DATE NOT NULL
);


-- 9. ТАБЛИЦА ЧАСТНЫХ ОБЪЯВЛЕНИЙ О ПРОДАЖЕ ТС:
DROP TABLE IF EXISTS private_seller;
CREATE TABLE private_seller(
	id SERIAL PRIMARY KEY,
	id_user INT,
	id_light_vehicles INT,
	id_freight_vehicles INT,
	id_motorcycles INT,
	description VARCHAR (20),
	status VARCHAR (20),
	photo_id INT,
	video_id INT,
	price INT,
	created_at DATE NOT NULL,
	
	CONSTRAINT id_user_fk FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT id_light_vehicles_fk FOREIGN KEY (id_light_vehicles) REFERENCES light_vehicles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT id_freight_vehicles_fk FOREIGN KEY (id_freight_vehicles) REFERENCES freight_vehicles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT id_motorcycles_fk FOREIGN KEY (id_motorcycles) REFERENCES motorcycles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT photo_id_fk FOREIGN KEY (photo_id) REFERENCES vehicles_photo(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT video_id_fk FOREIGN KEY (video_id) REFERENCES video(id) ON DELETE CASCADE ON UPDATE CASCADE
);




-- 10. ТАБЛИЦА СООБЩЕНИЙ ДЛЯ ПРОДАВЦА ПО ЕГО ОБЪЯВЛЕНИЮ:
DROP TABLE IF EXISTS messages_for_seller;
CREATE TABLE messages_for_seller(
	id SERIAL PRIMARY KEY,
	from_user_id INT NOT NULL,
	to_private_seller INT NOT NULL,
	text VARCHAR (500) NOT NULL,
	created_at DATE NOT NULL,
	
	CONSTRAINT from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT to_private_seller_fk FOREIGN KEY (to_private_seller) REFERENCES private_seller(id) ON DELETE CASCADE ON UPDATE CASCADE
);



-- 11.ТАБЛИЦА ГАРАЖ, в которой пользователь может указать, каким автомобилем он владеет или владел, с его описанием.
DROP TABLE IF EXISTS garage;
CREATE TABLE garage(
	id_user INT,
	id_light_vehicles INT,
	id_freight_vehicles INT,
	id_motorcycles INT,
	state_number VARCHAR(20)UNIQUE,
	VIN VARCHAR(30)UNIQUE,
	vehicles_photo_id INT,
	vehicles_video_id INT,
	ownership_status VARCHAR (50),
	vehicle_information VARCHAR (300),
	created_at DATE,
	
	CONSTRAINT id_user_fk FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT id_light_vehicles_fk FOREIGN KEY (id_light_vehicles) REFERENCES light_vehicles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT id_freight_vehicles_fk FOREIGN KEY (id_freight_vehicles) REFERENCES freight_vehicles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT id_motorcycles_fk FOREIGN KEY (id_motorcycles) REFERENCES motorcycles(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT photo_id_fk FOREIGN KEY (vehicles_photo_id) REFERENCES vehicles_photo(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT video_id_fk FOREIGN KEY (vehicles_video_id) REFERENCES video(id) ON DELETE CASCADE ON UPDATE CASCADE
);

