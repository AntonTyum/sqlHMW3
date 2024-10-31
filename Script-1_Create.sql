CREATE TABLE Исполнители (
    ID_исполнителя SERIAL PRIMARY KEY,
    Название_исполнителя VARCHAR(255)
);

CREATE TABLE Жанры (
    ID_жанра SERIAL PRIMARY KEY,
    Название_жанра VARCHAR(255) UNIQUE
);

CREATE TABLE Альбомы (
    ID_альбома SERIAL PRIMARY KEY,
    Название_альбома VARCHAR(255),
    Год_выпуска INT CHECK (Год_выпуска >= 1900)
);

CREATE TABLE Треки (
    ID_трека SERIAL PRIMARY KEY,
    Название_трека VARCHAR(255),
    ID_альбома INT,
    Длительность INT,
    FOREIGN KEY (ID_альбома) REFERENCES Альбомы (ID_альбома)
);

CREATE TABLE Сборники (
    ID_сборника SERIAL PRIMARY KEY,
    Название_сборника VARCHAR(255),
    Год_выпуска INT CHECK (Год_выпуска >= 1900)
);

CREATE TABLE Треки_в_сборниках (
    ID_сборника INT,
    ID_трека INT,
    Номер_трека_в_сборнике INT,
    FOREIGN KEY (ID_сборника) REFERENCES Сборники(ID_сборника),
    FOREIGN KEY (ID_трека) REFERENCES Треки(ID_трека),
    PRIMARY KEY (ID_сборника, ID_трека)
);

CREATE TABLE Жанры_исполнителей (
    ID_исполнителя INT,
    ID_жанра INT,
    FOREIGN KEY (ID_исполнителя) REFERENCES Исполнители(ID_исполнителя),
    FOREIGN KEY (ID_жанра) REFERENCES Жанры(ID_жанра),
    PRIMARY KEY (ID_исполнителя, ID_жанра)
);

CREATE TABLE Альбом_исполнителя (
    ID_альбома INT,
    ID_исполнителя INT,
    FOREIGN KEY (ID_альбома) REFERENCES Альбомы (ID_альбома),
    FOREIGN KEY (ID_исполнителя) REFERENCES Исполнители(ID_исполнителя),
    PRIMARY KEY (ID_альбома, ID_исполнителя)
);
