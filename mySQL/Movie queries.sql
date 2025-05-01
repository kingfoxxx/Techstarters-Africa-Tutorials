select * from 2016_movies;

# fetch movies released in usa with a rating of pg or pg-13
select title from 2016_movies
where country = "usa" and Rating = "pg" or Rating = "pg-13";

# how many movies were produced in each country
select country, count(title) movie_count from 2016_movies
group by country;

# which movies had a budget above 500000 but gross less than 2million
select title from 2016_movies 
where budget > 500000 and `Gross Revenue` < 2000000;

# average imdb score for each genre
select genre, avg(`IMDb Score (1-10)`) average_imdb_score from 2016_movies 
group by genre
order by 2 desc;

# all movies in english with imdb above 7.0
select title from 2016_movies 
where language = "english" and `IMDb Score (1-10)` > 7.0;

# total gross revenue by movie rating (g,pg,r, etc)
select rating, sum(`gross revenue`) sum_of_revenue from 2016_movies 
group by rating;

#movies in black and white and belongs to drama genre
select title from 2016_movies
where `Color/B&W` = "b&w" and Genre = "drama";

# average movie duration by language
select language, avg(`Duration (min)`) avg_duration from 2016_movies
group by language
order by 2 desc;

# all movies directed by someone with fewer than 10 fb likes
select title from 2016_movies
where `Director FB Likes` < 10;

# average budget per director
select `Director Name`, avg(budget) average_budget 
from 2016_movies
group by `Director Name`
order by 2 desc;

