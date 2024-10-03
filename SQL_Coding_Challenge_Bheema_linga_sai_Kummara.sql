
-- 1Q. Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”.
-- 4Q. Ensure the script handles potential errors, such as if the database already exist.
if not exists (
    select name 
    from sys.databases 
    where name = 'CareerHub'
)
begin
    create database CareerHub;
end



use CareerHub;

-- 2Q. Create tables for Companies, Jobs, Applicants and Applications.
-- 3Q. Define appropriate primary keys, foreign keys, and constraints.


/*
Table: Companies
Attributes:
• CompanyID (Primary Key, int): Unique identifier for each company.
• CompanyName (string): The name of the hiring company.
• Location (string): The location of the company.
*/

create table Companies(
CompanyID int primary key not null,
CompanyName varchar(40),
Location varchar(50)
);

/*
Table: Jobs
Attributes:
• JobID (Primary Key, int): Unique identifier for each job listing.
• CompanyID (Foreign Key, int): References the CompanyID of the hiring company.
• JobTitle (string): The title of the job.
• JobDescription (text): A detailed description of the job.
• JobLocation (string): The location where the job is based.
• Salary (decimal): The salary offered for the job.
• JobType (string): Type of job (e.g., Full-time, Part-time, Contract).
• PostedDate (datetime): Date and time when the job was posted.
*/

create table Jobs(
JobID int primary key not null,
CompanyID int,
JobTitle varchar(30),
JobDescription text,
JobLocation varchar(40),
Salary decimal(9,2),
JobType varchar(20),
PostedDate datetime,
foreign key (CompanyID) references Companies(CompanyID)
);

/*
Table: Applicants
Attributes:
• ApplicantID (Primary Key, int): Unique identifier for each applicant.
• FirstName (string): The first name of the applicant.
• LastName (string): The last name of the applicant.
• Email (string): The email address of the applicant.
• Phone (string): The phone number of the applicant.
• Resume (text): The applicant's resume or CV (text or file reference).
*/

create table Applicants(
ApplicantID int primary key not null,
FirstName varchar(50),
LastName varchar(40),
Email varchar(100),
Phone varchar(20),
Resume text
);

/*
Table: Applications
Attributes:
• ApplicationID (Primary Key, int): Unique identifier for each job application.
• JobID (Foreign Key, int): References the JobID of the job listing.
• ApplicantID (Foreign Key, int): References the ApplicantID of the applicant.
• ApplicationDate (datetime): Date and time when the application was submitted.
• CoverLetter (text): The applicant's cover letter for the specific job.
*/

create table Applications(
ApplicationID int primary key not null,
JobID int,
ApplicantID int,
ApplicationDate datetime,
CoverLetter text,
foreign key (ApplicantID) references Applicants(ApplicantID),
foreign key (JobID) references Jobs(JobID)
);


-- Sample datainsertion
insert into Companies 
(CompanyID, CompanyName, Location)
values 
(1, 'Hexaware', 'CityX'),
(2, 'Tata Consultancy Services', 'CityR'),
(3, 'Infosys', 'CityS'),
(4, 'Wipro', 'CityX'),
(5, 'HCL Technologies', 'CityU'),
(6, 'Tech Mahindra', 'CityV'),
(7, 'Accenture', 'CityX'),
(8, 'Cognizant', 'CityX'),
(9, 'IBM India', 'CityY'),
(10, 'Capgemini', 'CityZ');

insert into Jobs 
(JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
values 
(1, 1, 'Software Engineer', 'Develop software solutions', 'Mumbai', 60000.00, 'Full-time', GETDATE()),
(2, 2, 'Data Analyst', 'Analyze business data', 'Bangalore', 50000.00, 'Full-time', GETDATE()),
(3, 3, 'System Administrator', 'Manage IT systems', 'Hyderabad', 55000.00, 'Full-time', GETDATE()),
(4, 4, 'Project Manager', 'Lead software projects', 'Chennai', 80000.00, 'Full-time', GETDATE()),
(5, 5, 'Business Analyst', 'Analyze business processes', 'Pune', 70000.00, 'Full-time', GETDATE()),
(6, 6, 'Consultant', 'Provide IT consulting', 'Gurgaon', 65000.00, 'Contract', GETDATE()),
(7, 7, 'QA Engineer', 'Test software products', 'Kolkata', 45000.00, 'Full-time', GETDATE()),
(8, 8, 'Network Engineer', 'Maintain network infrastructure', 'Delhi', 50000.00, 'Full-time', GETDATE()),
(9, 9, 'Web Developer', 'Develop web applications', 'Noida', 60000.00, 'Full-time', GETDATE()),
(10, 10, 'DevOps Engineer', 'Automate processes', 'Chennai', 75000.00, 'Full-time', GETDATE());

insert into Applicants 
(ApplicantID, FirstName, LastName, Email, Phone, Resume)
values 
(1, 'Amit', 'Sharma', 'amit.sharma@gmail.com', '9876543210', 'Resume1'),
(2, 'Neha', 'Verma', 'neha.verma@gmail.com', '9876543211', 'Resume2'),
(3, 'Ravi', 'Kumar', 'ravi.kumar@gmail.com', '9876543212', 'Resume3'),
(4, 'Pooja', 'Singh', 'pooja.singh@gmail.com', '9876543213', 'Resume4'),
(5, 'Rajesh', 'Patel', 'rajesh.patel@gmail.com', '9876543214', 'Resume5'),
(6, 'Sonia', 'Mehra', 'sonia.mehra@gmail.com', '9876543215', 'Resume6'),
(7, 'Rohan', 'Joshi', 'rohan.joshi@gmail.com', '9876543216', 'Resume7'),
(8, 'Preeti', 'Mishra', 'preeti.mishra@gmail.com', '9876543217', 'Resume8'),
(9, 'Kunal', 'Agarwal', 'kunal.agarwal@gmail.com', '9876543218', 'Resume9'),
(10, 'Ankita', 'Rao', 'ankita.rao@gmail.com', '9876543219', 'Resume10');

insert into Applications 
(ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter)
values 
(1, 1, 1, GETDATE(), 'Cover letter 1'),
(2, 2, 2, GETDATE(), 'Cover letter 2'),
(3, 3, 3, GETDATE(), 'Cover letter 3'),
(4, 4, 4, GETDATE(), 'Cover letter 4'),
(5, 5, 5, GETDATE(), 'Cover letter 5'),
(6, 6, 6, GETDATE(), 'Cover letter 6'),
(7, 7, 7, GETDATE(), 'Cover letter 7'),
(8, 8, 8, GETDATE(), 'Cover letter 8'),
(9, 9, 9, GETDATE(), 'Cover letter 9'),
(10, 10, 10, GETDATE(), 'Cover letter 10');


-- 5Q. Write an SQL query to count the number of applications received for each job listing in the "Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all jobs, even if they have no applications.
select j.JobTitle, count(a.ApplicationID) as ApplicationCount
from Jobs
j left join Applications a 
on j.JobID = a.JobID
group by j.JobTitle;

-- 6Q. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range. Allow parameters for the minimum and maximum salary values. Display the job title, company name, location, and salary for each matching job.
select j.JobTitle, c.CompanyName, j.JobLocation, j.Salary
from Jobs j
inner join Companies c
on j.CompanyID = c.CompanyID
where j.Salary between 50000.00 and 60000.00;


-- 7Q. Write an SQL query that retrieves the job application history for a specific applicant. Allow a parameter for the ApplicantID, and return a result set with the job titles, company names, and application dates for all the jobs the applicant has applied to.
select j.JobTitle, c.CompanyName, a.ApplicationDate
from Applications a
inner join Jobs j on a.JobID = j.JobID
inner join Companies c on j.CompanyID = c.CompanyID
where a.ApplicantID = 3;


-- 8Q. Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.
select avg(Salary) as [Average Salary]
from Jobs
where Salary > 0;


-- 9Q. Write an SQL query to identify the company that has posted the most job listings. Display the company name along with the count of job listings they have posted. Handle ties if multiple companies have the same maximum count.
select c.CompanyName, count(j.JobID) as [Jobs Count]
from Companies c
inner join Jobs j on c.CompanyID = j.CompanyID
group by c.CompanyName
having count(j.JobID) = (
    select max(JobCount)
    from (
        select count(JobID) as JobCount
        from Jobs
        group by CompanyID
    ) as MaxJobCount
);


-- 10Q. Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.

-- Adding column Experience in the Applicants table for the query.
alter table Applicants
add Experience int;

-- Please Exececute the above command, so that all will go as per planned
-- or else it will show error

-- sample data
update Applicants
set Experience = 0;

update Applicants
set Experience = 4
where ApplicantID = 3;

update Applicants
set Experience = 6
where ApplicantID = 7;

select * from Applicants;


--main query
select a.FirstName, a.LastName, a.Email, a.Phone
from Applicants a
inner join Applications ap on a.ApplicantID = ap.ApplicantID
inner join Jobs j on ap.JobID = j.JobID
inner join Companies c on j.CompanyID = c.CompanyID
where c.Location = 'CityX' and a.Experience >= 3;


-- 11Q. Retrieve a list of distinct job titles with salaries between $600000 and $800000.
select distinct JobTitle
from Jobs
where Salary between 60000 and 80000;

-- 12Q. Find the jobs that have not received any applications.

select j.JobTitle, c.CompanyName
from Jobs j
left join Applications a on j.JobID = a.JobID
inner join Companies c on j.CompanyID = c.CompanyID
where a.ApplicationID is null;


-- 13Q. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.
select a.FirstName, a.LastName, c.CompanyName, j.JobTitle
from Applicants a
inner join Applications ap on a.ApplicantID = ap.ApplicantID
inner join Jobs j on ap.JobID = j.JobID
inner join Companies c on j.CompanyID = c.CompanyID;

-- 14Q. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.
select c.CompanyName, count(j.JobID) as JobCount
from Companies c
left join Jobs j on c.CompanyID = j.CompanyID
group by c.CompanyName;


-- 15Q. List all applicants along with the companies and positions they have applied for, including those who have not applied.
select a.FirstName, a.LastName, c.CompanyName, j.JobTitle
from Applicants a
left join Applications ap on a.ApplicantID = ap.ApplicantID
left join Jobs j on ap.JobID = j.JobID
left join Companies c on j.CompanyID = c.CompanyID;



-- 16Q. Find companies that have posted jobs with a salary higher than the average salary of all jobs.
select distinct c.CompanyName
from Companies c
inner join Jobs j on c.CompanyID = j.CompanyID
where j.Salary > (
select avg(Salary)
from Jobs
);


-- 17Q. Display a list of applicants with their names and a concatenated string of their city and state.

-- there are no column such as city, state. so creating them here
alter table Applicants
add City varchar(50);

alter table Applicants
add State varchar(50);



-- sample data for state, city
update Applicants
set City = 'Pune', State = 'Maharashtra'
WHERE ApplicantID = 1;

update Applicants
set City = 'Mumbai', State = 'Maharashtra'
where ApplicantID = 2;

update Applicants
set City = 'Bangalore', State = 'Karnataka'
where ApplicantID = 3;

update Applicants
set City = 'Hyderabad', State = 'Telangana'
where ApplicantID = 4;

update Applicants
set City = 'Chennai', State = 'Tamil Nadu'
where ApplicantID = 5;

update Applicants
set City = 'Delhi', State = 'Delhi'
where ApplicantID = 6;

update Applicants
set City = 'Kolkata', State = 'West Bengal'
where ApplicantID = 7;

update Applicants
set City = 'Ahmedabad', State = 'Gujarat'
where ApplicantID = 8;

update Applicants
set City = 'Jaipur', State = 'Rajasthan'
where ApplicantID = 9;

update Applicants
set City = 'Lucknow', State = 'Uttar Pradesh'
where ApplicantID = 10;


-- before executing the main query execute the above first

-- main Query
select a.FirstName, a.LastName, 
concat(a.City, ', ', a.State) as Location
from Applicants a;



-- 18Q. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.
select JobTitle
from Jobs
where JobTitle like '%Developer%' or JobTitle like '%Engineer%';


-- 19Q. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.
select a.FirstName, a.LastName, j.JobTitle
from Applicants a
full outer join Applications ap on a.ApplicantID = ap.ApplicantID
full outer join Jobs j on ap.JobID = j.JobID;


-- 20Q. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience.
select a.FirstName, a.LastName, c.CompanyName
from Applicants a
inner join Applications ap on a.ApplicantID = ap.ApplicantID
inner join Jobs j on ap.JobID = j.JobID
inner join Companies c on j.CompanyID = c.CompanyID
where c.Location = 'CityX' and a.Experience > 2;
