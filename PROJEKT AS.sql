CREATE DATABASE Sklep_odziezowy;
USE Sklep_odziezowy;

CREATE TABLE Producenci (
	ID_Producenta VARCHAR(4) PRIMARY KEY,
    Nazwa_Producenta TEXT,
    Adres_Producenta TEXT,
    NIP_Producenta INTEGER, CHECK(1000000000<=NIP_Producenta<=9999999999),
    Data_umowy_z_producentem DATE
    );
    
CREATE TABLE Produkty (
	ID_Produktu VARCHAR(6) PRIMARY KEY,
    ID_Producenta VARCHAR(4),
    Nazwa_produktu TEXT,  
    Opis_produktu TEXT,
    Cena_netto_zakupu INTEGER NOT NULL,
    Cena_brutto_zakupu INTEGER NOT NULL,
    Cena_netto_sprzedaży INTEGER, CHECK(Cena_netto_zakupu<Cena_netto_sprzedaży),
    Cena_brutto_sprzedaży INTEGER, CHECK(Cena_brutto_zakupu<Cena_brutto_sprzedaży),
    Procent_VAT_sprzedaży INTEGER, CHECK(Procent_VAT_sprzedaży=23 OR Procent_VAT_sprzedaży=8 OR Procent_VAT_sprzedaży=5)
    );
    
CREATE TABLE Zamowienia (
	ID_Zamówienia VARCHAR(5) PRIMARY KEY,
    ID_Klienta VARCHAR(4),
    ID_Produktu VARCHAR(6),
    Data_zamówienia DATE
    );

CREATE TABLE Klienci (
    ID_Klienta VARCHAR(4) PRIMARY KEY,
    ID_zamówienia VARCHAR(5),
    Imie TEXT,
    Nazwisko TEXT,
    Adres TEXT
    );

ALTER TABLE Produkty ADD CONSTRAINT Producenci_fk FOREIGN KEY (ID_Producenta) REFERENCES Producenci(ID_Producenta);
ALTER TABLE Zamowienia ADD CONSTRAINT Produkty_fk FOREIGN KEY (ID_Produktu) REFERENCES Produkty(ID_Produktu);
ALTER TABLE Klienci ADD CONSTRAINT Zamówienia_fk FOREIGN KEY (ID_Zamówienia) REFERENCES Zamowienia(ID_Zamówienia);

INSERT INTO Producenci
	VALUES ("P001", "Szanel", "Fabryczna 1 Niu Jork", 1111111111, "2000-01-01"),
		("P002", "DolczeGabana", "Robotnicza 20 Los Andzeles", 222222222, "2005-01-01"),
        ("P003", "Orsej", "Kolaczowa 30 San Franczisko", 333333333, "2003-01-01"),
        ("P004", "Barbery", "Wakacyjna 40 Ditroit", 444444444, "2002-01-01");
INSERT INTO Produkty
	VALUES ("I00001", "P001", "Sukienka", "Dżersej", 500, 500*1.23, 1000, 1000*1.23, 23),
		("I00002", "P001", "Sukienka", "Weselna", 1500, 1500*1.23, 2000, 2000*1.23, 23),
        ("I00003", "P001", "Sukienka", "Plażowa", 2500, 2500*1.23, 3000, 3000*1.23, 23),
        ("I00004", "P001", "Sukienka", "Tulipan", 4500, 4500*1.23, 5000, 5000*1.23, 23),
        ("I00005", "P002", "Sukienka", "Letnia", 7500, 7500*1.23, 8000, 8000*1.23, 23),
        ("I00006", "P003", "Sukienka", "Jedwabna", 10500, 10500*1.23, 15000, 15000*1.23, 23),
        ("I00007", "P004", "Sukienka", "Grecka", 8500, 8500*1.23, 9000, 9000*1.23, 23),
        ("I00008", "P001", "Sukienka", "Rozkloszowana", 5500, 5500*1.23, 6000, 6000*1.23, 23),
        ("I00009", "P001", "Sukienka", "Szmizjerka", 2500, 2500*1.23, 3500, 3500*1.23, 23),
        ("I00010", "P002", "Sukienka", "Boho", 9500, 9500*1.23, 11000, 11000*1.23, 23),
        ("I00011", "P003", "Sukienka", "Biznesowa", 4500, 4500*1.23, 5000, 5000*1.23, 23),
        ("I00012", "P003", "Sukienka", "Koktajlowa", 4500, 4500*1.23, 6000, 6000*1.23, 23),
        ("I00013", "P003", "Sukienka", "Mała czarna", 5500, 5500*1.23, 7000, 7000*1.23, 23),
        ("I00014", "P003", "Sukienka", "Ołowkoa", 8500, 8500*1.23, 9000, 9000*1.23, 23),
        ("I00015", "P004", "Sukienka", "Etui", 8500, 8500*1.23, 10000, 10000*1.23, 23),
        ("I00016", "P004", "Sukienka", "Klepsydra", 5500, 5500*1.23, 8000, 8000*1.23, 23),
        ("I00017", "P001", "Sukienka", "Bombka", 4000, 4000*1.23, 5600, 5600*1.23, 23),
        ("I00018", "P001", "Sukienka", "Prosta", 3400, 3400*1.23, 4200, 4200*1.23, 23),
        ("I00019", "P002", "Sukienka", "Długa", 1500, 1500*1.23, 2200, 2200*1.23, 23),
        ("I00020", "P002", "Sukienka", "Trapezowa", 600, 600*1.23, 1100, 1100*1.23, 23);

INSERT INTO Zamowienia
	VALUES ("Z0001", "P002","I00019", "2021-10-10"),
		("Z0002", "P002","I00019", "2021-10-11"),
        ("Z0003", "P003","I00014", "2021-10-14"),
        ("Z0004", "P004","I00015", "2021-10-14"),
        ("Z0005", "P001","I00017", "2021-10-15"),
        ("Z0006", "P001","I00018", "2021-10-20"),
        ("Z0007", "P002","I00010", "2021-10-21"),
        ("Z0008", "P002","I00005", "2021-10-08"),
        ("Z0009", "P004","I00007", "2021-10-08"),
        ("Z0010", "P003","I00006", "2021-10-01");
        
INSERT INTO Klienci
	VALUES ("K001", "Z0001", "Lejdi", "Gaga", "ul. Pokerface New York"),
		("K002", "Z0003", "Kejti", "Pery", "ul. Roar Santa Barbara"),
        ("K003", "Z0006", "Bejonce", "Knołels", "ul. Single Lady Houston"),
        ("K004", "Z0009", "Adriana", "Granda", "ul. Positions Floryda"),
        ("K005", "Z0005", "Britnej", "Spirs", "ul. Oops McComb"),
        ("K006", "Z0002", "Kristina", "Agilera", "ul. Hurt New York"),
        ("K007", "Z0004", "Taylor", "Słift", "ul. Shake it Pensylwania"),
        ("K008", "Z0007", "Duła", "Lipa", "ul. Physical London"),
        ("K009", "Z0008", "Selena", "Gomes", "ul. Wolves Texas"),
        ("K010", "Z0010", "Maili", "Cajrus", "ul. Wrecking Ball Franklin");
        
-- 8. Wyświetl wszystkie produkty z wszystkimi danymi od producenta który znajduje się na pozycji 1 w tabeli „Producenci” 
SELECT *
FROM Produkty
JOIN Producenci
WHERE Producenci.ID_Producenta="P001";

-- 9. Posortuj te produkty alfabetycznie po nazwie
SELECT *
FROM Produkty
JOIN Producenci
WHERE Producenci.ID_Producenta="P001"
ORDER BY Produkty.Nazwa_produktu;

-- 10. Wylicz średnią cenę za produktu od producenta z pozycji 1
SELECT Producenci.ID_Producenta, Producenci.Nazwa_producenta, ROUND(AVG(Cena_netto_zakupu),2) AS "średnia cena netto", ROUND(AVG(Cena_brutto_zakupu),2) AS "średnia cena brutto"
FROM Produkty
JOIN Producenci
ON Producenci.ID_Producenta=Produkty.ID_Producenta
WHERE Producenci.ID_Producenta="P001";

--  11. Wyświetl dwie grupy produktów tego producenta:
WITH Producent_P001	AS(
	SELECT 
		Producenci.ID_Producenta, 
        Producenci.Nazwa_producenta, 
        Produkty.ID_Produktu, 
        Produkty.Nazwa_produktu, 
        Produkty.cena_netto_zakupu
	FROM Produkty
	JOIN Producenci
	ON Producenci.ID_Producenta=Produkty.ID_Producenta
	WHERE Producenci.ID_Producenta="P001"
    GROUP BY Produkty.ID_produktu
    )
    SELECT *,
		CASE
			WHEN Producent_P001.cena_netto_zakupu<(SELECT AVG(Produkty.cena_netto_zakupu) FROM Produkty WHERE ID_Producenta="P001") THEN "Tanie"
            ELSE "Drogie"
		END AS "Rodzaj"
    FROM Producent_P001
    GROUP BY Producent_P001.ID_Produktu
    HAVING AVG(Producent_P001.cena_netto_zakupu);

-- 12. Wyświetl produkty zamówione, wyświetlając tylko ich nazwę

SELECT Produkty.ID_produktu, Produkty.Nazwa_produktu
FROM Produkty
JOIN Zamowienia
ON Zamowienia.ID_produktu=Produkty.ID_Produktu;
-- dodałam też ID produktu, ponieważ wszystkie nazwy są takie same :)

-- 13. Wyświetl wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji

SELECT Produkty.ID_produktu, Produkty.Nazwa_produktu
FROM Produkty
JOIN Zamowienia
ON Zamowienia.ID_produktu=Produkty.ID_Produktu
LIMIT 5;

-- 14. Policz łączną wartość wszystkich zamówień

SELECT SUM(Produkty.cena_brutto_sprzedaży) AS wartosc_wszystkich_zamowien
FROM Zamowienia
JOIN Produkty
ON Zamowienia.ID_produktu=Produkty.ID_Produktu;

-- 15. Wyświetl wszystkie zamówienia wraz z nazwą produktu sortując je wg daty od najstarszego do najnowszego
SELECT Zamowienia.ID_zamówienia, Zamowienia.ID_Produktu, Produkty.Nazwa_produktu, Zamowienia.Data_zamówienia
FROM Zamowienia
JOIN Produkty
ON Zamowienia.ID_Produktu=Produkty.ID_Produktu
ORDER BY Zamowienia.Data_zamówienia ASC;

-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych
SELECT *
FROM Produkty
WHERE 
ID_Produktu IS NULL
OR ID_Producenta IS NULL
OR Nazwa_produktu IS NULL
OR Opis_Produktu IS NULL
OR cena_netto_zakupu IS NULL
OR cena_netto_zakupu IS NULL
OR cena_netto_sprzedaży IS NULL
OR cena_brutto_sprzedaży IS NULL
OR procent_VAT_Sprzedaży IS NULL;

-- 17. Wyświetl produkt najczęściej sprzedawany wraz z jego ceną
SELECT Produkty.ID_produktu, Produkty.Nazwa_Produktu, Produkty.cena_netto_sprzedaży, COUNT(Zamowienia.ID_Produktu) AS ilosc_zamowien
FROM Produkty
JOIN Zamowienia
ON Produkty.ID_Produktu=Zamowienia.ID_Produktu
GROUP BY Zamowienia.ID_Produktu
HAVING COUNT(*)=
	(
    SELECT MAX(ilosc_zamowien)
		FROM
        (
        SELECT 
			Produkty.ID_produktu, 
            Produkty.Nazwa_Produktu, 
            Produkty.cena_netto_sprzedaży, 
            COUNT(Zamowienia.ID_Produktu) AS ilosc_zamowien 
            FROM Produkty 
            JOIN Zamowienia 
            ON Produkty.ID_Produktu=Zamowienia.ID_Produktu 
            GROUP BY Zamowienia.ID_Produktu) 
		ilosc_zamowien
            );

-- 18. Znajdź dzień w którym najwięcej zostało złożonych zamówień
SELECT Zamowienia.Data_zamówienia, COUNT(Zamowienia.ID_Produktu) AS ilosc_zamowien_na_dzien
FROM Zamowienia
GROUP BY Zamowienia.Data_zamówienia
HAVING COUNT(*)=
	(
    SELECT MAX(ilosc_zamowien_na_dzien)
		FROM
        (
        SELECT 
			Zamowienia.Data_zamówienia,
            COUNT(Zamowienia.ID_Produktu) AS ilosc_zamowien_na_dzien 
            FROM Zamowienia
           GROUP BY Zamowienia.Data_zamówienia) 
		ilosc_zamowien_na_dzien
            );

    
