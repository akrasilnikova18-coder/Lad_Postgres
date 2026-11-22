select * from authors;
select * from posts;
select * from categories;
select * from post_tags;

-- Задание 1
-- Выведите title и views всех опубликованных статей категории 2 («Базы данных»), отсортированных по views по убыванию.
select title, views from posts
where category_id = 2 and published = true
order by views desc;


-- Задание 2
-- Выведите 3 самые «свежие» (по created_at) неопубликованные статьи — title и created_at.
-- Отсортируйте по created_at DESC и возьмите LIMIT 3.
select title, created_at from posts
where published = false
order by created_at desc
limit 3;


-- Задание 3
-- Добавьте нового автора и одну его статью (сначала INSERT автора с RETURNING id, затем INSERT поста, используя полученный
-- author_id). После этого увеличьте просмотры этой статьи на 1 (UPDATE ... RETURNING)
-- и удалите другой пост (DELETE ... RETURNING).
insert into authors (username, email, is_active) values 
('Egor', '6787', true)
returning id;

insert into posts (author_id, category_id, title, body, views, published) values 
(3, 3, 'Русский язык', 'Мой пятый пост', 645, true)
returning id;

update posts
set views = views + 1
where id = 9;

delete from posts 
where id = 2
returning id, title;


-- Задание 4
-- Список без дубликатов. Выведите уникальные пары (author_id, category_id) из таблицы posts,
-- отсортированные по author_id, затем по category_id.
select distinct author_id, category_id from posts
order by author_id, category_id;


-- Задание 5
-- Разберитесь с UPSERT: напишите INSERT INTO authors (name, email) VALUES (...) ON CONFLICT (email)
-- DO UPDATE SET name = EXCLUDED.name RETURNING id, name;. Объясните своими словами в комментарии к запросу:
-- что делает ON CONFLICT (email) и DO UPDATE, и при чём тут EXCLUDED. Подсказка: посмотрите главу про INSERT ... ON CONFLICT
-- в словаре PostgreSQL.
insert into authors (username, email) values 
('Angela', '123')
-- Проверяем, есть ли уже автор с таким email.
-- Для этого на email должно быть ограничение UNIQUE.
on conflict (email)
-- Если email уже существует, обновляем имя автора.
do update set username = excluded.username
-- Возвращаем id и имя добавленного или обновлённого автора.
returning id, username;

-- До этого выдавал ошибку, так как email не было уникальным
alter table authors
add constraint authors_email_unique UNIQUE (email);


-- Задание 6
-- Выведите title, published, views, category_id для статей, которые удовлетворяют такому условию:
-- (опубликована и имеет более 100 просмотров) ИЛИ (не опубликована и не имеет категории).
-- Используйте скобки и IS NULL, чтобы условие читалось однозначно. Проверьте себя: какой из запросов — A OR B AND C — 
-- даст «неожиданный» результат, и почему? Опишите разницу в комментарии.
select title, published, views, category_id from posts
where (published = true and views > 100) or (published = false and category_id is null);

-- Для начала "category_id is null" - невыполнимое условие, потому что это поле обязательно, 
-- при попытке его удалить, вывод ошибку базы данных
-- Скобки нужны, потому что AND имеет более высокий приоритет, чем OR.
-- Поэтому A OR B AND C выполняется как A OR (B AND C).
-- Если нужны условия (A OR B) AND C, необходимо поставить скобки.
-- Без скобок запрос может вернуть лишние строки,
-- потому что условия будут объединены не так, как мы ожидали.



