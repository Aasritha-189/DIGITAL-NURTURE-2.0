CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL
);

CREATE TABLE sessions (
    id INT PRIMARY KEY,
    event_id INT,
    session_name VARCHAR(255) NOT NULL,
    session_time TIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(id)
);
INSERT INTO events (id, event_name, event_date)
VALUES 
(1, 'Event A', '2024-09-20'),
(2, 'Event B', '2024-09-25'),
(3, 'Event C', '2024-09-15');

INSERT INTO sessions (id, event_id, session_name, session_time)
VALUES 
(1, 1, 'Session 1', '10:00:00'),
(2, 1, 'Session 2', '12:00:00'),
(3, 2, 'Session 3', '14:00:00'),
(4, 3, 'Session 4', '10:00:00'),
(5, 3, 'Session 5', '11:00:00'),
(6, 3, 'Session 6', '12:00:00');
SELECT 
    e.event_name AS Event,
    COUNT(s.id) AS SessionCount
FROM 
    events e
LEFT JOIN 
    sessions s ON e.id = s.event_id
WHERE 
    e.event_date >= '2024-05-27'  -- Replace with the current date or a date that matches your data
GROUP BY 
    e.id, e.event_name
ORDER BY 
    e.event_date;