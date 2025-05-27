-- Users table
CREATE TABLE Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  city VARCHAR(100) NOT NULL,
  registration_date DATE NOT NULL
);

-- Events table
CREATE TABLE Events (
  event_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  description TEXT,
  city VARCHAR(100) NOT NULL,
  start_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  status ENUM('upcoming', 'completed', 'cancelled') NOT NULL,
  organizer_id INT,
  FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

-- Feedback table
CREATE TABLE Feedback (
  feedback_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  event_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comments TEXT,
  feedback_date DATE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
-- Insert Users
INSERT INTO Users (user_id, full_name, email, city, registration_date) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'New York', '2024-12-01'),
(2, 'Bob Smith', 'bob@example.com', 'Los Angeles', '2024-12-05'),
(3, 'Charlie Lee', 'charlie@example.com', 'Chicago', '2024-12-10');

-- Insert Events
INSERT INTO Events (event_id, title, description, city, start_date, end_date, status, organizer_id) VALUES
(1, 'Tech Innovators Meetup', 'A meetup for tech enthusiasts.', 'New York', '2025-06-10 10:00:00', '2025-06-10 16:00:00', 'upcoming', 1),
(2, 'AI & ML Conference', 'Conference on AI and ML advancements.', 'Chicago', '2025-05-15 09:00:00', '2025-05-15 17:00:00', 'completed', 3);

-- Insert enough Feedback to have at least 10 for one event
INSERT INTO Feedback (user_id, event_id, rating, comments, feedback_date) VALUES
(1, 1, 5, 'Excellent!', '2025-05-01'),
(2, 1, 4, 'Good!', '2025-05-02'),
(3, 1, 5, 'Awesome!', '2025-05-03'),
(1, 1, 4, 'Nice work.', '2025-05-04'),
(2, 1, 5, 'Fantastic.', '2025-05-05'),
(3, 1, 4, 'Great insights.', '2025-05-06'),
(1, 1, 5, 'Loved it.', '2025-05-07'),
(2, 1, 4, 'Superb.', '2025-05-08'),
(3, 1, 5, 'Very informative.', '2025-05-09'),
(1, 1, 5, 'Highly recommend.', '2025-05-10'),
(2, 2, 4, 'Interesting.', '2025-05-11'),
(3, 2, 5, 'Loved it!', '2025-05-12');
SELECT e.title AS event_title,
       AVG(f.rating) AS average_rating,
       COUNT(f.feedback_id) AS feedback_count
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id
HAVING feedback_count >= 10
ORDER BY average_rating DESC;
