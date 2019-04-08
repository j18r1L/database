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
	times DATETIME2 ,
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
    (1, '18-01-2019', '�������', '9:00', 1),
	(1, '18-01-2019', '�������', '9:20', 2),
	(2, '18-01-2019', '�������', '9:25', 1),
	(2, '18-01-2019', '�������', '9:45', 2);
	
INSERT INTO SOTRUDNIKI(id_s, fio, datebirth, otdel) VALUES
    (1, '������ ��', '25-09-1990', '��'),
	(2, '������ ��', '12-11-1987', '�����������');
