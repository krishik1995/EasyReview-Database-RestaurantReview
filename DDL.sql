USE BUDT703_Project_0501_12

--Drop Table Statements
DROP TABLE IF EXISTS [EasyReview.Review];
DROP TABLE IF EXISTS [EasyReview.RestaurantCuisine];
DROP TABLE IF EXISTS [EasyReview.Amenity];
DROP TABLE IF EXISTS [EasyReview.Platform];
DROP TABLE IF EXISTS [EasyReview.Restaurant];
DROP TABLE IF EXISTS [EasyReview.Customer];

--Creating Customer Table
CREATE TABLE [EasyReview.Customer] (
	cstId CHAR (5) NOT NULL,
	cstFName VARCHAR (20),
	cstLName VARCHAR (20),
	cstGender CHAR,
	CONSTRAINT pk_Customer_cstId PRIMARY KEY (cstId) )

--Inserting Values into Customer Table
-- If the gender = 1, that signals the gender is male. If gender = 2, the gender is female. Additional genders can be specified using 3
INSERT INTO [EasyReview.Customer] VALUES
	('C0001','Jasmin','Hollywood','2'),
	('C0002', 'Jaseaton', 'Park', '1'),
	('C0003', 'Ben', 'Rivers', '1'),
    ('C0004', 'Sanders', 'Becs', '1'), 
	('C0005', 'Ann', 'Ray', '2'),
	('C0006', 'Sunnie', 'Jackson', '2'),
	('C0007', 'Bonnie','Jones', '2'),	
	('C0008', 'Ben', 'Ford', '2'),
	('C0009', 'Luke', 'A.', '1'),	
	('C0010', 'Kyle', 'L', '2'),	
	('C0011', 'Katelyn', 'K.', '2'),
	('C0012', 'Ronak', 'Patel', '1'),
	('C0013', 'Luna', 'Sparkle', '2'),
	('C0014', 'Olesea', 'St', '2'),
	('C0015', 'Jason', 'Miller', '1'),
	('C0016', 'Wendy', 'Knight', '2'),
	('C0017', 'Eldar', 'H', '1'),
	('C0018', 'Erina', 'Sakata', '2'),
	('C0019', 'Samantha', 'T', '2'),
	('C0020', 'Vinicius', 'Correa', '1'),
	('C0021', 'Mark', 'C', '1'),
	('C0022', 'Don', 'G', '1'),
	('C0023', 'Ramon', 'Gonzalez', '1'),
	('C0024', 'Jeena', 'L', '2'),
	('C0025', 'Laura', 'T', '2')


--Creating Restaurant Table
CREATE TABLE [EasyReview.Restaurant](
rstId CHAR (5) NOT NULL,
rstName VARCHAR (25),
rstStreet VARCHAR (30),
rstCity VARCHAR (20),
rstState CHAR (2),
rstZipCode VARCHAR (5),
	CONSTRAINT pk_Customer_rstId PRIMARY KEY (rstId))

--Inserting values into Restaurant Table
INSERT INTO [EasyReview.Restaurant] VALUES
	('R0001', 'Kangnam BBQ','8503 Baltimore Ave','College Park','MD', '20740'),
	('R0002', 'Potbelly Sandwich Shop','10260 Baltimore Avenue','College Park','MD', '20740'),
	('R0003', 'Hanami','8145 Baltimore Ave Ste M','College Park','MD', '20740'),
	('R0004', 'Nuvegan Cafe','8150 Baltimore Ave', 'College Park', 'MD', '20740'),
	('R0005', 'Seoul Spice','4200 Guilford Dr','College Park','MD', '20740'),
	('R0006','LaTao Hotpot','8700 Baltimore Avenue','College Park','MD', '20740'),
	('R0007','Qu Japan','7406 Baltimore Ave','College Park','MD', '20740'),
	('R0008','Wasabi Bistro','4505 College Ave','College Park','MD', '20740'),
	('R0009','Saburo Ramen Bar','8503 Baltimore Ave','College Park','MD', '20740'),
	('R0010','The Spot Mini','4209 Knox Rd','College Park','MD', '20740'),
	('R0011','Sarku Japan','10280 Baltimore Ave Ste A','College Park','MD', '20740')


--Creating Platform table
CREATE TABLE [EasyReview.Platform](
pltId CHAR (4) NOT NULL,
pltName VARCHAR(15),
pltUrl VARCHAR(50),
CONSTRAINT pk_Platform_pltId PRIMARY KEY (pltId) )

--Inserting values into Platform Table
INSERT INTO [EasyReview.Platform] VALUES
	('P001', 'Google Map', 'https://www.google.com/maps'),
	('P002', 'Tripsdvisor', 'https://www.tripadvisor.com/'),
	('P003', 'Yelp',  'https://www.yelp.com/')

--Creating Amenity table
CREATE TABLE [EasyReview.Amenity] (
	amenityId CHAR(5) NOT NULL,
	rstId CHAR (5) NOT NULL,
	pickUp CHAR,
	delivery  CHAR,
	parking CHAR,
	reservations CHAR,
	veganOptions CHAR,
	goodForGroups CHAR,
	goodForKids CHAR,
​​	CONSTRAINT pk_Amenity_amenityId_rstId PRIMARY KEY (amenityId, rstId) ,
	CONSTRAINT fk_Amenity_rstId  FOREIGN KEY (rstId)
                	REFERENCES[EasyReview.Restaurant] (rstId)
                	ON DELETE CASCADE ON UPDATE CASCADE) 

--Inserting values into Amenity Table
-- If an amenity = 1, that signals the restaurant has that amenity. If amenity = 0, restaurant does not have that amenity.
INSERT INTO [EasyReview.Amenity] VALUES
	('A0001', 'R0001','1', '0','1','1','1','1','1'),
    ('A0002', 'R0002','1', '1','1','0','1','1','1'),
    ('A0003', 'R0003','1', '1','1','1','1','1','1'),
    ('A0004', 'R0004','1', '0','0','1','1','1','1'),
	('A0005', 'R0005','1', '1','0','0','1','0','1'),
	('A0006','R0006','0','1','1','1','1','1','0'),
	('A0007','R0007','1', '1','0','0','1','1','1'),
	('A0008','R0008','1','1','1','0','1','1','0'),
	('A0009','R0009','1','1','1','0','0','1','1'),
	('A0010','R0010','1','1','1','0','1','0','1'),
	('A0011','R0011','1','1','1','0','1','1','1')


--Creating RestaurantCuisine table
CREATE TABLE [EasyReview.RestaurantCuisine] (
	rstCuisine VARCHAR(30) NOT NULL,
	rstId CHAR (5) NOT NULL,
	CONSTRAINT pk_RestaurantCuisine_rstCuisine_rstId PRIMARY KEY (rstCuisine,rstId),
	CONSTRAINT fk_RestaurantCuisine_rstId  FOREIGN KEY( rstId)
                	REFERENCES[EasyReview.Restaurant](rstId)
                	ON DELETE CASCADE ON UPDATE CASCADE )

--Inserting values into RestaurantCuisine Table
INSERT INTO [EasyReview.RestaurantCuisine] VALUES
	('Korean','R0001'),
	('American', 'R0002'),
    ('Japanese', 'R0003'),
	('Korean','R0004'),
	('Korean','R0005'),
	('Chinese','R0006'),
	('Japanese','R0007'),
	('Japanese','R0008'),
	('Japanese','R0009'),
	('Japanese','R0010'),
	('Japanese','R0011')


--Creating Review table
CREATE TABLE [EasyReview.Review] (
	pltId  CHAR (4) NOT NULL,
	cstId  CHAR (5) NOT NULL,
	rstId  CHAR (5) NOT NULL,
	rvwRating DECIMAL,
	rvwDate DATE,
	rvwComment VARCHAR (1500),
	CONSTRAINT pk_Review_Platform_platformId_customerId_restaurantId PRIMARY KEY (pltId, cstId, rstId),
	CONSTRAINT fk_Review_rstId  FOREIGN KEY( rstId)
		REFERENCES[EasyReview.Restaurant](rstId)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Review_cstId FOREIGN KEY (cstId)
		REFERENCES [EasyReview.Customer] (cstId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Review_pltId FOREIGN KEY (pltId)
		REFERENCES [EasyReview.Platform] (pltId)
		ON DELETE NO ACTION ON UPDATE CASCADE)

--Inserting values into Review Table
INSERT INTO [EasyReview.Review] VALUES
('P001', 'C0001','R0001',4, '05/10/2021','Ordered large garlic Korean fried chicken and it was nothing special, a bit soggy on the breading. I ordered a bulgogi beef box with rice and kimchi and it was so so / edible. When I got to the establishment to pick up my order I was treated like a thief by a female employee who skeptically asked me for my confirmation as I stated that I was there to pick up my own order for Jasmin, another male employee in the back kitchen who over heard me immediately brought it out and handed it to me. I was able to purchase a bottle of raspberry Wine which was a bit overpriced also with food and all. Ive eaten here a couple times in the past over the 6 years or so and similar experience not being many open Korean restaurants in the area anyway not sure if I will return again.'),
('P002', 'C0002',  'R0002', 4, '04/06/2018', 'This edition of Potbelly is in the new shopping area across from Ikea in Beltsville. Foods the same as everywhere: reliable, tasty sandwiches, soups and now gyros. The music over the PA was set with moderate volume (better than other Potbellys Ive been to) and the restroom was clean.'),
('P002', 'C0003',  'R0003', 4, '08/29/2021' , 'Average food, not very cheap. Good enough to non-Asian customer.We have visited for lunch, have combo box and other.'), 
('P002', 'C0004','R0004',4, '05/14/2019','I had lunch at the restaurant. The buffet was good but the BBQ Tofu was too sweet and the greens and cabbage overcooked. I appreciated the vegan fare but the restaurant could do more with presentation and flavoring of foods and the service both in giving the food and at the cash register is frustratingly slow and inefficient. I would eat here again but hope for fresher, more nuanced food and quick service for the buffet food.'),
('P003', 'C0005','R0005',5, '11/10/2021','I love this little place in college park. Its such a great idea to combine the style of Chipotle and korean food. I always mix the greens and rice as my base so Im not eating too much rice. Their bulgogi has some good flavor in it. They ran out when I went there, but I only had to wait 5 minutes or to get a fresh batch and it was worth the wait! The korean spicy sauce was the perfect amount of heat for me. Its definitely comparable to the sauces you find in korean food (like bibimbap sauce) - not mild, but not crazy spicy. Its not the cheapest thing to get in the area, but honestly I think its well worth it.'),
('P001','C0006','R0006',5,'10/26/2021','Amazing! I almost don''t want to share. So fun for the kids, but I wouldn''t take any that are too small. They have to keep there hands out of the pot. But, my 6 and 8 year old loved cooking food at the table. Delicious and fun!!'),
('P001','C0007','R0006',5,'10/11/2021','My Daughter took me out for dinner, and to try something different. I LOVED LaTao Hotpot.  It was clean,the employees were Absolutely Wonderful, the food was great and the price of our dining was quite reasonable.. And the most important thing I didn''t get sick. I will Definitely become a regular patron'),
('P001','C0008','R0006',5,'08/30/2021','Not sure what all the negative buzz is about - maybe it''s from people who didn''t grow up having hot pot and eating at hot pot restaurants? This place is so good. The meat is good quality (would recommend the fatty beef and the fatty lamb), and there are so many options to choose from. The regenerative herbal soup base tastes just like a chicken soup my mom used to make. There is so much space in the restaurant, which is good for times such as these. Would definitely come back and recommend to anyone.'),
('P003','C0009','R0007',4,'07/10/2021','Qu is THE BEST bang for your buck in College Park, specifically their hibachi meals. Some of the best hibachi I''ve ever had at a reasonable takeout price. I always go with the one protein hibachi and it has never disappointed me. It''s an absolutely killer lunch meal if you are visiting College Park and the best quick study dinner for students. My favorite aspect of the restaurant is how simple the menu is -- Qu does not try to do too much, they give you either ramen or hibachi, cooked to perfection. Not a sit-down restaurant but for a take-out joint it''s one of the best I''ve ever been to.'),
('P003','C0010', 'R0007',5,'10/19/2021','Qu Japan opened four years ago. Their hibachi is good but their portion sizes are a little small.  I''m very picky about my ramen and tend to be too crucial, so I''ll share my friends'' thoughts...My friends love their ramen and order it almost every time we eat out.  Their broth is very flavorful and their noodles are much higher quality than your average microwave ramen.'),
('P003','C0011', 'R0007',2,'04/26/2021','We eat a lot of Ramen - in fact I have a whole list of them here on Yelp - but Qu Japan is not even close to my favorite. I have tried their Tonkotsu Miso Ramen and their Tonkotsu Shoyu Ramen. There was no flavor difference. In fact both were rather bland in general.  (Me prattling on about the differences between the two types and why it matters): Shoyu Ramen is made with soy sauce so the broth should have a more salty flavor, whereas Miso Ramen is made with miso paste which isn''t very salty. (Tonkotsu by the way means pork bone in Japanese, so Pork Bone Broth has either shoyu or miso added to it to make the bases of these Ramen dishes - but that also means they should be slightly cloudy),The add-ins for the bowls are decent in terms of types (Nori, Extra Protein, Egg, Corn, and Bok-Choy) I would LOVE if butter was an option.'),
('P001','C0012', 'R0007',5,'09/23/2021', 'This place is definitely worth trying out. Dining in is an experience in and of itself because the ramen bowls are very nicely made (and look beautiful!). The employees also work very hard. She would rush to clean up a table as soon as it is done being used and rush back if there was a customer waiting. The food took a bit longer than I thought but that’s either because they were busy or just because it’s prepared properly so it’s excusable.'),
('P002','C0013', 'R0007',5,'01/30/2020','I love everything about this place! The food is delicious; they have the best ramen you can get in College Park, the build your own Hibachi meals are also amazing, and they have a good variety of fresh ingredients. The place is clean and really pretty inside. I love just hanging out here with friends or just by myself with a book. It can get pretty busy and then space becomes limited so just keep that in mind if you have a big group. Otherwise you can''t go wrong with coming here, I really love it!.'),
('P001','C0014', 'R0007',3,'07/23/2021','Food was good. Service was good. But they put it in single-use plastic containers and don’t seem to be environmentally-oriented at all. I will be happy to go there again but would love to see reusable or cardboard or compostable dinnerware'),
('P001','C0015', 'R0007',4,'06/23/2021','Their Ramen bowls are delish. In the heart of college park, its an easy walk for students and employees at university of Maryland.'),
('P001','C0016', 'R0009',5,'11/16/2021','We met with friends at this restaurant for dinner. my friend recommended this restaurant.  Well, we were not disappointed. The staff were extremely nice and we felt fantastic. The meal was fresh and delicious. We had a great time and we will visit this place again. Warmly recommended.'),
('P001','C0017', 'R0009',4,'08/23/2021','Great ramen, so far the best one I''ve found locally here around College Park. If I had one piece of advice give, it would be to have dedicated wait staff for each half of the restaurant (It has a bbq half, and a ramen half).'),
('P001','C0018', 'R0008',1,'10/23/2021','I ordered Salmon sushi and sashimi through Uber Eats. Benishouga (pink pickled ginger) was gone bad and I could smell and see white fungus on the surface. I didn''t eat Benishouga but the actual food might have touched the fungus when everything inside the food container was squished together (probably because of car riding?).'),
('P003','C0019', 'R0008',3,'10/12/2021','This place is good for a quick fix. The portions and prices are pretty consistent with other small sushi locations. It''s ideal for takeout even though when ordering on Uber eats I had an extremely long wait time so it might be better to pick it up if you can.'),
('P001','C0020', 'R0010',5,'04/12/2021','Had a good poke bowl from here. Employees were quick and friendly. Good portions. All ingredients tasted fresh. Don’t expect to spend less than $10 though.'),
('P003','C0021', 'R0010',4,'03/06/2021','Accepts cash and credit card. Does offer delivery service. Dine in and carry out. Imagine the usual Spot in Rockville, but smaller. This place offers decent food selections from bubble tea, sushi, dumplings and other dishes. They offer pretty good sushi selections. From salmon avocado roll, spicy tuna, Philly roll, eel roll, spicy shrimp roll and much more. The food quality is very fresh. Their sushi combos comes with a side of salad or miso soup (your choice). They also serve bubble tea (Gong cha) here. Tons of selections and you can customize your order from ice level, sweet level, etc. We also ordered their steam dumpling. Packaging was good especially since we ordered take out. Dumplings have tons of filling and meat to wrapper ratio was decent. If you are in the area, worth giving this place a try.'),
('P002','C0022', 'R0011',5,'04/25/2014','Great Japanese food including sushi. Restaurant is clean and staff are very friendly. I would recommend this for anyone that needs to grab a quick bite.'),
('P001','C0023', 'R0011',5,'10/23/2021','Quick, tasty and a decent alternative to some fast food. It’s like a Japanese answer to Panda Express. It was near my hotel and there was seating outside which made it a plus in these times. I see a lot of negative reviews about the “older Japanese lady” and while I was there I saw her cheerfully greet what seemed like her regulars and remember their orders. I got a teriyaki bento box and was happy with my order.'),
('P003','C0024', 'R0011',5,'10/21/2021','Good decent customer services. Serves dumplings and fried rice too. One of the best chicken teriyaki ever.'),
('P003','C0025', 'R0011',5,'12/30/2020','The food here was pretty decent. It''s fresh and made to order, which is nice since you know it hasn''t been sitting long. The store is pretty big and they have outdoor seating and it was flavorful. I wouldn''t really call the salad a salad but the portion size was nice. It''s definitely enough for two meals.')


