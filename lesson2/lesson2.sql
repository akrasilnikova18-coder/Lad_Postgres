select * from posts;

select title, views from posts;

update posts
set views = 150
where title = 'Занимательная математика'
returning id, title, views;

update posts
set views = 250
where id = 2
returning id, title, views;

select title, views from posts
where views > 100;

select title from posts
where title ilike '%химия%'

alter table posts
add column published BOOLEAN not null default false;

select id, title, published, views from posts;

update posts
set published = true
where id in (1, 2); 

select title, views from posts
where published = true and views between 50 and 250;

select title, views from posts
order by views desc
limit 4;

select id, title from posts
order by title;

select title, published, views from posts
order by published desc, views desc;

select id, title, views from posts
order by views desc 
offset 4 limit 2;

insert into posts (author_id, category_id, title, body, views, published) values
(2, 3, 'Литература', 'Мой четвертый пост', 459, true)
returning id, title;

delete from posts 
where id = 7
returning id;

select distinct author_id from posts
order by author_id;

select distinct category_id from posts
order by category_id;

select distinct author_id, category_id from posts
order by author_id, category_id;











