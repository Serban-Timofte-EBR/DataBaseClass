-- 1 
CREATE TABLE Dep(
    ID NUMBER(7) CONSTRAINT pk_id_dep PRIMARY KEY,
    Denumire VARCHAR2(25)
);

-- 2
INSERT INTO Dep
SELECT id_departament, denumire_departament FROM Departamente;

-- 3
CREATE TABLE Ang(
    ID NUMBER(7) CONSTRAINT pk_id_ang PRIMARY KEY,
    Prenume VARCHAR2(25),
    Nume VARCHAR(25),
    Dep_ID NUMBER(7),
    CONSTRAINT fk_departamente_ang FOREIGN KEY(Dep_ID) REFERENCES Dep(ID)
);

-- 4
ALTER TABLE Ang 
ADD varsta NUMBER(2);

-- 5
ALTER TABLE Ang
ADD CONSTRAINT Verificare_varsta CHECK(varsta>=18 AND varsta<=65);

-- 6 
ALTER TABLE Ang
DISABLE CONSTRAINT Verificare_varsta;

-- 7 
ALTER TABLE Ang
MODIFY Nume VARCHAR2(30);

-- 8
ALTER TABLE Ang
RENAME TO Ang2;

-- 9
CREATE TABLE SalariatiEx9 -- Am ales numele SalatiatiEx9, deoarece "Name Salariati is already in use" 
AS SELECT * FROM Angajati
WHERE 1=1;

-- 10
INSERT INTO SalariatiEx9
VALUES (1, 'Steven', 'Kong', 'SKONG', '515.123.4567', TO_DATE('17-06-1987', 'DD-MM-YYYY'), 'AD_PRES', 24000, 0.1, NULL, 90)

INSERT INTO SalariatiEx9
VALUES (2, 'Neena', 'Koch', 'NKOCH', '515.123.4568', TO_DATE('21-09-1989', 'DD-MM-YYYY'), 'AD_VP', 17000, 0.1, 100, 90)

INSERT INTO SalariatiEx9
VALUES (3, 'Lex', 'Haan', 'LHAAN', '515.123.4569', TO_DATE('13-01-1993', 'DD-MM-YYYY'), 'AD_VP', 17000, 0.2, 100, 90)

-- 11
UPDATE SalariatiEx9
SET Prenume = 'John'
WHERE id_angajat = 3

-- 12
UPDATE SalariatiEx9
SET email = 'JHAAN'
WHERE id_angajat = 3

-- 13
UPDATE SalariatiEx9
SET salariul = salariul + 0.1*salariul
WHERE salariul < 20000

-- 14
UPDATE SalariatiEx9
SET id_functie = 'AD_PRES'
WHERE id_angajat = 2

-- 15
UPDATE SalariatiEx9
SET comision = (SELECT comision FROM SalariatiEx9
                WHERE id_angajat = 3)
WHERE id_angajat = 2

-- 16
DELETE FROM SalariatiEx9
WHERE id_angajat = 1