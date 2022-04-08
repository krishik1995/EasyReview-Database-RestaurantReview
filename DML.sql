USE BUDT703_Project_0501_12

--#1.To find top five restaurants by average review rating to help customers pick the best place to eat
DROP VIEW IF EXISTS Restaurants

GO 
CREATE VIEW
Restaurants AS
SELECT rs.rstName AS 'Restaurant Name', AVG(rv.rvwRating) AS 'Average Review Rating'
FROM [EasyReview.Restaurant] rs, [EasyReview.Review] rv
WHERE rs.rstId = rv.rstId
GROUP BY rs.rstName
GO

SELECT TOP 5 * FROM Restaurants
ORDER BY 'Average Review Rating' DESC

--#2.For the same restaurant what are the average review ratings across different platforms?
DROP VIEW IF EXISTS ratings_across_multiple_platforms_view_1

GO 
CREATE VIEW 
ratings_across_multiple_platforms_view_1 AS

SELECT rs.rstName AS 'Restauarant Name', p.pltName AS 'Platform Name', AVG(rv.rvwRating) AS 'Average Review Rating'						
FROM  [EasyReview.Restaurant] rs, [EasyReview.Review] rv , [EasyReview.Platform] p
WHERE (p.pltId = rv.pltId) AND rs.rstId = rv.rstId
GROUP BY rs.rstName, p.pltName
GO

SELECT * FROM ratings_across_multiple_platforms_view_1
ORDER BY 'Restauarant Name', 'Average Review Rating' DESC

--Create another view that only shows restaurants that have a review in more than one platform

DROP VIEW IF EXISTS ratings_across_multiple_platforms_view_2

GO 
CREATE VIEW 
ratings_across_multiple_platforms_view_2 AS
SELECT rs.rstName AS 'Restauarant Name', p.pltName AS 'Platform Name', AVG(rv.rvwRating) as 'Average Review Rating'		
FROM  [EasyReview.Restaurant] rs, [EasyReview.Review] rv , [EasyReview.Platform] p
WHERE (p.pltId = rv.pltId) AND rs.rstId = rv.rstId
GROUP BY  p.pltName, rs.rstName
HAVING rs.rstName IN (
			SELECT V.rstName
			FROM
			(
				SELECT rs.rstName , p.pltName, AVG(rv.rvwRating) as 'Average Review Rating'		
				FROM  [EasyReview.Restaurant] rs, [EasyReview.Review] rv , [EasyReview.Platform] p
				WHERE (p.pltId = rv.pltId) AND rs.rstId = rv.rstId
				GROUP BY  p.pltName, rs.rstName
			) V
			GROUP BY (V.rstName)
			HAVING  COUNT(V.rstName) >1
		)
GO

SELECT * FROM ratings_across_multiple_platforms_view_2
ORDER BY 'Restauarant Name', 'Average Review Rating' DESC

--#3.To show the all the restaurants for “Japanese” cuisine ordered by average review ratings.
DROP VIEW IF EXISTS Japanese_Restaurant

GO 
CREATE VIEW 
Japanese_Restaurant AS
SELECT rs.rstName AS 'Restaurant Name', AVG(rv.rvwRating) AS 'Average Review Rating'
FROM [EasyReview.Restaurant] rs, [EasyReview.RestaurantCuisine] c, [EasyReview.Review] rv
WHERE rs.rstId = rv.rstId AND c.rstCuisine = 'Japanese' AND c.rstId = rs.rstId
GROUP BY rs.rstName
GO

SELECT * FROM Japanese_Restaurant
ORDER BY 'Average Review Rating' DESC

--#3 To show the all the restaurants for "Korean" cuisine ordered by average review ratings (another example of how query can be used)
DROP VIEW IF EXISTS Korean_Restaurant

GO 
CREATE VIEW 
Korean_Restaurant AS
SELECT rs.rstName AS 'Restaurant Name', AVG(rv.rvwRating) AS 'Average Review Rating'
FROM [EasyReview.Restaurant] rs, [EasyReview.RestaurantCuisine] c, [EasyReview.Review] rv
WHERE rs.rstId = rv.rstId AND c.rstCuisine = 'Korean' AND c.rstId = rs.rstId
GROUP BY rs.rstName
GO

SELECT * FROM Korean_Restaurant
ORDER BY 'Average Review Rating' DESC

--#4.What are the restaurants that have reservations, parking, and are good for groups ordered by average review ratings?

DROP VIEW IF EXISTS Restaurants_with_amenities 

GO 
CREATE VIEW Restaurants_with_amenities AS
SELECT rs.rstName AS 'Restaurant Name', AVG(rv.rvwRating) AS 'Average Review Rating'
FROM [EasyReview.Restaurant] rs, [EasyReview.Amenity] a, [EasyReview.Review] rv
WHERE rs.rstId = rv.rstId AND a.reservations = 1 AND a.parking = 1 AND a.goodForGroups = 1 AND a.rstId = rs.rstId
GROUP BY  rs.rstName 
GO

SELECT * FROM Restaurants_with_amenities
ORDER BY 'Average Review Rating' DESC

--#4 What are restaurants that have vegan options ordered by average review rating? (another example of how query can be used)
DROP VIEW IF EXISTS Vegan_Restaurants 

GO 
CREATE VIEW Vegan_Restaurants AS
SELECT rs.rstName AS 'Restaurant Name', AVG(rv.rvwRating) AS 'Average Review Rating'
FROM [EasyReview.Restaurant] rs, [EasyReview.Amenity] a, [EasyReview.Review] rv
WHERE rs.rstId = rv.rstId AND a.veganOptions = 1 AND a.rstId = rs.rstId
GROUP BY  rs.rstName 
GO


SELECT * FROM Vegan_Restaurants
ORDER BY 'Average Review Rating' DESC

 
