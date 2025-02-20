

CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE  NOT NULL
);


CREATE TABLE Accounts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    username TEXT UNIQUE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE SET NULL
);


CREATE TABLE Followers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    follower_id INTEGER NOT NULL,
    following_id INTEGER NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES Accounts(id) ON DELETE SET NULL,
    FOREIGN KEY (following_id) REFERENCES Accounts(id) ON DELETE SET NULL,
    UNIQUE (follower_id, following_id)
);

CREATE TABLE Posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Accounts(id) ON DELETE SET NULL
);


CREATE TABLE Likes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Accounts(id) ON DELETE SET NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(id) ON DELETE SET NULL,
    UNIQUE (account_id, post_id)
);


CREATE TABLE Mutes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    muter_id INTEGER NOT NULL,
    muting_id INTEGER NOT NULL,
    FOREIGN KEY (muter_id) REFERENCES Accounts(id) ON DELETE SET NULL,
    FOREIGN KEY (muting_id) REFERENCES Accounts(id) ON DELETE SET NULL,
    UNIQUE (muter_id, muting_id)
);
