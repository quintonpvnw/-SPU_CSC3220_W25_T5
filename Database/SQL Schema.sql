--
-- File generated with SQLiteStudio v3.4.15 on Fri Feb 14 15:24:35 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Author
CREATE TABLE Author (
    AuthorID  INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT    NOT NULL,
    LastName  TEXT    NOT NULL,
    Birthyear TEXT,
    Biography TEXT
)
STRICT;


-- Table: Book
CREATE TABLE Book (
    BookID           INTEGER PRIMARY KEY AUTOINCREMENT,
    AuthorID         INTEGER REFERENCES Author (AuthorID),
    Title            TEXT    NOT NULL,
    Genre            TEXT,
    [Published Year] TEXT,
    IBSN             NUMERIC UNIQUE
);


-- Table: Rating
CREATE TABLE Rating (
    RatingID INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID   INTEGER REFERENCES Book (BookID),
    Stars    INTEGER,
    Review   TEXT
)
STRICT;


-- Table: Status
CREATE TABLE Status (
    StatusID      INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID        INTEGER REFERENCES Book (BookID),
    [Read Status] INT     NOT NULL
                          AS (0),
    Goal          TEXT
)
STRICT;


-- Table: Wishlist
CREATE TABLE Wishlist (
    [Wishlist ID] INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID        ANY     REFERENCES Book (BookID),
    [Added Date]  TEXT
)
STRICT;


-- Table: WrittenBy
CREATE TABLE WrittenBy (
    AuthorID INTEGER REFERENCES Author (AuthorID) 
                     NOT NULL,
    BookID   INTEGER REFERENCES Book (BookID) 
                     NOT NULL,
    PRIMARY KEY (
        AuthorID,
        BookID
    )
)
STRICT;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
