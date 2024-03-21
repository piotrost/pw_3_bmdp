---------------------------------------------------------------------------------------------
--------------------------------------NOT NULL------------------------------------------------
---------------------------------------------------------------------------------------------

-- adms_a
alter table minibdot.ot_adms_a alter column czy_obiekt_bdoo set not null;
alter table minibdot.ot_adms_a alter column x_kod set not null;
alter table minibdot.ot_adms_a alter column x_kat_dokl_geom set not null;
alter table minibdot.ot_adms_a alter column x_zrodlo_danych_g set not null;
alter table minibdot.ot_adms_a alter column x_zrodlo_danych_a set not null;
alter table minibdot.ot_adms_a alter column x_rodzaj_repr_geom set not null;
alter table minibdot.ot_adms_a alter column x_uzytkownik set not null;
alter table minibdot.ot_adms_a alter column x_aktualnosc_g set not null;
alter table minibdot.ot_adms_a alter column x_aktualnosc_a set not null;
alter table minibdot.ot_adms_a alter column poczatek_wersji_obiektu set not null;
alter table minibdot.ot_adms_a alter column x_data_utworzenia set not null;
alter table minibdot.ot_adms_a alter column x_kat_istnienia set not null;
alter table minibdot.ot_adms_a alter column nazwa set not null;
alter table minibdot.ot_adms_a alter column geometria set not null;
alter table minibdot.ot_adms_a alter column id_prng set not null;
alter table minibdot.ot_adms_a alter column id_teryt_gmi set not null;
alter table minibdot.ot_adms_a alter column rodzaj set not null;
alter table minibdot.ot_adms_a alter column siedziba_urzedu_gminy set not null;
alter table minibdot.ot_adms_a alter column adja_a_id set not null;

-- adms_p
alter table minibdot.ot_adms_p alter column czy_obiekt_bdoo set not null;
alter table minibdot.ot_adms_p alter column x_kod set not null;
alter table minibdot.ot_adms_p alter column x_kat_dokl_geom set not null;
alter table minibdot.ot_adms_p alter column x_zrodlo_danych_g set not null;
alter table minibdot.ot_adms_p alter column x_zrodlo_danych_a set not null;
alter table minibdot.ot_adms_p alter column x_rodzaj_repr_geom set not null;
alter table minibdot.ot_adms_p alter column x_uzytkownik set not null;
alter table minibdot.ot_adms_p alter column x_aktualnosc_g set not null;
alter table minibdot.ot_adms_p alter column x_aktualnosc_a set not null;
alter table minibdot.ot_adms_p alter column poczatek_wersji_obiektu set not null;
alter table minibdot.ot_adms_p alter column x_data_utworzenia set not null;
alter table minibdot.ot_adms_p alter column x_kat_istnienia set not null;
alter table minibdot.ot_adms_p alter column nazwa set not null;
alter table minibdot.ot_adms_p alter column geometria set not null;
alter table minibdot.ot_adms_p alter column id_prng set not null;
alter table minibdot.ot_adms_p alter column id_teryt_gmi set not null;
alter table minibdot.ot_adms_p alter column rodzaj set not null;
alter table minibdot.ot_adms_p alter column siedziba_urzedu_gminy set not null;
alter table minibdot.ot_adms_p alter column adja_a_id set not null;

-- adja_a
alter table minibdot.ot_adja_a alter column czy_obiekt_bdoo set not null;
alter table minibdot.ot_adja_a alter column x_kod set not null;
alter table minibdot.ot_adja_a alter column x_kat_dokl_geom set not null;
alter table minibdot.ot_adja_a alter column x_zrodlo_danych_g set not null;
alter table minibdot.ot_adja_a alter column x_zrodlo_danych_a set not null;
alter table minibdot.ot_adja_a alter column x_rodzaj_repr_geom set not null;
alter table minibdot.ot_adja_a alter column x_uzytkownik set not null;
alter table minibdot.ot_adja_a alter column x_aktualnosc_g set not null;
alter table minibdot.ot_adja_a alter column x_aktualnosc_a set not null;
alter table minibdot.ot_adja_a alter column poczatek_wersji_obiektu set not null;
alter table minibdot.ot_adja_a alter column x_data_utworzenia set not null;
alter table minibdot.ot_adja_a alter column x_kat_istnienia set not null;
alter table minibdot.ot_adja_a alter column nazwa set not null;
alter table minibdot.ot_adja_a alter column geometria set not null;
alter table minibdot.ot_adja_a alter column id_prg set not null;
alter table minibdot.ot_adja_a alter column id_teryt_terc set not null;
alter table minibdot.ot_adja_a alter column rodzaj set not null;

-- tcrz_a
alter table minibdot.ot_tcrz_a alter column czy_obiekt_bdoo set not null;
alter table minibdot.ot_tcrz_a alter column x_kod set not null;
alter table minibdot.ot_tcrz_a alter column x_kat_dokl_geom set not null;
alter table minibdot.ot_tcrz_a alter column x_zrodlo_danych_g set not null;
alter table minibdot.ot_tcrz_a alter column x_zrodlo_danych_a set not null;
alter table minibdot.ot_tcrz_a alter column x_rodzaj_repr_geom set not null;
alter table minibdot.ot_tcrz_a alter column x_uzytkownik set not null;
alter table minibdot.ot_tcrz_a alter column x_aktualnosc_g set not null;
alter table minibdot.ot_tcrz_a alter column x_aktualnosc_a set not null;
alter table minibdot.ot_tcrz_a alter column poczatek_wersji_obiektu set not null;
alter table minibdot.ot_tcrz_a alter column x_data_utworzenia set not null;
alter table minibdot.ot_tcrz_a alter column x_kat_istnienia set not null;
alter table minibdot.ot_tcrz_a alter column geometria set not null;
alter table minibdot.ot_tcrz_a alter column rodzaj set not null;

---------------------------------------------------------------------------------------------
--------------------------------------CONSTRAINTY--------------------------------------------
---------------------------------------------------------------------------------------------

-- adja_a
alter table minibdot.ot_adja_a add constraint adja_a_fk_x_kat_dokl_geom foreign key (x_kat_dokl_geom) references minibdot.ot_kat_dokl_geom (id);
alter table minibdot.ot_adja_a add constraint adja_a_dokl_geom_positive check (x_dokl_geom > 0);
alter table minibdot.ot_adja_a add constraint adja_a_fk_x_zrodlo_danych_g foreign key (x_zrodlo_danych_g) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_adja_a add constraint adja_a_fk_x_zrodlo_danych_a foreign key (x_zrodlo_danych_a) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_adja_a add constraint adja_a_fk_x_rodzaj_repr_geom foreign key (x_rodzaj_repr_geom) references minibdot.ot_rodzaj_repr_geom (id);
alter table minibdot.ot_adja_a add constraint adja_a_fk_x_kat_istnienia foreign key (x_kat_istnienia) references minibdot.ot_kat_istnienia (id);
alter table minibdot.ot_adja_a add constraint adja_a_prg_unique unique (id_prg);
alter table minibdot.ot_adja_a add constraint adja_a_id_teryt_terc_unique unique (id_teryt_terc);
alter table minibdot.ot_adja_a add constraint adja_a_fk_id_id_teryt_jednostki_nadrzednej foreign key (id_teryt_jednostki_nadrzednej) references minibdot.ot_adja_a (id_teryt_terc);
alter table minibdot.ot_adja_a add constraint adja_a_id_teryt_terc_text check (id_teryt_terc ~ '^[0-9]+$');
alter table minibdot.ot_adja_a add constraint adja_a_fk_rodzaj_jednostki foreign key (rodzaj) references minibdot.ot_rodzaj_jednostki_administracyjnej (id);

-- adms_a
alter table minibdot.ot_adms_a add constraint adms_a_fk_x_kat_dokl_geom foreign key (x_kat_dokl_geom) references minibdot.ot_kat_dokl_geom (id);
alter table minibdot.ot_adms_a add constraint adms_a_dokl_geom_positive check (x_dokl_geom > 0);
alter table minibdot.ot_adms_a add constraint adms_a_fk_x_zrodlo_danych_g foreign key (x_zrodlo_danych_g) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_adms_a add constraint adms_a_fk_x_zrodlo_danych_a foreign key (x_zrodlo_danych_a) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_adms_a add constraint adms_a_fk_x_rodzaj_repr_geom foreign key (x_rodzaj_repr_geom) references minibdot.ot_rodzaj_repr_geom (id);
alter table minibdot.ot_adms_a add constraint adms_a_fk_x_kat_istnienia foreign key (x_kat_istnienia) references minibdot.ot_kat_istnienia (id);
alter table minibdot.ot_adms_a add constraint adms_a_prng_unique unique (id_prng);
alter table minibdot.ot_adms_a add constraint adms_a_prng_text check (length(id_prng) = 7 and id_prng ~ '^[0-9]+$');
alter table minibdot.ot_adms_a add constraint adms_a_ateryt_gmi_text check (length(id_teryt_gmi) = 7 and id_teryt_gmi ~ '^[0-9]+$');
alter table minibdot.ot_adms_a add constraint adms_a_liczba_ludnosci_positive check (liczba_mieszkancow > 0);
alter table minibdot.ot_adms_a add constraint adms_a_fk_rodzaj_miejscowosci foreign key (rodzaj) references minibdot.ot_rodzaj_miejscowosci (id);
alter table minibdot.ot_adms_a add constraint adms_a_czesc_miejscowosci_text foreign key (czesc_miejscowosci) references minibdot.ot_adms_a (idiip) on delete cascade;
alter table minibdot.ot_adms_a add constraint adms_a_fk_x_adja_a foreign key (adja_a_id) references minibdot.ot_adja_a (idiip);

-- adms_p
alter table minibdot.ot_adms_p add constraint adms_p_fk_x_kat_dokl_geom foreign key (x_kat_dokl_geom) references minibdot.ot_kat_dokl_geom (id);
alter table minibdot.ot_adms_p add constraint adms_p_dokl_geom_positive check (x_dokl_geom > 0);
alter table minibdot.ot_adms_p add constraint adms_p_fk_x_zrodlo_danych_g foreign key (x_zrodlo_danych_g) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_adms_p add constraint adms_p_fk_x_zrodlo_danych_a foreign key (x_zrodlo_danych_a) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_adms_p add constraint adms_p_fk_x_rodzaj_repr_geom foreign key (x_rodzaj_repr_geom) references minibdot.ot_rodzaj_repr_geom (id);
alter table minibdot.ot_adms_p add constraint adms_p_fk_x_kat_istnienia foreign key (x_kat_istnienia) references minibdot.ot_kat_istnienia (id);
alter table minibdot.ot_adms_p add constraint adms_p_prng_unique unique (id_prng);
alter table minibdot.ot_adms_p add constraint adms_p_prng_text check (length(id_prng) = 7 and id_prng ~ '^[0-9]+$');
alter table minibdot.ot_adms_p add constraint adms_p_ateryt_gmi_text check (length(id_teryt_gmi) = 7 and id_teryt_gmi ~ '^[0-9]+$');
alter table minibdot.ot_adms_p add constraint adms_p_liczba_ludnosci_positive check (liczba_mieszkancow > 0);
alter table minibdot.ot_adms_p add constraint adms_p_fk_rodzaj_miejscowosci foreign key (rodzaj) references minibdot.ot_rodzaj_miejscowosci (id);
alter table minibdot.ot_adms_p add constraint adms_p_czesc_miejscowosci_text foreign key (czesc_miejscowosci) references minibdot.ot_adms_a (idiip) on delete cascade;
alter table minibdot.ot_adms_p add constraint adms_p_fk_x_adja_a foreign key (adja_a_id) references minibdot.ot_adja_a (idiip);

-- tcrz_a
alter table minibdot.ot_tcrz_a add constraint tcrz_a_fk_x_kat_dokl_geom foreign key (x_kat_dokl_geom) references minibdot.ot_kat_dokl_geom (id);
alter table minibdot.ot_tcrz_a add constraint tcrz_a_dokl_geom_positive check (x_dokl_geom > 0);
alter table minibdot.ot_tcrz_a add constraint tcrz_a_fk_x_zrodlo_danych_g foreign key (x_zrodlo_danych_g) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_tcrz_a add constraint tcrz_a_fk_x_zrodlo_danych_a foreign key (x_zrodlo_danych_a) references minibdot.ot_zrodlo_danych (id);
alter table minibdot.ot_tcrz_a add constraint tcrz_a_fk_x_rodzaj_repr_geom foreign key (x_rodzaj_repr_geom) references minibdot.ot_rodzaj_repr_geom (id);
alter table minibdot.ot_tcrz_a add constraint tcrz_a_fk_x_kat_istnienia foreign key (x_kat_istnienia) references minibdot.ot_kat_istnienia (id);
alter table minibdot.ot_tcrz_a add constraint tcrz_a_unique_idksoch unique (idksoch);
alter table minibdot.ot_tcrz_a add constraint tcrz_a_fk_rodzaj_rez foreign key (rodzaj) references minibdot.ot_rodzaj_rezerwatu (id);

---------------------------------------------------------------------------------------------
--------------------------------------INSERTY-----------------------------------------------
---------------------------------------------------------------------------------------------

-- adja_a
insert into minibdot.ot_adja_a (idiip, czy_obiekt_bdoo, x_kod, x_kat_dokl_geom, x_dokl_geom, x_zrodlo_danych_g, x_zrodlo_danych_a, x_rodzaj_repr_geom, x_uwagi, x_uzytkownik, x_aktualnosc_g, x_aktualnosc_a, poczatek_wersji_obiektu,  x_data_utworzenia, x_inform_dodatkowa, x_kat_istnienia, nazwa, geometria, id_prg, id_teryt_terc, rodzaj) values
	('0', true, '0000001', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2017-01-01', '2017-01-01', '2017-01-01', '2017-01-01', 'Informacja dodatkowa', 'Eks', 'klops', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000001', '0000001', 'GM');

-- adms_a
insert into minibdot.ot_adms_a (idiip, czy_obiekt_bdoo, x_kod, x_kat_dokl_geom, x_dokl_geom, x_zrodlo_danych_g, x_zrodlo_danych_a, x_rodzaj_repr_geom, x_uwagi, x_uzytkownik, x_aktualnosc_g, x_aktualnosc_a, poczatek_wersji_obiektu,  x_data_utworzenia, x_inform_dodatkowa, x_kat_istnienia, nazwa, geometria, id_prng, id_teryt_gmi, liczba_mieszkancow, rodzaj, siedziba_urzedu_gminy, czesc_miejscowosci, adja_a_id) values
	('0000001', true, '0000001', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Warszawa', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000001', '0000001', 1000000, 'Ms', true, null, '0'),
	('0000002', true, '0000002', 'Prz', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Poznan', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000002', '0000002', 1000000, 'Ms', false, null, '0'),
	('0000003', true, '0000003', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Gdansk', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000003', '0000003', 1000000, 'Ms', false, null, '0'),
	('0000004', true, '0000004', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Wroclaw', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000004', '0000004', 1000000, 'Ms', false, null, '0'),
	('0000005', true, '0000005', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Krakow', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000005', '0000005', 1000000, 'Ms', false, null, '0'),
	('0000006', true, '0000006', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Lodz', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000006', '0000006', 1000000, 'Ms', false, null, '0'),
	('0000007', true, '0000007', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Katowice', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000007', '0000007', 1000000, 'Ms', false, null, '0'),
	('0000008', true, '0000008', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Szczecin', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000008', '0000008', 1000000, 'Ms', false, null, '0'),
	('0000009', true, '0000009', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Bialystok', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000009', '0000009', 1000000, 'Ms', false, null, '0'),
	('0000010', true, '0000010', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Gdynia', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000010', '0000010', 1000000, 'Ms', false, null, '0');

-- adms_p
insert into minibdot.ot_adms_p (idiip, czy_obiekt_bdoo, x_kod, x_kat_dokl_geom, x_dokl_geom, x_zrodlo_danych_g, x_zrodlo_danych_a, x_rodzaj_repr_geom, x_uwagi, x_uzytkownik, x_aktualnosc_g, x_aktualnosc_a, poczatek_wersji_obiektu,  x_data_utworzenia, x_inform_dodatkowa, x_kat_istnienia, nazwa, geometria, id_prng, id_teryt_gmi, liczba_mieszkancow, rodzaj, siedziba_urzedu_gminy, czesc_miejscowosci, adja_a_id) values
	('0000001', true, '0000001', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Warszawa', ST_GeomFromText('POINT(0 0)', 2180), '0000001', '0000001', 1000000, 'Ms', true, null, '0'),
	('0000002', true, '0000002', 'Prz', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Poznan', ST_GeomFromText('POINT(0 0)', 2180), '0000002', '0000002', 1000000, 'Ms', false, null, '0'),
	('0000003', true, '0000003', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Gdansk', ST_GeomFromText('POINT(0 0)', 2180), '0000003', '0000003', 1000000, 'Ms', false, null, '0'),
	('0000004', true, '0000004', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Wroclaw', ST_GeomFromText('POINT(0 0)', 2180), '0000004', '0000004', 1000000, 'Ms', false, null, '0'),
	('0000005', true, '0000005', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Krakow', ST_GeomFromText('POINT(0 0)', 2180), '0000005', '0000005', 1000000, 'Ms', false, null, '0'),
	('0000006', true, '0000006', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Lodz', ST_GeomFromText('POINT(0 0)', 2180), '0000006', '0000006', 1000000, 'Ms', false, null, '0'),
	('0000007', true, '0000007', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Katowice', ST_GeomFromText('POINT(0 0)', 2180), '0000007', '0000007', 1000000, 'Ms', false, null, '0'),
	('0000008', true, '0000008', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2019-01-01', '2019-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Szczecin', ST_GeomFromText('POINT(0 0)', 2180), '0000008', '0000008', 1000000, 'Ms', false, null, '0'),
	('0000009', true, '0000009', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2020-01-01', '2020-01-01', '2020-01-01', '2020-01-01', 'Informacja dodatkowa', 'Eks', 'Bialystok', ST_GeomFromText('POINT(0 0)', 2180), '0000009', '0000009', 1000000, 'Ms', false, null, '0'),
	('0000010', true, '0000010', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2020-01-01', '2020-01-01', '2020-01-01', '2020-01-01', 'Informacja dodatkowa', 'Eks', 'Gdynia', ST_GeomFromText('POINT(0 0)', 2180), '0000010', '0000010', 1000000, 'Ms', false, null, '0');

-- tcrz_a
insert into minibdot.ot_tcrz_a (idiip, czy_obiekt_bdoo, x_kod, x_kat_dokl_geom, x_dokl_geom, x_zrodlo_danych_g, x_zrodlo_danych_a, x_rodzaj_repr_geom, x_uwagi, x_uzytkownik, x_aktualnosc_g, x_aktualnosc_a, poczatek_wersji_obiektu,  x_data_utworzenia, x_inform_dodatkowa, x_kat_istnienia, nazwa, geometria, idksoch, rodzaj) values
	('0000001', true, '0000001', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000001', 'Sl'),
	('0000002', true, '0000002', 'Prz', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000002', 'Sl'),
	('0000003', true, '0000003', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000003', 'Sl'),
	('0000004', true, '0000004', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000004', 'Sl'),
	('0000005', true, '0000005', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000005', 'Sl'),
	('0000006', true, '0000006', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000006', 'Sl'),
	('0000007', true, '0000007', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000007', 'Sl'),
	('0000008', true, '0000008', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2018-01-01', '2018-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000008', 'Sl'),
	('0000009', true, '0000009', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000009', 'Sl'),
	('0000010', true, '0000010', 'Dok', 0.1, 'GEOS', 'EGiB', 'SG', 'Uwagi', 'admin', '2018-01-01', '2018-01-01', '2019-01-01', '2019-01-01', 'Informacja dodatkowa', 'Eks', 'Rezerwat przyrody', ST_GeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 2180), '0000010', 'Sl');

refresh materialized view minibdot.adms_a_mv;
refresh materialized view minibdot.adms_p_mv;
refresh materialized view minibdot.tcrz_a_mv;