USE Master
CREATE DATABASE RK3
GO
USE RK3
GO

CREATE TABLE DATEANDTIME
(
	id_d int,
	dates DATETIME2,
	dayw nvarchar(50),
	times DATETIME2,
	tip int
)

CREATE TABLE SOTRUDNIKI
(
	id_s int,
	fio nvarchar(50),
	datebirth DATETIME2,
	otdel nvarchar(50)
)

INSERT INTO DATEANDTIME(id_d, dates,dayw, times, tip) VALUES
    (1, '25-09-1990', 'Понедельник', '9:00', 1),
	(1, '25-09-1990', 'Понедельник', '11:00', 2),
	(2, '24-09-1990', 'Воскресенье', '10:00', 1),
	(2, '24-09-1990', 'Воскресенье', '19:00', 2),
	(3, '23-09-1990', 'Суббота', '11:00', 1),
	(3, '23-09-1990', 'Суббота', '11:20', 2),
	(4, '22-09-1990', 'Пятница', '12:00', 1),
	(4, '22-09-1990', 'Пятница', '15:00', 2);
	
INSERT INTO SOTRUDNIKI(id_s, fio, datebirth, otdel) VALUES
    (1, 'Вас Йук Гор', '25-09-1980', '9-00', 1),
	(2, 'Ныр Пук Хур', '13-01-1981', '11-00', 1),
	(3, 'Шар Ван Лок', '21-03-1900', '10-00', 1),
	(4, 'Уух Оох Аах', '29-07-1860', '19-00', 2);