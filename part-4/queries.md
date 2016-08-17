Paste your queries and results in this file
================================================================================


RELEASE 0:
sqlite> SELECT * FROM books;

id          title                       author_id   publisher_id
----------  --------------------------  ----------  ------------
1           Rails 4 Test Prescriptions  1           1
2           Metaprogramming Ruby 2      2           1
3           Programming Ruby 1.9 & 2.0  3           1
4           Pragmatic Programmer        3           2
5           Practical Object Oriented   4           2
6           The Rails 4 Way             5           2
7           Objective-C Programming     6           3
8           iOS Programming             6           3
9           JavaScript: The Good Parts  7           4
10          JavaScript: The Definitive  8           4
11          Functional JavaScript       9           4
12          Build iOS Games with Sprit  10          1
13          Test iOS Apps with UI Auto  10          1
14          Design Patterns in Ruby     11          2
15          Eloquent Ruby               11          2
16          Web Design with HTML & CSS  12          5
17          JavaScript and jQuery       12          5
18          Well-Grounded Rubyist       13          6
19          Essential Algorithms        14          5
20          Introduction to Algorithms  15          7


RELEASE 1:
SELECT * FROM books
JOIN authors ON authors.id = books.author_id
WHERE books.title LIKE '%Ruby%' AND authors.name LIKE 'Dav%';
id          title                       author_id   publisher_id  id          name
----------  --------------------------  ----------  ------------  ----------  -----------
3           Programming Ruby 1.9 & 2.0  3           1             3           Dave Thomas
18          Well-Grounded Rubyist       13          6             13          David Black


RELEASE 2:
SELECT books.title, publishers.name, authors.name FROM books
JOIN publishers ON publishers.id = books.publisher_id
JOIN authors ON authors.id = books.author_id
WHERE publishers.name LIKE "Addison-Wesley";

title                 name            name
--------------------  --------------  -----------
Pragmatic Programmer  Addison-Wesley  Dave Thomas
Practical Object Ori  Addison-Wesley  Sandi Metz
The Rails 4 Way       Addison-Wesley  Obie Fernan
Design Patterns in R  Addison-Wesley  Russ Olsen
Eloquent Ruby         Addison-Wesley  Russ Olsen

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT books.title, publishers.name, authors.name FROM books
JOIN publishers ON publishers.id = books.publisher_id
JOIN authors ON authors.id = books.author_id
WHERE authors.name LIKE "Jonathan Penn" ;

title                           name                   name
------------------------------  ---------------------  -------------
Build iOS Games with SpriteKit  Pragmatic Programmers  Jonathan Penn
Test iOS Apps with UI Automati  Pragmatic Programmers  Jonathan Penn

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT books.title, publishers.name FROM publishers
JOIN books ON publishers.id = books.publisher_id
WHERE books.title LIKE '%iOS%';

title            name
---------------  --------------
iOS Programming  Big Nerd Ranch
Build iOS Games  Pragmatic Prog
Test iOS Apps w  Pragmatic Prog

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT books.title, publishers.name, authors.name FROM publishers
JOIN books ON publishers.id = books.publisher_id
JOIN authors ON authors.id = books.author_id
WHERE authors.name LIKE 'Sandi Metz';

title                                     name            name
----------------------------------------  --------------  ----------
Practical Object Oriented Design in Ruby  Addison-Wesley  Sandi Metz

RELEASE 3
sqlite> INSERT INTO authors (name) VALUES ('Assunta Crux');
sqlite> SELECT * FROM authors;
id          name
----------  -----------
1           Noel Rappin
2           Paolo Perro
3           Dave Thomas
4           Sandi Metz
5           Obie Fernan
6           Aaron Hille
7           Douglas Cro
8           David Flana
9           Michael Fog
10          Jonathan Pe
11          Russ Olsen
12          Jon Duckett
13          David Black
14          Rod Stephen
15          Thomas Corm
16          Assunta Cru

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
sqlite> INSERT INTO publishers (name) VALUES ('Assunta Crux');
sqlite> SELECT * FROM publishers;
id          name
----------  ---------------------
1           Pragmatic Programmers
2           Addison-Wesley
3           Big Nerd Ranch
4           O'Reilly
5           Wiley
6           Manning Publications
7           MIT Press
8           Assunta Crux

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
INSERT INTO books (title, author_id, publisher_id) VALUES ('The beautiful live of Assunta Crux', 16, 8);
sqlite> SELECT * FROM books;
id          title                       author_id   publisher_id
----------  --------------------------  ----------  ------------
1           Rails 4 Test Prescriptions  1           1
2           Metaprogramming Ruby 2      2           1
3           Programming Ruby 1.9 & 2.0  3           1
4           Pragmatic Programmer        3           2
5           Practical Object Oriented   4           2
6           The Rails 4 Way             5           2
7           Objective-C Programming     6           3
8           iOS Programming             6           3
9           JavaScript: The Good Parts  7           4
10          JavaScript: The Definitive  8           4
11          Functional JavaScript       9           4
12          Build iOS Games with Sprit  10          1
13          Test iOS Apps with UI Auto  10          1
14          Design Patterns in Ruby     11          2
15          Eloquent Ruby               11          2
16          Web Design with HTML & CSS  12          5
17          JavaScript and jQuery       12          5
18          Well-Grounded Rubyist       13          6
19          Essential Algorithms        14          5
20          Introduction to Algorithms  15          7
21          The beautiful live of Assu  16          8

RELEASE 4:
UPDATE authors SET name = 'David A. Black' WHERE name = 'David Black';
sqlite> SELECT * FROM authors;
id          name
----------  -----------
1           Noel Rappin
2           Paolo Perro
3           Dave Thomas
4           Sandi Metz
5           Obie Fernan
6           Aaron Hille
7           Douglas Cro
8           David Flana
9           Michael Fog
10          Jonathan Pe
11          Russ Olsen
12          Jon Duckett
13          David A. Bl
14          Rod Stephen
15          Thomas Corm
16          Assunta Cru

RELEASE 5:
DELETE FROM books WHERE id = 21;
sqlite> SELECT * FROM books;
id          title                       author_id   publisher_id
----------  --------------------------  ----------  ------------
1           Rails 4 Test Prescriptions  1           1
2           Metaprogramming Ruby 2      2           1
3           Programming Ruby 1.9 & 2.0  3           1
4           Pragmatic Programmer        3           2
5           Practical Object Oriented   4           2
6           The Rails 4 Way             5           2
7           Objective-C Programming     6           3
8           iOS Programming             6           3
9           JavaScript: The Good Parts  7           4
10          JavaScript: The Definitive  8           4
11          Functional JavaScript       9           4
12          Build iOS Games with Sprit  10          1
13          Test iOS Apps with UI Auto  10          1
14          Design Patterns in Ruby     11          2
15          Eloquent Ruby               11          2
16          Web Design with HTML & CSS  12          5
17          JavaScript and jQuery       12          5
18          Well-Grounded Rubyist       13          6
19          Essential Algorithms        14          5
20          Introduction to Algorithms  15          7

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELETE FROM authors WHERE id = 16;
sqlite> SELECT * FROM authors;
id          name
----------  -----------
1           Noel Rappin
2           Paolo Perro
3           Dave Thomas
4           Sandi Metz
5           Obie Fernan
6           Aaron Hille
7           Douglas Cro
8           David Flana
9           Michael Fog
10          Jonathan Pe
11          Russ Olsen
12          Jon Duckett
13          David A. Bl
14          Rod Stephen
15          Thomas Corm

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELETE FROM publishers WHERE name = 'Assunta Crux';
sqlite> SELECT * FROM publishers;
id          name
----------  ---------------------
1           Pragmatic Programmers
2           Addison-Wesley
3           Big Nerd Ranch
4           O'Reilly
5           Wiley
6           Manning Publications
7           MIT Press
