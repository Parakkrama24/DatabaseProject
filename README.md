University Event Management Database Project
This repository contains the database schema and related files for our university group project on an event management company system. We utilized MySQL as our database management system for this project.

Schema Overview
Our database schema is designed to handle various aspects of event management, including but not limited to:

Events: Information about different events such as conferences, workshops, etc.
Attendees: Details of individuals attending the events.
Organizers: Information about the companies or individuals organizing the events.
Venues: Details about the venues where events are held.
Payments: Records of payments made for event tickets or services.
Employees: Information about the staff involved in organizing events.
Feedback: Feedback and reviews provided by attendees.
Files Included
schema.sql: SQL script containing the database schema.
sample_data.sql: SQL script with sample data to populate the database for testing purposes.
README.md: This file providing an overview of the project and instructions for setting up the database.
Setup Instructions
Clone the Repository:
bash
Copy code
git clone https://github.com/your-username/university-event-management-db.git
Import Schema:
Open your MySQL client (e.g., MySQL Workbench).
Execute the schema.sql script to create the database and tables:
bash
Copy code
source /path/to/schema.sql;
