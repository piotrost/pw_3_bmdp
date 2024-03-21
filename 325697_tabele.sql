----------------------------------------------------------------------------------------------
--------------------------------- Piotr Ostaszewski (325697) ---------------------------------
----------------------------------------------------------------------------------------------

-- plpgsql (już był samoistnie, ale na wszelki wypadek)
CREATE EXTENSIon IF NOT EXisTS plpgsql
    SCHEMA pg_catalog
    VERSIon "1.0";

-- postgis
CREATE EXTENSIon IF NOT EXisTS postgis
    SCHEMA public
    VERSIon "3.4.1";

-- SCHEMA: minibdot
CREATE SCHEMA IF NOT EXisTS minibdot
    AUTHorIZATIon postgres;

---------------------------------------------------------------------------------------------
--------------------------------------SŁOWNIKI-----------------------------------------------
---------------------------------------------------------------------------------------------

-- zrodlo danych
create table minibdot.ot_zrodlo_danych(
	id text primary key,
	nazwa text unique not null
);
create index on minibdot.ot_zrodlo_danych (id);
create index on minibdot.ot_zrodlo_danych (nazwa);

insert into minibdot.ot_zrodlo_danych (id, nazwa) values ('GEOS', 'bazaDanychGeodezyjnychGrawimetrycznych'),
	('EGiB', 'ewidencjaGruntowIBudynkow'), ('GESUT', 'geodezyjnaEwidencjaSieciUzbrojeniaTerenu'), ('PRG', 'bazaDanychPanstwowegoRejestruGranic'), ('PRNG', 'panstwowyRejestrNazwGeograficznych'), ('EMUiA', 'ewidencjaMiejscowosciUlicAdresow'),
	('RCiWN', 'rejestrCenWartosciNieruchomosci'), ('BDO', 'bazaDanychOgolnogeograficznych'), ('Ort', 'ortofotomapa'), ('Mz', 'mapaZasadnicza'), ('Mtp10', 'mapaTopograficzna10k'),
	('Mtp50', 'mapaTopograficzna50k'), ('VMAPL2_v1', 'vmapLevel2PierwszejEdycji'), ('VMAPL2_v2', 'vmapLevel2DrugiejEdycji'), ('TBD', 'bazaDanychTopograficznych'), ('CORINE', 'bazaDanychCLC'), ('CRFOP', 'centralnyRejestrFormOchronyPrzyrody'),
	('BDD', 'bankDanychDrogowych'), ('BDOT500', 'bazaDanychWgInstrK1'), ('KSOCH', 'krajowySystemObszarowChronionych'), ('LMN', 'lesnaMapaNumeryczna'), ('MPHP', 'mapaPodzialuHydrograficznegoPolsk'), ('PKP', 'bazyDanychPKP'),
	('RZAB', 'rejestrZabytkow'), ('TERYT', 'krajowyRejestrUrzedowyPodzialuTerytorialnegoKraju'), ('Str', 'pomiarStereoskopowy'), ('Trn', 'pomiarTerenowy');

-- kategoria istnienia
create table minibdot.ot_kat_istnienia(
	id text primary key,
	nazwa text unique not null
);
create index on minibdot.ot_kat_istnienia (id);
create index on minibdot.ot_kat_istnienia (nazwa);

insert into minibdot.ot_kat_istnienia (id, nazwa) values ('Eks', 'eksploatowany'), ('Bud', 'wBudowie'), ('Zns', 'zniszczony'), ('Tmc', 'tymczasowy'), ('Ncn', 'nieczynny');

-- rodzaj miejscowości
create table minibdot.ot_rodzaj_miejscowosci(
	id text primary key,
	nazwa text unique not null
);
create index on minibdot.ot_rodzaj_miejscowosci (id);
create index on minibdot.ot_rodzaj_miejscowosci (nazwa);

insert into minibdot.ot_rodzaj_miejscowosci (id, nazwa) values ('Ms', 'miasto'),
	('CMs', 'czescMiasta'), ('Ws', 'wies'), ('CWs', 'czescWsi'), (' Kl', 'kolonia'),
	('CKl', 'czescKolonii'), ('Osd', 'osada'), ('COsd', 'czescOsady'), ('Osl', 'osiedle'),
	('Prz', 'przysiolek'), ('Ls', 'lesniczowka'), ('Gj', 'gajowka'), ('Inn', 'innyObiekt');

-- kategoria dokladnosci geometrycznej
create table minibdot.ot_kat_dokl_geom(
	id text primary key,
	nazwa text unique not null
);
create index on minibdot.ot_kat_dokl_geom (id);
create index on minibdot.ot_kat_dokl_geom (nazwa);

insert into minibdot.ot_kat_dokl_geom (id, nazwa) values ('Dok', 'dokladny'), ('Prz', 'przyblizony'), ('Npw', 'niepewny');

-- rodzaj repr geom
create table minibdot.ot_rodzaj_repr_geom(
	id text primary key,
	nazwa text unique not null
);
create index on minibdot.ot_rodzaj_repr_geom (id);
create index on minibdot.ot_rodzaj_repr_geom (nazwa);

insert into minibdot.ot_rodzaj_repr_geom (id, nazwa) values ('SG', 'srodekGeometryczny'), ('MC', 'miejsceCharakterystyczne'), ('PU', 'punktUmowny'), ('OG', 'osGeometryczna'),
	('OI', 'osInterpolowana'), ('LU', 'liniaUmowna'), ('SL', 'sztucznyLacznik'),
	('KR', 'krawedz'), ('ZP', 'zarysPodstawy'), ('ZU', 'zasiegUmowny'),
	('MA', 'maksymalnyZasieg'), ('MI', 'minimalnyZasieg'), ('SZ', 'sredniZasieg');

-- rodzaj rezerwatu
create table minibdot.ot_rodzaj_rezerwatu(
	id text primary key,
	nazwa text unique not null
);
create index on minibdot.ot_rodzaj_rezerwatu (id);
create index on minibdot.ot_rodzaj_rezerwatu (nazwa);

insert into minibdot.ot_rodzaj_rezerwatu (id, nazwa) values ('Ls', 'lesny'), ('Wd', 'wodny'), ('St', 'stepowy'),
('Sl', 'slonoroslowy'), (' Fn', 'faunistyczny'), ('Fl', 'florystyczny'),
('Tf', 'torfowiskowy'), ('Pn', 'przyrodyNieozywionej'), ('Kr', 'krajobrazowy');

-- rodzaj jednostki administracyjnej
create table minibdot.ot_rodzaj_jednostki_administracyjnej(
	id text primary key,
	nazwa text unique not null
);
create index on minibdot.ot_rodzaj_jednostki_administracyjnej (id);
create index on minibdot.ot_rodzaj_jednostki_administracyjnej (nazwa);

insert into minibdot.ot_rodzaj_jednostki_administracyjnej (id, nazwa) values ('Pns', 'panstwo'), ('Woj', 'wojewodztwo'),
('Pow', 'powiat'), ('GM', 'gminaMiejska'), ('GW', 'gminaWiejska'), ('Gmw', 'gminaMiejskoWiejska'),
('CmG', 'miastoWGminieMiejskoWiejskiej'), ('CwG', 'obszarWiejskiWGminieMiejskoWiejskiej'), ('Dzl', 'dzielnica'), ('Dlg', 'delegatura');

---------------------------------------------------------------------------------------------
--------------------------------------TABELE-------------------------------------------------
---------------------------------------------------------------------------------------------

-- adms_a
create table minibdot.ot_adms_a(
	idiip text,
	czy_obiekt_bdoo boolean,
	x_kod text,
	x_kat_dokl_geom text,
	x_dokl_geom real,
	x_zrodlo_danych_g text,
	x_zrodlo_danych_a text,
	x_rodzaj_repr_geom text,
	x_uwagi text,
	x_uzytkownik text,
	x_aktualnosc_g date,
	x_aktualnosc_a date,
	poczatek_wersji_obiektu timestamptz,
	koniec_wersji_obiektu timestamptz,
	x_data_utworzenia date,
	x_inform_dodatkowa text,
	x_kat_istnienia text,
	nazwa text,
	geometria geometry(POLYGON, 2180),
	id_prng text,
	id_teryt_gmi text,
	liczba_mieszkancow integer,
	rodzaj text,
	siedziba_urzedu_gminy boolean,
	czesc_miejscowosci text,
	adja_a_id text
);

alter table minibdot.ot_adms_a add constraint adms_a_pk primary key (idiip);

-- adms_p
create table minibdot.ot_adms_p(
	idiip text,
	czy_obiekt_bdoo boolean ,
	x_kod text ,
	x_kat_dokl_geom text ,
	x_dokl_geom real,
	x_zrodlo_danych_g text ,
	x_zrodlo_danych_a text ,
	x_rodzaj_repr_geom text ,
	x_uwagi text,
	x_uzytkownik text ,
	x_aktualnosc_g date ,
	x_aktualnosc_a date ,
	poczatek_wersji_obiektu timestamptz ,
	koniec_wersji_obiektu timestamptz,
	x_data_utworzenia date ,
	x_inform_dodatkowa text,
	x_kat_istnienia text ,
	nazwa text ,
	geometria geometry(POINT, 2180) ,
	id_prng text ,
	id_teryt_gmi text ,
	liczba_mieszkancow integer,
	rodzaj text ,
	siedziba_urzedu_gminy boolean ,
	czesc_miejscowosci text,
	adja_a_id text
);

alter table minibdot.ot_adms_p add constraint adms_p_pk primary key (idiip);

-- adja_a
create table minibdot.ot_adja_a(
	idiip text,
	czy_obiekt_bdoo boolean ,
	x_kod text ,
	x_kat_dokl_geom text ,
	x_dokl_geom real,
	x_zrodlo_danych_g text ,
	x_zrodlo_danych_a text ,
	x_rodzaj_repr_geom text ,
	x_uwagi text,
	x_uzytkownik text ,
	x_aktualnosc_g date ,
	x_aktualnosc_a date ,
	poczatek_wersji_obiektu timestamptz ,
	koniec_wersji_obiektu timestamptz,
	x_data_utworzenia date ,
	x_inform_dodatkowa text,
	x_kat_istnienia text ,
	nazwa text ,
	geometria geometry(POLYGON, 2180) ,
	id_prg text,
	id_teryt_jednostki_nadrzednej text,
	id_teryt_terc text,
	rodzaj text
);
alter table minibdot.ot_adja_a add constraint adja_a_pk primary key (idiip);

-- tcrz_a
create table minibdot.ot_tcrz_a(
	idiip text,
	czy_obiekt_bdoo boolean ,
	x_kod text ,
	x_kat_dokl_geom text ,
	x_dokl_geom real,
	x_zrodlo_danych_g text ,
	x_zrodlo_danych_a text ,
	x_rodzaj_repr_geom text ,
	x_uwagi text,
	x_uzytkownik text ,
	x_aktualnosc_g date ,
	x_aktualnosc_a date ,
	poczatek_wersji_obiektu timestamptz ,
	koniec_wersji_obiektu timestamptz,
	x_data_utworzenia date ,
	x_inform_dodatkowa text,
	x_kat_istnienia text ,
	geometria geometry(POLYGON, 2180) ,
	idksoch text,
	rodzaj text,
	nazwa text
);

alter table minibdot.ot_tcrz_a add constraint tcrz_a_pk primary key (idiip);

---------------------------------------------------------------------------------------------
--------------------------------------INDEKSY------------------------------------------------
---------------------------------------------------------------------------------------------

-- adms_a
create index adms_a_geom_idx on minibdot.ot_adms_a using gist (geometria);
create index adms_a_pk_idx on minibdot.ot_adms_a (idiip);
create index adms_a_fk_x_kat_dokl_geom_idx on minibdot.ot_adms_a (x_kat_dokl_geom);
create index adms_a_fk_x_zrodlo_danych_g_idx on minibdot.ot_adms_a (x_zrodlo_danych_g);
create index adms_a_fk_x_zrodlo_danych_a_idx on minibdot.ot_adms_a (x_zrodlo_danych_a);
create index adms_a_fk_x_rodzaj_repr_geom_idx on minibdot.ot_adms_a (x_rodzaj_repr_geom);
create index adms_a_fk_x_kat_istnienia_idx on minibdot.ot_adms_a (x_kat_istnienia);
create index adms_a_fk_rodzaj_miejscowosci_idx on minibdot.ot_adms_a (rodzaj);
create index adms_a_fk_czesc_miejscowosci_idx on minibdot.ot_adms_a (czesc_miejscowosci);

create index adms_a_x_uzytkownik_idx on minibdot.ot_adms_a (x_uzytkownik);
create index adms_a_poczatek_wersji_obiektu_idx on minibdot.ot_adms_a (poczatek_wersji_obiektu);
create index adms_a_data_utworzenia_idx on minibdot.ot_adms_a (x_data_utworzenia);
create index adms_a_nazwa_idx on minibdot.ot_adms_a (nazwa);
create index adms_a_id_prng_idx on minibdot.ot_adms_a (id_prng);
create index adms_a_id_teryt_gmi_idx on minibdot.ot_adms_a (id_teryt_gmi);
create index adms_a_liczba_mieszkancow_idx on minibdot.ot_adms_a (liczba_mieszkancow);
create index adms_a_fk_adja_a_id_idx on minibdot.ot_adms_a (adja_a_id);

-- adms_p
create index adms_p_geom_idx on minibdot.ot_adms_p using gist (geometria);
create index adms_p_pk_idx on minibdot.ot_adms_p (idiip);
create index adms_p_fk_x_kat_dokl_geom_idx on minibdot.ot_adms_p (x_kat_dokl_geom);
create index adms_p_fk_x_zrodlo_danych_g_idx on minibdot.ot_adms_p (x_zrodlo_danych_g);
create index adms_p_fk_x_zrodlo_danych_a_idx on minibdot.ot_adms_p (x_zrodlo_danych_a);
create index adms_p_fk_x_rodzaj_repr_geom_idx on minibdot.ot_adms_p (x_rodzaj_repr_geom);
create index adms_p_fk_x_kat_istnienia_idx on minibdot.ot_adms_p (x_kat_istnienia);
create index adms_p_fk_rodzaj_miejscowosci_idx on minibdot.ot_adms_p (rodzaj);
create index adms_p_fk_czesc_miejscowosci_idx on minibdot.ot_adms_p (czesc_miejscowosci);

create index adms_p_x_uzytkownik_idx on minibdot.ot_adms_p (x_uzytkownik);
create index adms_p_poczatek_wersji_obiektu_idx on minibdot.ot_adms_p (poczatek_wersji_obiektu);
create index adms_p_data_utworzenia_idx on minibdot.ot_adms_p (x_data_utworzenia);
create index adms_p_nazwa_idx on minibdot.ot_adms_p (nazwa);
create index adms_p_id_prng_idx on minibdot.ot_adms_p (id_prng);
create index adms_p_id_teryt_gmi_idx on minibdot.ot_adms_p (id_teryt_gmi);
create index adms_p_liczba_mieszkancow_idx on minibdot.ot_adms_p (liczba_mieszkancow);
create index adms_p_fk_adja_a_id_idx on minibdot.ot_adms_p (adja_a_id);

-- adja_a
create index adja_a_geom_idx on minibdot.ot_adja_a using gist (geometria);
create index adja_a_pk_idx on minibdot.ot_adja_a (idiip);
create index adja_a_fk_x_kat_dokl_geom_idx on minibdot.ot_adja_a (x_kat_dokl_geom);
create index adja_a_fk_x_zrodlo_danych_g_idx on minibdot.ot_adja_a (x_zrodlo_danych_g);
create index adja_a_fk_x_zrodlo_danych_a_idx on minibdot.ot_adja_a (x_zrodlo_danych_a);
create index adja_a_fk_x_rodzaj_repr_geom_idx on minibdot.ot_adja_a (x_rodzaj_repr_geom);
create index adja_a_fk_x_kat_istnienia_idx on minibdot.ot_adja_a (x_kat_istnienia);
create index adja_a_fk_rodzaj_jednostki_administracyjnej_idx on minibdot.ot_adja_a (rodzaj);

create index adja_a_x_uzytkownik_idx on minibdot.ot_adja_a (x_uzytkownik);
create index adja_a_poczatek_wersji_obiektu_idx on minibdot.ot_adja_a (poczatek_wersji_obiektu);
create index adja_a_data_utworzenia_idx on minibdot.ot_adja_a (x_data_utworzenia);
create index adja_a_nazwa_idx on minibdot.ot_adja_a (nazwa);
create index adja_a_id_prg_idx on minibdot.ot_adja_a (id_prg);
create index adja_a_id_teryt_jednostki_nadrzednej_idx on minibdot.ot_adja_a (id_teryt_jednostki_nadrzednej);
create index adja_a_id_teryt_terc_idx on minibdot.ot_adja_a (id_teryt_terc);

-- tcrz_a
create index tcrz_a_geom_idx on minibdot.ot_tcrz_a using gist (geometria);
create index tcrz_a_pk_idx on minibdot.ot_tcrz_a (idiip);
create index tcrz_a_fk_x_kat_dokl_geom_idx on minibdot.ot_tcrz_a (x_kat_dokl_geom);
create index tcrz_a_fk_x_zrodlo_danych_g_idx on minibdot.ot_tcrz_a (x_zrodlo_danych_g);
create index tcrz_a_fk_x_zrodlo_danych_a_idx on minibdot.ot_tcrz_a (x_zrodlo_danych_a);
create index tcrz_a_fk_x_rodzaj_repr_geom_idx on minibdot.ot_tcrz_a (x_rodzaj_repr_geom);
create index tcrz_a_fk_x_kat_istnienia_idx on minibdot.ot_tcrz_a (x_kat_istnienia);
create index tcrz_a_fk_rodzaj_rez_idx on minibdot.ot_tcrz_a (rodzaj);

create index tcrz_a_x_uzytkownik_idx on minibdot.ot_tcrz_a (x_uzytkownik);
create index tcrz_a_poczatek_wersji_obiektu_idx on minibdot.ot_tcrz_a (poczatek_wersji_obiektu);
create index tcrz_a_data_utworzenia_idx on minibdot.ot_tcrz_a (x_data_utworzenia);
create index tcrz_a_id_ksoch_idx on minibdot.ot_tcrz_a (idksoch);
create index tcrz_a_nazwa_idx on minibdot.ot_tcrz_a (nazwa);

---------------------------------------------------------------------------------------------
--------------------------------------WIDOKI------------------------------------------------
---------------------------------------------------------------------------------------------

-- adms_a - widok zmaterializowany
create materialized view minibdot.adms_a_mv as
select a.idiip, a.nazwa, a.id_prng, a.id_teryt_gmi, a.liczba_mieszkancow,
	kd.nazwa as kategoria_dokladnosci_geometrycznej, zg.nazwa as zrodlo_danych_g, za.nazwa as zrodlo_danych_a, rg.nazwa as rodzaj_repr_geom, ki.nazwa as kategoria_istnienia, rm.nazwa as rodzaj_miejscowosci, cma.nazwa as czesc_miejscowosci	
from minibdot.ot_adms_a as a
left join minibdot.ot_kat_dokl_geom as kd
	on a.x_kat_dokl_geom = kd.id
left join minibdot.ot_zrodlo_danych as zg
	on a.x_zrodlo_danych_g = zg.id
left join minibdot.ot_zrodlo_danych as za
	on a.x_zrodlo_danych_a = za.id
left join minibdot.ot_rodzaj_repr_geom as rg
	on a.x_rodzaj_repr_geom = rg.id
left join minibdot.ot_kat_istnienia as ki
	on a.x_kat_istnienia = ki.id
left join minibdot.ot_rodzaj_miejscowosci as rm
	on a.rodzaj = rm.id
left join minibdot.ot_adms_a as cma
	on a.czesc_miejscowosci = cma.idiip;

create unique index adms_a_mv_pk_idx on minibdot.adms_a_mv (idiip);

-- adms_p
create materialized view minibdot.adms_p_mv as
select p.idiip, p.nazwa, p.id_prng, p.id_teryt_gmi, p.liczba_mieszkancow,
	kd.nazwa as kategoria_dokladnosci_geometrycznej, zg.nazwa as zrodlo_danych_g, za.nazwa as zrodlo_danych_a, rg.nazwa as rodzaj_repr_geom, ki.nazwa as kategoria_istnienia, rm.nazwa as rodzaj_miejscowosci, cma.nazwa as czesc_miejscowosci
from minibdot.ot_adms_p as p
left join minibdot.ot_kat_dokl_geom as kd
	on p.x_kat_dokl_geom = kd.id
left join minibdot.ot_zrodlo_danych as zg
	on p.x_zrodlo_danych_g = zg.id
left join minibdot.ot_zrodlo_danych as za
	on p.x_zrodlo_danych_a = za.id
left join minibdot.ot_rodzaj_repr_geom as rg
	on p.x_rodzaj_repr_geom = rg.id
left join minibdot.ot_kat_istnienia as ki
	on p.x_kat_istnienia = ki.id
left join minibdot.ot_rodzaj_miejscowosci as rm
	on p.rodzaj = rm.id
left join minibdot.ot_adms_a as cma
	on p.czesc_miejscowosci = cma.idiip;

create unique index adms_p_mv_pk_idx on minibdot.adms_p_mv (idiip);

-- tcrz_a
create materialized view minibdot.tcrz_a_mv as
select a.idiip, a.nazwa, a.idksoch, a.poczatek_wersji_obiektu, a.x_uzytkownik as autor_wersji_obiektu, a.x_inform_dodatkowa as liczba_wierzcholkow_obiektu,
	kd.nazwa as kategoria_dokladnosci_geometrycznej, zg.nazwa as zrodlo_danych_g, za.nazwa as zrodlo_danych_a, rg.nazwa as rodzaj_repr_geom, ki.nazwa as kategoria_istnienia, rm.nazwa as rodzaj_rezerwatu
from minibdot.ot_tcrz_a as a
left join minibdot.ot_kat_dokl_geom as kd
	on a.x_kat_dokl_geom = kd.id
left join minibdot.ot_zrodlo_danych as zg
	on a.x_zrodlo_danych_g = zg.id
left join minibdot.ot_zrodlo_danych as za
	on a.x_zrodlo_danych_a = za.id
left join minibdot.ot_rodzaj_repr_geom as rg
	on a.x_rodzaj_repr_geom = rg.id
left join minibdot.ot_kat_istnienia as ki
	on a.x_kat_istnienia = ki.id
left join minibdot.ot_rodzaj_rezerwatu as rm
	on a.rodzaj = rm.id;

create unique index tcrz_a_mv_pk_idx on minibdot.tcrz_a_mv (idiip);