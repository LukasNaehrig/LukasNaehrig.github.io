--**********************************************************************************************--
-- Title: Final Project, Milestone 03, Assignment 09, Part 1
-- Author: LukasNaehrig
-- Desc: This adds data to the Patient Appointments Database
-- Change Log: When,Who,What
-- 2020-05-27,LukasNaehrig,Created File
--***********************************************************************************************--

Use PatientAppointmentsDB_LukasNaehrig;
Go

-- Adding Data --

-- Clinics: --
Exec pInsClinics
 @ClinicID = '1'
,@ClinicName = 'UW Medical Center'
,@ClinicPhoneNumber = '206-123-4567'
,@ClinicAddress = '1959 NE Pacific St'
,@ClinicCity = 'Seattle'
,@ClinicState = 'WA'
,@ClinicZipCode = '98195'
Go

Exec pInsClinics
 @ClinicID = '2'
,@ClinicName = 'Evergreen Health Medical Center'
,@ClinicPhoneNumber = '425-899-1000'
,@ClinicAddress = '12040 NE 128th St'
,@ClinicCity = 'Kirkland'
,@ClinicState = 'WA'
,@ClinicZipCode = '98034'
Go

Exec pInsClinics
 @ClinicID = '3'
,@ClinicName = 'Overlake Medical Center'
,@ClinicPhoneNumber = '425-688-5000'
,@ClinicAddress = '1035 116th Ave NE'
,@ClinicCity = 'Bellevue'
,@ClinicState = 'WA'
,@ClinicZipCode = '98004'
Go

Exec pInsClinics
 @ClinicID = '4'
,@ClinicName = 'Swedish Medical Center'
,@ClinicPhoneNumber = '425-313-4000'
,@ClinicAddress = '751 NE Blakely Dr'
,@ClinicCity = 'Issaquah'
,@ClinicState = 'WA'
,@ClinicZipCode = '98029'
Go

Exec pInsClinics
 @ClinicID = '5'
,@ClinicName = 'Harborview Medical Center'
,@ClinicPhoneNumber = '206-744-3000'
,@ClinicAddress = '325 9th Ave'
,@ClinicCity = 'Seattle'
,@ClinicState = 'WA'
,@ClinicZipCode = '98104'
Go

-- Patients: --
Exec pInsPatients
 @PatientID = '1'
,@PatientFirstName = 'Jeff'
,@PatientLastName = 'Winger'
,@PatientPhoneNumber = '555-666-7777'
,@PatientAddress = '23456 NE 10th Ave'
,@PatientCity = 'Sammamish'
,@PatientState = 'WA'
,@PatientZipCode ='98074'
Go

Exec pInsPatients
 @PatientID = '2'
,@PatientFirstName = 'Britta'
,@PatientLastName = 'Perry'
,@PatientPhoneNumber = '777-666-5555'
,@PatientAddress = '695 Sunset Blvd SE'
,@PatientCity = 'Redmond'
,@PatientState = 'WA'
,@PatientZipCode ='98066'
Go

Exec pInsPatients
 @PatientID = '3'
,@PatientFirstName = 'Abed'
,@PatientLastName = 'Nadir'
,@PatientPhoneNumber = '439-090-7593'
,@PatientAddress = '999 Jackson Ave S'
,@PatientCity = 'Fall City'
,@PatientState = 'WA'
,@PatientZipCode ='98299'
Go

Exec pInsPatients
 @PatientID = '4'
,@PatientFirstName = 'Shirley'
,@PatientLastName = 'Bennett'
,@PatientPhoneNumber = '458-545-8853'
,@PatientAddress = '10 Aachener St'
,@PatientCity = 'Woodinville'
,@PatientState = 'WA'
,@PatientZipCode ='98077'
Go

Exec pInsPatients
 @PatientID = '5'
,@PatientFirstName = 'Annie'
,@PatientLastName = 'Edison'
,@PatientPhoneNumber = '757-585-2894'
,@PatientAddress = '8585 NE 234th Pl'
,@PatientCity = 'Bothell'
,@PatientState = 'WA'
,@PatientZipCode ='98099'
Go

Exec pInsPatients
 @PatientID = '6'
,@PatientFirstName = 'Troy'
,@PatientLastName = 'Barnes'
,@PatientPhoneNumber = '491-423-3484'
,@PatientAddress = '4482 SE Deer Rd'
,@PatientCity = 'Klahanie'
,@PatientState = 'WA'
,@PatientZipCode ='98075'
Go

Exec pInsPatients
 @PatientID = '7'
,@PatientFirstName = 'Pierce'
,@PatientLastName = 'Hawthorne'
,@PatientPhoneNumber = '343-595-3992'
,@PatientAddress = '7475 Main St'
,@PatientCity = 'Bellevue'
,@PatientState = 'WA'
,@PatientZipCode ='98057'
Go

Exec pInsPatients
 @PatientID = '8'
,@PatientFirstName = 'John'
,@PatientLastName = 'Oliver'
,@PatientPhoneNumber = '425-956-4801'
,@PatientAddress = '76584 NE 29th Pl'
,@PatientCity = 'Sammamish'
,@PatientState = 'WA'
,@PatientZipCode ='98074'
Go

Exec pInsPatients
 @PatientID = '9'
,@PatientFirstName = 'John'
,@PatientLastName = 'Oliver'
,@PatientPhoneNumber = '425-956-4801'
,@PatientAddress = '76584 NE 29th Pl'
,@PatientCity = 'Sammamish'
,@PatientState = 'WA'
,@PatientZipCode ='98074'
Go

Exec pInsPatients
 @PatientID = '10'
,@PatientFirstName = 'Jordan'
,@PatientLastName = 'Morris'
,@PatientPhoneNumber = '206-019-1313'
,@PatientAddress = '4343 Cherry St'
,@PatientCity = 'Seattle'
,@PatientState = 'WA'
,@PatientZipCode ='98105'
Go

Exec pInsPatients
 @PatientID = '11'
,@PatientFirstName = 'Cristian'
,@PatientLastName = 'Roldan'
,@PatientPhoneNumber = '206-018-7707'
,@PatientAddress = '137 Madison Ave'
,@PatientCity = 'Seattle'
,@PatientState = 'WA'
,@PatientZipCode ='98105'
Go

Exec pInsPatients
 @PatientID = '12'
,@PatientFirstName = 'Nicolas'
,@PatientLastName = 'Lodeiro'
,@PatientPhoneNumber = '206-111-1392'
,@PatientAddress = '10 Boca Ln'
,@PatientCity = 'Seattle'
,@PatientState = 'WA'
,@PatientZipCode ='98105'
Go

Exec pInsPatients
 @PatientID = '13'
,@PatientFirstName = 'Raul'
,@PatientLastName = 'Ruidiaz'
,@PatientPhoneNumber = '206-999-2931'
,@PatientAddress = '9 Peru Ln'
,@PatientCity = 'Seattle'
,@PatientState = 'WA'
,@PatientZipCode ='98105'
Go

Exec pInsPatients
 @PatientID = '13'
,@PatientFirstName = 'Jax'
,@PatientLastName = 'Morgan'
,@PatientPhoneNumber = '444-888-2929'
,@PatientAddress = '9900 Boston Highway'
,@PatientCity = 'Seattle'
,@PatientState = 'WA'
,@PatientZipCode ='98105'
Go

-- Doctors:
Exec pInsDoctors
 @DoctorID = '1'
,@DoctorFirstName = 'Karoline'
,@DoctorLastName = 'Wucherer'
,@DoctorPhoneNumber = '206-100-0608'
,@DoctorAddress = '156 156th St'
,@DoctorCity = 'Woodinville'
,@DoctorState = 'WA'
,@DoctorZipCode = '98077'
Go

Exec pInsDoctors
 @DoctorID = '2'
,@DoctorFirstName = 'Jacob'
,@DoctorLastName = 'Bodnar'
,@DoctorPhoneNumber = '425-199-2054'
,@DoctorAddress = '1035 NE 14th Blvd'
,@DoctorCity = 'Duvall'
,@DoctorState = 'WA'
,@DoctorZipCode = '98400'
Go

Exec pInsDoctors
 @DoctorID = '3'
,@DoctorFirstName = 'Colby'
,@DoctorLastName = 'Tong'
,@DoctorPhoneNumber = '206-243-3483'
,@DoctorAddress = '584 S Freemont Ave'
,@DoctorCity = 'Auburn'
,@DoctorState = 'WA'
,@DoctorZipCode = '99875'
Go

Exec pInsDoctors
 @DoctorID = '4'
,@DoctorFirstName = 'Zach'
,@DoctorLastName = 'Grande'
,@DoctorPhoneNumber = '484-484-4848'
,@DoctorAddress = '848 NE 848th St'
,@DoctorCity = 'Redmond'
,@DoctorState = 'WA'
,@DoctorZipCode = '98079'
Go

Exec pInsDoctors
 @DoctorID = '5'
,@DoctorFirstName = 'James'
,@DoctorLastName = 'Hetfield'
,@DoctorPhoneNumber = '198-120-2077'
,@DoctorAddress = '3214 Tallica Rd'
,@DoctorCity = 'Seattle'
,@DoctorState = 'WA'
,@DoctorZipCode = '98105'
Go

Exec pInsDoctors
 @DoctorID = '6'
,@DoctorFirstName = 'James'
,@DoctorLastName = 'Hickey'
,@DoctorPhoneNumber = '206-128-2382'
,@DoctorAddress = '999 88th Ave'
,@DoctorCity = 'Everett'
,@DoctorState = 'WA'
,@DoctorZipCode = '97758'
Go

Exec pInsDoctors
 @DoctorID = '7'
,@DoctorFirstName = 'Johannes'
,@DoctorLastName = 'Reitinger'
,@DoctorPhoneNumber = '425-250-2525'
,@DoctorAddress = '25 54th St'
,@DoctorCity = 'Redmond'
,@DoctorState = 'WA'
,@DoctorZipCode = '98063'
Go

Exec pInsDoctors
 @DoctorID = '8'
,@DoctorFirstName = 'Jerry'
,@DoctorLastName = 'Cantrell'
,@DoctorPhoneNumber = '206-454-1353'
,@DoctorAddress = '1234 Alice St'
,@DoctorCity = 'Mercer Island'
,@DoctorState = 'WA'
,@DoctorZipCode = '98000'
Go

Exec pInsDoctors
 @DoctorID = '9'
,@DoctorFirstName = 'Allison'
,@DoctorLastName = 'Brie'
,@DoctorPhoneNumber = '475-234-8695'
,@DoctorAddress = '3433 Community Pl'
,@DoctorCity = 'Sammamish'
,@DoctorState = 'WA'
,@DoctorZipCode = '98074'
Go

Exec pInsDoctors
 @DoctorID = '10'
,@DoctorFirstName = 'Karl-Heinz'
,@DoctorLastName = 'Overbeck'
,@DoctorPhoneNumber = '987-098-0009'
,@DoctorAddress = '1 Pearl St'
,@DoctorCity = 'Seattle'
,@DoctorState = 'WA'
,@DoctorZipCode = '98111'
Go

-- Appointments:
Exec pInsAppointments
 @AppointmentID = '1'
,@AppointmentDateTime  = '06-01-2020 8:00'
,@AppointmentPatientID = '2'
,@AppointmentDoctorID  = '2'
,@AppointmentClinicID = '2'
Go

Exec pInsAppointments
 @AppointmentID = '2'
,@AppointmentDateTime  = '06-01-2020 9:00'
,@AppointmentPatientID = '3'
,@AppointmentDoctorID  = '3'
,@AppointmentClinicID = '2'
Go

Exec pInsAppointments
 @AppointmentID = '3'
,@AppointmentDateTime  = '06-02-2020 9:00'
,@AppointmentPatientID = '4'
,@AppointmentDoctorID  = '4'
,@AppointmentClinicID = '3'
Go

Exec pInsAppointments
 @AppointmentID = '4'
,@AppointmentDateTime  = '06-02-2020 10:00'
,@AppointmentPatientID = '5'
,@AppointmentDoctorID  = '5'
,@AppointmentClinicID = '3'
Go

Exec pInsAppointments
 @AppointmentID = '5'
,@AppointmentDateTime  = '06-03-2020 10:00'
,@AppointmentPatientID = '6'
,@AppointmentDoctorID  = '6'
,@AppointmentClinicID = '4'
Go

Exec pInsAppointments
 @AppointmentID = '6'
,@AppointmentDateTime  = '06-03-2020 11:00'
,@AppointmentPatientID = '7'
,@AppointmentDoctorID  = '7'
,@AppointmentClinicID = '4'
Go

Exec pInsAppointments
 @AppointmentID = '7'
,@AppointmentDateTime  = '06-04-2020 11:00'
,@AppointmentPatientID = '8'
,@AppointmentDoctorID  = '8'
,@AppointmentClinicID = '4'
Go

Exec pInsAppointments
 @AppointmentID = '8'
,@AppointmentDateTime  = '06-01-2020 11:00'
,@AppointmentPatientID = '9'
,@AppointmentDoctorID  = '9'
,@AppointmentClinicID = '5'
Go

Exec pInsAppointments
 @AppointmentID = '9'
,@AppointmentDateTime  = '06-04-2020 14:00'
,@AppointmentPatientID = '10'
,@AppointmentDoctorID  = '10'
,@AppointmentClinicID = '6'
Go

Exec pInsAppointments
 @AppointmentID = '10'
,@AppointmentDateTime  = '06-04-2020 15:00'
,@AppointmentPatientID = '11'
,@AppointmentDoctorID  = '11'
,@AppointmentClinicID = '5'
Go

Exec pInsAppointments
 @AppointmentID = '11'
,@AppointmentDateTime  = '06-04-2020 15:00'
,@AppointmentPatientID = '12'
,@AppointmentDoctorID  = '10'
,@AppointmentClinicID = '2'
Go

Exec pInsAppointments
 @AppointmentID = '12'
,@AppointmentDateTime  = '06-05-2020 15:00'
,@AppointmentPatientID = '13'
,@AppointmentDoctorID  = '2'
,@AppointmentClinicID = '2'
Go

Exec pInsAppointments
 @AppointmentID = '13'
,@AppointmentDateTime  = '06-05-2020 16:00'
,@AppointmentPatientID = '14'
,@AppointmentDoctorID  = '2'
,@AppointmentClinicID = '2'
Go