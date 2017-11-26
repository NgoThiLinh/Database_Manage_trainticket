CREATE DATABASE quanlibanve;
USE quanlibanve;
CREATE TABLE station (
    id_station INT NOT NULL AUTO_INCREMENT,
    name_station VARCHAR(20),
    PRIMARY KEY (id_station)
);

INSERT INTO station(name_station)
VALUES
		(' DaNang station'),
        (' HaNoi station'),
        (' HoChiMinh station');
SELECT 
    *
FROM
    station;

drop table station;
INSERT INTO station(name_station)
VALUES ('Hue station');
DELETE FROM station 
WHERE
    id_station = 1;
SELECT 
    *
FROM
    station;


CREATE TABLE Train (
    id_train INT AUTO_INCREMENT,
    name_train VARCHAR(20),
    journey VARCHAR(30),
    seat INT,
    number_compartment INT,
    id_station INT,
    id_ticket INT,
    PRIMARY KEY (id_train),
    FOREIGN KEY (id_station)
        REFERENCES station (id_station)
);
ALTER TABLE train AUTO_INCREMENT=3;
INSERT INTO train (name_train,journey,seat,number_compartment,id_station,id_ticket)
VALUES 
		('SE7','danang-saigon',170,7,1,1),
        ('SE5','danang-hanoi',159,6,2,2),
        ('TN1','hue-saigon',200,8,1,3), 
		('SE1','hanoi-saigon',210,9,2,4);
		
SELECT * FROM train;
UPDATE train 
SET 
    name_train = 'SE8'
WHERE
    id_train = 3;/*update du lieu*/
SELECT 
    *
FROM
    train;
DELETE FROM train 
WHERE
    id_train = 3;/*xoa du lieu*/
INSERT INTO train 
	VALUES ('SE3',180,3);/*Chèn dữ liệu*/
    
CREATE TABLE Ticket (
    id_ticket INT AUTO_INCREMENT,
    time_leave DATETIME,
    time_come DATETIME,
    id_seat INT,
    ticket_cost INT,
    time_buy DATE,
    id_train INT,
    PRIMARY KEY (id_ticket),
    FOREIGN KEY (id_train)
        REFERENCES train (id_train)
);
INSERT INTO Ticket(time_leave,time_come,id_seat,ticket_cost,time_buy,id_train)
VALUES
	('2015-07-22 17:55:33','2015-07-25 12:00:50',23,70000,'2015-07-21',1),
	('2015-07-30 09:55:33','2015-07-11 04:07:09',40,90000,'2015-06-22',2),
	('2016-07-05 18:55:33','2016-07-08 15:34:09',18,60000,'2015-07-20',3),
	('2016-07-24 20:55:33','2016-07-24 23:45:09',22,100000,'2015-07-24',4);
SELECT 
    *
FROM
    Ticket;
CREATE TABLE train_team (
    id_trainteam INT AUTO_INCREMENT,
    name_driver VARCHAR(20),
    address_driver VARCHAR(30),
    salary VARCHAR(10),
    id_ticket INT,
    id_train INT,
    PRIMARY KEY (id_trainteam),
    FOREIGN KEY (id_ticket)
        REFERENCES ticket (id_ticket),
    FOREIGN KEY (id_train)
        REFERENCES train (id_train)
);
INSERT INTO train_team( name_driver,address_driver, salary, id_ticket,id_train)
	VALUES
			('linh','Thanh Binh','200$',1,1),
			('anh','Ca Mau','300$',2,2),
			('Ha','Da Lat','400$',3,3),
			('an','Ninh Thuan','500$',4,4);
            
SELECT 
    *
FROM
    train_team;
DROP TABLE train_team ;

ALTER TABLE train_team MODIFY name_driver VARCHAR(25);/* Thay đổi kiểu dữ liệu*/
DELETE FROM train_team 
WHERE
    name_driver = 'hoa'; /* Xóa dữ liệu*/
ALTER TABLE train_team DROP PRIMARY KEY;/* Xóa khóa */
CREATE TABLE compartment (
    id_compartment INT NOT NULL AUTO_INCREMENT,
    name_compartment VARCHAR(50),
    seat_compartment INT,
    id_train INT NOT NULL,
    PRIMARY KEY (id_compartment),
    FOREIGN KEY (id_train)
        REFERENCES train (id_train)
);
INSERT INTO compartment(name_compartment,seat_compartment,id_train)
VALUES 
		('toa ghe cung',21,1),
		('toa ghe mem',22,4),
		('toa giuong nam',30,3),
		('toa ghe mem co dieu hoa',40,2),
		('toa ghe cung co dieu hoa',23,1),
        ('toa ghe mem',22,1);
INSERT INTO compartment(name_compartment,seat_compartment,id_train)
VALUES 
		('toa ghe mem-phong lanh',22,3),
		('toa giuong nam',30,1),
          ('toa ghe mem-phong lanh',16,4),
		('toa ghe mem co dieu hoa',40,2);
        
SELECT 
    *
FROM
    compartment;

CREATE TABLE customer (
    name_train VARCHAR(20),
    name_customer VARCHAR(20),
    address VARCHAR(20),
    stiation VARCHAR(40),
    gender VARCHAR(20),
    id_ticket INT,
    id_compartment INT,
    id_train INT,
    seat INT,
    birthday DATE,
    PRIMARY KEY (id_ticket , id_compartment),
    FOREIGN KEY (id_ticket)
        REFERENCES ticket (id_ticket),
    FOREIGN KEY (id_train)
        REFERENCES train (id_train),
    FOREIGN KEY (id_compartment)
        REFERENCES compartment (id_compartment)
);
INSERT INTO customer(name_customer,gender,address,birthday,stiation,id_compartment,id_ticket,id_train,seat,name_train)
VALUES
		('Ngo Thi Linh','female','Quang Tri Foreign','2017-4-24','young',7,2,1,170,'SE7'),
        ('Ngo Thi La','female','Quang Tri Foreign','1997-5-5','older',1,2,1,170,'SE7'),
        ('Nguyen Van A','male','Da Nang Vietnam','1998-5-5','older',9,1,2,159,'SE5'),
		('Do Ngoc Anh','female','Da Nang Vietnam','1996-5-5','medium',6,2,3,200,'TN1'),
		('Ta Thi An','male','Quang Nam Foreign','1998-5-5','odler',7,3,4,210,'SE1'),
		('Nguyen Van Tan','female','Binh Dinh Vietnam','2017-4-24','young',4,4,1,170,'SE7'),
		('Nguyen Thuyen Quyen','female','Quang Nam Foreign','1998-5-5','young',6,1,2,159,'SE5'),
		('Ngo Thi Linh','female','Quang Tri Foreign','1997-5-5','older',4,2,1,170,'SE7'),
        ('Nguyen Van A','male','Da Nang Vietnam','1998-5-5','medium',3,1,2,159,'SE5'),
		('Do Ngoc Anh','female','Da Nang Vietnam','1996-5-5','medium',5,2,3,200,'TN1'),
        ('Nguyen Van Tan','female','Binh Dinh Vietnam','1990-5-5','older',5,4,1,170,'SE7'),
        ('Nguyen Thuyen Quyen','female','Quang Nam Foreign','1998-5-5','young',1,1,2,159,'SE5');
	SELECT 
    *
FROM
    customer;    
    

/*hien thi thong tin nhung hanh khach co ngay sinh vao hom nay */
SELECT 
    train.name_train,
    compartment.name_compartment,
    customer.name_customer,
    customer.stiation,
    ticket.id_seat,
    compartment.id_compartment,
    ticket.time_leave,
    customer.birthday
FROM
    train,
    customer,
    compartment,
    ticket
WHERE
    customer.id_compartment = compartment.id_compartment
        AND customer.id_ticket = ticket.id_ticket
        AND train.id_train = compartment.id_compartment
        AND customer.birthday = CURDATE();

/*hien thi ten tau,ten toa,ten hanh khach da lon tuoi*/
SELECT 
    train.name_train,
    compartment.name_compartment,
    customer.name_customer,
    customer.stiation,
    ticket.id_seat,
    compartment.id_compartment,
    ticket.time_leave
FROM
    train,
    customer,
    compartment,
    ticket
WHERE
    customer.id_compartment = compartment.id_compartment
        AND customer.id_ticket = ticket.id_ticket
        AND train.id_train = compartment.id_train
        AND customer.stiation = 'older';

/*hien thi nhung khach hang va neu khach hang la hoc sinh hoac nguoi gia thi giam 10%*/
SELECT 
    customer.name_customer,
    customer.stiation,
    ticket.ticket_cost,
    IF(customer.stiation = 'young'
            OR customer.stiation = 'older',
        ticket.ticket_cost * 0.1,
        0) AS giamgia,
    ((ticket.ticket_cost) - IF(customer.stiation = 'young'
            OR customer.stiation = 'older',
        ticket.ticket_cost * 0.1,
        0)) AS conlai
FROM
    customer,
    ticket
WHERE
    customer.id_ticket = ticket.id_ticket;
/* hien thi ten tau va so cho ngoi ma co thoi gian di va thoi gian den nhu duoi*/
SELECT 
    train.name_train,
    train.seat,
    ticket.time_leave,
    ticket.time_come
FROM
    train,
    ticket
WHERE
    ticket.id_ticket = train.id_train
        AND ticket.time_leave = '2015-07-22 17:55:33'
        AND ticket.time_come = '2015-07-25 12:00:50';



/*hien thi hanh khach o da nang*/
SELECT 
    customer.address,
    customer.name_customer,
    customer.stiation,
    ticket.time_leave,
    customer.name_customer,
    customer.stiation,
    ticket.ticket_cost,
    IF(customer.stiation = 'young'
            OR customer.stiation = 'older',
        ticket.ticket_cost * 0.1,
        0) AS giamgia,
    ((ticket.ticket_cost) - IF(customer.stiation = 'young'
            OR customer.stiation = 'older',
        ticket.ticket_cost * 0.1,
        0)) AS conlai
FROM
    customer,
    ticket
WHERE
    customer.id_ticket = ticket.id_ticket
        AND customer.address = 'Da Nang Vietnam';

/*hien thi khach hang co ten bat dau bang chu o*/
SELECT 
    train.name_train,
    compartment.name_compartment,
    customer.name_customer,
    customer.stiation,
    ticket.id_seat,
    compartment.id_compartment,
    ticket.time_leave
FROM
    train,
    customer,
    compartment,
    ticket
WHERE
    customer.id_compartment = compartment.id_compartment
        AND customer.id_ticket = ticket.id_ticket
        AND train.id_train = compartment.id_compartment
        AND name_customer LIKE '%o%';

/*dem xem co bao nhieu khach nu bao nhieu khach nam cua cac toa cua tau 1;
select train.name_train,compartment.name_compartment,count(customer.gender)  
from train,compartment,customer where customer.id_compartment=compartment.id_compartment and 
train.id_train=compartment.id_train and  train.name_train='SE7'
group by compartment.id_compartment ;*/

SELECT 
    train.name_train,
    train.journey,
    train_team.name_driver,
    train_team.address_driver
FROM
    train,
    train_team
WHERE
    train.id_train = train_team.id_trainteam
        AND journey = 'danang-saigon';

/*hien thi khach hang co quoc tich viet nam cu tru nuoc ngoai*/
SELECT 
    *
FROM
    customer
WHERE
    customer.address LIKE '%foreign';

/*hien thi seat con trong trong tau
select customer.name_customer,customer.stiation,ticket.ticket_cost,
if(customer.student='yes',ticket.ticket_cost*0.1,0) as giamgia,((ticket.ticket_cost)-if(customer.student='yes',ticket.ticket_cost*0.1,0)) as conlai 
from customer,ticket
where customer.id_ticket=ticket.id_ticket;*/

SELECT 
    customer.name_customer,
    customer.gender,
    customer.address,
    customer.birthday,
    customer.stiation,
    ticket.time_buy
FROM
    customer,
    ticket
WHERE
    customer.id_ticket = ticket.id_ticket
ORDER BY ticket.time_buy DESC
LIMIT 3;

/*hien thi so cho con trong tren tau SE7*/
SELECT 
    name_train,
    seat,
    (SELECT 
            COUNT(id_train)
        FROM
            customer
        WHERE
            id_train = '1') AS so_ve_da_dat,
    (seat - (SELECT 
            COUNT(id_train)
        FROM
            customer
        WHERE
            id_train = '1')) AS so_cho_con
FROM
    customer
WHERE
    id_train = '1'
GROUP BY id_train = '1';

/*hien thi tat ca nhung hanh khach cua tau 1 va sap xep theo thu tu tang dan cua ten va lay ra 3 ban ghi dau tien*/
SELECT 
    customer.id_compartment,
    customer.name_customer,
    customer.address,
    customer.gender,
    customer.id_ticket
FROM
    customer,
    train,
    compartment
WHERE
    train.id_train = compartment.id_train
        AND compartment.id_compartment = customer.id_compartment
        AND train.id_train = 1
ORDER BY compartment.id_compartment ASC
LIMIT 1 , 3;


/*hien thi nhung tau co toa ghe mem phong lanh ,so cho da dat va so cho con trong */ 
SELECT 
    train.name_train,
    compartment.name_compartment,
    compartment.seat_compartment,
    COUNT(customer.name_customer) AS totalcustomer,
    compartment.seat_compartment - COUNT(train.name_train) AS blanks
FROM
    train
        INNER JOIN
    compartment
        INNER JOIN
    customer ON train.id_train = compartment.id_train
        AND compartment.name_compartment = 'toa ghe mem-phong lanh'
        AND compartment.id_compartment = customer.id_compartment
GROUP BY train.name_train;
