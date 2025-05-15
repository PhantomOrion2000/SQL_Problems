Given a table Movies with columns:

MovieID

MovieName

Rating

Write a query to assign ranks to movies based on their ratings. Movies with identical ratings must share the same rank without gaps in the ranking (1,1,2...).
Output columns: MovieID, MovieName, Rating, Rank.

--------------------------------------------------------------------


CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(100),
    Rating DECIMAL(3,1)
);

INSERT INTO Movies (MovieID, MovieName, Rating) VALUES
(1, 'Inception', 9.0),
(2, 'Interstellar', 8.6),
(3, 'The Dark Knight', 9.0),
(4, 'Tenet', 7.5),
(5, 'Dunkirk', 8.6),
(6, 'Memento', 8.4);

select * from Movies;

Select 
	MovieID, MovieName, Rating,
    dense_rank() over(order by Rating DESC) as Rank
from 
	Movies;