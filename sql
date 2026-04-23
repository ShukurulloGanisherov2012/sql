create table computers (
id Serial primary key,
brendi varchar(50),
model varchar(50) not null,
cpu varchar(50),
ram int,
xotira varchar(50),
narxi decimal(10,2) not null check (narxi >= 700),
soni int
);

create table users (
id Serial primary key,
ism_familiya varchar(100) not null unique,
telefon_raqami varchar(20),
sohasi varchar(50),
qurilmaID int,
foreign key (qurilmaID) references computers(id)
);


insert into computers(brendi,model,cpu,ram,xotira,narxi,soni)
values('HP','EliteBook 840','Intel i5',8,'256',800.00,20),
('Dell','XPS 13','Intel i7',16,'512',1200.00,10),
('Apple','MacBook Pro','M2',16,'1000',1800.00,15),
('Lenovo','ThinkPad L15','AMD Ryzen 5',8,'512',850.00,12),
('Asus','ZenBook 14','Intel i7',16,'1000',1100.00,8);


insert into users(ism_familiya,telefon_raqami,sohasi,qurilmaID)
values('Ali Valiyev', '+998901234567','IT',2),
('Zuhra Karimova','+998931112233','Accouting',1),
('Sardor Rahimzoda','+998948887766','HR',4),
('Olim Toshmatov','+998993332211','Design',3);

alter table computers 
rename column ram to tezkor_xotira;

alter table users
rename column sohasi to soha;

alter table users 
rename to foydalanuvchilar;

alter table foydalanuvchilar
drop column telefon_raqami;

select
	f.ism_familiya,
	c.brendi,
	c.soni
from foydalanuvchilar f
join computers c on f.qurilmaID=c.id;

select c.model,c.xotira
from foydalanuvchilar f
join computers c on f.qurilmaID = c.id
where f.soha = 'Design';

select f.*,c.narxi
from foydalanuvchilar f
join computers c on f.qurilmaID = c.id 
where c.narxi = (select max(narxi) from computers);

select count(*) as xotira_512_soni
from computers
where xotira = '512';


