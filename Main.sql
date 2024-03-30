create database if not exists event_mangment;

use event_mangment;

create table Events_TB (
Event_id varchar(10) Not null,
E_date date,
E_time time,
Number_of_Participant int,
primary key(Event_id));

create table Event_cordinators(
Cordinator_id varchar(12) not null,
Co_name varchar(45) ,
Department varchar(15),
phone_number varchar(10),
Birthday date,
primary key(Cordinator_id));

create table employee( 
empl_id varchar(12) not null,
Empl_name varchar(45),
Birthday date ,
phone_number varchar(10) ,
primary key(empl_id));

create table clients (
client_id varchar(12) not null,
Cilent_name varchar(45) ,
Contact_number varchar(15) ,
Home_number varchar(6),
streat varchar(80) ,
town varchar(50),
Post_office_number varchar(12),
primary key(client_id));

create table hotels (
hotelId varchar(12) not null,
hotel_name varchar(30),
contact_details varchar(15) ,
City varchar(50),
street varchar(30),
primary key (hotelId)
);

create table musics (
bandId varchar(12) not null,
B_name varchar(50),
style varchar(75) ,
contact_id varchar(20) ,
charge_of_event double ,
primary key(bandId));

create table booking (
BookingId varchar(12) not null,
payment double ,
Booking_date date,
primary key(BookingId));

create table catering (
CateringId varchar(12) not null,
Charge_per_person double ,
contactNumber varchar(15),
primary key( CateringId));

create table photography (
photpgrapy_id varchar(12) not null,
contact_number varchar(15) ,
P_name varchar(30) ,
charge_per_person double,
primary key(photpgrapy_id));

create table decoration(
deco_id varchar(12) not null,
contact_number varchar(15) ,
primary key(deco_id));

create table transportation(
vehi_number varchar(10) not null,
type_of_vehicle varchar(20) ,
contact_number varchar(15) ,
charge_per_1km double,
primary key(vehi_number));

alter table Events_TB add Hotel_id varchar(12) default 'HT00001' not null;
alter table Events_TB add band_id varchar(12) default 'BT00001' not null;
alter table Events_TB add Trasportation_id varchar(12) default 'VH00001' not null;
alter table Events_TB add Decoration_id varchar(12) default 'DC00001' not null;
alter table Events_TB add Phtography_id varchar(12) default 'PH00001' not null;
alter table Events_TB add catering varchar(12) default 'CT00001' not null;
alter table Events_TB add Cootdinator_id varchar(12) default 'EMP_C_00001' not null;


-- some events has maybe more than employees there for that time event table has multi valued attributes 
-- then i create new table for event employees 

create table Event_employees(
event_id varchar(12) not null,
employee_id varchar(12) not null,
primary key(event_id, employee_id));

/* relationship*/
-- event table and hotels table relationship 

alter table events_Tb add constraint fk_hotel
foreign key(Hotel_id) references hotels(hotelId)
on delete cascade on update cascade;

-- events table and decoration table relationship

alter table events_tb add constraint fk_decoration
foreign key(Decoration_id) references decoration(deco_id)
on delete cascade on update cascade;

-- event table and photography table relationship

alter table Events_TB add constraint fk_phtography 
foreign key(Phtography_id) references Photography(photpgrapy_id)
on delete cascade on update cascade;

-- event table and band table relationship

alter table Events_TB add constraint fk_band 
foreign key(band_id) references Musics(bandId)
on delete cascade on update cascade;

-- event table and catering table relationship

alter table Events_TB add constraint fk_catering
foreign key(catering) references catering(cateringId)
on delete cascade on update cascade;

-- event table and traspotation table relationship

alter table Events_TB add constraint fk_transportation
foreign key(Trasportation_id) references transportation(vehi_number)
on delete cascade on update cascade;

-- event table and cordinator table relationship

alter table Events_TB add constraint fk_cordinator
foreign key(Cootdinator_id) references event_cordinators(cordinator_id)
on delete cascade on update cascade;

-- add coodinator_Id collomn for employee table 

alter table employee add coodinator_id varchar(12) default 'EMP_C_00001'; 

-- employee table and cordinator table relationship

alter table employee add constraint fk_cordinatorId
foreign key(coodinator_id) references event_cordinators(cordinator_id)
on delete set null on update cascade;

alter table event_employees drop primary key;

alter table event_employees add employee2_id varchar(12) ;
alter table event_employees add employee3_id varchar(12) ;
alter table event_employees add employee4_id varchar(12) ;
alter table event_employees add employee5_id varchar(12) ;
alter table event_employees add employee6_id varchar(12) ;
alter table event_employees add employee7_id varchar(12) ;
alter table event_employees add employee8_id varchar(12) ;
alter table event_employees add employee9_id varchar(12) ;
alter table event_employees add employee10_id varchar(12) ;

alter table event_employees add constraint primary key(event_id);

-- event_employee and event table relationsip

alter table event_employees add constraint fk_Event  
foreign key(event_id) references events_tb(event_id) 
on delete cascade on update cascade;

-- event table client colomn

alter table events_tb add client_id varchar(12) not null;

-- event and client relationsip

alter table events_tb add constraint fk_client 
foreign key(client_id) references clients(client_id)
on delete cascade on update cascade;

-- booking and event table relationship

alter table booking add constraint fk_event_booking 
foreign key(bookingId) references events_tb (event_id)
on delete cascade on update cascade;

-- add booking table to client id colomn 
alter table booking add client_id varchar(12) not null;

-- booking table and client table realationship
alter table booking add constraint fk_client_booking 
foreign key(client_id) references clients(client_id) 
on delete cascade on update cascade ;

Alter Table clients
add constraint unique_client_id UNIQUE (client_id);


-- add is maneger colomn
alter table employee add IsManeger boolean default false;
alter table employee add ManegerId varchar(12) default 'MG0001';

-- recursvie relationship
Alter table employee
add constraint fk_manager_employee foreign key  (ManegerId) references employee(empl_id)
on delete cascade on update cascade;
