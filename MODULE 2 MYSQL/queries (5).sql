CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100)
);
INSERT INTO users (name, email, city) VALUES
('Alice Smith', 'alice@example.com', 'New York'),
('Bob Johnson', 'bob@example.com', 'Los Angeles'),
('Charlie Davis', 'charlie@example.com', 'New York'),
('Diana Evans', 'diana@example.com', 'Chicago'),
('Eve Miller', 'eve@example.com', 'New York'),
('Frank Harris', 'frank@example.com', 'Los Angeles'),
('Grace Lee', 'grace@example.com', 'San Francisco'),
('Henry Walker', 'henry@example.com', 'Chicago'),
('Irene Scott', 'irene@example.com', 'New York'),
('Jack Brown', 'jack@example.com', 'Boston'),
('Kara Adams', 'kara@example.com', 'Boston'),
('Leo Thomas', 'leo@example.com', 'New York'),
('Mona Lewis', 'mona@example.com', 'Los Angeles'),
('Nina Hall', 'nina@example.com', 'Chicago');
SELECT 
    city, 
    COUNT(DISTINCT user_id) AS total_users
FROM 
    users
GROUP BY 
    city
ORDER BY 
    total_users DESC
LIMIT 5;
