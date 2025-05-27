CREATE TABLE sessions (
    session_id SERIAL PRIMARY KEY,
    event_name VARCHAR(100),
    session_start_time TIMESTAMP
);
INSERT INTO sessions (event_name, session_start_time) VALUES
('Event A', '2025-05-27 10:15:00'),
('Event A', '2025-05-27 09:45:00'),
('Event B', '2025-05-27 11:30:00'),
('Event B', '2025-05-27 12:05:00'),
('Event C', '2025-05-27 10:00:00'),
('Event C', '2025-05-27 14:00:00');
SELECT 
    event_name, 
    COUNT(*) AS peak_session_count
FROM 
    sessions
WHERE 
    EXTRACT(HOUR FROM session_start_time) BETWEEN 10 AND 11
GROUP BY 
    event_name;
