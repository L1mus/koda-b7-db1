
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

INSERT INTO USERS (username,email,age) VALUES('hanif','hanif@mail.com',29),('naufal','naufal@mail.com',19),('rivando','rivando@mail.com',26),('ilham','ilham@mail.com',26),('angga','angga@mail.com',28),('dwiki','dwiki@mail.com',24),('rafi','rafi@mail.com',29),('akmal','akmal@mail.com',25),('aqil','aqil@mail.com',22),('ali','ali@mail.com',27);

INSERT INTO CATEGORIES(category_name) VALUES('Romance'),('Fantasy'),('Romance'),('Science Fiction'),('Mystery'),('Crime'),('Thriller'),('Suspense'),('Historical'),('Horror'),('Adult'),('Mindset');

INSERT INTO BOOKSHELF(bookshelf_number) VALUES (1),(2);

INSERT INTO BOOKS (book_name,author,publisher,category_id,bookshelf_id,pages) VALUES ('Think And Grow Rich','Napoleon Hill','Gramedia Pustaka Utama',12,2,320),('Gaga dan Permen Cokelat
','Arnoldus Yansen Sabu Paji','KEMENDIKBUD',2,2,1),('NATIONAL GEOGRAPHIC
','Utomo Priyambodo','Gridnetwork',2,3,84),('Majalah Kiko
','Majalah Kiko','PT. HighEnd Multimedia Indonesia',5,2,52),('Seijo No Kyusa
','Keigo Higashino','Gramedia Pustaka Utama',5,2,2),('The Prophet; Kisah Hikmah 25 Nabi Allah
','Dian Noviyanti','Gramedia Pustaka Utama',9,1,340),('The Outcast
','Okky Madasari','Gramedia Pustaka Utama',7,1,266),('The Impossible Possible: Pembelajaran Tan Kwang Hwa merintis pabrik kertas tisue Tessa menjadi pengusaha kelas dunia
','Dyah Hasto Palupi','Gramedia Pustaka Utama',9,1,170)
,('The Immortal Heart
','Serdar Ozkan','Gramedia Pustaka Utama',8,1,316),('Antara Api dan Ordonansi Validasi yang Tergadai
','Aksara Sunyi','PENAMUDA MEDIA',10,1,194);


INSERT INTO LIBRARIAN(name,address) VALUES('John','Bogor'),('Eren','Bandung')

INSERT INTO BOOKLENDING(book_id,librarian_id,user_id,borrowing_at,load_expired_at) VALUES(1,1,1,2026-05-05 20:53:00,2026-05-08 20:53:00),(2,1,1,2026-05-05 20:53:00,2026-05-08 20:53:00),(5,1,1,2026-05-05 20:53:00,2026-05-08 20:53:00);