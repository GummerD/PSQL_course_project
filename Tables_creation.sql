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

-- 5. Создать два сложных (многотабличных) запроса с использованием подзапросов.

-- запрос показывающий имя и фамилию пользователя, его транспортное средство и выборку по статусу владения (продано или во владении пользователя):
SELECT 
 (SELECT id_user FROM profiles WHERE profiles.id_user = garage.id_user) AS id_user,
 (SELECT CONCAT(first_name, ' ', last_name) FROM profiles WHERE profiles.id_user = garage.id_user) AS user_name,
 (SELECT car_brand FROM light_vehicles WHERE light_vehicles.id = garage.id_light_vehicles) AS name_light_vehicles, 
 (SELECT car_brand FROM freight_vehicles WHERE freight_vehicles.id = garage.id_freight_vehicles) AS name_freight_vehicles, 
 (SELECT moto_brand FROM motorcycles WHERE motorcycles.id = garage.id_motorcycles) AS name_motorcycles,
 ownership_status
  FROM garage  
   GROUP BY
    id_user,
	id_light_vehicles, 
	id_freight_vehicles, 
	id_motorcycles,
	ownership_status
   ORDER BY ownership_status;

-- запрос показывающий какие транспортные срадства есть у пользователя с фамлией Gordon:
SELECT 
 id_user,
 (SELECT car_brand FROM light_vehicles WHERE light_vehicles.id = garage.id_light_vehicles) AS name_light_vehicles, 
 (SELECT car_brand FROM freight_vehicles WHERE freight_vehicles.id = garage.id_freight_vehicles) AS name_freight_vehicles, 
 (SELECT moto_brand FROM motorcycles WHERE motorcycles.id = garage.id_motorcycles) AS name_motorcycles,
 ownership_status
  FROM garage
  	WHERE id_user = (SELECT id_user FROM profiles WHERE last_name = 'Gordon');



-- 6. Создать два сложных запроса с использованием объединения JOIN и без использования подзапросов.

-- Получить номера объявлений, по которому была произведена отправка сообщений пользователей:
SELECT
	private_seller.id AS "Номер обявления",
	messages_for_seller.from_user_id AS "ID отправителя",
	messages_for_seller.to_private_seller AS "ID получателя",
	messages_for_seller.text AS "Текст сообщения"
	FROM private_seller
		JOIN messages_for_seller
		ON private_seller.id = messages_for_seller.id;

-- Модифицирую запрос, на  отрправителя:		
SELECT
	private_seller.id AS "Номер обявления",
	messages_for_seller.from_user_id AS "ID отправителя",
	profiles.first_name AS "Имя отправителя",
	profiles.last_name AS "Фамиля отправителя",
	messages_for_seller.to_private_seller AS "ID получателя",
	messages_for_seller.text AS "Текст сообщения"
	FROM private_seller
		JOIN messages_for_seller
		 ON private_seller.id = messages_for_seller.id
		JOIN profiles
		 ON profiles.id_user = messages_for_seller.from_user_id;

-- Модифицирую запрос, меняю имя и фамилию на получателя:	
SELECT
	private_seller.id AS "Номер обявления",
	messages_for_seller.to_private_seller AS "ID отправителя",
	profiles.first_name AS "Имя отправителя",
	profiles.last_name AS "Фамиля отправителя",
	messages_for_seller.text AS "Текст сообщения"
	FROM private_seller
		JOIN messages_for_seller
		 ON private_seller.id = messages_for_seller.id
		JOIN profiles
		 ON profiles.id_user = messages_for_seller.to_private_seller;
		 


-- Второй запрос, для получения полной инфорамции о пользователях:
SELECT
 users.id AS "ID пользователя",
 users.login AS "Логин пользователя",
 users.password AS "Пароль пользователя",
 users.created_at AS "Дата создания учетной записи",
 profiles.first_name AS "Имя пользователя",
 profiles.last_name AS "Фамилия пользователя",
 profiles.email AS "Эл. почта пользователя",
 profiles.phone AS "Телефон пользователя",
 profiles.driving_experience AS "Стаж вождения пользователя",
 profiles.personal_information AS "Информация о пользоватиле",
 profiles.main_foto_id AS "Фотография пользователя",
 profiles.created_at AS "Дата создания профиля"
 	FROM profiles
 		JOIN users
		ON profiles.id_user = users.id;

-- Третий запрос, по которуму в 10-ом задании будет проведена оптимизация.
--Запрос, позволяющий по фамалии узнать, какие легковый автомобили есть у пользователя в гараже: 
SELECT
 profiles.id_user,
 profiles.last_name,
 profiles.first_name,
 garage.id_light_vehicles,
 light_vehicles.car_brand
  FROM profiles
  	JOIN garage
	ON garage.id_user = profiles.id_user
	JOIN light_vehicles
	ON garage.id_light_vehicles = light_vehicles.id
	WHERE last_name = 'Lindsay';

-- 7.Создать два представления, в основе которых лежат сложные запросы.

-- создаю представление, которое показывает пользователей без мотоциклов:
CREATE VIEW  users_without_motorcycles AS
SELECT DISTINCT
	users.id,
 	profiles.first_name,
	profiles.last_name
	FROM users
		JOIN profiles
			ON users.id = profiles.id_user
		JOIN garage
			ON users.id = garage.id_user 
			WHERE garage.id_motorcycles IS NULL;
			
SELECT * FROM users_without_motorcycles LIMIT 5;

-- создаю представление, показывающее пользователей с 2 и более объявлениями: 
CREATE VIEW show_users_more_than_two_ads AS
SELECT
	users.id,
 	profiles.first_name,
	profiles.last_name
	FROM users
		JOIN profiles
			ON users.id = profiles.id_user
		JOIN private_seller
			ON users.id = private_seller.id_user 
			GROUP BY users.id,
			profiles.first_name,
			profiles.last_name
			HAVING COUNT(private_seller.id_user) > 2;
			
SELECT * FROM show_users_more_than_two_ads LIMIT 5;

--8.Создать пользовательскую функцию.

-- функция, показывающая название и цвет грузвого автомобиля, по его ID:
CREATE FUNCTION name_and_color_by_id (id_vehicles INTEGER, OUT color VARCHAR, OUT power VARCHAR) AS
$$
	SELECT 
		car_brand,
		car_color
	FROM freight_vehicles
	WHERE id = id_vehicles;
$$
LANGUAGE SQL;

SELECT name_and_color_by_id(9);