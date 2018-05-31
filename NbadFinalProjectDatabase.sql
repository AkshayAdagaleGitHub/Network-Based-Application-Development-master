create database NbadFinalProject;
use NbadFinalProject;
Create table user(
userId int auto0_increment,
userName varchar(60),
userEmail varchar(150),
userPassword varchar(300),
userType varchar(60),
primary key(userId)
);

create table area(
area_id int auto_increment,
area_name varchar(60),
primary key (area_id)
);

create table society(
society_id int auto_increment,
society_name varchar(60),
primary key(society_id)
);

create table building(
building_id int auto_increment,
building_name varchar(60),
primary key(building_id) 
);

create table flats(
flat_id int auto_increment,
flat_name varchar(60),
primary key(flat_id)
);

create table feedback(
customer_id int auto_increment,
customer_name varchar(60),
customer_feedback varchar(500),
cutomer_contact varchar(60),
primary key(customer_id)
);

/*Insert queries*/

insert into area(area_id,area_name) values(1,'Charlotte');
insert into area(area_id,area_name) values(2,'San Francisco');
insert into area(area_id,area_name) values(3,'New York');
insert into area(area_id,area_name) values(4,'Las Vegas');

insert into society(society_id,society_name) values(1,'Charlotte 49ers');
insert into society(society_id,society_name) values(2,'San Francisco');
insert into society(society_id,society_name) values(3,'New York');
insert into society(society_id,society_name) values(4,'Vegas');

insert into building(building_id,building_name) values(1,'Charlotte_SkyLine');
insert into building(building_id,building_name) values(2,'Charlotte_Uptown');
insert into building(building_id,building_name) values(3,'San Francisco_SkyLine');
insert into building(building_id,building_name) values(4,'New_York_SkyLine');
insert into building(building_id,building_name) values(5,'las_vegas_SkyLine');


insert into flats(flat_id,flat_name)values(1,'CKL_1');
insert into flats(flat_id,flat_name)values(2,'CKL_2');
insert into flats(flat_id,flat_name)values(3,'CKL_3');
insert into flats(flat_id,flat_name)values(4,'CKL_4');

insert into flats(flat_id,flat_name)values(5,'Charlotte_1');
insert into flats(flat_id,flat_name)values(6,'Charlotte_2');
insert into flats(flat_id,flat_name)values(7,'Charlotte_3');
insert into flats(flat_id,flat_name)values(8,'Charlotte_4');

insert into flats(flat_id,flat_name)values(9,'San_1');
insert into flats(flat_id,flat_name)values(10,'San_2');
insert into flats(flat_id,flat_name)values(11,'San_3');
insert into flats(flat_id,flat_name)values(12,'San_4');

insert into flats(flat_id,flat_name)values(13,'Vegas_1');
insert into flats(flat_id,flat_name)values(14,'Vegas_2');
insert into flats(flat_id,flat_name)values(15,'Vegas_3');
insert into flats(flat_id,flat_name)values(16,'Vegas_4');

/*Creating relationship tables*/

create table area_building(
area_id int,
building_id int,
foreign key (area_id) references area(area_id),
foreign key (building_id) references building(building_id)
);

create table building_flat(
building_id int,
flat_id int,
foreign key (flat_id) references flats(flat_id),
foreign key (building_id) references building(building_id)
);

create table society_building(
society_id int,
building_id int,
foreign key (society_id) references society(society_id),
foreign key (building_id) references building(building_id)
);

create table area_society(
area_id int,
society_id int,
foreign key (area_id) references area(area_id),
foreign key (society_id) references society(society_id)
);
drop table area_society;

insert into area_society values(1,1);
insert into area_society values(1,2);
insert into area_society values(2,3);
insert into area_society values(3,4);




insert into area_building values(1,1);
insert into area_building values(1,2);
insert into area_building values(2,3);
insert into area_building values(3,4);
insert into area_building values(4,5);

insert into building_flat values(1,1);
insert into building_flat values(1,2);
insert into building_flat values(1,3);
insert into building_flat values(1,4);

insert into building_flat values(2,5);
insert into building_flat values(2,6);
insert into building_flat values(2,7);
insert into building_flat values(2,8);

insert into building_flat values(3,9);
insert into building_flat values(3,10);
insert into building_flat values(3,11);
insert into building_flat values(3,12);

insert into building_flat values(4,13);
insert into building_flat values(4,14);
insert into building_flat values(4,15);
insert into building_flat values(4,16);

insert into society_building values(1,1);
insert into society_building values(1,2);
insert into society_building values(2,3);
insert into society_building values(3,4);
insert into society_building values(4,5);





/*Updating the database and testing the queries*/
alter table building
add floors varchar(60);

alter table building
modify floors int;

alter table building
add type varchar(60);

update building
set floors = 4, type = 'apartment'
where building_id>0;

select * from building inner join society_building on building.building_id = society_building.building_id where society_id=1;

select * from society inner join area_society on society.society_id = area_society.society_id where area_society.area_id=1;

select * from flats inner join building_flat on flats.flat_id = building_flat.flat_id where building_flat.building_id=1;

alter table flats
add booked varchar(60);

update flats
set booked='No'
where flat_id>0;

select * from flats;