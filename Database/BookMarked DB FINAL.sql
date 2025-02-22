--
-- File generated with SQLiteStudio v3.4.15 on Fri Feb 21 22:05:15 2025
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
    BookID    INTEGER PRIMARY KEY AUTOINCREMENT,
    Title     TEXT    NOT NULL,
    Genre     TEXT,
    Published TEXT,
    IBSN      INTEGER UNIQUE,
    Rating    INTEGER,
    Review    TEXT,
    Status    INTEGER NOT NULL
                      DEFAULT (0),
    Goal      TEXT
)
STRICT;


-- Table: Wishlist
DROP TABLE IF EXISTS Wishlist;

CREATE TABLE IF NOT EXISTS Wishlist (
    WishlistID INTEGER PRIMARY KEY AUTOINCREMENT,
    BookID     ANY     REFERENCES Book (BookID),
    Added_Date TEXT
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
