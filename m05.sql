CREATE TABLE User (
	username VARCHAR(30)PRIMARY KEY, 
	name VARCHAR(30), 
	email_address VARCHAR(60), 
	password_hash VARCHAR(300), 
	role VARCHAR(30));


CREATE TABLE Course (
	course_id VARCHAR(30) PRIMARY KEY, 
 	course_code VARCHAR(30),
	start_date DATETIME,
	end_date DATETIME,
	FOREIGN KEY (course_code) REFERENCES CourseCode(course_code)
);

CREATE TABLE CourseCode (
	course_code VARCHAR(30) PRIMARY KEY, 
	course_name VARCHAR(30),
	short_description VARCHAR(200),
	thumbnail_image VARCHAR(200)
);


CREATE TABLE Login (
	username VARCHAR(30),
	time DATETIME,
	IP_address VARCHAR(30),
	session_alive BOOLEAN,	
	PRIMARY KEY (username, time),
	FOREIGN KEY (username) REFERENCES User(username)
);

CREATE TABLE ZipCode (
	zip_code VARCHAR(10) PRIMARY KEY,
	city_name VARCHAR(30),
	state_naem VARCHAR(30)
);

CREATE TABLE Address (
	username VARCHAR(30),
	address_num INTEGER,
	flat_number VARCHAR(10),
	address_lines VARCHAR(30),
	country_code INTEGER,
	contact_number VARCHAR(10),
	zip_code VARCHAR(10),
	PRIMARY KEY (username, address_num),
	FOREIGN KEY (username) REFERENCES User(username),
	FOREIGN KEY (zip_code) REFERENCES ZipCode(zip_code)
);

CREATE TABLE Learner_Progress (
	username VARCHAR(30),
	course_id VARCHAR(30),
	finished_percentage INTEGER,
	time DATETIME,
	grade INTEGER,
	PRIMARY KEY (username, course_id),
	FOREIGN KEY (username) REFERENCES User(username),
	FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Course_Update (
	course_id VARCHAR(30),
	time DATETIME,
	remark VARCHAR(100),
	PRIMARY KEY (course_id, time),
	FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE CourseComponent(
	course_comp_id VARCHAR(30) PRIMARY KEY,
	name VARCHAR(30),
	topic VARCHAR(30),
	difficutly_level VARCHAR(30),
	content TEXT,
	isExternalTool Boolean
);

CREATE TABLE Course_Structure (
	course_code VARCHAR(30),
	course_comp_id VARCHAR(30),
	index_number INTEGER,
	paywall_protected BOOLEAN,
	PRIMARY KEY (course_code, course_comp_id),
	FOREIGN KEY (course_code) REFERENCES CourseCode(course_code),
	FOREIGN KEY (course_comp_id) REFERENCES CourseComponent(course_comp_id)
);

CREATE TABLE LTI_Tool(
	lti_tool_id VARCHAR(30) PRIMARY KEY,
	tool_name VARCHAR(30),
	lti_username VARCHAR(30),
	lti_password VARCHAR(30),
	url VARCHAR(200)
);

CREATE TABLE LTI_Tool_Component (
	unique_id VARCHAR(30) PRIMARY KEY,
	window_width INTEGER,
	window_height INTEGER
);

INSERT INTO User 
VALUES 
    ("alex", "Alex", "alex@example.com", "123QWERTY", "Student"),
    ("bob", "Bob", "bob@example.com", "123ASDF", "Student"),
    ("cara", "Cara", "cara@example.com", "123YUIP", "Teacher"),
    ("marie", "Marie", "marie@example.com", "123QZCV", "Teacher"),
    ("john", "John", "john@example.com", "12XVXCX", "Student");
    
    

INSERT INTO CourseCode 
VALUES
    ("CS101", "Computer Science Foundation", "This is a simple course.", "cs101.jpeg"),
    ("CS201", "Automata Theory", "This is a simple course.", "cs201.jpeg"),
    ("CS301", "Complexity Theory", "This is a simple course.", "cs301.jpeg"),
    ("CS401","Model Checking", "This is a simple course.", "cs401.jpeg"),
    ("CS501", "Timed Automata", "This is a simple course.", "cs501.jpeg");
      
INSERT INTO Course 
VALUES 
    ("CS101_2021", "CS101", "01-08-2021", "30-12-2021"),
    ("CS201_2021", "CS201", "01-08-2021", "30-12-2021"),
    ("CS301_2021", "CS301", "01-08-2021", "30-12-2021"),
    ("CS401_2021", "CS401", "01-08-2021", "30-12-2021"),
    ("CS501_2021", "CS501", "01-08-2021", "30-12-2021");
    
INSERT INTO Login
VALUES
    ("alex", "29-03-2021", "201.196.108.1", 0),
    ("bob", "29-04-2021", "201.196.108.2", 1),
    ("cara", "29-05-2021", "201.196.108.3", 0),
    ("marie", "29-06-2021", "201.196.108.4", 1),
    ("john", "29-07-2021", "201.196.108.5", 0);
    
INSERT INTO ZipCode 
VALUES
    ("35618", "Courtland", "Lawrence"), 
    ("35650", "Moulton", "Lawrence"), 
    ("35672", "Town Creek", "Lawrence"), 
    ("35643", "Hillsboro", "Lawrence"), 
    ("35651", "Mount Hope", "Lawrence");
    
INSERT INTO Address
VALUES
    ("alex", 1, "100", "City Hall", 1, "989545343", "35618"),
    ("alex", 2, "101", "Hotel Plaza", 1,"2239545343",  "35618"),
    ("bob", 1, "298", "Mad House", 1,"9555545343",  "35643"),
    ("marie", 1, "210", "Rehab", 1, "444545343", "35650"),
    ("john", 1, "5942", "Motel Bottle","3439545343",  1, "35651");
    

INSERT INTO CourseComponent
VALUES 
    ("1", "Automata Definition","Automata", "1", "Automata is easy.", 0),
    ("2", "Product Automata","Automata", "1", "Product Automata is easy.", 0),
    ("3", "Timed Automata","Automata", "1", "Timed Automata is easy.", 0),
    ("4", "Cost Register Automata","Automata", "1", "Cost Register Automata is easy.", 0),
    ("5", "Tree Automata", "1","Automata", "Tree Automata is easy.", 0);
    
    
INSERT INTO Course_Structure
VALUES 
    ("CS101", "1", 1, 0),
    ("CS101", "2", 2, 0),
    ("CS101", "3", 3, 0),
    ("CS101", "4", 4, 0),
    ("CS101", "5", 5, 0);
    

INSERT INTO LTI_Tool 
VALUES
    ("1", "Quizzes", "hit", "me", "https://quizzeslti.com"),
    ("2", "Fill", "hit", "me", "https://fillslti.com"),
    ("3", "Matchings", "hit", "me", "https://matchingslti.com"),
    ("4", "Vocab", "hit", "me", "https://vocablti.com"),
    ("5", "MathTool", "hit", "me", "https://mathtoollti.com");

INSERT INTO LTI_Tool_Component 
VALUES
    ("1", "1920", "1024"),
    ("2", "1920", "1024"),
    ("3", "1920", "1024"),
    ("4", "1920", "1024"),
    ("5", "1920", "1024");
    
INSERT INTO Learner_Progress 
VALUES 
    ("alex", "CS101_2021", 95, "21-09-2021", 80),
    ("alex", "CS201_2021", 80, "21-09-2021", 60),
    ("alex", "CS301_2021", 85, "21-09-2021", 95),
    ("alex", "CS401_2021", 75, "21-09-2021", 67),
    ("alex", "CS501_2021", 99, "21-09-2021", 98);
    