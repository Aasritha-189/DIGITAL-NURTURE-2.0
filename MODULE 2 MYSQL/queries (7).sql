CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL
);

CREATE TABLE feedback (
    id INT PRIMARY KEY,
    user_id INT,
    event_id INT,
    rating INT,
    comments TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);
INSERT INTO users (id, username)
VALUES 
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Bob Johnson');

INSERT INTO events (id, event_name)
VALUES 
(1, 'Event A'),
(2, 'Event B'),
(3, 'Event C');

INSERT INTO feedback (id, user_id, event_id, rating, comments)
VALUES 
(1, 1, 1, 2, 'Not impressed'),
(2, 2, 2, 4, 'Good event'),
(3, 3, 1, 1, 'Very disappointing'),
(4, 1, 3, 5, 'Excellent'),
(5, 2, 1, 2, 'Could be better');
SELECT 
    u.username AS User,
    f.rating AS Rating,
    f.comments AS Comments,
    e.event_name AS Event
FROM 
    feedback f
JOIN 
    users u ON f.user_id = u.id
JOIN 
    events e ON f.event_id = e.id
WHERE 
    f.rating < 3;