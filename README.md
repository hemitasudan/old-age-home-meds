# Old Age Home Medicine Management System (SQL Project)

This project models a complete medicine management system tailored for old age homes or assisted living centers. It focuses on maintaining structured data for caregivers, residents, their prescribed medicines, reminders for dosage timings, and logs of medicine intake with optional feedback.

The system was designed to reflect real-world use cases such as caregiver-patient assignments, stock tracking, daily medicine schedules, and intake logging. All data relationships are handled using foreign keys to maintain data integrity.

---

## Key Features

- Assign multiple residents to a caregiver
- Track prescribed medicines including dosage, frequency, stock, and duration
- Set multiple reminder times for each medicine per day
- Record daily intake logs along with optional health feedback

---

## Database Design

**Caregivers**  
Stores information about registered caregivers  
`(caregiver_id, name, email)`

**Residents**  
Stores details of elderly residents, each assigned to a caregiver  
`(user_id, caregiver_id, name, age, gender, email)`

**Medicines**  
Tracks medicines prescribed to residents, along with schedule and stock  
`(medicine_id, user_id, name, dosage, frequency_per_day, start_date, end_date, stock_quantity)`

**Reminders**  
Stores daily reminder times for each medicine  
`(reminder_id, medicine_id, reminder_time)`

**MedicineLog**  
Logs when a medicine was taken and any related feedback  
`(log_id, medicine_id, intake_time, feedback)`

---

## Sample Scenario

- A caregiver named Vishnu NV is responsible for residents like Priya Takher (age 74) and Pooja Panchal (age 79).
- Priya is prescribed Paracetamol (500mg) three times daily from June 25 to July 5.
- Her reminders are set for 09:00, 14:00, and 20:00.
- Each dose taken is logged along with optional feedback such as “No issues” or “Mild headache.”

---

## Files

- `schema.sql` – Full schema and sample insert statements to set up and test the database

---

## Future Enhancements

- Frontend interface for caregivers using HTML/JavaScript
- Alerts for low stock or missed doses
- Daily/weekly summary dashboard for intake compliance

---

This project was built to strengthen my understanding of relational database design and simulate a meaningful use case in the healthcare domain. It reflects an approach to solving real operational challenges using structured SQL systems.
