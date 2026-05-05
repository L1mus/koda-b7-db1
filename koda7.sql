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
    Foreign Key (user_id) REFERENCES USERS(id)
);
