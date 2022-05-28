use bank;
-- Assume that any _id columns are incremental, meaning that higher ids always occur after lower ids. 
-- For example, a client with a higher client_id joined the bank after a client with a lower client_id.
-- Query 1 Get the id values of the first 5 clients from district_id with a value equals to 1.
SELECT client_id FROM client  WHERE district_id = 1 order by district_id LIMIT 5;

-- Query 2 In the client table, get an id value of the last client where the district_id equals to 72.
SELECT client_id FROM client WHERE district_id = 72 order by client_id DESC LIMIT 1;

-- Query 3 Get the 3 lowest amounts in the loan table.
SELECT amount FROM loan order by amount LIMIT 3;

-- Query 4 What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT DISTINCT status FROM loan order by status;

-- Query 5 What is the loan_id of the highest payment received in the loan table?
SELECT loan_id FROM loan order by payments desc LIMIT 1 ;

-- Query 6 What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT account_id, amount FROM loan order by account_id LIMIT 5 ;

-- Query 7 What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id FROM loan where duration = 60  order by amount LIMIT 5 ;

-- ??Query 8 What are the unique values of k_symbol in the order table?
-- Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. 
-- You have to use backticks to escape the order table name.
SELECT DISTINCT k_symbol FROM  `order` group by k_symbol;

-- Query 9 In the order table, what are the order_ids of the client with the account_id 34?
SELECT order_id FROM `order` where account_id = 34  order by order_id;

-- Query 10 In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT distinct account_id FROM `order` where order_id > 29540 and order_id < 29560 order by order_id;

-- Query 11 In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT distinct amount FROM `order` where account_to = 30067122 order by amount;

-- Query 12 In the trans table, show the trans_id, date, type and amount of the 10 first transactions 
-- from account_id 793 in chronological order, from newest to oldest.
SELECT trans_id, `date`, `type`, amount FROM trans where account_id = 793 order by `date` desc limit 10;

-- Query 13(Optional) In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? 
-- Show the results sorted by the district_id in ascending order.
SELECT district_id, count(*) FROM `client` where district_id < 10 group by district_id order by district_id;

-- Query 14 In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
SELECT `type`, count(*) FROM `card` group by `type` order by `type`;

-- Query 15 Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id, amount FROM loan order by amount desc limit 10;

--??Query 16 In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, 
-- ordered by date in descending order.
SELECT account_id, amount FROM loan order by amount desc limit 10;