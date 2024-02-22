-- DDL & Inserts for Worker and Project Example Figure 5.3
CREATE TABLE Worker (
empId NUMBER(6) PRIMARY KEY, 
lastName VARCHAR2(20) NOT NULL,
firstName VARCHAR2(15) NOT NULL, 
deptName VARCHAR2(15), 
birthDate DATE, 
hireDate DATE, 
salary NUMBER(8,2));

CREATE TABLE Dept(
deptName VARCHAR2(15),
mgrId NUMBER(6),
CONSTRAINT Dept_deptName_pk PRIMARY KEY (deptName),
CONSTRAINT Dept_mgrId_fk FOREIGN KEY (mgrId) REFERENCES Worker(empId) ON DELETE SET NULL);

--ALTER TABLE Worker ADD CONSTRAINT Worker_deptName_fk FOREIGN KEY (deptName) REFERENCES Dept(deptName) ON DELETE SET NULL;

CREATE TABLE Project (
projNo NUMBER(6), 
projName VARCHAR2(20), 
projMgrId NUMBER(6),
budget NUMBER (8,2), 
startDate DATE, 
expectedDurationWeeks NUMBER(4),
CONSTRAINT Project_projNo_pk PRIMARY KEY (projNo),
CONSTRAINT Project_projMgrId_fk FOREIGN KEY(projMgrId) REFERENCES WORKER(empId) ON DELETE SET NULL);
	
CREATE TABLE Assign (
projNo NUMBER(6), 
empId NUMBER(6), 
hoursAssigned NUMBER(3), 
rating NUMBER(1),
CONSTRAINT Assign_projNo_empId_pk PRIMARY KEY (projNo, empId),
CONSTRAINT Assign_projNo_fk FOREIGN KEY(projNo) REFERENCES Project(projNo) ON DELETE CASCADE,
CONSTRAINT Assign_empId_fk FOREIGN KEY(empId) REFERENCES Worker(empId) ON DELETE CASCADE);

INSERT INTO Dept VALUES ('Accounting',null);
INSERT INTO Dept VALUES ('Research',null);

INSERT INTO Worker VALUES(101,'Smith','Tom', 'Accounting', '1970- 01-Feb', '1993-Jun-06',50000);
INSERT INTO Worker VALUES(103,'Jones','Mary','Accounting', '1975-Jun-15', '2005-Sep-20',48000);
INSERT INTO Worker VALUES(105,'Burns','Jane','Accounting', '1980-Sep-21', '2015-Jun-12',39000);
INSERT INTO Worker VALUES(110,'Burns','Michael', 'Research', '1977-Apr-02', '2020-Sep-10',70000);
INSERT INTO Worker VALUES(115,'Chin','Amanda', 'Research', '1980-Sep-22', '2022-Jun-19',60000);

UPDATE Dept SET mgrId = 101 WHERE deptName = 'Accounting';
UPDATE Dept SET mgrId = 110 WHERE deptName = 'Research';	

INSERT INTO Project VALUES (1001, 'Jupiter', 101, 300000, '2021-Feb-01', 50);
INSERT INTO Project VALUES (1005, 'Saturn', 101, 400000, '2022-Jun-01', 35);
INSERT INTO Project VALUES (1019, 'Mercury', 110, 350000, '2022-Feb-05', 40);
INSERT INTO Project VALUES (1025, 'Neptune', 110, 600000, '2021-Feb-01', 45);
INSERT INTO Project VALUES (1030, 'Pluto', 110, 380000, '2023-Sep-15', 50);

INSERT INTO Assign VALUES(1001, 101, 30,null);
INSERT INTO Assign VALUES(1001, 103, 20,5);
INSERT INTO Assign VALUES(1005, 103, 20,null);
INSERT INTO Assign VALUES(1001, 105, 30,null);
INSERT INTO Assign VALUES(1001, 115, 20,4);
INSERT INTO Assign VALUES(1019, 110, 20,5);
INSERT INTO Assign VALUES(1019, 115, 10,4);
INSERT INTO Assign VALUES(1025, 110, 10,null);
INSERT INTO Assign VALUES(1030, 110, 10,null);


-- Figure 5.3
