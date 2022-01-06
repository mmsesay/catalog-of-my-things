CREATE TABLE Book(
  id            INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  genre_id      INTEGER,
  author_id     INTEGER,
  author_id     INTEGER,
  publish_date  DATE,
  archived      BOOLEAN,
  publisher     VARCHAR(250),
  cover_state   VARCHAR(4),

  FOREIGN KEY (genre_id) REFERENCES Genre(id)
  FOREIGN KEY (author_id) REFERENCES Author(id)
  FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE Label(
  id      INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  title   VARCHAR(100),
  color   VARCHAR(100)
);