-- Chapter 03
create database if not exists EP;
-- drop schema EP;
use EP;

create table Events_TB(
	Event_ID varchar(12) Not null,
    Empl_ID varchar(12) not null,
    Coordinator_ID varchar(12) not null,
    Band_ID varchar(12) not null,
    Hotel_Reg_No varchar(20) not null,
    Vehicle_No varchar(15) not null,
    Deco_ID varchar(12) not null,
    Photpgrapy_ID varchar(12) not null,
    Catering_ID varchar(12) not null,
    Client_ID varchar(12) not null,
    Event_Name varchar(50),
	Event_Date date,
	Event_Time time,
	Number_of_Participant int,
	primary key(Event_ID));
    
create table Event_Coordinator(
	Coordinator_ID varchar(12) not null,
	First_Name varchar(50),
    Last_Name varchar(50),
	Birthday date,
	primary key(Coordinator_ID));
create table Event_Coordinator_Contact_Number(
	Coordinator_ID varchar(12) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Coordinator_ID ,Contact_No)
);
    
create table Employee(
	Empl_ID varchar(12) not null,
    Event_ID varchar(12) Not null,
    Coordinator_ID varchar(12) not null,
	First_Name varchar(50),
    Last_Name varchar(50),
	Birthday date ,
	primary key(Empl_ID));
create table Empl_ID_Contact_Number(
	Empl_ID varchar(12) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Empl_ID ,Contact_No)
);

create table Music(
	Band_ID varchar(12) not null,
	Band_Name varchar(50),
	Style_of_Music varchar(75) ,
	Charge_of_Event double ,
	primary key(Band_ID));
create table Music_Contact_Number(
	Band_ID varchar(12) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Band_ID ,Contact_No)
);
	
create table Hotel(
	Hotel_Reg_No varchar(20) not null,
	Hotel_Name varchar(30),
    Block_No varchar(15),
	City varchar(50),
	Street varchar(30),
    Charge_per_Person double,
	primary key (Hotel_Reg_No));
create table Hotel_Contact_Number(
	Hotel_Reg_No varchar(12) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Hotel_Reg_No ,Contact_No)
);
    
create table Transportation(
	Vehicle_No varchar(15) not null,
	Type_of_Vehicle varchar(20) ,
	charge_per_1km double,
	primary key(Vehicle_No));
create table Transportation_Contact_Number(
	Vehicle_No varchar(15) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Vehicle_No ,Contact_No)
);
    
create table Decoration(
	Deco_ID varchar(12) not null,
	Contact_No varchar(20) ,
	primary key(Deco_ID));
    
create table Photography(
	Photpgrapy_ID varchar(12) not null,
	Photography_Name varchar(30) ,
	Charge_per_Person double,
	primary key(Photpgrapy_ID));
create table Photography_Contact_Number(
	Photpgrapy_ID varchar(12) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Photpgrapy_ID ,Contact_No)
);

create table Catering(
	Catering_ID varchar(12) not null,
    Catering_Name varchar(30),
	Charge_per_Person double ,
	primary key(Catering_ID));
create table Catering_Contact_Number(
	Catering_ID varchar(12) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Catering_ID ,Contact_No)
);

create table Booking(
	Client_ID varchar(12) not null,
    Event_ID varchar(12) not null,
	Payment double ,
	Booking_Date date,
	primary key(Client_ID,Event_ID));

create table Clients(
	Client_ID varchar(12) not null,
	First_Name varchar(30) ,
    Last_Name varchar(30) ,
	Block_No varchar(10),
	Street varchar(80) ,
	City varchar(50),
	primary key(client_ID));
    
create table Clients_Contact_Number(
	Client_ID varchar(12) NOT NULL,
    Contact_No varchar(20) Not null,
    primary key(Client_ID ,Contact_No)
);

create table Feedback(
	Client_ID varchar(12),
    Feedback_Comment varchar(100),
    Foreign key(Client_ID) References Clients(Client_ID)on delete cascade on update cascade);
    
CREATE TABLE Rating (
    Event_ID VARCHAR(12) ,
    Rating INT CHECK (Rating >= 0 AND Rating<= 10),
    FOREIGN KEY (Event_ID) REFERENCES Events_TB(Event_ID)on delete cascade on update cascade) ;
    
    
/* Relationship between Employee and Event_Coordinator */
 ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_Dept_ID foreign key(Coordinator_ID) references Event_Coordinator(Coordinator_ID) on delete cascade on update cascade;   
 
/* Relationship between Event_Coordinator and Event */
ALTER TABLE Events_TB ADD CONSTRAINT  foreign key(Coordinator_ID) references Event_Coordinator(Coordinator_ID) on delete cascade on update cascade;
   
 /* Relationship between Event_Coordinator and Event_Coordinator_Contact_Number */  
ALTER TABLE Event_Coordinator_Contact_Number ADD CONSTRAINT  foreign key(Coordinator_ID) references Event_Coordinator(Coordinator_ID) on delete cascade on update cascade;    

/* Relationship between Music and Event */
 ALTER TABLE Events_TB  ADD CONSTRAINT  foreign key(Band_ID) references Music(Band_ID) on delete cascade on update cascade;       
  
/* Relationship between Hotel and Event */
ALTER TABLE Events_TB ADD CONSTRAINT  foreign key(Hotel_Reg_No) references Hotel(Hotel_Reg_No) on delete cascade on update cascade;   
    
/* Relationship between Transportation and Event */
ALTER TABLE Events_TB ADD CONSTRAINT  foreign key(Vehicle_No) references Transportation(Vehicle_No) on delete cascade on update cascade;     

/* Relationship between Decoration and Event */
ALTER TABLE Events_TB ADD CONSTRAINT foreign key(Deco_ID) references Decoration(Deco_ID) on delete cascade on update cascade;   

/* Relationship between Photography and Event */
ALTER TABLE Events_TB ADD CONSTRAINT  foreign key(Photpgrapy_ID) references Photography(Photpgrapy_ID) on delete cascade on update cascade;   

/* Relationship between Catering and Event */
ALTER TABLE Events_TB ADD CONSTRAINT foreign key(Catering_ID) references Catering(Catering_ID) on delete cascade on update cascade;   

/* Relationship between Client and Booking */
ALTER TABLE Booking ADD CONSTRAINT  foreign key(Client_ID) references Clients(Client_ID) on delete cascade on update cascade; 

/* Relationship between Event_Tb and Booking */
ALTER TABLE booking ADD INDEX idx_event_id (Event_ID);
ALTER TABLE Events_TB ADD CONSTRAINT  foreign key(Event_ID) references booking(Event_ID) on delete cascade on update cascade;   

/* Relationship between Client and Event */
ALTER TABLE Events_TB ADD  CONSTRAINT foreign key(Client_ID) references Clients(Client_ID) on delete cascade on update cascade;    

alter table Music_Contact_Number add constraint foreign key(Band_ID) references Music(Band_ID) on delete cascade on update cascade ;
alter table Hotel_Contact_Number add constraint foreign key(Hotel_Reg_No) references Hotel(Hotel_Reg_No) on delete cascade on update cascade ;
alter table Catering_Contact_Number add constraint foreign key(Catering_ID) references Catering(Catering_ID) on delete cascade on update cascade ;
alter table Photography_Contact_Number add constraint foreign key(Photpgrapy_ID) references Photography(Photpgrapy_ID) on delete cascade on update cascade ;
alter table Transportation_Contact_Number add constraint foreign key(Vehicle_No) references transportation(Vehicle_No) on delete cascade on update cascade ;
alter table Clients_Contact_Number add constraint foreign key(Client_ID) references Clients(Client_ID) on delete cascade on update cascade ;

/* Relationship between Employee and Event */
CREATE TABLE EmployEventRelation(
	Empl_ID varchar(12) not null,
    Event_ID varchar(12) not null,
    primary key (Event_ID,Empl_ID),
    CONSTRAINT fk_PRJ foreign key(Event_ID) references EVENTs_TB(Event_ID),
	CONSTRAINT fk_emp foreign key(Empl_ID) references EMPLOYEE(Empl_ID)
);



/* Insert Values */



INSERT INTO Event_Coordinator(Coordinator_ID, First_Name,Last_Name,Birthday)
VALUES
('CT00003', 'John', 'Smith', '1990-05-15'),
('CT00005', 'Michael', 'Johnson', '1989-10-03'),
('CT00006', 'Emily', 'Brown', '1992-04-20'),
('CT00007', 'Daniel', 'Williams', '1987-12-12'),
('CT00004', 'Sophia', 'Martinez', '1991-08-25'),
('CT00001', 'James', 'Garcia', '1993-06-30');

INSERT INTO Event_Coordinator_Contact_Number(Coordinator_ID, Contact_No)
VALUES
('CT00003', '072 345 6789'),
('CT00001', '077 569 8321'),
('CT00007', '072 124 5789'),
('CT00001', '078 545 8345'),
('CT00004', '078 569 1545'),
('CT00005', '078 512 8345'),
('CT00006', '078 569 8345'),
('CT00003', '078 578 8345');


INSERT INTO Employee(Empl_ID, Event_ID, Coordinator_ID, First_Name,Last_Name, Birthday)
VALUES
('EMP0003', 'E_001', 'CT00001', 'Alice', 'Smith', '1990-01-15'),
('EMP0004', 'E_002', 'CT00007', 'Bob', 'Johnson', '1988-07-20'),
('EMP0005', 'E_003', 'CT00004', 'Carol', 'Williams', '1992-03-10'),
('EMP0002', 'E_004', 'CT00006', 'David', 'Brown', '1989-11-25'),
('EMP0015', 'E_005', 'CT00004', 'Emma', 'Jones', '1991-05-05'),
('EMP0010', 'E_006', 'CT00007', 'Frank', 'Davis', '1993-09-30');

INSERT INTO Empl_ID_Contact_Number(Empl_ID,Contact_No)
VALUES
('EMP0003', '071 234 5678'),
('EMP0005', '071 234 1234'),
('EMP0004', '077 345 6789'),
('EMP0045', '072 456 7890'),
('EMP0002', '079 567 8901'),
('EMP0002', '075 567 8901'),
('EMP0015', '076 678 9012'),
('EMP0015', '076 456 9012'),
('EMP0010', '070 789 0123');


INSERT INTO Music(Band_ID, Band_Name, Style_of_Music, Charge_of_Event)
VALUES
('BT00002', 'Phoenix', 'Rock', '30000'),
('BT00003', 'Harmony', 'Pop', '35000'),
('BT00004', 'RhythmNation', 'Jazz',  '28000'),
('BT00005', 'SoulfulSound', 'Blues',  '32000'),
('BT00006', 'MelodicBeats', 'Classical',  '27000'),
('BT00007', 'FunkyGroove', 'Funk',  '71000');

INSERT INTO Music_Contact_Number(Band_ID,Contact_No)
VALUES
('BT00002', '071 234 5678'),
('BT00002', '077 345 6789'),
('BT00002', '076 456 7890'),
('BT00003', '072 345 6789'),
('BT00004', '075 567 8901'),
('BT00004', '073 456 7890'),
('BT00003', '079 567 8901'),
('BT00005', '074 567 8901'),
('BT00007', '070 678 9012'),
('BT00005', '077 789 0123'),
('BT00006', '075 678 9012'),
('BT00006', '071 789 0123'),
('BT00006', '078 890 1234'),
('BT00007', '076 789 0123');


INSERT INTO Hotel (Hotel_Reg_No, Hotel_Name, Block_No,City,Street) 
VALUES 
('H0201', 'GreenOasis', 'No:22/1', 'Colombo', 'Park Avenue'),
('H0301', 'SunsetView', 'No:155/9/1', 'Kandy', 'Hillside Drive'),
('H0401', 'SeaBreeze', 'No:2/A', 'Negombo', 'Beach Road'),
('H0501', 'MountainTop', 'No:105/06', 'Nuwara Eliya', 'Summit Street'),
('H0601', 'GoldenPalms', 'No:78/9,2/1', 'Bentota', 'Coastal Highway'),
('H0701', 'Riverfront', 'No:9/1', 'Kitulgala', 'Riverside Avenue');

INSERT INTO Hotel_Contact_Number(Hotel_Reg_No,Contact_No)
VALUES
('H0201', '071 234 5678'),
('H0201', '071 452 5679'),
('H0301', '077 345 6780'),
('H0301', '077 125 7853'),
('H0301', '072 345 6781'),
('H0401', '079 567 8902'),
('H0501', '079 567 8903'),
('H0501', '079 567 7854'),
('H0601', '079 567 8905'),
('H0701', '079 456 9658');


INSERT INTO transportation (Vehicle_No,Type_of_Vehicle, charge_per_1km)
VALUES
('AB-4562', 'Sedan', '50'),
('GH-5678', 'Limousine', '750'),
('EF-7890', 'SUV', '100'),
('KL-3456', 'Van', '150'),
('CD-2156', 'Limousine', '1000'),
('CD-2166', 'Motorcycle', '30');

INSERT INTO Transportation_Contact_Number(Vehicle_No,Contact_No)
VALUES
('AB-4562', '071 234 5678'),
('CD-2156', '071 452 5678'),
('KL-3456', '077 345 6789'),
('GH-5678', '077 125 7852'),
('KL-3456', '072 345 6789'),
('EF-7890', '079 567 8901'),
('EF-7890', '079 125 8901'),
('CD-2156', '079 567 7852'),
('CD-2166', '079 567 8901');


INSERT INTO Decoration (Deco_ID, Contact_No)
VALUES
('DC08046', '071 234 5678'),
('DC08047', '076 543 2109'),
('DC08048', '072 345 6789'),
('DC08049', '078 901 2345'),
('DC08050', '075 678 9012'),
('DC08051', '070 123 4567');


INSERT INTO Photography (Photpgrapy_ID, Photography_Name,Charge_per_Person)
VALUES
('PH00002', 'FocusClick', '150.00'),
('PH00003', 'SnapStudio', '180.000'),
('PH00004',  'PixelPerfect', '120.000'),
('PH00005',  'LensCraft', '135.000'),
('PH00006',  'ShutterMasters', '160.000'),
('PH00007', 'FrameFusion', '140.000');

INSERT INTO Photography_Contact_Number(Photpgrapy_ID,Contact_No)
VALUES
('PH00002', '071 234 5678'),
('PH00006', '071 452 5679'),
('PH00002', '077 345 6780'),
('PH00002', '077 125 7853'),
('PH00003', '072 345 6781'),
('PH00004', '079 567 8902'),
('PH00005', '079 567 8903'),
('PH00005', '079 567 7854'),
('PH00006', '079 567 8905');


INSERT INTO Catering(Catering_ID,Catering_Name, Charge_per_Person)
VALUES
('CAT0001', 'ABC Catering', '500.00'),
('CAT0002', 'XYZ Catering', '600.00'),
('CAT0003', 'Best Caterers', '550.00'),
('CAT0004', 'Delicious Catering', '700.00'),
('CAT0005', 'Elite Caterers', '650.00'),
('CAT0006', 'dimo Caterers', '780.00'),
('CAT0007', 'wee Caterers', '50.00');

INSERT INTO Catering_Contact_Number(Catering_ID,Contact_No)
VALUES
('CAT0001', '071 234 5678'),
('CAT0002', '077 345 6789'),
('CAT0003', '072 456 7890'),
('CAT0004', '071 567 8901'),
('CAT0004', '074 567 1235'),
('CAT0005', '076 678 9012'),
('CAT0006', '070 789 0123'),
('CAT0007', '078 890 1234'),
('CAT0007', '078 145 1234');

INSERT INTO Clients (Client_ID, First_Name,Last_Name,Block_No, Street,City)
VALUES
('Cl_0002', 'Alice',' Johnson', '22/4', 'Main Street', 'Colombo'),
('Cl_0003', 'Robert',' Smith', '19/9', 'Beach Road', 'Galle'),
('Cl_0004', 'Emily ','Davis',  '11', 'Hillside Drive', 'Kandy'),
('Cl_0005', 'Michael',' Wilson',  '980/4', 'Summit Street', 'Nuwara Eliya'),
('Cl_0006', 'Jessica ','Anderson',  '00007', 'Coastal Highway', 'Bentota'),
('Cl_0007', 'David ','Brown', '22/8,A', 'Riverside Avenue', 'Kitulgala');

INSERT INTO Clients_Contact_Number(Client_ID,Contact_No)
VALUES
('Cl_0002', '071 234 5678'),
('Cl_0002', '071 456 5678'),
('Cl_0002', '071 789 5678'),
('Cl_0003', '077 345 6789'),
('Cl_0004', '072 456 7890'),
('Cl_0005', '079 567 8901'),
('Cl_0006', '076 678 9012'),
('Cl_0006', '076 123 9012'),
('Cl_0007', '070 789 0123'),
('Cl_0007', '071 789 0123');

INSERT INTO Booking (Client_ID, Event_ID,Payment, Booking_Date)
VALUES
('Cl_0002', 'E_001', '15000.00', '2024-04-03'),
('Cl_0003', 'E_002', '20000.00', '2024-04-04'),
('Cl_0004', 'E_003', '18000.00', '2024-04-05'),
('Cl_0005', 'E_004', '25000.00', '2024-04-06'),
('Cl_0006', 'E_005', '22000.00', '2024-04-07'),
('Cl_0007', 'E_006', '19000.00', '2024-04-08'),
('Cl_0002', 'E_007', '30000.00', '2024-04-09');

INSERT INTO Feedback (Client_ID, Feedback_Comment)
VALUES
('Cl_0007', 'Great event, loved the decorations!'),
('Cl_0002', 'The catering service was exceptional.'),
('Cl_0003', 'The transportation arrangements were smooth.'),
('Cl_0004', 'The band performance was fantastic!'),
('Cl_0005', 'The photography team captured amazing moments.'),
('Cl_0006', 'The coordination team did an excellent job.'),
('Cl_0002', 'The hotel venue was beautiful and comfortable.'),
('Cl_0007', 'Highly recommend this event planning team!');



INSERT INTO Events_TB (Event_ID,Empl_ID,Coordinator_ID,Band_ID,Hotel_Reg_No,Vehicle_No,Deco_ID,Photpgrapy_ID,Catering_ID,Client_ID,Event_Name,Event_Date,Event_Time,Number_of_Participant)
VALUES
('E_001','EMP0002', 'CT00003',  'BT00005', 'H0201','AB-4562','DC08046','PH00003','CAT0002','Cl_0002','Wedding','2024-08-01', '14:00:00',150),
('E_002','EMP0003', 'CT00006',  'BT00002', 'H0301','CD-2156','DC08049','PH00003','CAT0001','Cl_0007','Birthday_Party','2023-01-29', '18:00:00',50),
('E_003','EMP0045', 'CT00004',  'BT00003', 'H0501','EF-7890','DC08048','PH00002','CAT0003','Cl_0003','Corporate Gala','2024-04-10', '18:00:00',200),
('E_004','EMP0004', 'CT00005',  'BT00002', 'H0401','GH-5678','DC08049','PH00004','CAT0004','Cl_0004','Conference','2022-04-15', '09:00:00',300),
('E_005','EMP0015', 'CT00007',  'BT00004', 'H0601','CD-2156','DC08050','PH00005','CAT0005','Cl_0005','Product Launch','2021-12-20', '13:00:00',150),
('E_006','EMP0010', 'CT00001',  'BT00007', 'H0501','KL-3456','DC08051','PH00005','CAT0007','Cl_0002','Charity Event','2023-06-25', '17:00:00',100);


INSERT INTO Rating (Event_ID, Rating)
VALUES
('E_001', 5),
('E_002', 4),
('E_003', 3),
('E_005', 5),
('E_004', 4),
('E_006', 5);



  -- update delete 
UPDATE Rating
SET Rating = 7
WHERE Event_ID IN ('E_001', 'E_003');


DELETE FROM Rating
WHERE Event_ID='E_005';
 -- ------------------------------

UPDATE Events_TB
SET Number_of_Participant = 200
WHERE Event_ID IN ('E_002');
UPDATE Events_TB
SET Number_of_Participant = 450
WHERE Event_ID IN ('E_006');

DELETE FROM Events_TB
WHERE Event_ID = 'E_005';


-- ---------------------------------

UPDATE Event_Coordinator
SET First_Name = 'Emma', Last_Name = 'Taylor', Birthday = '1992-08-15'
WHERE Coordinator_ID IN ('CT00002');
UPDATE Event_Coordinator
SET First_Name = 'Anna', Last_Name = 'gray', Birthday = '1992-11-15'
WHERE Coordinator_ID IN ('CT00005');

-- DELETE FROM Event_Coordinator
-- WHERE Coordinator_ID = 'CT00005';

  -- ----------------------------------------

UPDATE Event_Coordinator_Contact_Number
SET Contact_No = '0712345678'
WHERE Coordinator_ID IN ('CT00004');
UPDATE Event_Coordinator_Contact_Number
SET Contact_No = '0712345678'
WHERE Coordinator_ID IN ('CT00005');

DELETE FROM Event_Coordinator_Contact_Number
WHERE Coordinator_ID = 'CD00006';

-- -----------------------------------------

UPDATE Employee
SET Birthday = '1993-12-31'
WHERE Empl_ID IN ('EMP0002', 'EMP0010');

DELETE FROM Employee
WHERE Empl_ID = 'EMP0004';

 -- ----------------------------

UPDATE Empl_ID_Contact_Number
SET Contact_No = '+94712349499'
WHERE Empl_ID IN ('EMP0003');
UPDATE Empl_ID_Contact_Number
SET Contact_No = '+94711689999'
WHERE Empl_ID IN ('EMP0005' );

DELETE FROM Empl_ID_Contact_Number
WHERE Empl_ID = 'EMP0004';

-- ----------------------------------

UPDATE Music
SET Charge_of_Event = '36000'
WHERE Band_ID IN ('BT00003');
UPDATE Music
SET Charge_of_Event = '45000'
WHERE Band_ID IN ('BT00005');

DELETE FROM Music
WHERE Band_ID = 'BT00007';

-- ------------------------------------

UPDATE Music_Contact_Number
SET Contact_No = '+94704581234'
WHERE Band_ID IN ('BT00003''079 567 8901');
UPDATE Music_Contact_Number
SET Contact_No = '+94757894567'
WHERE Band_ID IN ('BT00006''078 890 1234');

DELETE FROM Music_Contact_Number
WHERE Band_ID = 'BT00007';

-- --------------------------------------

UPDATE Hotel
SET Block_No = 'No:999/1'
WHERE Hotel_Reg_No IN ('H0401');
UPDATE Hotel
SET Block_No = 'No:105/06'
WHERE Hotel_Reg_No IN ('H0301');

DELETE FROM Hotel
WHERE Hotel_Reg_No = 'H0501';

-- ---------------------------------

UPDATE Hotel_Contact_Number
SET Contact_No = '+98 71 234 1547'
WHERE Hotel_Reg_No IN ('H0301''079 567 7854');
UPDATE Hotel_Contact_Number
SET Contact_No = '+94 72 345 6781'
WHERE Hotel_Reg_No IN ('H0501''077 345 6780');

DELETE FROM Hotel_Contact_Number
WHERE Hotel_Reg_No = 'H0401';

-- -------------------------------------

UPDATE transportation
SET charge_per_1km = '60'
WHERE Vehicle_No IN ('TN00001');
UPDATE transportation
SET charge_per_1km = '65'
WHERE Vehicle_No IN ('TN00005');

DELETE FROM transportation
WHERE Vehicle_No = 'TN00005';

-- ------------------------------------

UPDATE Transportation_Contact_Number
SET Contact_No = '+94 71 234 9999'
WHERE Vehicle_No IN ('TN00001');
UPDATE Transportation_Contact_Number
SET Contact_No = '+94 71 234 4586'
WHERE Vehicle_No IN ('TN00002');

DELETE FROM Transportation_Contact_Number
WHERE Vehicle_No = 'TN00003';

-- ------------------------------------------


UPDATE Decoration
SET Contact_No = '0712345678'
WHERE Deco_ID IN ('DC08047');
UPDATE Decoration
SET Contact_No = '0757845678'
WHERE Deco_ID IN ('DC08049');

DELETE FROM Decoration
WHERE Deco_ID = 'DC08050';


-- ----------------------------------------

UPDATE Photography
SET Charge_per_Person = '2000.00'
WHERE Photpgrapy_ID IN ('PH00003', 'PH00005');

DELETE FROM Photography
WHERE Photpgrapy_ID = 'PH00006';

-- ------------------------------------------


UPDATE Photography_Contact_Number
SET Contact_No = '+94 71 234 1452'
WHERE Photpgrapy_ID IN ('PHOTO004''079 567 8902');
UPDATE Photography_Contact_Number
SET Contact_No = '+94 71 785 1254'
WHERE Photpgrapy_ID IN ('PHOTO002''077 345 6780');

DELETE FROM Photography_Contact_Number
WHERE Photpgrapy_ID = 'PHOTO005';

-- --------------------------------------

UPDATE Catering
SET Charge_per_Person = 600.00
WHERE Catering_ID IN ('CAT0003', 'CAT0005');

DELETE FROM Catering
WHERE Catering_ID = 'CAT0007';

-- ----------------------------------------


UPDATE Catering_Contact_Number
SET Contact_No = '+94 71 785 7452'
WHERE Catering_ID IN ('CAT0004''071 567 8901');
UPDATE Catering_Contact_Number
SET Contact_No = '+94 71 234 7821'
WHERE Catering_ID IN ('CAT0004''074 567 1235');

DELETE FROM Catering_Contact_Number
WHERE Catering_ID = 'CAT0005''076 678 9012';

-- ----------------------------------------

UPDATE Booking
SET Payment = 21000.00
WHERE Event_ID IN ('E_003');
UPDATE Booking
SET Payment = 21000.00
WHERE Event_ID IN ('E_006');

DELETE FROM Booking
WHERE Event_ID = 'E_007';

-- ----------------------------

UPDATE Clients
SET Last_Name = 'Johnson'
WHERE Client_ID IN ('Cl_0005');
UPDATE Clients
SET Last_Name = 'Kriss'
WHERE Client_ID IN ('Cl_0003');

DELETE FROM Clients
WHERE Client_ID = 'Cl_0006';

-- ---------------------------------------


UPDATE Clients_Contact_Number
SET Contact_No = '+94 71 234 7452'
WHERE Client_ID IN ('Cl_0007''070 789 0123');
UPDATE Clients_Contact_Number
SET Contact_No = '+94 71 234 7452'
WHERE Client_ID IN ('Cl_0006''076 123 9012');


DELETE FROM Clients_Contact_Number
WHERE Client_ID = 'Cl_0005''079 567 8901';

-- -------------------------------------

UPDATE Feedback
SET Feedback_Comment = 'Greate work'
WHERE Client_ID IN ('Cl_0002', 'Cl_0003');

DELETE FROM Feedback
WHERE Client_ID = 'Cl_0006';


-- ------------------------------




/*  Simple Qureies*/
-- Select Operation
SELECT * FROM EVENTS_TB WHERE EVENT_DATE > '2024-04-01';

-- Project Operation
SELECT PHOTPGRAPY_ID, PHOTOGRAPHY_NAME,CHARGE_PER_PERSON FROM PHOTOGRAPHY;

-- Cartesian Product Operation
SELECT * FROM CLIENTS ,EVENTS_TB;

-- Creating a User View
CREATE VIEW BOOKING_DETAILS AS SELECT CLIENT_ID, Payment, BOOKING_DATE FROM BOOKING;
SELECT * FROM BOOKING_DETAILS;

-- Renaming Operation
SELECT EMPL_ID AS ID , FIRST_NAME AS F_NAME , LAST_NAME AS L_NAME, Coordinator_ID AS C_ID FROM EMPLOYEE;

-- Aggregation Function 
SELECT AVG(RATING) AS AVARAGE_RATING FROM RATING;

-- LIKE Keyword
SELECT * FROM TRANSPORTATION WHERE TYPE_OF_VEHICLE LIKE 'LIMOUSINE';

-- Union Operation with Aliasing:
SELECT Event_Time AS E_Time, Event_Date AS E_date FROM Events_TB
UNION
SELECT First_Name AS F_Name, Street AS Lane FROM Clients; 

-- Intersection
SELECT Client_ID AS Cl_ID, Payment AS Amount FROM Booking
INTERSECT
SELECT  Client_ID AS Cl_ID, Block_No AS House_No FROM Clients;

-- Set difference
SELECT Hotel_Name AS H_Name,Charge_per_Person AS Price_Per FROM Hotel
EXCEPT
SELECT Number_of_Participant AS Total_Parti ,Event_Name AS E_Name FROM Events_TB;





-- Complex Queries:

-- 01 Union Operation: Combining results from two queries
SELECT Event_Name AS Title FROM Events_TB
UNION
SELECT Catering_Name AS Title FROM Catering;

-- 02 Intersection: Finding common values between two queries

SELECT Client_ID AS cF FROM Feedback
INTERSECT
SELECT Client_ID AS c FROM Clients;

-- 03 Set Difference: Showing values from the first query that are not in the second query
SELECT Event_Name AS Title FROM Events_TB
EXCEPT
SELECT Catering_Name AS Title FROM Catering;

-- 04 Division: Finding items in the first table that have relationships with all items in the second table
-- Assuming there's a relationship between Events_TB and Catering, let's find events that use all available caterers.
SELECT Event_Name FROM Events_TB as E
WHERE NOT EXISTS (
    SELECT Catering_ID FROM Catering as C
    WHERE NOT EXISTS (
        SELECT * FROM Booking B
        WHERE B.Event_ID = E.Event_ID AND B.Payment > C.Charge_per_Person
    )
);


-- 05  Inner join to create a view Event_Clients joining Events_TB and Clients
-- Creating a User View Event_Clients by Inner Join
CREATE VIEW EventClients AS
SELECT ET.Event_ID, C.Client_ID, ET.Event_Name, C.First_Name, C.Last_Name
FROM Events_TB as ET
INNER JOIN Clients C ON ET.Client_ID = C.Client_ID;
 SELECT Event_Name, First_Name
FROM EventClients
WHERE Event_Name LIKE 'C%';


--  06 Natural join between Event_Clients view and Feedback table to get feedback for each event
-- Create the Event_Feedback view using Natural Join
CREATE VIEW Event_Feedback AS
SELECT EC.Event_ID, EC.Event_Name, EC.Coordinator_ID,  F.Feedback_Comment
FROM events_tb as EC
NATURAL JOIN Feedback as F;
-- Selecting data from the Event_Feedback view
SELECT Event_ID, Event_Name, Feedback_Comment
FROM Event_Feedback WHERE Event_Name LIKE 'C%';


-- left 
--  07 LEFT JOIN with aliases
CREATE VIEW Events_TB_View AS
SELECT Event_ID, Event_Name
FROM events_tb;
CREATE VIEW Booking_View AS
SELECT Event_ID, Payment, Booking_Date
FROM Booking;

SELECT EC.Event_ID, EC.Event_Name, B.Payment, B.Booking_Date 
FROM Events_TB_View as EC
LEFT OUTER JOIN Booking_View B ON EC.Event_ID = B.Event_ID where EC.Event_Name like 'c%';



-- right
-- 08  RIGHT JOIN with aliases
-- Create the Event_Booking view using Left Outer Join
CREATE VIEW Event_Booking AS
SELECT EC.Event_ID, EC.Event_Name, EC.Client_ID, B.Payment, B.Booking_Date
FROM events_tb EC
LEFT OUTER JOIN Booking B ON EC.Event_ID = B.Event_ID ;
-- Selecting data from the Event_Booking view
SELECT Event_ID, Event_Name, Payment, Booking_Date
FROM Event_Booking where Payment like '1%';


 --  09 full outer 
-- LEFT JOIN
-- Create the Event_Booking_Union view using Union of Left and Right Outer Joins with Aliases
CREATE VIEW Event_Booking_Union AS
(
    SELECT EC.Event_ID, EC.Event_Name, EC.Client_ID,  B.Payment, B.Booking_Date 
    FROM events_tb AS EC
    LEFT OUTER JOIN Booking AS B ON EC.Event_ID = B.Event_ID
    
    UNION
    
    SELECT EC.Event_ID, EC.Event_Name, EC.Client_ID,  B.Payment, B.Booking_Date 
    FROM Booking AS B
    RIGHT OUTER JOIN events_tb AS EC ON EC.Event_ID = B.Event_ID
);

-- Selecting data from the Event_Booking_Union view
SELECT Event_ID, Event_Name, Client_ID, Payment, Booking_Date
FROM Event_Booking_Union where Event_Name like 'c%';



-- 10 Outer Union Example
-- Create the Outer_Union_View view using Outer Union
CREATE VIEW Outer_Union_View AS
(
    SELECT Client_ID FROM Clients

    UNION

    SELECT Client_ID FROM Booking
);
-- Selecting data from the Outer_Union_View view
SELECT * FROM Outer_Union_View ;


-- 11. Nested Query with Union:
-- Total number of participants in events and total payment made in bookings
SELECT Event_Name, Number_of_Participant AS Quantity FROM Events_TB where Number_of_Participant<100
UNION
SELECT 'Booking Total', SUM(Payment) AS Quantity FROM Booking;

-- 12. Nested Query with Intersection:
-- Clients who have provided feedback and also made bookings
SELECT Client_ID FROM Feedback
INTERSECT
SELECT Client_ID FROM Booking;

-- 13. Nested Query with Set Difference:
-- Events where number of participants exceeds average
SELECT Event_Name FROM Events_TB
WHERE Number_of_Participant > (
    SELECT AVG(Number_of_Participant) FROM Events_TB
);



-- tunning 
-- ---------------------------------
-- befor - 01
explain  SELECT Event_Name, First_Name
FROM EventClients
WHERE Event_Name LIKE 'C%';

-- Add an index to the Event_Name column
CREATE INDEX idx_event_name ON Events_TB(Event_Name);

-- after 
explain  SELECT Event_Name, First_Name
FROM EventClients
WHERE Event_Name LIKE 'C%';
 
 -- -----------------------------------
-- before 

explain SELECT Event_ID, Event_Name, Feedback_Comment
FROM Event_Feedback WHERE Event_Name LIKE 'C%';

 -- - CREATE INDEX idx_event_name ON Event_Feedback(Event_ID,Event_Name); // this is not a base table we can't add indexes
 
 --  ------
 -- before 
 DROP INDEX idx_event_name on Events_TB ;
  explain  SELECT EC.Event_ID, EC.Event_Name, B.Payment, B.Booking_Date 
FROM Events_TB_View as EC
LEFT OUTER JOIN Booking_View B ON EC.Event_ID = B.Event_ID where EC.Event_Name like 'c%';

 -- after 
 
 CREATE INDEX idx_event_name ON Events_TB(Event_Name);
 explain  SELECT EC.Event_ID, EC.Event_Name, B.Payment, B.Booking_Date 
FROM Events_TB_View as EC
LEFT OUTER JOIN Booking_View B ON EC.Event_ID = B.Event_ID where EC.Event_Name like 'c%';
 
-- ------------------- 
-- before
explain SELECT Event_ID, Event_Name, Payment, Booking_Date
FROM Event_Booking where Payment like '1%';

create index Bookinh_price on booking(Payment);
drop index Bookinh_price on booking ;

explain SELECT Event_ID, Event_Name, Payment, Booking_Date
FROM Event_Booking where Payment like '1%';

-- -----------------------------
-- befor 
explain SELECT Event_ID, Event_Name, Client_ID, Payment, Booking_Date
FROM Event_Booking_Union where Event_Name like 'c%';

drop INDEX idx_event_name ON Events_TB;
CREATE INDEX idx_event_name ON Events_TB(Event_Name);
create index Bookinh_price on booking(Payment);

-- after
explain SELECT Event_ID, Event_Name, Client_ID, Payment, Booking_Date
FROM Event_Booking_Union where Event_Name like 'c%';

-- -----------------------------------
-- Selecting data from the Outer_Union_View view
explain SELECT * FROM Outer_Union_View where client_id='%2';

create index clientId_index on clients(client_id);
create index Booking_Id_index on booking(client_id);

explain SELECT * FROM Outer_Union_View where client_id='%2';

-- no more tunning 

-- ----------------------
-- before


explain SELECT Event_Name, Number_of_Participant AS Quantity FROM Events_TB where Number_of_Participant<100
UNION
SELECT 'Booking Total', SUM(Payment) AS Quantity FROM Booking;

-- drop index participation_index on events_Tb;
create index participation_index on  Events_TB (Number_of_Participant);

-- -----------------------
-- after
explain SELECT Event_Name FROM Events_TB
WHERE Number_of_Participant > (
    SELECT AVG(Number_of_Participant) FROM Events_TB
);
drop schema EP;