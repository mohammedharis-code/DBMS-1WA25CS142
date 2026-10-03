CREATE TABLE person( 
   driver_id INT primary KEY ,
   name varchar(20) NOT NULL,
   address VARCHAR(20) 
 ); 

CREATE TABLE car(
    reg_num INT PRIMARY key,
    model VARCHAR(20) NOT NULL,
    year INT NOT NULL
);


CREATE TABLE accident(
    report_num INT PRIMARY KEY,
    accident_date DATE NOT NULL,
    location varchar(20) NOT NULL
);

CREATE TABLE owns(
   driver_id INT,
   reg_num INT,
   PRIMARY KEY(driver_id , reg_num),
   foreign key(driver_id) REFERENCES person(driver_id) ON DELETE CASCADE,
   foreign key(reg_num) REFERENCES car(reg_num) ON DELETE CASCADE
);

CREATE TABLE participated(
	driver_id INT,
    reg_num INT,
    report_num INT,
    damage_amount INT NOT NULL,
    PRIMARY KEY(driver_id , reg_num, report_num),
    foreign key(driver_id) REFERENCES person(driver_id) ON DELETE CASCADE,
    foreign key(reg_num) REFERENCES car(reg_num) ON DELETE CASCADE,
    foreign key(report_num) REFERENCES accident(report_num) ON DELETE CASCADE
);
SELECT * FROM owns;
INSERT INTO person VALUES (101 , 'BEN' , 'BANGLORE') , (102 , 'JACK' , 'MYSURU') , (103 , 'RAHUL' , 'LONDON') , (104, 'ROHIT' , 'DELHI'),(105 , 'JOHN' , 'NEWYORK');
INSERT INTO car VALUES (201 , 'BMW' , 2000) ,(202 , 'TOYOTA' , 2005) , ( 203 , 'MARUTI' , 2010) , (204 , 'SUZUKI' , 2015) , (205 , 'TESLA' , 2020);
INSERT INTO accident VALUES (301, '2000-01-01' , 'BANGLORE') , (302 , '2001-01-01' , 'MYSURU') , ( 303 , '2002-02-02' , 'LONDON'), (304 , '2003-03-03' , 'DELHI'),(305,'2005-02-06' , 'MANCHESTER');  
INSERT INTO owns VALUES (101,201) , (102,202) , (103,203) , (104,204) , (105,205);
INSERT INTO participated VALUES (101,201,301,10000) , (102,202,302,50000) , (103,203,303,25000) , (104,204,304,3000) , (105,205,305,5000);
UPDATE participated SET damage_amount = 25000 WHERE report_num = 305;
ALTER TABLE accident ADD COLUMN new_accident varchar(20);
SELECT accident_date , location FROM accident;
SELECT driver_id, damage_amount FROM participated WHERE damage_amount >= 25000;
SELECT * FROM participated;
SELECT * FROM person;

