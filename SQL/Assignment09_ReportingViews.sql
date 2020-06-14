--**********************************************************************************************--
-- Title: Final Project, Milestone 03, Assignment 09, Part 2
-- Author: LukasNaehrig
-- Desc: This file creates views for the excel and tableau reports.
-- Change Log: When,Who,What
-- 2020-05-28,LukasNaehrig,Created File
--***********************************************************************************************--

Use PatientAppointmentsDB_LukasNaehrig;
Go

-- Creating Reporting Views: --

-- Select * From vClinics;
-- Go
-- Select * From vClinics As c
-- Join vAppointments As a
--  On c.ClinicID = a.AppointmentClinicID;
-- Go
-- Select ClinicID, ClinicName, ClinicCity, AppointmentID, AppointmentDateTime From vClinics As c
-- Join vAppointments As a
--  On c.ClinicID = a.AppointmentClinicID;
-- Go
-- Select * From vAppointmentsByPatientsDoctorsAndClinics;
-- Go
-- Select ClinicID, ClinicName, ClinicCity, AppointmentID, AppointmentDate, AppointmentTime From vAppointmentsByPatientsDoctorsAndClinics
-- Go
-- Select Top 100 Percent
-- ClinicName, ClinicCity, [AppointmentCount] = Count(AppointmentID) 
-- From vAppointmentsByPatientsDoctorsAndClinics
-- Group By ClinicName, ClinicCity;
-- Go

Create View vAppointmentsByClinic
As
 Select Top 100 Percent
 ClinicName, ClinicCity, [AppointmentCount] = Count(AppointmentID) 
 From vAppointmentsByPatientsDoctorsAndClinics
 Group By ClinicName, ClinicCity;
Go

-- Select * From vAppointmentsByPatientsDoctorsAndClinics;
-- Go
-- Select DoctorName, AppointmentID, ClinicCity From vAppointmentsByPatientsDoctorsAndClinics;
-- Go
-- Select Top 100 Percent
-- DoctorName, ClinicCity, [AppointmentCount] = Count(AppointmentID) 
-- From vAppointmentsByPatientsDoctorsAndClinics
-- Group By DoctorName, ClinicCity
-- Order By [AppointmentCount] Desc;
-- Go

Create View vAppointmentsByDoctor
As
 Select Top 100 Percent
 DoctorName, ClinicCity, [AppointmentCount] = Count(AppointmentID) 
 From vAppointmentsByPatientsDoctorsAndClinics
 Group By DoctorName, ClinicCity
 Order By [AppointmentCount] Desc;
Go

-- Select * From vAppointmentsByPatientsDoctorsAndClinics;
-- Go
-- Select Top 100 Percent
-- [DoctorCount] = Count(DoctorID), ClinicName, ClinicCity
-- From vAppointmentsByPatientsDoctorsAndClinics
-- Group By ClinicCity, ClinicName
-- Order By [DoctorCount] Desc;
-- Go

Create View vDoctorsByClinic
As
 Select Top 100 Percent
 [DoctorCount] = Count(DoctorID), ClinicName, ClinicCity
 From vAppointmentsByPatientsDoctorsAndClinics
 Group By ClinicCity, ClinicName
 Order By [DoctorCount] Desc;
Go

-- Select * From vAppointmentsByPatientsDoctorsAndClinics;
-- Go
-- Select AppointmentDate, AppointmentID, ClinicName
-- From vAppointmentsByPatientsDoctorsAndClinics;
-- Go
-- Select Top 100 Percent
-- [AppointmentCount] = Count(AppointmentID), AppointmentDate
-- From vAppointmentsByPatientsDoctorsAndClinics
-- Group By AppointmentDate
-- Order By AppointmentDate;
-- Go

Create View vAppointmentsByDate
As
 Select Top 100 Percent
 [AppointmentCount] = Count(AppointmentID), AppointmentDate
 From vAppointmentsByPatientsDoctorsAndClinics
 Group By AppointmentDate
 Order By AppointmentDate;
Go