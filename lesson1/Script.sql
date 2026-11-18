select * from posts;

alter table posts add column views integer not null default 0;

alter table posts add constraint posts_views_not_negative check (views >= 0);

update posts set views = 8 where id = 1;

select id, title, views from posts order by id;