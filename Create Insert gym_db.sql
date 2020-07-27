-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Q04zFW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- MODULE 9 Assessment


-- You’ve been hired to create a SQL database for a local gym owner. Based on your meetings with the owner, you’ve determined that the initial database design should follow schema.txt. 
-- The gym owner contacts you to let you know that the gym is going to start offering drop-in classes. The classes are paid for separately, and trainers are paid a percentage commission for the class (commission is determined for each class).
-- Using https://app.quickdatabasediagrams.com/#/, add two new tables with the following columns to the ERD:

-- Classes
-- -
-- Class_ID PK 
-- Trainer_ID 
-- Gym_ID 
-- Class_Name 
-- Commission_Percentage 

-- Class_Attendance
-- -
-- Member_ID 
-- Class_ID 

-- Using the ERD from the last question, export the ERD to a PostgreSQL query and open the query. 
-- What is the keyword used when adding the foreign key constraints? - ALTER

CREATE TABLE "Gym" (
    "Gym_ID" INTEGER   NOT NULL,
    "Gym_Name" VARCHAR   NOT NULL,
    "Address" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "Zipcode" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Gym" PRIMARY KEY (
        "Gym_ID"
     )
);

CREATE TABLE "Trainers" (
    "Trainer_ID" INTEGER   NOT NULL,
    "Gym_ID" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Trainers" PRIMARY KEY (
        "Trainer_ID"
     )
);

CREATE TABLE "Members" (
    "Member_ID" INTEGER   NOT NULL,
    "Gym_ID" INTEGER   NOT NULL,
    "Trainer_ID" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Address" VARCHAR   NOT NULL,
    "CITY" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Members" PRIMARY KEY (
        "Member_ID"
     )
);

CREATE TABLE "Payments" (
    "Payment_ID" INTEGER   NOT NULL,
    "Member_ID" INTEGER   NOT NULL,
    "CreditCard_Info" INTEGER   NOT NULL,
    "Billing_Zip" INTEGER   NOT NULL,
    CONSTRAINT "pk_Payments" PRIMARY KEY (
        "Payment_ID"
     )
);

CREATE TABLE "Classes" (
    "Class_ID" INTEGER   NOT NULL,
    "Trainer_ID" INTEGER   NOT NULL,
    "Gym_ID" INTEGER   NOT NULL,
    "Class_Name" VARCHAR   NOT NULL,
    "Commission_Percentage" FLOAT   NOT NULL,
    CONSTRAINT "pk_Classes" PRIMARY KEY (
        "Class_ID"
     )
);

CREATE TABLE "Class_Attendance" (
    "Member_ID" INTEGER   NOT NULL,
    "Class_ID" INTEGER   NOT NULL
);

ALTER TABLE "Trainers" ADD CONSTRAINT "fk_Trainers_Gym_ID" FOREIGN KEY("Gym_ID")
REFERENCES "Gym" ("Gym_ID");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Gym_ID" FOREIGN KEY("Gym_ID")
REFERENCES "Gym" ("Gym_ID");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Trainer_ID" FOREIGN KEY("Trainer_ID")
REFERENCES "Trainers" ("Trainer_ID");

ALTER TABLE "Payments" ADD CONSTRAINT "fk_Payments_Member_ID" FOREIGN KEY("Member_ID")
REFERENCES "Members" ("Member_ID");

ALTER TABLE "Classes" ADD CONSTRAINT "fk_Classes_Trainer_ID" FOREIGN KEY("Trainer_ID")
REFERENCES "Trainers" ("Trainer_ID");

ALTER TABLE "Classes" ADD CONSTRAINT "fk_Classes_Gym_ID" FOREIGN KEY("Gym_ID")
REFERENCES "Gym" ("Gym_ID");

ALTER TABLE "Class_Attendance" ADD CONSTRAINT "fk_Class_Attendance_Member_ID" FOREIGN KEY("Member_ID")
REFERENCES "Members" ("Member_ID");

ALTER TABLE "Class_Attendance" ADD CONSTRAINT "fk_Class_Attendance_Class_ID" FOREIGN KEY("Class_ID")
REFERENCES "Classes" ("Class_ID");






-- Create a “gym_db” database in pgAdmin. Open the query tool and run the exported ERD query to create all the tables.
-- The following SQL code is attempting to insert a class into the database, but it returns an error.

insert into gym
(gym_id, gym_name, address, city, zipcode)
values (1, 'Average Joe''s Gymnasium', '123 Main St.', 'Springfield', '12345');

insert into classes
(class_id, trainer_id, gym_id, class_name, commission_percentage)
values (1,1,1,'Wrench Dodging',0.1);

insert into trainers
(trainer_id, gym_id, first_name, last_name)
values (1, 1, 'Patches', 'O''Houlihan');
