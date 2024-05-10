<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>University Event Management Database Project</title>
</head>
<body>
  <h1>University Event Management Database Project</h1>
  <p>This repository contains the database schema and related files for our university group project on an event management company system. We utilized MySQL as our database management system for this project.</p>

  <h2>Schema Overview</h2>
  <p>Our database schema is designed to handle various aspects of event management, including but not limited to:</p>
  <ul>
    <li>Events: Information about different events such as conferences, workshops, etc.</li>
    <li>Attendees: Details of individuals attending the events.</li>
    <li>Organizers: Information about the companies or individuals organizing the events.</li>
    <li>Venues: Details about the venues where events are held.</li>
    <li>Payments: Records of payments made for event tickets or services.</li>
    <li>Employees: Information about the staff involved in organizing events.</li>
    <li>Feedback: Feedback and reviews provided by attendees.</li>
  </ul>

  <h2>Files Included</h2>
  <ul>
    <li><code>schema.sql</code>: SQL script containing the database schema.</li>
    <li><code>sample_data.sql</code>: SQL script with sample data to populate the database for testing purposes.</li>
    <li><code>README.md</code>: This file providing an overview of the project and instructions for setting up the database.</li>
  </ul>

  <h2>Setup Instructions</h2>
  <ol>
    <li>Clone the Repository:</li>
    <pre><code>git clone https://github.com/your-username/university-event-management-db.git</code></pre>
    <li>Import Schema:</li>
    <p>Open your MySQL client (e.g., MySQL Workbench). Execute the <code>schema.sql</code> script to create the database and tables:</p>
    <pre><code>source /path/to/schema.sql;</code></pre>
  </ol>
</body>
</html>
