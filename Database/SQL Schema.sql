--
-- File generated with SQLiteStudio v3.4.15 on Fri Feb 14 15:41:56 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Author
CREATE TABLE IF NOT EXISTS Author (
    AuthorID  INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT    NOT NULL,
    LastName  TEXT    NOT NULL,
    Birthyear TEXT,
    Biography TEXT
)
STRICT;


-- Table: Book
CREATE TABLE IF NOT EXISTS Book (
    BookID           INTEGER PRIMARY KEY AUTOINCREMENT,
    AuthorID         INTEGER REFERENCES Author (AuthorID),
    Title            TEXT    NOT NULL,
    Genre            TEXT,
    [Published Year] TEXT,
    IBSN             NUMERIC UNIQUE
);


-- Table: Rating
CREATE TABLE IF NOT EXISTS Rating (
    RatingID INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID   INTEGER REFERENCES Book (BookID),
    Stars    INTEGER,
    Review   TEXT
)
STRICT;


-- Table: Status
CREATE TABLE IF NOT EXISTS Status (
    StatusID      INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID        INTEGER REFERENCES Book (BookID),
    [Read Status] INT     NOT NULL
                          AS (0),
    Goal          TEXT
)
STRICT;


-- Table: Wishlist
CREATE TABLE IF NOT EXISTS Wishlist (
    [Wishlist ID] INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID        ANY     REFERENCES Book (BookID),
    [Added Date]  TEXT
)
STRICT;


-- Table: WrittenBy
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
