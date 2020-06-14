--**********************************************************************************************--
-- Title: Final Project, Milestone 02, Assignment 08
-- Author: LukasNaehrig
-- Desc: This file creates tables, constraints, views, stored procedures,
--        and permissions for the Patient Appointments database.
-- Change Log: When,Who,What
-- 2020-05-20,LukasNaehrig,Created File
--***********************************************************************************************--
Begin Try
	Use Master;
	If Exists(Select Name From SysDatabases Where Name = 'PatientAppointmentsDB_LukasNaehrig')
	 Begin 
	  Alter Database [PatientAppointmentsDB_LukasNaehrig] set Single_user With Rollback Immediate;
	  Drop Database PatientAppointmentsDB_LukasNaehrig;
	 End
	Create Database PatientAppointmentsDB_LukasNaehrig;
End Try
Begin Catch
	Print Error_Number();
End Catch
Go
Use PatientAppointmentsDB_LukasNaehrig;
Go

-- 1: Create Tables -- 
Create Table Clinics
(ClinicID Int Identity(1,1) Not Null
,ClinicName Nvarchar(100) Not Null
,ClinicPhoneNumber Nvarchar(100)
,ClinicAddress Nvarchar(100) Not Null
,ClinicCity Nvarchar(100) Not Null
,ClinicState Nvarchar(2) Not Null
,ClinicZipCode Nvarchar(10) Not Null
);
Go

Create Table Patients
(PatientID Int Identity(1,1) Not Null
,PatientFirstName Nvarchar(100) Not Null
,PatientLastName Nvarchar(100) Not Null
,PatientPhoneNumber Nvarchar(100) Not Null
,PatientAddress Nvarchar(100) Not Null
,PatientCity Nvarchar(100) Not Null
,PatientState Nvarchar(2) Not Null
,PatientZipCode Nvarchar(10) Not Null
);		
Go	

Create Table Doctors
(DoctorID Int Identity(1,1) Not Null
,DoctorFirstName Nvarchar(100) Not Null
,DoctorLastName Nvarchar(100) Not Null
,DoctorPhoneNumber Nvarchar(100) Not Null
,DoctorAddress Nvarchar(100) Not Null
,DoctorCity Nvarchar(100) Not Null
,DoctorState Nvarchar(2) Not Null
,DoctorZipCode Nvarchar(10) Not Null
);		
Go

Create Table Appointments
(AppointmentID Int Identity(1,1) Not Null
,AppointmentDateTime Datetime Not Null
,AppointmentPatientID Int Not Null
,AppointmentDoctorID Int Not Null
,AppointmentClinicID Int Not Null
);
Go


-- 2: Add Constraints --
Alter Table Clinics
 Add Constraint pkClinics
  Primary Key (ClinicID);
Go

Alter Table Patients
 Add Constraint pkPatients
  Primary Key (PatientID);
Go

Alter Table Doctors
 Add Constraint pkDoctors
  Primary Key (DoctorID);
Go

Alter Table Appointments
 Add Constraint pkAppointments
  Primary Key (AppointmentID);
Go

Alter Table Appointments
 Add Constraint fkAppointments1 
  Foreign Key (AppointmentPatientID) References Patients(PatientID);
Go

Alter Table Appointments
 Add Constraint fkAppointments2 
  Foreign Key (AppointmentDoctorID) References Doctors(DoctorID);
Go

Alter Table Appointments
 Add Constraint fkAppointments3 
  Foreign Key (AppointmentClinicID) References Clinics(ClinicID);
Go

Alter Table Clinics
 Add Constraint uqClinicName
  Unique (ClinicName);
Go

Alter Table Clinics
 Add Constraint ckClinicPhonePattern 
  Check (ClinicPhoneNumber Like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');
Go

Alter Table Clinics
 Add Constraint ckClinicZipPattern
  Check (ClinicZipCode Like '[0-9][0-9][0-9][0-9][0-9]' Or ClinicZipCode Like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');
Go

Alter Table Patients
 Add Constraint ckPatientPhonePattern 
  Check (PatientPhoneNumber Like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');
Go

Alter Table Patients
 Add Constraint ckPatientZipPattern
  Check (PatientZipCode Like '[0-9][0-9][0-9][0-9][0-9]' Or PatientZipCode Like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');
Go

Alter Table Doctors
 Add Constraint ckDoctorPhonePattern 
  Check (DoctorPhoneNumber Like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');
Go

Alter Table Doctors
 Add Constraint ckDoctorZipPattern
  Check (DoctorZipCode Like '[0-9][0-9][0-9][0-9][0-9]' Or DoctorZipCode Like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');
Go


-- 3: Add Views --
/*
Select * From Clinics;
Go
Select 
  ClinicID
 ,ClinicName
 ,ClinicPhoneNumber
 ,ClinicAddress
 ,ClinicCity
 ,ClinicState
 ,ClinicZipCode
From Clinics;
Go
*/
Create View vClinics
As
 Select 
  ClinicID
 ,ClinicName
 ,ClinicPhoneNumber
 ,ClinicAddress
 ,ClinicCity
 ,ClinicState
 ,ClinicZipCode
From Clinics;
Go

/*
Select * From Patients;
Go
Select 
  PatientID
 ,PatientFirstName
 ,PatientLastName
 ,PatientPhoneNumber
 ,PatientAddress
 ,PatientCity
 ,PatientState
 ,PatientZipCode
From Patients;
Go
*/
Create View vPatients
As
 Select 
   PatientID
  ,PatientFirstName
  ,PatientLastName
  ,PatientPhoneNumber
  ,PatientAddress
  ,PatientCity
  ,PatientState
  ,PatientZipCode
 From Patients;
 Go

/*
Select * From Doctors;
Go
Select
  DoctorID
 ,DoctorFirstName
 ,DoctorLastName
 ,DoctorPhoneNumber
 ,DoctorAddress
 ,DoctorCity
 ,DoctorState
 ,DoctorZipCode
From Doctors;
Go
*/
Create View vDoctors
As
 Select
   DoctorID
  ,DoctorFirstName
  ,DoctorLastName
  ,DoctorPhoneNumber
  ,DoctorAddress
  ,DoctorCity
  ,DoctorState
  ,DoctorZipCode
 From Doctors;
Go

/*
Select * From Appointments;
Go
Select 
  AppointmentID
 ,AppointmentDateTime 
 ,AppointmentPatientID
 ,AppointmentDoctorID 
 ,AppointmentClinicID 
From Appointments;
Go
*/
Create View vAppointments
As
 Select 
   AppointmentID
  ,AppointmentDateTime 
  ,AppointmentPatientID
  ,AppointmentDoctorID 
  ,AppointmentClinicID 
 From Appointments;
Go

/*
Select * From vAppointments As a
Join vClinics As c
 On a.AppointmentClinicID = c.ClinicID;
Go
Select * From vAppointments As a
Join vClinics As c
 On a.AppointmentClinicID = c.ClinicID
Join vPatients As p
 On a.AppointmentPatientID = p.PatientID;
Go
Select * From vAppointments As a
Join vClinics As c
 On a.AppointmentClinicID = c.ClinicID
Join vPatients As p
 On a.AppointmentPatientID = p.PatientID
Join vDoctors As d
 On a.AppointmentDoctorID = d.DoctorID;
Go
Select
  a.AppointmentID
 ,a.AppointmentDateTime 
 ,a.AppointmentPatientID
 ,a.AppointmentDoctorID 
 ,a.AppointmentClinicID 
 ,p.PatientID
 ,p.PatientFirstName
 ,p.PatientLastName
 ,p.PatientPhoneNumber
 ,p.PatientAddress
 ,p.PatientCity
 ,p.PatientState
 ,p.PatientZipCode
 ,d.DoctorID
 ,d.DoctorFirstName
 ,d.DoctorLastName
 ,d.DoctorPhoneNumber
 ,d.DoctorAddress
 ,d.DoctorCity
 ,d.DoctorState
 ,d.DoctorZipCode
 ,c.ClinicID
 ,c.ClinicName
 ,c.ClinicPhoneNumber
 ,c.ClinicAddress
 ,c.ClinicCity
 ,c.ClinicState
 ,c.ClinicZipCode
From vAppointments As a
Join vClinics As c
 On a.AppointmentClinicID = c.ClinicID
Join vPatients As p
 On a.AppointmentPatientID = p.PatientID
Join vDoctors As d
 On a.AppointmentDoctorID = d.DoctorID;
Go
*/
Create View vAppointmentsByPatientsDoctorsAndClinics
As
 Select
   a.AppointmentID
  ,[AppointmentDate] = Format(a.AppointmentDateTime, 'd', 'en-us')
  ,[AppointmentTime] = Format(a.AppointmentDateTime, 'HH:mm')
  ,p.PatientID
  ,[PatientName] = p.PatientFirstName + ' ' + p.PatientLastName
  ,p.PatientPhoneNumber
  ,p.PatientAddress
  ,p.PatientCity
  ,p.PatientState
  ,p.PatientZipCode
  ,d.DoctorID
  ,[DoctorName] = d.DoctorFirstName + ' ' + d.DoctorLastName
  ,d.DoctorPhoneNumber
  ,d.DoctorAddress
  ,d.DoctorCity
  ,d.DoctorState
  ,d.DoctorZipCode
  ,c.ClinicID
  ,c.ClinicName
  ,c.ClinicPhoneNumber
  ,c.ClinicAddress
  ,c.ClinicCity
  ,c.ClinicState
  ,c.ClinicZipCode
 From vAppointments As a
 Join vClinics As c
  On a.AppointmentClinicID = c.ClinicID
 Join vPatients As p
  On a.AppointmentPatientID = p.PatientID
 Join vDoctors As d
  On a.AppointmentDoctorID = d.DoctorID;
Go


-- 4: Create Stored Procedures -- 
-- Inserts --
Create Procedure pInsClinics
 (@ClinicID Int Output
 ,@ClinicName Nvarchar(100)
 ,@ClinicPhoneNumber Nvarchar(100)
 ,@ClinicAddress Nvarchar(100)
 ,@ClinicCity Nvarchar(100)
 ,@ClinicState Nvarchar(2)
 ,@ClinicZipCode Nvarchar(10))
/* Author: LNaehrig
** Desc: Processes Inserts for Clinics Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Insert Into dbo.Clinics
    (ClinicName
	,ClinicPhoneNumber
	,ClinicAddress
	,ClinicCity
	,ClinicState
	,ClinicZipCode)
   Values
    (@ClinicName
	,@ClinicPhoneNumber
	,@ClinicAddress
	,@ClinicCity
	,@ClinicState
	,@ClinicZipCode);
   Commit Transaction;
   Set @RC = +1;
   Set @ClinicID = Scope_Identity();
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pInsPatients
 (@PatientID Int Output
 ,@PatientFirstName Nvarchar(100)
 ,@PatientLastName Nvarchar(100)
 ,@PatientPhoneNumber Nvarchar(100)
 ,@PatientAddress Nvarchar(100)
 ,@PatientCity Nvarchar(100)
 ,@PatientState Nvarchar(2)
 ,@PatientZipCode Nvarchar(10))
/* Author: LNaehrig
** Desc: Processes Inserts for Patients Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Insert Into dbo.Patients
    (PatientFirstName
	,PatientLastName
	,PatientPhoneNumber
	,PatientAddress
	,PatientCity
	,PatientState
	,PatientZipCode)
   Values
    (@PatientFirstName
	,@PatientLastName
	,@PatientPhoneNumber
	,@PatientAddress
	,@PatientCity
	,@PatientState
	,@PatientZipCode);
   Commit Transaction;
   Set @RC = +1;
   Set @PatientID = Scope_Identity();
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pInsDoctors
 (@DoctorID Int Output
 ,@DoctorFirstName Nvarchar(100)
 ,@DoctorLastName Nvarchar(100)
 ,@DoctorPhoneNumber Nvarchar(100)
 ,@DoctorAddress Nvarchar(100)
 ,@DoctorCity Nvarchar(100)
 ,@DoctorState Nvarchar(2)
 ,@DoctorZipCode Nvarchar(10))
/* Author: LNaehrig
** Desc: Processes Inserts for Doctors Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Insert Into dbo.Doctors
    (DoctorFirstName
	,DoctorLastName
	,DoctorPhoneNumber
	,DoctorAddress
	,DoctorCity
	,DoctorState
	,DoctorZipCode)
   Values
    (@DoctorFirstName
	,@DoctorLastName
	,@DoctorPhoneNumber
	,@DoctorAddress
	,@DoctorCity
	,@DoctorState
	,@DoctorZipCode);
   Commit Transaction;
   Set @RC = +1;
   Set @DoctorID = Scope_Identity();
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pInsAppointments
 (@AppointmentID Int Output
 ,@AppointmentDateTime Datetime
 ,@AppointmentPatientID Int
 ,@AppointmentDoctorID Int 
 ,@AppointmentClinicID Int)
/* Author: LNaehrig
** Desc: Processes Inserts for Appointments Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Insert Into dbo.Appointments
    (AppointmentDateTime
	,AppointmentPatientID
	,AppointmentDoctorID 
	,AppointmentClinicID)
   Values
    (@AppointmentDateTime 
	,@AppointmentPatientID
	,@AppointmentDoctorID 
	,@AppointmentClinicID);
   Commit Transaction;
   Set @RC = +1;
   Set @AppointmentID = Scope_Identity();
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

-- Updates --
Create Procedure pUpdClinics
 (@ClinicID Int
 ,@ClinicName Nvarchar(100)
 ,@ClinicPhoneNumber Nvarchar(100)
 ,@ClinicAddress Nvarchar(100)
 ,@ClinicCity Nvarchar(100)
 ,@ClinicState Nvarchar(2)
 ,@ClinicZipCode Nvarchar(10))
/* Author: LNaehrig
** Desc: Processes Updates for Clinics Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Update Clinics
   Set 
     ClinicName = @ClinicName
    ,ClinicPhoneNumber = @ClinicPhoneNumber
	,ClinicAddress = @ClinicAddress
	,ClinicCity = @ClinicCity
	,ClinicState = @ClinicState
	,ClinicZipCode = @ClinicZipCode
   Where ClinicID = @ClinicID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pUpdPatients
 (@PatientID Int
 ,@PatientFirstName Nvarchar(100)
 ,@PatientLastName Nvarchar(100)
 ,@PatientPhoneNumber Nvarchar(100)
 ,@PatientAddress Nvarchar(100)
 ,@PatientCity Nvarchar(100)
 ,@PatientState Nvarchar(2)
 ,@PatientZipCode Nvarchar(10))
/* Author: LNaehrig
** Desc: Processes Updates for Patients Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Update Patients
   Set 
      PatientFirstName = @PatientFirstName
	 ,PatientLastName = @PatientLastName
	 ,PatientPhoneNumber = @PatientPhoneNumber
	 ,PatientAddress = @PatientAddress 
	 ,PatientCity = @PatientCity
	 ,PatientState = @PatientState
	 ,PatientZipCode = @PatientZipCode 
   Where PatientID = @PatientID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pUpdDoctors
 (@DoctorID Int
 ,@DoctorFirstName Nvarchar(100)
 ,@DoctorLastName Nvarchar(100)
 ,@DoctorPhoneNumber Nvarchar(100)
 ,@DoctorAddress Nvarchar(100)
 ,@DoctorCity Nvarchar(100)
 ,@DoctorState Nvarchar(2)
 ,@DoctorZipCode Nvarchar(10))
/* Author: LNaehrig
** Desc: Processes Updates for Doctors Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Update Doctors
   Set 
      DoctorFirstName = @DoctorFirstName
	 ,DoctorLastName = @DoctorLastName
	 ,DoctorPhoneNumber = @DoctorPhoneNumber
	 ,DoctorAddress = @DoctorAddress 
	 ,DoctorCity = @DoctorCity
	 ,DoctorState = @DoctorState
	 ,DoctorZipCode = @DoctorZipCode 
   Where DoctorID = @DoctorID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pUpdAppointments
 (@AppointmentID Int
 ,@AppointmentDateTime Datetime
 ,@AppointmentPatientID Int
 ,@AppointmentDoctorID Int 
 ,@AppointmentClinicID Int)
/* Author: LNaehrig
** Desc: Processes Updates for Appointments Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Update Appointments
   Set 
     AppointmentDateTime = @AppointmentDateTime
    ,AppointmentPatientID = @AppointmentPatientID
    ,AppointmentDoctorID = @AppointmentDoctorID 
    ,AppointmentClinicID = @AppointmentClinicID
   Where AppointmentID = @AppointmentID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End
Go

-- Deletes --
Create Procedure pDelAppointments
(@AppointmentID Int)
/* Author: LNaehrig
** Desc: Processes Deletes for the Appointments Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Delete From Appointments Where AppointmentID = @AppointmentID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC =
   -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pDelClinics
(@ClinicID Int)
/* Author: LNaehrig
** Desc: Processes Deletes for the Clinics Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Delete From Clinics Where ClinicID = @ClinicID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC =
   -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pDelPatients
(@PatientID Int)
/* Author: LNaehrig
** Desc: Processes Deletes for the Patients Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Delete From Patients Where PatientID = @PatientID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC =
   -1
  End Catch
  Return @RC;
 End
Go

Create Procedure pDelDoctors
(@DoctorID Int)
/* Author: LNaehrig
** Desc: Processes Deletes for the Doctors Table
** Change Log:
** 2020-05-21, LNaehrig, Created Script
*/
As
 Begin
  Declare @RC Int = 0;
  Begin Try
   Begin Transaction
   Delete From Doctors Where DoctorID = @DoctorID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC =
   -1
  End Catch
  Return @RC;
 End
Go


-- 5: Set Permissions --
Deny Select, Insert, Update, Delete On Clinics To Public;
Deny Select, Insert, Update, Delete On Patients To Public;
Deny Select, Insert, Update, Delete On Doctors To Public;
Deny Select, Insert, Update, Delete On Appointments To Public;

Grant Select On vClinics To Public;
Grant Select On vPatients To Public;
Grant Select On vDoctors To Public;
Grant Select On vAppointments To Public;
Grant Select On vAppointmentsByPatientsDoctorsAndClinics To Public;

Grant Exec On pInsClinics To Public;
Grant Exec On pInsPatients To Public;
Grant Exec On pInsDoctors To Public;
Grant Exec On pInsAppointments To Public;

Grant Exec On pUpdClinics To Public;
Grant Exec On pUpdPatients To Public;
Grant Exec On pUpdDoctors To Public;
Grant Exec On pUpdAppointments To Public;

Grant Exec On pDelClinics To Public;
Grant Exec On pDelPatients To Public;
Grant Exec On pDelDoctors To Public;
Grant Exec On pDelAppointments To Public;


-- 6: Test Views and Procedure --
Select 
  ClinicID
 ,ClinicName
 ,ClinicPhoneNumber
 ,ClinicAddress
 ,ClinicCity
 ,ClinicState
 ,ClinicZipCode
From vClinics;
Go

Select 
  PatientID
 ,PatientFirstName
 ,PatientLastName
 ,PatientPhoneNumber
 ,PatientAddress
 ,PatientCity
 ,PatientState
 ,PatientZipCode
From vPatients;
 Go

Select
  DoctorID
 ,DoctorFirstName
 ,DoctorLastName
 ,DoctorPhoneNumber
 ,DoctorAddress
 ,DoctorCity
 ,DoctorState
 ,DoctorZipCode
From vDoctors;
Go

Select 
  AppointmentID
 ,AppointmentDateTime 
 ,AppointmentPatientID
 ,AppointmentDoctorID 
 ,AppointmentClinicID 
From Appointments;
Go

Select
  AppointmentID
 ,AppointmentDate
 ,AppointmentTime
 ,PatientID
 ,PatientName
 ,PatientPhoneNumber
 ,PatientAddress
 ,PatientCity
 ,PatientState
 ,PatientZipCode
 ,DoctorID
 ,DoctorName
 ,DoctorPhoneNumber
 ,DoctorAddress
 ,DoctorCity
 ,DoctorState
 ,DoctorZipCode
 ,ClinicID
 ,ClinicName
 ,ClinicPhoneNumber
 ,ClinicAddress
 ,ClinicCity
 ,ClinicState
 ,ClinicZipCode
From vAppointmentsByPatientsDoctorsAndClinics;
Go

Declare @Status Int;
Declare @ClinicID Int;
Exec @Status = pInsClinics
  @ClinicID = @ClinicID Output
 ,@ClinicName = 'Test Clinic'
 ,@ClinicPhoneNumber = '111-222-3333'
 ,@ClinicAddress = '123 Test St'
 ,@ClinicCity = 'Seattle'
 ,@ClinicState = 'WA'
 ,@ClinicZipCode = '98015'
Select Case @Status
  When +1 Then 'Insert was successful!'
  When -1 Then 'Insert failed! Review Data.'
  End As [Status]
Select [The New ID Was:] = @ClinicID
Select * From vClinics;
Go

Declare @Status Int;
Declare @PatientID Int;
Exec @Status = pInsPatients
  @PatientID = @PatientID Output
 ,@PatientFirstName = 'Bob'
 ,@PatientLastName = 'Smith'
 ,@PatientPhoneNumber = '123-456-7890'
 ,@PatientAddress = '234 Test Ave'
 ,@PatientCity = 'Seattle' 
 ,@PatientState = 'WA'
 ,@PatientZipCode = '98077'
Select Case @Status
  When +1 Then 'Insert was successful!'
  When -1 Then 'Insert failed! Review Data.'
  End As [Status]
Select [The New ID Was:] = @PatientID
Select * From vPatients;
Go

Declare @Status Int;
Declare @DoctorID Int;
Exec @Status = pInsDoctors
  @DoctorID = @DoctorID Output
 ,@DoctorFirstName = 'Dr. Karl'
 ,@DoctorLastName = 'Heinz'
 ,@DoctorPhoneNumber= '098-765-4321'
 ,@DoctorAddress = '345 Test Pl'
 ,@DoctorCity = 'Seattle'
 ,@DoctorState = 'WA'
 ,@DoctorZipCode = '98074'
Select Case @Status
  When +1 Then 'Insert was successful!'
  When -1 Then 'Insert failed! Review Data.'
  End As [Status]
Select [The New ID Was:] = @DoctorID
Select * From vDoctors;
Go

Declare @Status Int;
Declare @AppointmentID Int;
Exec @Status = pInsAppointments
  @AppointmentID = @AppointmentID Output
 ,@AppointmentDateTime = '05/23/2020 18:00'
 ,@AppointmentPatientID = '1'
 ,@AppointmentDoctorID = '1'
 ,@AppointmentClinicID = '1'
Select Case @Status
  When +1 Then 'Insert was successful!'
  When -1 Then 'Insert failed! Review Data.'
  End As [Status]
Select [The New ID Was:] = @AppointmentID
Select * From vAppointments;
Go

Declare @Status Int;
Exec @Status = pUpdClinics
  @ClinicID = '1'
 ,@ClinicName = 'The Test Clinic'
 ,@ClinicPhoneNumber = '111-222-3334'
 ,@ClinicAddress = '123 Test St.'
 ,@ClinicCity = 'Seattle'
 ,@ClinicState = 'WA'
 ,@ClinicZipCode = '98015'
Select Case @Status
  When +1 Then 'Update was successful!'
  When -1 Then 'Update failed! Review data.'
  End As [Status]
Select * From vClinics;
Go

Declare @Status Int;
Exec @Status = pUpdPatients
  @PatientID = '1'
 ,@PatientFirstName = 'Mr. Bob'
 ,@PatientLastName = 'Smith'
 ,@PatientPhoneNumber = '123-456-7899'
 ,@PatientAddress = '234 Test Ave.'
 ,@PatientCity = 'Seattle' 
 ,@PatientState = 'WA'
 ,@PatientZipCode = '98077'
Select Case @Status
  When +1 Then 'Update was successful!'
  When -1 Then 'Update failed! Review data.'
  End As [Status]
Select * From vPatients;
Go

Declare @Status Int;
Exec @Status = pUpdDoctors
  @DoctorID = '1'
 ,@DoctorFirstName = 'Dr. Karl'
 ,@DoctorLastName = 'Heinz-Dieter'
 ,@DoctorPhoneNumber= '998-765-4321'
 ,@DoctorAddress = '345 Test Pl.'
 ,@DoctorCity = 'Seattle'
 ,@DoctorState = 'WA'
 ,@DoctorZipCode = '98074'
Select Case @Status
  When +1 Then 'Update was successful!'
  When -1 Then 'Update failed! Review data.'
  End As [Status]
Select * From vDoctors;
Go

Declare @Status Int;
Exec @Status = pUpdAppointments
  @AppointmentID = '1'
 ,@AppointmentDateTime = '05/24/2020 16:30'
 ,@AppointmentPatientID = '1'
 ,@AppointmentDoctorID = '1'
 ,@AppointmentClinicID = '1'
Select Case @Status
  When +1 Then 'Update was successful!'
  When -1 Then 'Update failed! Review data.'
  End As [Status]
Select * From vAppointments;
Go

Declare @Status Int;
Exec @Status = pDelAppointments @AppointmentID = '1';
Select Case @Status
  When +1 Then 'Delete was successful!'
  When -1 Then 'Delete failed! Review data.'
  End As [Status]
Select * From vAppointments;
Go

Declare @Status Int;
Exec @Status = pDelClinics @ClinicID = '1';
Select Case @Status
  When +1 Then 'Delete was successful!'
  When -1 Then 'Delete failed! Review data.'
  End As [Status]
Select * From vClinics;
Go

Declare @Status Int;
Exec @Status = pDelPatients @PatientID = '1';
Select Case @Status
  When +1 Then 'Delete was successful!'
  When -1 Then 'Delete failed! Review data.'
  End As [Status]
Select * From vPatients;
Go

Declare @Status Int;
Exec @Status = pDelDoctors @DoctorID = '1';
Select Case @Status
  When +1 Then 'Delete was successful!'
  When -1 Then 'Delete failed! Review data.'
  End As [Status]
Select * From vDoctors;
Go


-- 7: Insert Data -- 
-- Milestone 03 --