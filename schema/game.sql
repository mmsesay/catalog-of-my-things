CREATE TABLE Game(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  author_id INT,
  archived BOOLEAN,
  last_played_at DATE,
  multiplayer BOOLEAN,
  PRIMARY KEY (id),
  CONSTRAINT fk_game
    FOREIGN KEY(author_id) 
	    REFERENCES author(id)
	      ON DELETE SET NULL
);