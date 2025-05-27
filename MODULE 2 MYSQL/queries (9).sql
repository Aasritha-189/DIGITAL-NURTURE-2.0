CREATE TABLE organizers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE events (
    id INT PRIMARY KEY,
    organizer_id INT,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL CHECK(status IN ('upcoming', 'completed', 'cancelled')),
    FOREIGN KEY (organizer_id) REFERENCES organizers(id)
);
INSERT INTO organizers (id, name)
VALUES 
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Bob Johnson');

INSERT INTO events (id, organizer_id, event_name, event_date, status)
VALUES 
(1, 1, 'Event A', '2024-09-20', 'upcoming'),
(2, 1, 'Event B', '2024-05-20', 'completed'),
(3, 2, 'Event C', '2024-10-15', 'upcoming'),
(4, 3, 'Event D', '2024-05-10', 'cancelled'),
(5, 1, 'Event E', '2024-11-01', 'upcoming'),
(6, 2, 'Event F', '2024-06-01', 'completed');
SELECT 
    o.name AS Organizer,
    COUNT(e.id) AS TotalEvents,
    SUM(CASE WHEN e.status = 'upcoming' THEN 1 ELSE 0 END) AS UpcomingEvents,
    SUM(CASE WHEN e.status = 'completed' THEN 1 ELSE 0 END) AS CompletedEvents,
    SUM(CASE WHEN e.status = 'cancelled' THEN 1 ELSE 0 END) AS CancelledEvents
FROM 
    organizers o
LEFT JOIN 
    events e ON o.id = e.organizer_id
GROUP BY 
    o.id, o.name
ORDER BY 
    o.name;