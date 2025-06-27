-- OLD AGE HOME MEDS
DROP DATABASE IF EXISTS old_age_home_meds;
CREATE DATABASE old_age_home_meds;
USE old_age_home_meds;

-- Caregivers table
CREATE TABLE Caregivers (
    caregiver_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Residents (elderly users)
CREATE TABLE Residents (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    caregiver_id INT,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (caregiver_id) REFERENCES Caregivers(caregiver_id)
);

-- Medicines prescribed to residents
CREATE TABLE Medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50),
    frequency_per_day INT,
    start_date DATE,
    end_date DATE,
    stock_quantity INT,
    FOREIGN KEY (user_id) REFERENCES Residents(user_id)
);

-- Reminders for each medicine
CREATE TABLE Reminders (
    reminder_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    reminder_time TIME,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

-- Log of medicine intake
CREATE TABLE MedicineLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    intake_time DATETIME,
    feedback VARCHAR(255), -- optional comments or symptoms
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

-- Sample Caregivers
INSERT INTO Caregivers (name, email) VALUES
('Vishnu NV', 'vishnu.care@home.org'),
('Millan Mayuri Patra', 'millan.mayuri@home.org');

-- Sample Residents (elderly people)
INSERT INTO Residents (caregiver_id, name, age, gender, email) VALUES
(1, 'Priya Takher', 74, 'Female', 'priya.takher@example.com'),
(1, 'Pooja Panchal', 79, 'Female', 'pooja.panchal@example.com'),
(2, 'Pinkey Basat', 81, 'Female', 'pinkey.basat@example.com'),
(2, 'Aditya Raj Yadav', 76, 'Male', 'aditya.yadav@example.com');

-- Sample Medicines
INSERT INTO Medicines (user_id, name, dosage, frequency_per_day, start_date, end_date, stock_quantity) VALUES
(1, 'Paracetamol', '500mg', 3, '2025-06-25', '2025-07-05', 18),
(1, 'Amlodipine', '5mg', 1, '2025-06-20', '2025-07-20', 25),
(2, 'Metformin', '500mg', 2, '2025-06-22', '2025-07-22', 15),
(3, 'Ibuprofen', '200mg', 1, '2025-06-20', '2025-06-30', 7),
(4, 'Losartan', '50mg', 1, '2025-06-26', '2025-07-26', 20);

-- Sample Reminders
INSERT INTO Reminders (medicine_id, reminder_time) VALUES
(1, '09:00:00'), (1, '14:00:00'), (1, '20:00:00'),
(2, '10:00:00'),
(3, '08:00:00'), (3, '20:00:00'),
(4, '18:00:00'),
(5, '09:30:00');

-- Sample Logs
INSERT INTO MedicineLog (medicine_id, intake_time, feedback) VALUES
(1, '2025-06-26 09:00:00', 'No issues'),
(1, '2025-06-26 14:05:00', 'Mild headache'),
(2, '2025-06-26 10:00:00', 'Stable'),
(3, '2025-06-26 08:00:00', 'Skipped breakfast'),
(5, '2025-06-26 09:30:00', 'Feeling dizzy');

-- List medicines and their reminders for each resident
SELECT r.name AS resident, m.name AS medicine, re.reminder_time
FROM Residents r
JOIN Medicines m ON r.user_id = m.user_id
JOIN Reminders re ON m.medicine_id = re.medicine_id
ORDER BY r.name, m.name, re.reminder_time;

-- Check remaining stock for all medicines
SELECT r.name AS resident, m.name AS medicine, m.stock_quantity
FROM Residents r
JOIN Medicines m ON r.user_id = m.user_id;

-- Logs per day for audit
SELECT m.name AS medicine, l.intake_time, l.feedback
FROM MedicineLog l
JOIN Medicines m ON l.medicine_id = m.medicine_id
ORDER BY l.intake_time DESC;

