CREATE TABLE IF NOT EXISTS books(
  book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  author INTEGER UNSIGNED,
  title VARCHAR(100) NOT NULL,
  year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
  language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
  cover_url VARCHAR(500),
  price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
  sellable TINYINT(1) DEFAULT 1,
  copies INTEGER NOT NULL DEFAULT 1,
  description TEXT
);

CREATE TABLE IF NOT EXISTS authors(
  author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  nationality VARCHAR(3)
);

CREATE TABLE IF NOT EXISTS clients(
  client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  email VARCHAR(100) not null UNIQUE,
  birthdate DATETIME,
  gender ENUM('M', 'F', 'ND') NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS transactions(
  transaction_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  book_id INTEGER UNSIGNED NOT NULL,
  client_id INTEGER UNSIGNED NOT NULL, 00
  type ENUM('lend', 'return', 'sell') NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
  finished TINYINT(1) NOT NULL
);

ALTER TABLE transactions
MODIFY COLUMN `type`
enum('lend', 'return', 'sell') NOT NULL;

INSERT INTO authors(name, nationality)
VALUES('Juan Rulfo', 'MEX');

SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS edad, gender
FROM clients
WHERE gender='F'
    AND name LIKE'%Lop%';

SELECT count(*) FROM books;

SELECT * FROM authors WHERE author_id > 0 AND author_id <= 5;
SELECT book_id, author_id, title FROM books WHERE author_id between 1 AND 5;

SELECT b.book_id, a.name, a.author_id, b.title
FROM books as b
join authors as a
  on a.author_id = b.author_id
WHERE a.author_id between 1 and 5;

INSERT INTO transactions(transaction_id,book_id,client_id,`type`,`finished`)
VALUES(1,12,34,'sell',1),
(2,54,87,'lend',0),
(3,3,14,'sell',1),
(4,1,54,'sell',1),
(5,12,81,'lend',1),
(6,12,81,'return',1),
(7,87,29,'sell',1);

SELECT c.name, b.title, a.name, t.type
FROM transactions as t
join books as b
  on t.book_id = b.book_id
join clients as c
  on t.client_id = c.client_id
join authors as a
  on b.author_id = a.author_id
WHERE c.gender = 'F'
  and t.type in ('sell', 'lend');

select a.author_id, a.name, b.book_id, b.title, b.language-- count(b.Language),
from authors as a
right join books as b
  on a.author_id = b.author_id
WHERE a.author_id is null
-- group by a.author_id
order by a.author_id
limit 20;

select a.author_id, a.name, b.book_id, b.title, b.language-- count(b.Language),
from authors as a
join books as b
  on a.author_id = b.author_id
-- WHERE a.author_id is null
-- group by a.author_id
order by a.author_id
limit 20

select a.author_id, a.name, b.book_id, b.title, b.language-- count(b.Language),
from authors as a
left join books as b
  on a.author_id = b.author_id
WHERE b.book_id is null
-- group by a.author_id
order by a.author_id
limit 20

select name, b.title
from authors as
FULL OUTER JOIN books
  on a.author_id = b.author_id
WHERE b.book_id is null;

SELECT * FROM books as a LEFT JOIN authors as b ON a.author_id=b.author_id
UNION
SELECT * FROM books as a RIGHT JOIN authors as b ON a.author_id=b.author_id;

SELECT distinct a.nationality, count(a.author_id)
from authors as a
group by a.nationality
order by count(a.nationality);

select author_id,
(select count(author_id) as c_languaje_books
from books
WHERE language = 'es'
group by author_id
)
from books
limit 10;

group by author_id;

select a.name
from books as b
left join authors as a
  on a.author_id = b.author_id
WHERE b.author_id is null

select b.author_id, a.name,
  count(case when b.language = 'en' then true end) as c_languaje_books_en,
  count(case when b.language = 'es' then true end) as c_languaje_books_es
from books as b
left join authors as a
  on b.author_id = a.author_id
group by b.author_id
limit 15;

select nationality, count(b.book_id),
  sum(if(year < 1950, 1, 0)) as '<1950',
  sum(if(year >1950 and year <=1990,1,0)) as '<1990',
  sum(if(year >1990 and year <=2000,1,0)) as '<2000',
  sum(if(year >2000 and year <=2010,1,0)) as '<2010',
  sum(if(year >2010,1,0)) as 'actual'
from books as b
join authors as a
  on a.author_id = b.author_id
WHERE a.nationality is not null
group by nationality

select a.name, b.title, t.type
from authors as a
join books as b
  on a.author_id = b.author_id
join transactions as t
 on b.book_id = t.book_id
where t.type in ('lend', 'return', 'sell');


select a.name, b.title
from authors as a
full outer join books as b
  on a.author_id = b.author_id


