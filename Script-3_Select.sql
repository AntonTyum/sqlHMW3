
SELECT Жанры.Название_жанра, COUNT(Жанры_исполнителей.ID_исполнителя) AS Количество_исполнителей
FROM Жанры
JOIN Жанры_исполнителей ON Жанры.ID_жанра = Жанры_исполнителей.ID_жанра
GROUP BY Жанры.Название_жанра;


SELECT COUNT(Треки.ID_трека) AS Количество_треков 
FROM Треки
JOIN Альбомы ON Треки.ID_альбома = Альбомы.ID_альбома
WHERE Альбомы.Год_выпуска BETWEEN 2019 AND 2020;


SELECT Альбомы.Название_альбома, AVG(Треки.Длительность) AS Средняя_длительность
FROM Треки
JOIN Альбомы ON Треки.ID_альбома = Альбомы.ID_альбома
GROUP BY Альбомы.Название_альбома;


SELECT Исполнители.Название_исполнителя
FROM Исполнители
LEFT JOIN Альбом_исполнителя ON Исполнители.ID_исполнителя = Альбом_исполнителя.ID_исполнителя
LEFT JOIN Альбомы ON Альбом_исполнителя.ID_альбома = Альбомы.ID_альбома
WHERE Альбомы.Год_выпуска IS NULL OR Альбомы.Год_выпуска <> 2020;


SELECT DISTINCT Сборники.Название_сборника
FROM Сборники
JOIN Треки_в_сборниках ON Сборники.ID_сборника = Треки_в_сборниках.ID_сборника
JOIN Треки ON Треки.ID_трека = Треки_в_сборниках.ID_трека
JOIN Альбомы ON Альбомы.ID_альбома = Треки.ID_альбома
JOIN Альбом_исполнителя ON Альбомы.ID_альбома = Альбом_исполнителя.ID_альбома
JOIN Исполнители ON Альбом_исполнителя.ID_исполнителя = Исполнители.ID_исполнителя
WHERE Исполнители.Название_исполнителя = 'Кино';
