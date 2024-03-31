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

-- weak entities 
CREATE TABLE Rating (
    event_id VARCHAR(12) NOT NULL,
    rating INT CHECK (rating >= 0 AND rating <= 10),
    PRIMARY KEY (event_id)
);

create table Feedback(
 client_id varchar(12) not null,
 Feedback_view varchar(500) ,
 primary key(client_id));
 

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

-- rating and event relationship 

alter table rating add constraint fk_ratin_event foreign key(event_id ) references events_tb(event_id) 
on delete cascade on update cascade;

-- feedback vs client retaionship

alter table feedback add constraint fk_feedBack_cliet foreign key(client_id) references clients(client_id)
on delete cascade on update cascade;

-- simple quary 


-- select oparetion 

select * from employee where isManeger= true;

-- project oparation 
select client_id , client_name, Contact_number from clients;

-- cartierian product oparation
select * from clients,booking;

-- creating a user view 
create view Booking_details as select Bookingid ,client_id ,Payment from booking;

-- Reaname Oparation 
 select empl_id as Id , Empl_name as Employee_Name , coodinator_id as C_id from employee;


-- insert data


INSERT INTO hotels (HotelId, Hotel_name, contact_details, city, street) 
VALUES 
('H0201', 'GreenOasis', '0712345678', 'Colombo', 'Park Avenue'),
('H0301', 'SunsetView', '0778765432', 'Kandy', 'Hillside Drive'),
('H0401', 'SeaBreeze', '0765432109', 'Negombo', 'Beach Road'),
('H0501', 'MountainTop', '0723456789', 'Nuwara Eliya', 'Summit Street'),
('H0601', 'GoldenPalms', '0789012345', 'Bentota', 'Coastal Highway'),
('H0701', 'Riverfront', '0756789012', 'Kitulgala', 'Riverside Avenue');

INSERT INTO catering (cateringId, Charge_per_person, contactNumber)
VALUES
('CT00002', '1500', '0712345678'),
('CT00003', '1800', '0765432109'),
('CT00004', '1000', '0723456789'),
('CT00005', '1300', '0789012345'),
('CT00006', '1600', '0756789012'),
('CT00007', '1400', '0701234567');

INSERT INTO decoration (deco_id, contact_number)
VALUES
('DC08046', '0712345678'),
('DC08047', '0765432109'),
('DC08048', '0723456789'),
('DC08049', '0789012345'),
('DC08050', '0756789012'),
('DC08051', '0701234567');

INSERT INTO musics (bandId, B_name, style, contact_id, charge_of_event)
VALUES
('BT00002', 'Phoenix', 'Rock', '0712345678', '30000'),
('BT00003', 'Harmony', 'Pop', '0765432109', '35000'),
('BT00004', 'RhythmNation', 'Jazz', '0723456789', '28000'),
('BT00005', 'SoulfulSound', 'Blues', '0789012345', '32000'),
('BT00006', 'MelodicBeats', 'Classical', '0756789012', '27000'),
('BT00007', 'FunkyGroove', 'Funk', '0701234567', '31000');


INSERT INTO transportation (vehi_number, type_of_vehicle, contact_number, charge_per_1km)
VALUES
('TN00001', 'Sedan', '0712345678', '50'),
('TN00002', 'Van', '0765432109', '75'),
('TN00003', 'SUV', '0723456789', '100'),
('TN00004', 'Bus', '0789012345', '150'),
('TN00005', 'Limousine', '0756789012', '200'),
('TN00006', 'Motorcycle', '0701234567', '30');

INSERT INTO photography (photpgrapy_id, contact_number, P_name, charge_per_person)
VALUES
('PH00002', '0712345678', 'FocusClick', '1500'),
('PH00003', '0765432109', 'SnapStudio', '1800'),
('PH00004', '0723456789', 'PixelPerfect', '1200'),
('PH00005', '0789012345', 'LensCraft', '1300'),
('PH00006', '0756789012', 'ShutterMasters', '1600'),
('PH00007', '0701234567', 'FrameFusion', '1400');

INSERT INTO event_cordinators (Cordinator_id, Co_name, Department, phone_number, Birthday)
VALUES
('EMP_C_00002', 'John Smith', 'Management', '0712345678', '1990-05-15'),
('EMP_C_00003', 'Jane Doe', 'Weddings', '0765432109', '1985-08-20'),
('EMP_C_00004', 'Michael Johnson', 'Corporate ', '0723456789', '1988-11-10'),
('EMP_C_00005', 'Emily Brown', 'Gatherings', '0789012345', '1993-04-25'),
('EMP_C_00006', 'David Wilson', 'Conferences', '0756789012', '1991-09-30'),
('EMP_C_00007', 'Sarah Anderson', 'Parties', '0701234567', '1987-06-05');


INSERT INTO event_employees (event_id, employee_id, employee2_id, employee3_id, employee4_id, employee5_id, employee6_id, employee7_id, employee8_id, employee9_id, employee10_id)
VALUES
('I_003', 'EMP_001', 'EMP_002', 'EMP_003', 'EMP_004', 'EMP_014', 'EMP_006', 'EMP_007', 'EMP_008', 'EMP_009', null),
('I_004', 'EMP_011', 'EMP_012', 'EMP_013', 'EMP_014', 'EMP_015', 'EMP_016', 'EMP_017', 'EMP_018', 'EMP_019', null),
('I_005', 'EMP_021', 'EMP_022', 'EMP_023', 'EMP_024', 'EMP_007', 'EMP_026', 'EMP_027', 'EMP_028', 'EMP_019', 'EMP_011'),
('I_006', 'EMP_011', 'EMP_002', 'EMP_012', 'EMP_003', 'EMP_018', 'EMP_007', 'EMP_008', 'EMP_003', 'EMP_010', null),
('I_007', 'EMP_001', 'EMP_015', 'EMP_002', 'EMP_006', 'EMP_011', 'EMP_022', null, null, null, null),
('I_008', 'EMP_004', 'EMP_012', 'EMP_012', 'EMP_004', 'EMP_007', 'EMP_006', 'EMP_010', 'EMP_022', null, null);


INSERT INTO clients (client_id, Cilent_name, Contact_number, Home_number, streat, town, Post_office_number)
VALUES
('Cl_0002', 'Alice Johnson', '0712345678', '01123', 'Main Street', 'Colombo', '00100'),
('Cl_0003', 'Robert Smith', '0765432109', '01134', 'Beach Road', 'Galle', '80000'),
('Cl_0004', 'Emily Davis', '0723456789', '01145', 'Hillside Drive', 'Kandy', '20000'),
('Cl_0005', 'Michael Wilson', '0789012345', '01156', 'Summit Street', 'Nuwara Eliya', '60000'),
('Cl_0006', 'Jessica Anderson', '0756789012', '01167', 'Coastal Highway', 'Bentota', '90000'),
('Cl_0007', 'David Brown', '0701234567', '01178', 'Riverside Avenue', 'Kitulgala', '70000');


-- ------------------------------------------
-- inser employee
INSERT INTO employee (empl_id, Empl_name, Birthday, phone_number, coodinator_id, IsManeger, ManegerId)
VALUES
('EMP_001', 'John Smith', '1990-05-15', '0712345678', 'EMP_C_00002', 0, null),
('EMP_003', 'Michael Johnson', '1993-11-10', '0723456789', 'EMP_C_00004', 0, null),
('EMP_004', 'Emily Brown', '1991-04-25', '0789012345', 'EMP_C_00005', 0, null),
('EMP_005', 'David Wilson', '1987-09-30', '0756789012', 'EMP_C_00006', 0, null),
('EMP_006', 'Sarah Anderson', '1985-06-05', '0701234567', 'EMP_C_00007', 0, null);

INSERT INTO employee (empl_id, Empl_name, Birthday, phone_number, coodinator_id, IsManeger, ManegerId)
VALUES ('EMP_002', 'Jane Doe', '1985-08-20', '0765432109', 'EMP_C_00003', 1, 'EMP_002');

INSERT INTO employee (empl_id, Empl_name, Birthday, phone_number, coodinator_id, IsManeger, ManegerId)
VALUES 
('EMP_008', 'Adam Johnson', '1992-03-15', '0712385678', null, 0, null),
('EMP_009', 'Sophia Brown', '1994-11-25', '0765432109', null, 0, null),
('EMP_010', 'Daniel Wilson', '1989-09-05', '0723456789', null, 0, null),
('EMP_011', 'Olivia Anderson', '1987-06-10', '0789012345', null, 0, null),
('EMP_012', 'James Smith', '1991-02-20', '0756789012', null, 0, null),
('EMP_013', 'Emma Johnson', '1986-12-30', '0701234537', null, 0, null);

INSERT INTO employee (empl_id, Empl_name, Birthday, phone_number, coodinator_id, IsManeger, ManegerId)
VALUES 
('EMP_014', 'Noah Taylor', '1993-07-18', '0712385690', null, 0, null),
('EMP_015', 'Ava Martinez', '1990-10-12', '0765432110', null, 0, null),
('EMP_016', 'William Thompson', '1988-04-05', '0723456790', null, 0, null),
('EMP_017', 'Isabella Harris', '1985-11-30', '0789012346', null, 0, null),
('EMP_018', 'Benjamin Clark', '1992-01-25', '0756789013', null, 0, null),
('EMP_019', 'Mia Lewis', '1987-09-15', '0701234538', null, 0, null),
('EMP_020', 'Ethan Hall', '1994-03-20', '0712385691', null, 0, null),
('EMP_021', 'Amelia Young', '1991-08-10', '0765432111', null, 0, null),
('EMP_022', 'Alexander Wright', '1989-12-05', '0723456791', null, 0, null),
('EMP_023', 'Charlotte King', '1986-05-25', '0789012347', null, 0, null);
-- --------------------------------------------------------------------------

INSERT INTO events_tb (event_id, e_date, E_time, Number_of_participant, Hotel_id, band_id,Trasportation_id,Decoration_id,Phtography_id,catering, cootdinator_id, client_id)
VALUES
('E_001', '2024-04-01', '14:00:00', 50, 'H0201', 'BT00005', 'TN00004','DC08046','PH00003', 'CT00002', 'EMP_C_00002', 'Cl_0002'),
('E_002', '2024-04-05', '15:30:00', 80, 'H0401', 'BT00007', 'TN00001','DC08050', 'PH00003', 'CT00005', 'EMP_C_00002', 'Cl_0002'),
('E_003', '2024-04-10', '16:45:00', 60, 'H0501', 'BT00002', 'TN00001','DC08047', 'PH00004', 'CT00005', 'EMP_C_00003', 'Cl_0003'),
('E_004', '2024-04-15', '18:00:00', 100, 'H0701', 'BT00005', 'TN00006','DC08047', 'PH00004', 'CT00006', 'EMP_C_00004', 'Cl_0004'),
('E_005', '2024-04-20', '19:30:00', 70, 'H0501', 'BT00003', 'TN00004','DC08046', 'PH00003', 'CT00002', 'EMP_C_00005', 'Cl_0005'),
('E_006', '2024-04-25', '20:45:00', 120, 'H0401', 'BT00002', 'TN00004','DC08050', 'PH00006', 'CT00006', 'EMP_C_00006', 'Cl_0006');


