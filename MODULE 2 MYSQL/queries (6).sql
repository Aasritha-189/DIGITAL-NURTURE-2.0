CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(100)
);
CREATE TABLE resources (
    resource_id SERIAL PRIMARY KEY,
    event_id INTEGER REFERENCES events(event_id),
    resource_type VARCHAR(50),  -- e.g., 'pdf', 'image', 'link'
    resource_url TEXT
);
INSERT INTO events (event_name) VALUES
('Tech Summit 2025'),
('Marketing Expo'),
('Healthcare Forum'),
('Education Conference');
INSERT INTO resources (event_id, resource_type, resource_url) VALUES
(1, 'pdf', 'https://example.com/tech-agenda.pdf'),
(1, 'image', 'https://example.com/tech-banner.jpg'),
(1, 'link', 'https://techsummit2025.com'),
(2, 'pdf', 'https://example.com/marketing-plan.pdf'),
(2, 'link', 'https://marketingexpo.com'),
(3, 'image', 'https://example.com/healthcare-logo.png'),
(3, 'pdf', 'https://example.com/healthcare-schedule.pdf'),
(3, 'pdf', 'https://example.com/healthcare-report.pdf'),
(4, 'link', 'https://educonf2025.com'),
(4, 'image', 'https://example.com/edu-banner.png');
SELECT 
    e.event_name,
    COUNT(CASE WHEN r.resource_type = 'pdf' THEN 1 END) AS pdf_count,
    COUNT(CASE WHEN r.resource_type = 'image' THEN 1 END) AS image_count,
    COUNT(CASE WHEN r.resource_type = 'link' THEN 1 END) AS link_count
FROM 
    events e
LEFT JOIN 
    resources r ON e.event_id = r.event_id
GROUP BY 
    e.event_name
ORDER BY 
    e.event_name;
