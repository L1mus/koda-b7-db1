CREATE TABLE USERS (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    age INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

ALTER TABLE USERS
ADD COLUMN img_url VARCHAR(255)

ALTER TABLE USERS
ALTER COLUMN img_url SET DEFAULT 'default-img.png'

CREATE TABLE POSTS(
    id UUID DEFAULT gen_random_uuid(),
    title VARCHAR(100) NOT NULL,
    content TEXT,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    PRIMARY KEY (id),
    Foreign Key (user_ id) REFERENCES USERS(id)
);

CREATE DATABASE minitask4;
SELECT current_database();

CREATE TABLE Directors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE Genres (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Movies (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date TIMESTAMP NOT NULL,
    rating FLOAT(24),
    director_id INT NOT NULL,
    genre_id INT NOT NULL,

    FOREIGN KEY (director_id) REFERENCES Directors(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

CREATE TABLE Actors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255)
);

CREATE TABLE Movies_Actors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    role VARCHAR(100) NOT NULL,

    FOREIGN KEY (movie_id) REFERENCES Movies(id),
    FOREIGN KEY (actor_id) REFERENCES Actors(id)
);

INSERT INTO Directors (first_name, last_name)
VALUES
    ('Christopher', 'Nolan'),
    ('Greta', 'Gerwig'),
    ('Quentin', 'Tarantino'),
    ('Bong', 'Joon-ho'),
    ('Niki', 'Caro');

INSERT INTO Genres (name)
VALUES
    ('Sci-Fi'),
    ('Drama'),
    ('Action'),
    ('Comedy'),
    ('Thriller');

INSERT INTO Movies (title, release_date, rating, director_id, genre_id)
VALUES
    ('Inception', '2010-07-16 00:00:00', 8.8, 1, 1),
    ('Interstellar', '2014-11-07 00:00:00', 8.7, 1, 1),
    ('Lady Bird', '2017-11-03 00:00:00', 7.4, 2, 2),
    ('Parasite', '2019-05-30 00:00:00', 8.5, 4, 5),
    ('Mulan', '2020-09-04 00:00:00', 5.8, 5, 3);

INSERT INTO Actors (first_name, last_name)
VALUES
    ('Leonardo', 'DiCaprio'),
    ('Cillian', 'Murphy'),
    ('Saoirse', 'Ronan'),
    ('Song', 'Kang-ho'),
    ('Anne', 'Hathaway'),
    ('Mayes', 'Hathaway');

INSERT INTO Movies_Actors (movie_id, actor_id, role)
VALUES
    (1, 1, 'Cobb'),
    (1, 2, 'Robert Fischer'),
    (2, 5, 'Brand'),
    (3, 3, 'Christine McPherson'),
    (4, 4, 'Kim Ki-taek');