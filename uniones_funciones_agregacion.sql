/*Utilizando la base de datos de películas queremos conocer, por un lado, los títulos y el
nombre del género de todas las series de la base de datos.*/
select title, genres.name from series
left join genres on genre_id = genres.id;

/*Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de
los actores que trabajan en cada uno de ellos.*/
select episodes.title,concat (actors.first_name," ", actors.last_name) nombre_completo from episodes
left join actor_episode on actor_episode.episode_id = episodes.id
left join actors on actor_id = actors.id;

/*Para nuestro próximo desafío necesitamos obtener a todos los actores o actrices (mostrar
nombre y apellido) que han trabajado en cualquier película de la saga de la Guerra de las
galaxias, pero ¡cuidado!: debemos asegurarnos de que solo se muestre una sola vez cada
actor/actriz.*/
select distinct actors.first_name, actors.last_name from movies
inner join actor_movie on actor_movie.movie_id = movies.id
inner join actors on actor_id = actors.id
where title like "%La guerra de las galaxias%"; 

/*Debemos listar los títulos de cada película con su género correspondiente. En el caso de
que no tenga género, mostraremos una leyenda que diga "no tiene género". Como ayuda
podemos usar la función COALESCE() que retorna el primer valor no nulo de una lista.*/
select title, coalesce(genres.name, 'no tiene género') as 'genres' from movies
left join genres on movies.genre_id = genres.id;

/*Necesitamos mostrar, de cada serie, la cantidad de días desde su estreno hasta su fin, con
la particularidad de que a la columna que mostrará dicha cantidad la renombraremos:
“Duración”.*/
select title, datediff(end_date, release_date) Duración from series;

/*Listar los actores ordenados alfabéticamente cuyo nombre sea mayor a 6 caracteres.*/
select first_name, last_name from actors
having length (first_name) > 6
order by first_name;

/*Debemos mostrar la cantidad total de los episodios guardados en la base de datos.*/
select count(episodes.id) as total_episodios from episodes; 

/*Para el siguiente desafío nos piden que obtengamos el título de todas las series y el total
de temporadas que tiene cada una de ellas.*/
select series.title, count(*) as temporadas  from seasons
inner join series on seasons.serie_id = series.id
group by series.title;

/*Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor
o igual a 3.*/
select genres.name, count(*) as 'total_peliculas' from genres
inner join movies ON genres.id = movies.genre_id
group by genres.name
having total_peliculas >= 3;




