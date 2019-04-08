USE Master
CREATE DATABASE RK2_3
GO
USE RK2_3

CREATE TABLE ruk
( ruk_id VARCHAR(10) NOT NULL,
  fio VARCHAR(100) NOT NULL,
  birthday VARCHAR(100) NOT NULL,
  years VARCHAR(2) NOT NULL, 
  phone VARCHAR(11) NOT NULL,
);

CREATE TABLE krug
( krug_id VARCHAR(10) NOT NULL,
  krug_name VARCHAR(100) NOT NULL,
  date_found DATE NOT NULL,
  info VARCHAR(100) NOT NULL,
);

CREATE TABLE people
( people_id VARCHAR(10) NOT NULL,
  fio VARCHAR(100) NOT NULL,
  birth_date DATE NOT NULL,
  adress VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
);

CREATE TABLE Linker 
( krug_id int NOT NULL, 
  people_id int NOT NULL 
) 
GO 

ALTER TABLE krug
ADD CONSTRAINT krug_pk PRIMARY KEY (krug_id) 
GO 

ALTER TABLE people 
ADD CONSTRAINT people_pk PRIMARY KEY (people_id) 
GO 

ALTER TABLE ruk 
ADD CONSTRAINT ruk_pk PRIMARY KEY (ruk_id) 
GO 

ALTER TABLE Linker 
ADD CONSTRAINT krug_fk FOREIGN KEY (krug_id) 
REFERENCES krug (krug_id) 
ON DELETE CASCADE 
ON UPDATE CASCADE 
GO 

ALTER TABLE Linker
ADD CONSTRAINT people_fk FOREIGN KEY (people_id) 
REFERENCES people (PosID) 
ON DELETE CASCADE 
ON UPDATE CASCADE 
GO 

ALTER TABLE krug
ADD CONSTRAINT ruk_fk FOREIGN KEY (ruk_id) 
REFERENCES ruk (ruk_id) 
ON DELETE CASCADE 
ON UPDATE CASCADE 
GO

INSERT INTO people (people_id, fio, birth_date, adress, email) VALUES
    ('1', 'Гостев Юрий Михайлович', '14/09/2018', 'Москва', '1@mail.ru'),
    ('2', 'Гастев Павел Юрьич', '15/09/2018', 'Москва', '2@gmail.com'),
    ('3', 'Шастева Катя Маслиннекова', '16/09/2018', 'Питер', '3@yandex.ru'),
	('4', 'Шостева Маща Уездкова', 'Екаеринбург', '4@bk.ru'),
	('5', 'Ростева Шаня Улукмейкина', '18/09/2018', 'Архангельск', '5@mail.ru'),
	('6', 'Растев Щека Щекин', '19/09/2018', 'Нижний', '6@yandex.com'),
	('7', 'Ностев Василий Гостевич', '20/09/2018', 'Новгород', '7@gmail.ru'),
	('8', 'Настев Рома Васильевич', '21/09/2018', 'Московск', '8@mail.com'),
	('9', 'Настев Ваня Васильевич', '22/09/2018', 'Гыг', '9@bk.com'),
	('10', 'Настев Коля Иванович', '23/09/2018', 'Пык', '10@mail.nl'),
	('11', 'Шарович Шышуга Шарич', '24/09/2018', 'Шак', '11@gmail.nl');

INSERT INTO krug (krug_id, krug_name, date_found, info) VALUES
    ('1', 'odin', '14/09/2015', 'первые'),
    ('2', 'dva', '15/09/2015', 'вторые'),
    ('3', 'tri', '16/09/2015', 'третьи'),
	('4', 'chetire', '17/09/2015', 'четвертые'),
	('5', 'pat', '18/09/2015', 'пятые'),
	('6', 'shest', '19/09/2015', 'шестые'),
	('7', 'sem', '20/09/2015', 'седьмые'),
	('8', 'vosem', '21/09/2015', 'восьмые'),
	('9', 'devat', '22/09/2015', 'девятые'),
	('10', 'desat', '23/09/2015', 'десятые'),
	('11', 'odinadcat', '24/09/2015', 'одиннадцатые');

INSERT INTO ruk (ruk_id, fio, birthday, years, phone) VALUES
    ('1', 'Туш Пык Тур', '14/09/2018', '2', '89157494761'),
    ('2', 'Кик Фур Ван', '15/09/2018', '3', '89157494762'),
    ('3', 'Шак Кок Пух', '16/09/2018', '1', '89157494763'),
	('4', 'Кик Фур Ван', '17/09/2018', '6', '89157494764'),
	('5', 'Кокорев Юлий Васильщенков', '18/09/2018', '7', '89157494765'),
	('6', 'Шарандун Колок Михайлович', '19/09/2018', '6', '89157494766'),
	('7', 'Гурев Василий Межпланетов', '20/09/2018', '3', '89157494767'),
	('8', 'Евтиров Какиг Гузманович', '21/09/2018', '8', '89157494768'),
	('9', 'Гузнович Устав Йоркович', '22/09/2018', '4', '89157494769'),
	('10', 'Шарингович Нобла Басманова', '23/09/2018', '1', '89157494710'),
	('11', 'Числова Маша Михайловна', '24/09/2018', '9', '89157494611');

