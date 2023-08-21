** First we will import the data into music_store database**
** The data will be stored in the music_store database in multiple tables**

/* QUESTION SET 1(EASY) */

**Q1. Who is the senior most employee according to job title?**

SELECT  first_name, last_name FROM employee 
ORDER BY levels DESC;

**Q2. Which country has themost invoices?**

SELECT billing_country, COUNT(*) FROM invoice 
GROUP BY billing_country ORDER BY COUNT(*) DESC LIMIT  1;

**Q3. What are the top 3 values of total invoices?*

SELECT total FROM invoice ORDER total DESC LIMIT 3;

**Q4. Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals**

SELECT billing_city, SUM(total) FROM invoice 
GROUP BY billing_city 
ORDER BY SUM(total) DESC LIMIT 1;

**Q5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money**

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) FROM customer 
JOIN invoice ON customer.customer_id=invoice.customer_id 
GROUP BY customer.customer_id order by total desc limit total  1;

/* QUESTION SET 2 (MODERATE)*/

**Q1. Write query to return the email, first name, last name, & Genre of all Rock Music
listeners. Return your list ordered alphabetically by email starting with A**

SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoiceline ON invoiceline.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoiceline.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;

**Q2: Let us invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.**

SELECT artist.name, COUNT(track.*), genre.name 
FROM artist
JOIN album ON artist.artist_id= album.artist_id 
JOIN track ON album.album_id= track.album_id
JOIN genre ON track.genre_id= genre.genre_id  
WHERE genre.name LIKE "Rock" 
ORDER BY COUNT(track.*) 
DESC LIMIT 10

**Q3. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first**

SELECT track.name, track.milliseconds FROM track 
WHERE milliseconds> 
( SELECT AVG(milliseconds) FROM track) ORDER BY milliseconds DESC 

