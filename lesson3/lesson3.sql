select p.title, a.username as author, c.name as category, p.views
from posts as p
inner join authors as a on a.id = p.author_id
inner join categories as c on c.id = p.category_id;

insert into categories (name) values ('django');

select c.name as category, p.title
from categories as c
left join posts as p on p.category_id = c.id
order by category;

select a.username as name, p.title
from authors as a
left join posts as p on p.author_id = a.id
order by name desc;

select a.username as name, p.title
from posts as p
right join authors as a on a.id = p.author_id
order by name desc;

insert into authors (username, email, is_active) values
('Natalia', '45678', true);

select c.name, count(*) as posts_count, sum(p.views) as total_views, avg(p.views) as avg_views
from posts as p
inner join categories as c on c.id = p.category_id
group by c.name;

select c.name, count(*) as posts_count
from posts as p
join categories as c on c.id = p.category_id
group by c.name
having count(*) > 2;





