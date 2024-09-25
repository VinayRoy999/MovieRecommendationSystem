CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear YEAR NOT NULL,
    DurationMinutes INT,
    Summary TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(100) NOT NULL UNIQUE
);

-- Insert sample data
INSERT INTO Genres (GenreName) VALUES
('Action'), 
('Sci-Fi'), 
('Drama'), 
('Adventure');



CREATE TABLE MovieGenres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Insert sample data
INSERT INTO MovieGenres (MovieID, GenreID) VALUES
(1, 2),  -- Inception -> Sci-Fi
(1, 1),  -- Inception -> Action
(2, 2),  -- The Matrix -> Sci-Fi
(2, 1),  -- The Matrix -> Action
(3, 4);  -- Interstellar -> Adventure



CREATE TABLE Ratings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    RatingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);



CREATE TABLE UserPreferences (
    PreferenceID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    GenreID INT,
    PreferenceLevel INT CHECK (PreferenceLevel >= 1 AND PreferenceLevel <= 5),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);




CREATE TABLE Directors (
    DirectorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Insert sample data
INSERT INTO Directors (Name) VALUES
('Christopher Nolan'),
('Lana Wachowski'),
('Lilly Wachowski');




CREATE TABLE MovieDirectors (
    MovieID INT,
    DirectorID INT,
    PRIMARY KEY (MovieID, DirectorID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID)
);

-- Insert sample data
INSERT INTO MovieDirectors (MovieID, DirectorID) VALUES
(1, 1),  -- Inception -> Christopher Nolan
(2, 2),  -- The Matrix -> Lana Wachowski
(2, 3);  -- The Matrix -> Lilly Wachowski




CREATE TABLE Actors (
    ActorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Insert sample data
INSERT INTO Actors (Name) VALUES
('Leonardo DiCaprio'),
('Keanu Reeves'),
('Matthew McConaughey');




CREATE TABLE MovieActors (
    MovieID INT,
    ActorID INT,
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
);

-- Insert sample data
INSERT INTO MovieActors (MovieID, ActorID) VALUES
(1, 1),  -- Inception -> Leonardo DiCaprio
(2, 2),  -- The Matrix -> Keanu Reeves
(3, 3);  -- Interstellar -> Matthew McConaughey





CREATE TABLE WatchHistory (
    WatchID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    WatchDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);




CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    ReviewText TEXT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Insert sample data
INSERT INTO Reviews (UserID, MovieID, ReviewText) VALUES
(1, 1, 'Inception is a mind-bending thriller!'),
(2, 2, 'The Matrix is a revolutionary sci-fi movie.'),
(3, 3, 'Interstellar is visually stunning and thought-provoking.');







