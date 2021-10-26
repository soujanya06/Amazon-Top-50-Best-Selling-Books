Use PortfolioProject

Select * 
From bestsellers$


--best selling books from 2009-2019
With bestCTE As
(
  Select *,Rank() over (partition by name order by name) as rn
  From bestsellers$
 )
Select top 10 name, Rating,genre, count(rn) as total
From bestCTE
Group by rn, name, Rating,genre
Order by total  desc


-- Total no of fiction and non-fiction books
Select Genre, count(*) as counter
From bestsellers$
Group by Genre
Order by counter Desc


--Find the no. of best selling books in each genre every year 
Select Genre, Year,Name,count(*) as counter
From bestsellers$
Group by Genre, Year, Name
Order by Year Desc


--Total no. of books published by each author
Select Author, count(Name) as Total
From bestsellers$
Group by Author
Order by Total desc


--books with highest reviews
Select Top 10 Name,Genre, Reviews
From bestsellers$
Group by Genre,Name, Reviews
Order by Reviews Desc

--Books with highest rating
Select Top 10 Name,Genre, Rating
From bestsellers$
Group by Name, Rating, Genre
Order by Rating Desc

--Average price of books
Select avg(price) as average
From bestsellers$

