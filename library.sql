
CREATE TABLE USERS (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

CREATE TABLE CATEGORIES (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE BOOKS (
    id SERIAL PRIMARY KEY,
    book_name VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
    category_id INT,
    bookshelf_id INT,
    pages INT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(id)
    FOREIGN KEY (bookshelf_id) REFERENCES BOOKSHELF(id)
);

CREATE TABLE BOOKSHELF (
    id SERIAL PRIMARY KEY,
    bookshelf_number INT
);

CREATE TABLE LIBRARIAN (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    address VARCHAR(60)
);

CREATE TABLE BOOKLENDING (
    id SERIAL PRIMARY KEY,
    book_id INT,
    librarian_id INT,
    user_id int,
    borrowing_at TIMESTAMP,
    loan_expired_at TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES BOOKS(id),
    FOREIGN KEY (librarian_id) REFERENCES LIBRARIAN(id),
    FOREIGN KEY (user_id) REFERENCES USERS(id)
)

INSERT INTO USERS (username,email,age) VALUES('hanif','misterhanif@mail.com',29),('naufal','naufal@mail.com',19),('rivando','rivando@mail.com',26),('ilham','ilham@mail.com',26),('angga','angga@mail.com',28),('dwiki','dwiki@mail.com',24),('rafi','rafi@mail.com',29),('akmal','akmal@mail.com',25),('aqil','aqil@mail.com',22),('ali','ali@mail.com',27);

INSERT INTO CATEGORIES(category_name) VALUES('Romance'),('Fantasy'),('Science Fiction'),('Mystery'),('Crime'),('Thriller'),('Suspense'),('Historical'),('Horror'),('Adult'),('Mindset');

INSERT INTO BOOKSHELF(bookshelf_number) VALUES (1),(2);

INSERT INTO BOOKS (book_name,author,publisher,category_id,bookshelf_id,pages) VALUES ('Think And Grow Rich','Napoleon Hill','Gramedia Pustaka Utama',12,2,320),('Gaga dan Permen Cokelat
','Arnoldus Yansen Sabu Paji','KEMENDIKBUD',6,2,1),('NATIONAL GEOGRAPHIC
','Utomo Priyambodo','Gridnetwork',9,3,84),('Majalah Kiko
','Majalah Kiko','PT. HighEnd Multimedia Indonesia',5,2,52),('Seijo No Kyusa
','Keigo Higashino','Gramedia Pustaka Utama',5,2,2),('The Prophet; Kisah Hikmah 25 Nabi Allah
','Dian Noviyanti','Gramedia Pustaka Utama',9,1,340),('The Outcast
','Okky Madasari','Gramedia Pustaka Utama',7,1,266),('The Impossible Possible
','Dyah Hasto Palupi','Gramedia Pustaka Utama',9,1,170)
,('The Immortal Heart
','Serdar Ozkan','Gramedia Pustaka Utama',8,1,316),('Antara Api dan Ordonansi Validasi yang Tergadai
','Aksara Sunyi','PENAMUDA MEDIA',10,1,194);


INSERT INTO LIBRARIAN(name,address) VALUES('John','Bogor'),('Eren','Bandung')

INSERT INTO BOOKLENDING(book_id,librarian_id,user_id,borrowing_at,load_expired_at) VALUES(1,1,1,2026-05-05 20:53:00,2026-05-08 20:53:00);

SELECT * FROM BOOKLENDING


create table products (
    product_id serial not null,
    product_name varchar(70),
    price INT
)

insert into  products (product_name,price)
values
('Laptop',1000),
('Mouse',50),
('Keyboard',200);

SELECT * FROM products



select product_name as product ,price as price
from products
where price = (
select MAX(price)
from products
)

insert into  products (product_name,price)
values
('Console Gaming',1000);

insert into  products (product_name,price)
values
('VGA 5060 16GB',1000);


select AVG(price) as Rerata 
FROM products

select product_name as product ,price, rerata
from products a , (
select AVG(price) as Rerata
FROM products
) rerata
where price > rerata

create table transactions (
    transaction_id serial not null,
    customer_id int
    amount int
);

alter table transactions
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES users(id)

select * from users
select * from transactions

INSERT INTO transactions(customer_id,amount)
VALUES
(1,500),
(1,300),
(1,150);

INSERT INTO transactions(customer_id,amount)
VALUES
(2,500),
(2,300),
(3,300),
(3,100),
(4,300),
(4,150);


SELECT customer_id , AVG(amount) as rerata
FROM transactions
GROUP BY customer_id



SELECT customer_id , amount ,
from transactions ,(
SELECT customer_id , AVG(amount) as rerata
FROM transactions
GROUP BY customer_id)

