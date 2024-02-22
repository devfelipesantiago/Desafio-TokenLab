USE calendario;
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL
);
CREATE TABLE events (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  description TEXT,
  start_time DATETIME,
  end_time DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE invitations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  invited_user_id INT,
  status ENUM('pending', 'accepted', 'declined') DEFAULT 'pending',
  FOREIGN KEY (event_id) REFERENCES events(id),
  FOREIGN KEY (invited_user_id) REFERENCES users(id)
);