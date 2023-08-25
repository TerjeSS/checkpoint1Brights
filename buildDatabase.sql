-- Fikk ikke lov å kalle den User så ble Author

CREATE TABLE author ( Id serial UNIQUE NOT NULL,
																						Name TEXT NOT NULL,
																						Email TEXT NOT NULL UNIQUE,
																						Password TEXT NOT NULL,
																						Bio TEXT, CreatedAt DATE, UpdatedAt DATE, PRIMARY KEY (Id));


CREATE TABLE article(Id SERIAL UNIQUE NOT NULL,
																						AuthorId INTEGER NOT NULL,
																						Title TEXT NOT NULL,
																						Slug TEXT DEFAULT 'N/A',
																						Description TEXT NOT NULL,
																						Body TEXT NOT NULL,
																						CreatedAt DATE DEFAULT NOW(),
																						UpdatedAt DATE DEFAULT NOW(),
																						PRIMARY KEY (Id),
																					FOREIGN KEY (AuthorId) REFERENCES Author(Id));


CREATE TABLE ArticleFavorite( Id SERIAL NOT NULL UNIQUE,
																														ArticleId INTEGER NOT NULL,
																														UserId INTEGER NOT NULL,
																														PRIMARY KEY(Id),
																													FOREIGN KEY (ArticleId) REFERENCES Article(Id),
																													FOREIGN KEY (UserId) REFERENCES Author(Id) ) --Inserts

INSERT INTO Author
VALUES(default,
								'George R.R. Martin',
								'Neverfinishing@bookstore.com',
								'notgoodenough',
								'Written a lot of books');


INSERT INTO Author(name, email, password, bio)
VALUES ('Tolkien',
									'Tolkien@theshire.com',
									'Theonering',
									'GOAT?'), ('Rothfuss',
																					'Pat@theman.com',
																					'wordsofthewind',
																					'big beard')
INSERT INTO Article(AuthorId, Title, Slug, Description, Body, CreatedAt, UpdatedAt)
VALUES (3,
									'Lord of the Rings',
									'LOTR',
									'Theyr taking the hobbits to isengard',
									'Not gonna write the whole book',
									NOW(),
									NOW()), (1,
																			'Song of ice and fire',
																			'GoT',
																			'Sean Bean always dies',
																			'Lots of text here',
																			NOW(),
																			NOW());


INSERT INTO ArticleFavorite(ArticleId, UserId)
VALUES (3,
									3), (4,
															1);