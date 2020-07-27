-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Q04zFW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- MODULE 9 Assessment

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

