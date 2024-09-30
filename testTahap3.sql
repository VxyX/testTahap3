CREATE TABLE IF NOT EXISTS table_customers(
    customer_id SERIAL PRIMARY KEY,
	full_name TEXT NOT NULL,
	salutation CHAR(5) NOT NULL
);

CREATE TABLE IF NOT EXISTS table_movies(
    movie_id SERIAL PRIMARY KEY,
	movie_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS address(
	address_id SERIAL PRIMARY KEY,
	customer_id INT,
	address CHAR(50) NOT NULL,
	CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
        REFERENCES table_customers(customer_id)
);

CREATE TABLE IF NOT EXISTS rent(
	customer_id INT,
    movie_id INT,
    address_id INT,
    PRIMARY KEY (customer_id, movie_id),
	CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
        REFERENCES table_customers(customer_id),
	CONSTRAINT fk_movie
      FOREIGN KEY(movie_id) 
        REFERENCES table_movies(movie_id)
	CONSTRAINT fk_address
      FOREIGN KEY(address_id) 
        REFERENCES address(address_id)

);


INSERT INTO table_customers (full_name, salutation)
VALUES 
	('Janet Jones', 'Ms.'),
	('Robert Phil', 'Mr.' );

INSERT INTO table_movies (movie_name)
VALUES 
	('Pirates of the Caribbean'),
	('Clash of the Titans'),
	('Forgetting Sarah Marshal'),
	('Daddy''s Little Girls');

INSERT INTO address(customer_id, address)
VALUES
	(1,'First Street Plot No 4'),
	(2,'3rd Street 34'),
	(2,'5th Avenue');

INSERT INTO rent(customer_id, movie_id, address_id)
VALUES
	(1,1,1),
	(1,2,1),
	(2,3,2),
	(2,4,2),
	(2,2,3);

SELECT c.full_name, a.address, m.movie_name, c.salutation 
	FROM table_customers c
	JOIN rent r
	ON c.customer_id = r.customer_id
	JOIN address a
	ON r.address_id = a.address_id
	JOIN table_movies m
	ON r.movie_id = m.movie_id;





