CREATE TABLE computers (
id SERIAL PRIMARY KEY,
brendi VARCHAR(50),
model VARCHAR(50) NOT NULL,
cpu VARCHAR(50),
ram INT,
xotira VARCHAR(50),
narxi DECIMAL(10,2) NOT NULL CHECK (narxi >= 700),
soni INT
);

CREATE TABLE users (
id SERIAL PRIMARY KEY,
ism_familiya VARCHAR(100) NOT NULL UNIQUE,
telefon_raqami VARCHAR(20),
sohasi VARCHAR(50),
qurilmaID INT,
FOREIGN KEY (qurilmaID) REFERENCES computers(id)
);

INSERT INTO computers (brendi, model, cpu, ram, xotira, narxi, soni)
VALUES
('HP', 'EliteBook 840', 'Intel i5', 8, '256', 800.00, 20),
('Dell', 'XPS 13', 'Intel i7', 16, '512', 1200.00, 10),
('Apple', 'MacBook Pro', 'M2', 16, '1000', 1800.00, 15),
('Lenovo', 'ThinkPad L15', 'AMD Ryzen 5', 8, '512', 850.00, 12),
('Asus', 'ZenBook 14', 'Intel i7', 16, '1000', 1100.00, 8);

INSERT INTO users (ism_familiya, telefon_raqami, sohasi, qurilmaID)
VALUES
('Ali Valiyev', '+998901234567', 'IT', 2),
('Zuhra Karimova', '+998931112233', 'Accounting', 1),
('Sardor Rahimzoda', '+998948887766', 'HR', 4),
('Olim Toshmatov', '+998993332211', 'Design', 3);

ALTER TABLE computers RENAME COLUMN ram TO tezkor_xotira;

ALTER TABLE users RENAME COLUMN sohasi TO soha;

ALTER TABLE users RENAME TO foydalanuvchilar;

ALTER TABLE foydalanuvchilar DROP COLUMN telefon_raqami;

SELECT
f.ism_familiya,
c.brendi,
c.soni
FROM foydalanuvchilar f
JOIN computers c ON f.qurilmaID = c.id;

SELECT
c.model,
c.xotira
FROM foydalanuvchilar f
JOIN computers c ON f.qurilmaID = c.id
WHERE f.soha = 'Design';

SELECT
f.*,
c.narxi
FROM foydalanuvchilar f
JOIN computers c ON f.qurilmaID = c.id
WHERE c.narxi = (SELECT MAX(narxi) FROM computers);

SELECT COUNT(*) AS xotira_512_soni
FROM computers
WHERE xotira = '512';
