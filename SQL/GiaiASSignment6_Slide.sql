create database csdlBai6;
use csdlBai6;

create table Employee (
EmployeeID int primary key auto_increment,
EmployeeLastName varchar(30),
EmployeeFirstName varchar(30),
EmployeeHireDate date,
EmployeeStatus varchar(30),
SupervisorID int,
SocialSecurityNumber int 
);
create table Projects (
ProjectID int auto_increment primary key ,
EmployeeID int,
ProjectName varchar(30),
ProjectStartDate date,
ProjectDesciption text,
ProjectDetail varchar(30),
ProjectCompletedOn date,
foreign key(EmployeeID) references Employee(EmployeeID) on delete cascade on update cascade
);
create table Project_Modules (
ModuleID int auto_increment primary key,
ProjectID int,
EmployeeID int,
ProjectModulesDate date,
ProjectModulesCompleOn date,
ProjectModulesDesciption text,
foreign key(EmployeeID) references Employee(EmployeeID) on delete cascade on update cascade,
foreign key(ProjectID) references Projects(ProjectID) on delete cascade on update cascade
);
create table Work_Done (
WorkDoneID int auto_increment primary key,
EmployeeID int,
ModuleID int,
WorkDoneDate date,
WorkDoneDescription text,
WorkDoneStatus varchar(30),
foreign key(EmployeeID) references Employee(EmployeeID) on delete cascade on update cascade,
foreign key(ModuleID) references Project_Modules(ModuleID) on delete cascade on update cascade
);

-- them ban ghi
insert into Employee( EmployeeLastName ,EmployeeFirstName ,EmployeeHireDate,
						EmployeeStatus ,SupervisorID,SocialSecurityNumber)
			values	('Nguyen','Van A','2003-01-02','ChinhThuc',1,123),
					('Tran','Van B','2003-01-03','ChinhThuc',1,123),
                    ('Nguyen','Van C','2003-01-04','TamThoi',1,123);
insert into Projects(EmployeeID,ProjectName ,ProjectStartDate,ProjectDesciption
						,ProjectDetail,ProjectCompletedOn)
			values 	(1,'Lam web','2003-02-01','Lam website xem phim','Lam web gia 20tr','2003-04-01'),
					(2,'Lam game','2003-02-01','Lam game co vua ','Lam game gia 30tr','2003-04-02'),
					(3,'Lam web','2003-02-01','Lam website dat lich kham','Lam web gia 40tr','2024-03-22');
insert into Project_Modules(ProjectID ,EmployeeID,ProjectModulesDate,
							ProjectModulesCompleOn,ProjectModulesDesciption)
			values	(1,1,'2003-04-01','2003-04-10', 'Hoan thanh muon nhe'),
					(2,2,'2003-04-02','2003-04-11', 'Hoan thanh muon nhe'),
                    (3,3,'2003-04-03','2003-04-3', 'Hoan thanh ');
insert into Work_Done(EmployeeID,ModuleID,WorkDoneDate,WorkDoneDescription,WorkDoneStatus)
			values 	(1,1,null, 'Cong viec hoan thanh muon','Hoan thanh'),
					(2,2,null, 'Cong viec hoan thanh muon','Hoan thanh'),
					(3,3,'2003-04-3', 'Cong viec hoan thanh muon','Hoan thanh');
select *from Employee;
select *from Projects;
select *from Project_Modules;
select *from Work_Done;
-- tao thu tuc remove all project hoan thanh sau 3 thang tu ngay hien , in so luong record 
	-- da remove tu cac bang lien quan trog khi removing ( dung lenh print)
DELIMITER $$
	CREATE PROCEDURE AllprojectCompletedON_3thang(OUT SoRecordDeleted int ) -- OUT SoRecordDeleted int
		BEGIN 
        SET @sql_safe_updates =0;
			select count(*) into SoRecordDeleted
            from Projects 
            where projectID is not null and  DATEDIFF(CURDATE(),ProjectCompletedOn)>90  ;	 
			delete from Projects 
            where projectID is not null and  DATEDIFF(CURDATE(),ProjectCompletedOn)>90 ; -- datesub trả về ngày 
		-- Khong can cai nay nua. Set roi em nhe
        -- SET @sql_safe_updates = 1;
        END $$
DELIMITER ;
SET @SoRecordDeleted = 0 ;
CALL AllprojectCompletedON_3thang(@SoRecordDeleted);
select @SoRecordDeleted;

-- viet procedure in ra cac modules ddc thuc hien 
select *from Project_Modules;
DELIMITER $$
	create procedure InModules(IN ModuleID int)
    BEGIN
		select * from Project_Modules where Project_Modules.ModuleID = ModuleID;
    END $$
DELIMITER ;
CALL InModules(3);

            
            