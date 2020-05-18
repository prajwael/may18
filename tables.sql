CREATE TABLE MEMBERS (
    ssn char(9) NOT NULL,
    card_no int NOT NULL,
    name varchar(50) NOT NULL,
    phone char(10),
    campus_address varchar(100),
    home_address varchar(100),
    member_type varchar(40) NOT NULL,
    PRIMARY KEY(card_no),
    UNIQUE(ssn)
);
CREATE TABLE CARD_ISSUED (
    card_no int NOT NULL,
    name varchar(50),
    expiry_date DATE ,
    FOREIGN KEY(card_no) REFERENCES MEMBERS(card_no)
);

CREATE TABLE BOOK(
    book_id int UNIQUE,
    author varchar(200),
    title varchar(200),
    publisher varchar(50),
    PRIMARY KEY(book_id)
);

CREATE TABLE BORROW(
    card_no int NOT NULL,
    book_id int NOT NULL,
    loaned_out_date DATE,
    due_date DATE,
    FOREIGN KEY(book_id)REFERENCES BOOK(book_id),
    FOREIGN KEY(card_no) REFERENCES MEMBERS(card_no)
);
CREATE TABLE STAFF(
    ssn char(9) NOT NULL,
    book_id_issued int,
    name varchar(50),
    staff_type varchar(60),
    PRIMARY KEY(ssn),
    FOREIGN KEY(book_id_issued)REFERENCES BOOK(book_id)
);

CREATE TABLE BOOK_CATALOG(
    isbn int NOT NULL,
    available_copies int NOT NULL,
    rented_copies int NOT NULL,
    description varchar(255),
    subject_area varchar(50),
    PRIMARY KEY(isbn)
);

CREATE TABLE BOOK_INFO(
    isbn int NOT NULL,
    book_id int NOT NULL,
    FOREIGN KEY(isbn)REFERENCES BOOK_CATALOG(isbn),
    FOREIGN KEY(book_id)REFERENCES BOOK(book_id)
);

ALTER TABLE `BORROW` ADD FOREIGN KEY(`book_id`) REFERENCES `BOOK`(`book_id`);
ALTER TABLE `BOOK_INFO` ADD FOREIGN KEY(`isbn`) REFERENCES `BOOK_CATALOG`(`isbn`);
ALTER TABLE `STAFF` ADD FOREIGN KEY(`book_id_issued`) REFERENCES `BOOK`(`book_id`);

CREATE TABLE OVERDUE(
    ssn char(9) NOT NULL,
    card_no int NOT NULL,
    name varchar(50) NOT NULL,
    email varchar(50),
    phone char(10),
    campus_address varchar(100),
    home_address varchar(100),
    member_type varchar(40) NOT NULL,

    book_id int,
    loaned_out_date DATE,
    due_date DATE
);

CREATE TABLE RENEWAL(
    ssn char(9) NOT NULL,
    card_no int NOT NULL,
    name varchar(50) NOT NULL,
    email varchar(50),
    phone char(10),
    campus_address varchar(100),
    home_address varchar(100),
    member_type varchar(40) NOT NULL,

    expiry_date DATE
);