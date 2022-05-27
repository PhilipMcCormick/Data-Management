-- Lab 2

-- Question 1
-- What was the most reviewed non-fiction book between 2014 and 2016? (return one name only)


-- Question 2
-- Return a distinct list of authors in the dataset, sorted alphabetically


-- Question 3
-- What are the bottom 5 best sellers by user rating? Return a distinct list of name, author, and user_rating


-- Question 4
-- Of best sellers with at least 10,000 reviews, which Fiction book costs the most? (return one row)


-- Question 5
-- Create a new column which is the user_rating on a 100 point scale.  The user_rating in the dataset is on a
-- 5 point scale. Call this new column "user_rating_100".  Sort by this column (highest to lowest).
-- Break ties with the number of reviews (highest to lowest).


-- Question 6
-- Order all Harry Potter books (name contains Harry Potter and author is J.K. Rowling) by user_rating,
-- lowest to highest



-- Question 7
-- Let's use # of reviews as a proxy for # of purchases.  Create a new column called est_revenue which is the
-- product of reviews and price.  What are the top 10 distinct books by est_revenue? (Hint: we see duplicate books
-- because they are best sellers across multiple years)



-- Question 8
-- What are the top 10 longest and top 10 shortest book titles in this dataset? De-dupe the titles and also
-- return the length.
-- Write two queries



-- Question 9
-- (Freeform) Find the books on dieting/weight loss in this dataset




-- Question 10
-- (Freeform) Create a new column user_rating_category which
-- categorizes the user_rating column into several different buckets.
-- You can choose yourself how to define these buckets.



-- Question 11
-- Create a new column review_count_thousands
-- The values in this column will be the number of reviews
-- to the nearest hundred, expressed in thousands followed by K
-- For example
-- 7388 => 7.4K
-- 25221 => 25.2K
-- 349 => 0.3K
-- Hint: To convert a numeric value to a string, use CAST(x AS VARCHAR)



-- Question 12
-- What are the top 5 lowest rated best sellers written by
-- authors who also have a book rated >= 4.5 ?
