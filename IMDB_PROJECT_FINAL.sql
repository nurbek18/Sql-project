
-- Task 2: Create Tables
CREATE TABLE Movies (
    Movie_ID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Release_year INT,
    Duration INT,
    Description TEXT
);

CREATE TABLE Directors (
    Director_ID SERIAL PRIMARY KEY,
    Director_name VARCHAR(255) NOT NULL,
    Birth_year INT
);

CREATE TABLE Movie_Directors (
    Movie_ID INT REFERENCES Movies(Movie_ID),
    Director_ID INT REFERENCES Directors(Director_ID),
    PRIMARY KEY (Movie_ID, Director_ID)
);

CREATE TABLE Genres (
    Genre_ID SERIAL PRIMARY KEY,
    Genre_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Movie_Genres (
    Movie_ID INT REFERENCES Movies(Movie_ID),
    Genre_ID INT REFERENCES Genres(Genre_ID),
    PRIMARY KEY (Movie_ID, Genre_ID)
);

CREATE TABLE Actors (
    Actor_ID SERIAL PRIMARY KEY,
    Actor_Name VARCHAR(255) NOT NULL,
    Birth_date DATE
);

CREATE TABLE Movie_Actors (
    Movie_ID INT REFERENCES Movies(Movie_ID),
    Actor_ID INT REFERENCES Actors(Actor_ID),
    PRIMARY KEY (Movie_ID, Actor_ID)
);

CREATE TABLE Users (
    User_ID SERIAL PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Registration_date DATE
);

CREATE TABLE Reviews (
    Review_ID SERIAL PRIMARY KEY,
    Movie_ID INT REFERENCES Movies(Movie_ID),
    User_ID INT REFERENCES Users(User_ID),
    Rating INT CHECK (Rating BETWEEN 1 AND 10),
    Review_date DATE
);

CREATE TABLE Votes (
    Vote_ID SERIAL PRIMARY KEY,
    Movie_ID INT REFERENCES Movies(Movie_ID),
    User_ID INT REFERENCES Users(User_ID),
    Rating_Value INT CHECK (Rating_Value BETWEEN 1 AND 10)
);

CREATE TABLE Trailers (
    Trailer_ID SERIAL PRIMARY KEY,
    Movie_ID INT REFERENCES Movies(Movie_ID),
    URL VARCHAR(500),
    Release_Date DATE
);

CREATE TABLE Awards (
    Award_ID SERIAL PRIMARY KEY,
    Award_Name VARCHAR(255) NOT NULL,
    Year INT
);

CREATE TABLE Movie_Awards (
    Movie_ID INT REFERENCES Movies(Movie_ID),
    Award_ID INT REFERENCES Awards(Award_ID),
    Category VARCHAR(255),
    PRIMARY KEY (Movie_ID, Award_ID)
);



-- Task 3: Insert Sample Data
INSERT INTO Movies (Title, Release_year, Duration, Description) VALUES
('The Shawshank Redemption', 1994, 142, 'Two imprisoned men bond over a number of years...'),
('The Godfather', 1972, 175, 'The aging patriarch of an organized crime dynasty...'),
('The Dark Knight', 2008, 152, 'When the menace known as the Joker wreaks havoc...'),
('Pulp Fiction', 1994, 154, 'The lives of two mob hitmen, a boxer, and others...'),
('Fight Club', 1999, 139, 'An insomniac office worker and a soap maker...'),
('Forrest Gump', 1994, 142, 'The presidencies of Kennedy and Johnson...'),
('Inception', 2010, 148, 'A thief who steals corporate secrets through dream-sharing...'),
('The Matrix', 1999, 136, 'A hacker discovers the reality is a simulation...'),
('The Lord of the Rings: The Fellowship of the Ring', 2001, 178, 'A meek Hobbit sets out to destroy a powerful ring...'),
('Interstellar', 2014, 169, 'A team travels through a wormhole in space...'),
('Gladiator', 2000, 155, 'A former Roman general seeks revenge...'),
('Titanic', 1997, 195, 'A seventeen-year-old aristocrat falls in love...'),
('Avengers: Endgame', 2019, 181, 'After the devastating events of Infinity War...'),
('The Silence of the Lambs', 1991, 118, 'A young FBI cadet must confide in a manipulative killer...'),
('Schindler''s List', 1993, 195, 'In German-occupied Poland during WWII...');



INSERT INTO Directors (Director_name, Birth_year) VALUES
('Frank Darabont', 1959),
('Francis Ford Coppola', 1939),
('Christopher Nolan', 1970),
('Quentin Tarantino', 1963),
('David Fincher', 1962),
('Robert Zemeckis', 1952),
('Lana Wachowski', 1965),
('Peter Jackson', 1961),
('Ridley Scott', 1937),
('James Cameron', 1954),
('Anthony Russo', 1970),
('Joe Russo', 1971),
('Jonathan Demme', 1944),
('Steven Spielberg', 1946),
('Denis Villeneuve', 1967);


INSERT INTO Movie_Directors (Movie_ID, Director_ID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 3), (8, 7), (9, 8), (10, 3),
(11, 9), (12, 10), (13, 11), (13, 12),
(14, 13);


INSERT INTO Genres (Genre_Name) VALUES
('Drama'), ('Crime'), ('Action'), ('Thriller'),
('Adventure'), ('Romance'), ('Sci-Fi'), ('Fantasy'),
('Biography'), ('History'), ('Mystery'), ('War'),
('Comedy'), ('Horror'), ('Animation');


INSERT INTO Movie_Genres (Movie_ID, Genre_ID) VALUES
(1, 1), (2, 1), (2, 2), (3, 3), (3, 4),
(4, 2), (4, 1), (5, 1), (5, 4), (6, 1),
(7, 3), (7, 7), (8, 7), (9, 5), (9, 8);


INSERT INTO Actors (Actor_Name, Birth_date) VALUES
('Tim Robbins', '1958-10-16'),
('Morgan Freeman', '1937-06-01'),
('Marlon Brando', '1924-04-03'),
('Al Pacino', '1940-04-25'),
('Christian Bale', '1974-01-30'),
('Heath Ledger', '1979-04-04'),
('John Travolta', '1954-02-18'),
('Samuel L. Jackson', '1948-12-21'),
('Brad Pitt', '1963-12-18'),
('Edward Norton', '1969-08-18'),
('Tom Hanks', '1956-07-09'),
('Keanu Reeves', '1964-09-02'),
('Elijah Wood', '1981-01-28'),
('Leonardo DiCaprio', '1974-11-11'),
('Russell Crowe', '1964-04-07');



INSERT INTO Movie_Actors (Movie_ID, Actor_ID) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
(3, 6), (4, 7), (4, 8), (5, 9), (5, 10),
(6, 11), (8, 12), (9, 13), (10, 14), (11, 15);


INSERT INTO Users (Username, Email, Registration_date) VALUES
('user1', 'akmal@example.com', '2023-01-01'),
('user2', 'nurbek@example.com', '2023-01-05'),
('user3', 'alkar@example.com', '2023-02-15'),
('user4', 'arman@example.com', '2023-03-10'),
('user5', 'almat@example.com', '2023-03-22'),
('user6', 'user6@example.com', '2023-04-01'),
('user7', 'user7@example.com', '2023-04-15'),
('user8', 'user8@example.com', '2023-04-30'),
('user9', 'user9@example.com', '2023-05-12'),
('user10', 'user10@example.com', '2023-05-25'),
('user11', 'user11@example.com', '2023-06-01'),
('user12', 'user12@example.com', '2023-06-10'),
('user13', 'user13@example.com', '2023-06-18'),
('user14', 'user14@example.com', '2023-07-01'),
('user15', 'user15@example.com', '2023-07-10');

INSERT INTO Reviews (Movie_ID, User_ID, Rating, Review_date) VALUES
(1,1,10,'2023-06-01'), (2,2,9,'2023-06-02'), (3,3,8,'2023-06-03'),
(4,4,9,'2023-06-04'), (5,5,10,'2023-06-05'), (6,6,8,'2023-06-06'),
(7,7,9,'2023-06-07'), (8,8,8,'2023-06-08'), (9,9,10,'2023-06-09'),
(10,10,9,'2023-06-10'), (11,11,7,'2023-06-11'), (12,12,8,'2023-06-12'),
(13,13,9,'2023-06-13'), (14,14,8,'2023-06-14'), (15,15,10,'2023-06-15');



INSERT INTO Votes (Movie_ID, User_ID, Rating_Value) VALUES
(1,1,10), (2,2,9), (3,3,8), (4,4,9), (5,5,10),
(6,6,8), (7,7,9), (8,8,8), (9,9,10), (10,10,9),
(11,11,7), (12,12,8), (13,13,9), (14,14,8), (15,15,10);


INSERT INTO Trailers (Movie_ID, URL, Release_Date) VALUES
(1, 'https://youtu.be/NmzuHjWmXOc', '1994-09-10'),
(2, 'https://youtu.be/sY1S34973zA', '1972-03-15'),
(3, 'https://youtu.be/EXeTwQWrcwY', '2008-07-14'),
(4, 'https://youtu.be/s7EdQ4FqbhY', '1994-05-21'),
(5, 'https://youtu.be/qtRKdVHc-cE', '1999-10-15'),
(6, 'https://youtu.be/bLvqoHBptjg', '1994-07-06'),
(7, 'https://youtu.be/YoHD9XEInc0', '2010-07-08'),
(8, 'https://youtu.be/vKQi3bBA1y8', '1999-03-24'),
(9, 'https://youtu.be/V75dMMIW2B4', '2001-12-19'),
(10, 'https://youtu.be/zSWdZVtXT7E', '2014-11-05'),
(11, 'https://youtu.be/owK1qxDselE', '2000-05-01'),
(12, 'https://youtu.be/kVrqfYjkTdQ', '1997-12-19'),
(13, 'https://youtu.be/TcMBFSGVi1c', '2019-04-26'),
(14, 'https://youtu.be/W6Mm8Sbe__o', '1991-02-14'),
(15, 'https://youtu.be/gG22XNhtnoY', '1993-12-15');


INSERT INTO Awards (Award_Name, Year) VALUES
('Best Picture', 1994),
('Best Director', 1994),
('Best Actor', 1994),
('Best Adapted Screenplay', 1994),
('Best Cinematography', 1999),
('Best Visual Effects', 2010),
('Best Editing', 2008),
('Best Supporting Actor', 2008),
('Best Actress', 1991),
('Best Original Score', 1994),
('Best Makeup', 2000),
('Best Costume Design', 1997),
('Best Sound Mixing', 2014),
('Best Production Design', 2019),
('Best Animated Feature', 2010);



INSERT INTO Movie_Awards (Movie_ID, Award_ID, Category) VALUES
(1, 1, 'Best Picture'),
(2, 2, 'Best Director'),
(3, 7, 'Best Editing'),
(3, 8, 'Best Supporting Actor'),
(4, 4, 'Best Adapted Screenplay'),
(5, 5, 'Best Cinematography'),
(6, 10, 'Best Original Score'),
(7, 6, 'Best Visual Effects'),
(8, 6, 'Best Visual Effects'),
(9, 1, 'Best Picture'),
(10, 13, 'Best Sound Mixing'),
(11, 11, 'Best Makeup'),
(12, 12, 'Best Costume Design'),
(13, 14, 'Best Production Design'),
(14, 9, 'Best Actress');



SELECT * FROM Movies;
SELECT * FROM Directors;
SELECT * FROM Movie_Directors;
SELECT * FROM Genres;
SELECT * FROM Movie_Genres;
SELECT * FROM Actors;
SELECT * FROM Movie_Actors;
SELECT * FROM Users;
SELECT * FROM Reviews;
SELECT * FROM Votes;
SELECT * FROM Trailers;
SELECT * FROM Awards;
SELECT * FROM Movie_Awards;








PART 4 


-- 1. Select all movies released after 2000
SELECT Title, Release_year FROM Movies WHERE Release_year > 2000;

-- 2. Select all directors born before 1950
SELECT Director_name, Birth_year FROM Directors WHERE Birth_year < 1950;

-- 3. Select all actors who starred in 'The Shawshank Redemption'
SELECT Actor_Name FROM Actors 
JOIN Movie_Actors ON Actors.Actor_ID = Movie_Actors.Actor_ID
JOIN Movies ON Movie_Actors.Movie_ID = Movies.Movie_ID
WHERE Movies.Title = 'The Shawshank Redemption';

-- 4. Select the total number of movies per genre
SELECT Genre_Name, COUNT(Movie_Genres.Movie_ID) AS Total_Movies
FROM Genres
JOIN Movie_Genres ON Genres.Genre_ID = Movie_Genres.Genre_ID
GROUP BY Genre_Name;

-- 5. Select all movies with a rating higher than 8, ordered by release year
SELECT Title, Release_year FROM Movies
JOIN Reviews ON Movies.Movie_ID = Reviews.Movie_ID
WHERE Rating > 8
ORDER BY Release_year;

-- 6. Select all directors and their corresponding movies
SELECT Director_name, Title FROM Directors
JOIN Movie_Directors ON Directors.Director_ID = Movie_Directors.Director_ID
JOIN Movies ON Movie_Directors.Movie_ID = Movies.Movie_ID;

-- 7. Find the average rating of each movie
SELECT Title, Round(AVG(Rating),2) AS Average_Rating FROM Movies
JOIN Reviews ON Movies.Movie_ID = Reviews.Movie_ID
GROUP BY Title;

-- 8. Select all movies from 1994 with a genre 'Drama'
SELECT Title FROM Movies
JOIN Movie_Genres ON Movies.Movie_ID = Movie_Genres.Movie_ID
JOIN Genres ON Movie_Genres.Genre_ID = Genres.Genre_ID
WHERE Release_year = 1994 AND Genre_Name = 'Drama';

-- 9. Select movies and their directors where the director's birth year is between 1950 and 1970
SELECT Title, Director_name FROM Movies
JOIN Movie_Directors ON Movies.Movie_ID = Movie_Directors.Movie_ID
JOIN Directors ON Movie_Directors.Director_ID = Directors.Director_ID
WHERE Birth_year BETWEEN 1950 AND 1970;

-- 10. Find the total number of votes for each movie
SELECT Title, COUNT(Votes.Vote_ID) AS Total_Votes FROM Movies
JOIN Votes ON Movies.Movie_ID = Votes.Movie_ID
GROUP BY Title;

-- 11. Find all movies that have no associated trailer
SELECT Title FROM Movies
LEFT JOIN Trailers ON Movies.Movie_ID = Trailers.Movie_ID
WHERE Trailers.Movie_ID IS NULL;

-- 12. Select all actors who played in 'The Godfather' and 'Pulp Fiction'
SELECT Actor_Name FROM Actors
JOIN Movie_Actors ON Actors.Actor_ID = Movie_Actors.Actor_ID
JOIN Movies ON Movie_Actors.Movie_ID = Movies.Movie_ID
WHERE Movies.Title IN ('The Godfather', 'Pulp Fiction');

-- 13. Get the movies that have won an award in 1994
SELECT Title FROM Movies
JOIN Movie_Awards ON Movies.Movie_ID = Movie_Awards.Movie_ID
JOIN Awards ON Movie_Awards.Award_ID = Awards.Award_ID
WHERE Awards.Year = 1994;

-- 14. Get the actors who starred in movies with the genre 'Sci-Fi'
SELECT Actor_Name FROM Actors
JOIN Movie_Actors ON Actors.Actor_ID = Movie_Actors.Actor_ID
JOIN Movies ON Movie_Actors.Movie_ID = Movies.Movie_ID
JOIN Movie_Genres ON Movies.Movie_ID = Movie_Genres.Movie_ID
JOIN Genres ON Movie_Genres.Genre_ID = Genres.Genre_ID
WHERE Genre_Name = 'Sci-Fi';

-- 15. Get the highest-rated movie for each user
SELECT u.Username, m.Title, r.Rating AS Highest_Rating
FROM Users u
JOIN Reviews r ON u.User_ID = r.User_ID
JOIN Movies m ON r.Movie_ID = m.Movie_ID
WHERE (u.User_ID, r.Rating) IN (
    SELECT r2.User_ID, MAX(r2.Rating)
    FROM Reviews r2
    GROUP BY r2.User_ID
);


-- 16. Find the movies with a duration between 140 and 160 minutes
SELECT Title, Duration FROM Movies
WHERE Duration BETWEEN 140 AND 160;

-- 17. Select movies and the number of votes they have received, ordered by number of votes
SELECT Title, COUNT(Votes.Vote_ID) AS Total_Votes FROM Movies
JOIN Votes ON Movies.Movie_ID = Votes.Movie_ID
GROUP BY Title
ORDER BY Total_Votes DESC;

-- 18. Find all movies where the rating is not null
SELECT Title FROM Movies
JOIN Reviews ON Movies.Movie_ID = Reviews.Movie_ID
WHERE Rating IS NOT NULL;

-- 19. Select movies released after 2000 that have received a 'Best Picture' award
SELECT Title FROM Movies
JOIN Movie_Awards ON Movies.Movie_ID = Movie_Awards.Movie_ID
JOIN Awards ON Movie_Awards.Award_ID = Awards.Award_ID
WHERE Awards.Award_Name = 'Best Picture' AND Movies.Release_year > 2000;

-- 20. Get the movies that have no reviews yet
SELECT Title FROM Movies
LEFT JOIN Reviews ON Movies.Movie_ID = Reviews.Movie_ID
WHERE Reviews.Review_ID IS NULL;




