# Sql-project

## 🎬 Movie Database System

### 📚 Course Project: Database Theory

### 📌 Project Overview

This project is a simplified implementation of an IMDb-style relational database system. The goal was to design, implement, and query a structured database containing movie-related information.

---

### 🗃️ Features

* 📽️ Movies with metadata (title, year, duration, description, etc.)
* 🎭 Actors and their roles
* 🎬 Directors and their filmography
* 🏷️ Movie genres
* 🏆 Awards associated with movies
* 👤 Users with reviews and votes
* 📝 User-generated reviews and ratings
* 👍 Voting system
* 🎞️ Movie trailers

---

### 🧩 Entity-Relationship Model

The database includes the following main entities:

* Movies
* Actors
* Directors
* Genres
* Users
* Reviews
* Votes
* Awards
* Trailers

It also includes several junction tables to support many-to-many relationships (e.g., Movie_Actors, Movie_Directors, etc.).

---

### 🛠️ Technologies Used

* PostgreSQL
* SQL (DDL & DML)
* pgAdmin (optional)

---

### 🧪 Sample Queries

Some example queries developed for this project:

* Get highest-rated movies
* List all actors in a specific movie
* Find movies by a specific director or genre
* Average rating of a particular movie
* Top-rated movies by votes
* All reviews for a movie

---

### 📁 Project Structure

* schema.sql – SQL script to create all database tables
* data.sql – Sample data for each table
* queries.sql – A collection of analytical SQL queries
* ER-diagram.png – Visual representation of the database design
* README.md – Project description

---

### ✅ Learning Outcomes

* Relational database design and normalization
* Writing and optimizing SQL queries
* Conceptual, logical, and physical data modeling
* Hands-on experience with PostgreSQL
* 
