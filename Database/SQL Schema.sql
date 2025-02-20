--
-- File generated with SQLiteStudio v3.4.15 on Wed Feb 19 14:30:24 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Author
DROP TABLE IF EXISTS Author;

CREATE TABLE IF NOT EXISTS Author (
    AuthorID  INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT    NOT NULL,
    LastName  TEXT    NOT NULL,
    Birthyear TEXT,
    Biography TEXT
)
STRICT;


-- Table: Book
DROP TABLE IF EXISTS Book;

CREATE TABLE IF NOT EXISTS Book (
    BookID           INTEGER PRIMARY KEY AUTOINCREMENT,
    Title            TEXT    NOT NULL,
    Genre            TEXT,
    [Published Year] TEXT,
    IBSN             INTEGER UNIQUE,
    Rating           INTEGER,
    Review           TEXT
)
STRICT;


-- Table: Status
DROP TABLE IF EXISTS Status;

CREATE TABLE IF NOT EXISTS Status (
    StatusID      INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID        INTEGER REFERENCES Book (BookID),
    [Read Status] INT     NOT NULL
                          AS (0),
    Goal          TEXT
)
STRICT;


-- Table: Wishlist
DROP TABLE IF EXISTS Wishlist;

CREATE TABLE IF NOT EXISTS Wishlist (
    [Wishlist ID] INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID        ANY     REFERENCES Book (BookID),
    [Added Date]  TEXT
)
STRICT;


-- Table: WrittenBy
DROP TABLE IF EXISTS WrittenBy;

CREATE TABLE IF NOT EXISTS WrittenBy (
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
