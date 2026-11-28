-- Все авторы
select author_id, COUNT(*) as posts_count
from posts
group by author_id
order by posts_count desc;

-- Автор, у которого больше всего постов
select id, title, author_id
from posts
where author_id in (
	select author_id
	from posts
	group by author_id
	order by COUNT(*) desc
	limit 2
)
order by author_id;

select * from authors;

insert into authors (username) values 
('Ekaterina');

-- Если не заполнена почта, ставим по умолчанию
select username, coalesce(email, concat(username, '@', 'blog.local'))
from authors;

select * from posts;

select title, views, 
	case 
		when views >= 300 then 'Популярный'
		when views >= 100 then 'Обычный'
		else 'Не популярный'
	end as popularity
from posts
order by views desc;

-- Имена авторов, у кого есть посты
select a.username
from authors as a
where exists (
	select 1
	from posts as p
	where p.author_id = a.id and published
);

-- Авторы без постов
select a.username
from authors as a
where not exists (
	select 1
	from posts as p
	where p.author_id = a.id and published
);

-- Посчитали процент от общего количества просмотров
select title, views, (select sum(views) from posts) as sum_posts, 
(select max(views) from posts) as max_posts, 
round(100 * views::numeric / (select sum(views) from posts), 1) as share_procent
from posts
order by share_procent desc;

select c.name as category, count(*) as posts_count, round(avg(p.views), 1) as avg_views
from (
	select category_id, views
	from posts
	where published
) as p
join categories as c on c.id = p.category_id
group by category
order by avg_views desc;

select * from categories;



