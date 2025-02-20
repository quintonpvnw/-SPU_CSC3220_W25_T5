--
-- File generated with SQLiteStudio v3.4.13 on Wed Feb 19 22:45:41 2025
--
-- Text encoding used: UTF-8
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

INSERT INTO Author (
                       AuthorID,
                       FirstName,
                       LastName,
                       Birthyear,
                       Biography
                   )
                   VALUES (
                       1,
                       'Bob',
                       'Marley',
                       '2000',
                       NULL
                   );

INSERT INTO Author (
                       AuthorID,
                       FirstName,
                       LastName,
                       Birthyear,
                       Biography
                   )
                   VALUES (
                       2,
                       'Bob',
                       'Marley',
                       '2000',
                       NULL
                   );

INSERT INTO Author (
                       AuthorID,
                       FirstName,
                       LastName,
                       Birthyear,
                       Biography
                   )
                   VALUES (
                       3,
                       'Bob',
                       'Marley',
                       '2000',
                       NULL
                   );

INSERT INTO Author (
                       AuthorID,
                       FirstName,
                       LastName,
                       Birthyear,
                       Biography
                   )
                   VALUES (
                       4,
                       'Bob',
                       'Marley',
                       '2000',
                       NULL
                   );

INSERT INTO Author (
                       AuthorID,
                       FirstName,
                       LastName,
                       Birthyear,
                       Biography
                   )
                   VALUES (
                       5,
                       'Bob',
                       'Marley',
                       '2000',
                       NULL
                   );

INSERT INTO Author (
                       AuthorID,
                       FirstName,
                       LastName,
                       Birthyear,
                       Biography
                   )
                   VALUES (
                       6,
                       'Bob',
                       'Marley',
                       '2000',
                       NULL
                   );

INSERT INTO Author (
                       AuthorID,
                       FirstName,
                       LastName,
                       Birthyear,
                       Biography
                   )
                   VALUES (
                       7,
                       'Bob',
                       'Marley',
                       '2000',
                       NULL
                   );


-- Table: Book
DROP TABLE IF EXISTS Book;

CREATE TABLE IF NOT EXISTS Book (
    BookID           INTEGER PRIMARY KEY AUTOINCREMENT,
    Title            TEXT    NOT NULL,
    Genre            TEXT,
    [Published Year] TEXT,
    IBSN             INTEGER UNIQUE,
    Rating           INTEGER,
    Review           TEXT,
    [Read Status]    INT     NOT NULL
                             AS (0),
    Goal             TEXT
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
