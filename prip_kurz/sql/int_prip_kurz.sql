/*
 ins_prip_kurz.sql
 Zaznamy do DB prip_kurz.
 */

-- automaticke potvrzovani transakci
set autocommit=1; -- vychozi chovani

set autocommit=0; -- rucni potvrzovani transakci 
                  -- bud COMMIT; pro potbvrzeni
                  -- nebo ROLLBACK; pro odvolani

-- kurzy
-- id 1
INSERT INTO kurzy (predmet, pocet_lekci, kapacita, cena) 
VALUES ('M', 15, 15, 1400);

INSERT INTO kurzy (predmet, pocet_lekci, kapacita, cena) 
VALUES ('CJ', 7, 15, 1400);

INSERT INTO kurzy (predmet, pocet_lekci, kapacita, cena) 
VALUES ('ECDL', 7, 15, 400);

-- id 4
INSERT INTO kurzy (predmet, pocet_lekci, kapacita, cena) 
VALUES ('M', 15, 15, 1400);

delete from kurzy
where id >= 4; -- smazu dupl. M a vse co je po ni

-- ------------------------------------------

-- uzivatele
delete from uzivatele where id > 0;

insert into uzivatele(id, email, heslo, role, telefon)
values ('1', 'admin@neco.cz', '12345', 'admin', NULL);

insert into uzivatele(id, email, heslo, role, telefon)
values('2', 'novy@seznam.cz', '12345', 'user', NULL);
-- zmena zaznamu
update uzivatele set email='stary@seznam.cz' where id=2;

insert into uzivatele(id, email, heslo, role, telefon)
values(3, 'novak@seznam.cz', '12345', 'user', NULL);

-- pozn. - mame autocommit=0

insert into uzivatele(id, email, heslo, role)
values(4, 'ctvrty@neco.cz', '13245', 'user');

ALTER TABLE uzivatele MODIFY id INTEGER NOT NULL AUTO_INCREMENT;

INSERT INTO UZIVATELE(id, email, heslo, role, telefon)
VALUES('4', 'treti@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(id, email, heslo, role, telefon)
VALUES('5', 'paty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(id, email, heslo, role, telefon)
VALUES('6', 'sesty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(id, email, heslo, role, telefon)
VALUES('7', 'sedmy@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(id, email, heslo, role, telefon)
VALUES('8', 'osmy@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(id, email, heslo, role, telefon)
VALUES('9', 'devaty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(id, email, heslo, role, telefon)
VALUES('10', 'desaty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(email, heslo, role, telefon)
VALUES('jedenacty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(email, heslo, role, telefon)
VALUES('dvanacty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(email, heslo, role, telefon)
VALUES('trinacty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(email, heslo, role, telefon)
VALUES('ctrnacty@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(email, heslo, role, telefon)
VALUES('novy@seznam.cz', '12345', 'user', NULL);

INSERT INTO UZIVATELE(email, heslo, role, telefon)
VALUES('nova@seznam.cz', '12345', 'user', NULL);

update uzivatele set email = 'ctvrty@seznam.cz' where id = 4;

update uzivatele set email = 'treti@seznam.cz' where id = 3;

update uzivatele set email = 'druhy@seznam.cz' where id = 2;

update uzivatele set email = 'admin@seznam.cz' where id = 1;

update uzivatele set heslo = '11111' where id = 1;

-- rollback; -- rozmyslel jsem si to a vlozeni uziv. id=4 odvolavam

commit; -- potvrzeni transakce, tj. persistence (zapis do DB souboru)



-- uchazeci
desc uchazeci;

ALTER TABLE uchazeci MODIFY id INTEGER NOT NULL AUTO_INCREMENT;

insert into uchazeci(jmeno, prijmeni, uzivatele_id, kurzy_id, ulice, psc, mesto)
values('A', 'Dva', '2', '1', null, null, null);

insert into uchazeci(jmeno, prijmeni, uzivatele_id, kurzy_id, ulice, psc, mesto)
values('B', 'Dva', '2', '2', null, null, null);

insert into uchazeci(jmeno, prijmeni, uzivatele_id, kurzy_id, ulice, psc, mesto)
values('C', 'Dva', '2', '3', null, null, null);

insert into uchazeci(jmeno, prijmeni, uzivatele_id, kurzy_id, ulice, psc, mesto)
values('D', 'Dva', '2', '1', null, null, null);

insert into uchazeci(jmeno, prijmeni, uzivatele_id, kurzy_id, ulice, psc, mesto)
values('E', 'Dva', '2', '2', null, null, null);

delete from uzivatele where email = 'kon.sabik@gmail.com';

insert into uzivatele(email, heslo, telefon)
VALUES('kon.sabik@gmail.com', '1234', '');