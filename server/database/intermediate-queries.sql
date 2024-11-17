-- 01. alias - aliases can simplify column names and make table 
--             references easier.
select col_a as alias_name from table_name as t

-- 02. inner join - return records with matching values in
--     both tables
select a.col_a, b.col_b
from table a
inner join table_b b on a.common_col = b.common_col

-- 03. left join - returns all records from the left table and matched recoreds
--     from the right table
select a.col_a, b.col_b
from table a
left join table_b b on a.common_col = b.common_col

-- 04. right join - similar to left join, but returns all records from the right 
--                  table
select a.col_a, b.col_b
from table a
right join table_b b on a.common_col = b.common_col

-- 05. subqueries
--     as part of select
select col_a, (select (max(col_b) from table_b) as max_value)
from table_a

--     as part of where clause
select col_a from table_a where col_b > (
    select avg(col_b) from table_b
)

-- 06. union - combines results from two or more select queries and 
--             removes duplicates
select col_a from table_a
union
select col_a from table_b
-- or union all keep all duplicates
select col_a from table_a
union all
select col_a from table_b

-- 07. case - similar to if ... then in programming
select col_a,
    case 
        when col_b = 'value1' then 'result1'
        when col_b = 'value2' then 'results2'
        else 'other'
    end as alias_name
from table_name

-- 08. grop by having
select col_a, count(*)
from table_name
group by col_a
having count(*) > 1;

-- 09. insert into ... select
insert into table_a (col_a, col_b)
select col_a, col_b 
from table_b
where condition;

-- 10. self join
select a.col_a, b.col_b
from table_name a
join table_name b on a.related_col = b.related_col

-- 11. common table expressions
with cte as (
    select col_a, col_b
    from table_name
    where condition
)
select * from cte where col_b = 'value';

-- 12. exists (subquery) - checks whether a subquery returns any rows
select col_a
from table_a
where exists (
    select * 
from table_b 
where table_b.col_a = table_a.col_a);
    
-- 13. indexing - creates an index on a table to speed up searches. but be
--                cautious, as too many indexes can slow down [insert] and
--                [update] operations.
create index idx_name on table_name(col_name);

-- 14. pattern matching
-- % is a whildcard that represents any number of characters.
-- _ represents a single character
select col_a
from table_name
where col_a like 'A%'; -- start with 'A'

-- 15. transaction control
start transaction;
commit -- commit transaction
rollback; -- rollback transation (undo)

-- 16. distinct with aggregates - counte unique values in a col
select count(distinct col_a) from table_name

-- 17. update with join
update table_a a
join table_b on a.common_col = b.common_col
set a.col_a = b.col_b
where condition;

-- 18. delete with join
delete a
from table_a a
join table_b b on a.common_col = b.common_col
where condition;

-- 19. stored procedures
delimiter $$

create procedure procedure_name ()
begin
    select col_a from table_name;
end$$

delimiter

-- 20. triggers - executes automatically when spedified actions 
--                (insert, update, delete) happen
create trigger trigger_name
after insert another_table(col_a) values(new.column)
end;
