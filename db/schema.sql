DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;


CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  cp INT,
  poke_type TEXT NOT NULL,
  img_url TEXT,
  trainer_id INT
);

CREATE TABLE trainers(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  level INT,
  img_url TEXT
);
