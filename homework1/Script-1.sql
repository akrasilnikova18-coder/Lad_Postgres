-- Задание 1

create table tags (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) not null unique,
	slug VARCHAR(255) not null
);


-- Задание 2

create table post_tags (
	post_id INTEGER not null,
	tag_id INTEGER not null,
	
	primary key (post_id, tag_id),
	
	foreign key (post_id) references posts(id),
	foreign key (tag_id) references tags(id)
);


-- Задание 3
insert into tags (name, slug) values 
('Новости', 'news'),
('Советы', 'recommendations'),
('Обучение', 'education');


insert into post_tags (post_id, tag_id) values 
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3);


select * from post_tags;


-- Задание 4

-- SERIAL — это сокращённая запись для INTEGER с автоматической
-- генерацией значений через последовательность (SEQUENCE).
-- При создании столбца SERIAL PostgreSQL автоматически создаёт
-- последовательность и устанавливает DEFAULT nextval(...).
-- Когда мы добавляем строку без указания id, PostgreSQL вызывает
-- nextval(), получает следующее число и записывает его в id.
-- Обычный INTEGER не генерирует значения автоматически.
-- Для этого нужно вручную создать SEQUENCE и настроить DEFAULT.
-- SERIAL сам по себе не создаёт PRIMARY KEY.

-- Задание 5

-- Docker Volume хранит данные отдельно от контейнера.
-- При удалении контейнера blog_postgres именованный volume
-- pgdata сохраняется.
-- Если создать новый контейнер с тем же volume,
-- той же версией PostgreSQL и правильным путём подключения,
-- базы данных, таблицы и записи останутся доступными.
-- Volume хранит физические файлы PostgreSQL, включая
-- данные таблиц, индексы и служебную информацию.
-- Без подключения прежнего volume новый контейнер
-- не увидит старую базу данных.
-- Таким образом, Docker Volume позволяет сохранять
-- данные независимо от удаления и пересоздания контейнера.


