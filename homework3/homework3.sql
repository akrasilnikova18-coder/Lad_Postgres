-- Задание 1
-- JOIN-запрос: выведите список постов с именем автора, названием категории и числом просмотров.
-- Отсортируйте по просмотрам по убыванию (ORDER BY views DESC)
select p.title as title, a.username as name, c.name as category, p.views as views
from posts as p
join authors as a on a.id = p.author_id 
join categories as c on c.id = p.category_id
order by views desc;

-- Задание 2
-- Агрегация: посчитайте количество постов у каждого автора (author) — используйте LEFT JOIN авторов с постами и GROUP BY,
-- чтобы не потерять авторов без постов. Подсказка: рядом выведите и COUNT(p.id), чтобы сравнить с COUNT(*).
select a.username as name, count(*) as all_posts_count, count(p.id) as posts_count
from posts as p
right join authors as a on a.id = p.author_id
group by name
order by name;

-- Задание 3
-- Группировка: посчитайте количество постов в каждой категории и среднее число просмотров по категории.
-- Подсказка: GROUP BY c.name + AVG(p.views).
select c.name as category, count(*) as posts_count, avg(p.views) as avg_views
from posts as p
join categories as c on c.id = p.category_id
group by category
order by category;

-- Задание 4
-- Звёздочка: изучите и примените FULL JOIN и CROSS JOIN. Напишите и выполните по одному запросу каждого типа
-- на таблицах authors и posts. Объясните: что покажет CROSS JOIN (сколько строк в результате и почему)
-- и чем FULL JOIN отличается от LEFT/RIGHT. Запишите выводы комментарием к SQL.
select p.title as title, a.username as name, p.views as views
from posts as p
full join authors as a on a.id = p.author_id 
order by views desc;

select p.title as title, a.username as name, p.views as views
from posts as p
cross join authors as a 
order by views desc;

-- FULL JOIN возвращает всех авторов и все статьи. Если автора или статьи нет, он вернет NULL
-- CROSS JOIN соединяет каждого автора с каждой статьёй, независимо от того, кто её написал.
-- Количество строк в результате равно произведению количества записей в таблицах authors и posts.
-- Условие ON не требуется.
-- То есть у меня 4 автора и 7 статей, он вернул 28 строк

-- Задание 5
-- выполните две мини-задачи:
-- посчитайте количество уникальных авторов, у которых есть посты, через COUNT(DISTINCT author_id) (пользуясь тем же JOIN);
-- найдите топ категории по числу постов — категорию с наибольшим количеством постов
-- (для одной категории — через ORDER BY ... DESC LIMIT 1, для всех с ранжированием — через GROUP BY + HAVING/ORDER BY).
select distinct a.username as name, count(distinct a.username)
from authors as a
join posts as p on p.author_id = a.id 
group by name;

select c.name as category, count(p.id) as posts_count
from posts as p
join categories as c on c.id = p.category_id 
group by category 
order by posts_count desc 
limit 1;

select c.name as category, count(p.id) as posts_count
from posts as p
join categories as c on c.id = p.category_id 
group by category 
order by posts_count desc;

-- having нужен будет, если нужно вывести категории, где больше двух статей:
select c.name as category, count(p.id) as posts_count
from posts as p
join categories as c on c.id = p.category_id 
group by category 
having count(*) > 2
order by posts_count desc;



