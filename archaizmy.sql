-- Database: bmdp_325697
CREATE DATABASE bmdp_325697
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1250'
    LC_CTYPE = 'English_United States.1250'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

vacum analyze minibdot.ot_zrodlo_danych(id);
vacuum analyze minibdot.ot_zrodlo_danych(nazwa);
vacum analyze minibdot.ot_kat_istnienia(id);
vacuum analyze minibdot.ot_kat_istnienia(nazwa);
vacum analyze minibdot.ot_rodzaj_miejscowosci(id);
vacuum analyze minibdot.ot_rodzaj_miejscowosci(nazwa);

-- vacuum - adms_a
vacuum analyze minibdot.ot_adms_a(lokalny_id);
vacuum analyze minibdot.ot_adms_a(poczatek_wersji_obiektu);
vacuum analyze minibdot.ot_adms_a(koniec_wersji_obiektu);
vacuum analyze ot_adms_a(zrodlo_danych_geometrycznych);
vacuum analyze ot_adms_a(kategoria_istnienia);
vacuum analyze ot_adms_a(nazwa);
vacuum analyze ot_adms_a(identyfikator_simc);
vacuum analyze ot_adms_a(identyfikator_terc);
vacuum analyze ot_adms_a(rodzaj);
vacuum analyze ot_adms_a(liczba_mieszkancow);
vacuum analyze ot_adms_a(identyfikator_prng);
vacuum analyze ot_adms_a(geom);

-- vacuum - adms_p
vacuum analyze ot_adms_p(lokalny_id);
vacuum analyze ot_adms_p(poczatek_wersji_obiektu);
vacuum analyze ot_adms_p(koniec_wersji_obiektu);
vacuum analyze ot_adms_p(zrodlo_danych_geometrycznych);
vacuum analyze ot_adms_p(kategoria_istnienia);
vacuum analyze ot_adms_p(nazwa);
vacuum analyze ot_adms_p(identyfikator_simc);
vacuum analyze ot_adms_p(identyfikator_terc);
vacuum analyze ot_adms_p(rodzaj);
vacuum analyze ot_adms_p(liczba_mieszkancow);
vacuum analyze ot_adms_p(identyfikator_prng);
vacuum analyze ot_adms_p(geom);

-- vacuum - tcrz_a
vacuum analyze ot_tcrz_a(lokalny_id);
vacuum analyze ot_tcrz_a(poczatek_wersji_obiektu);
vacuum analyze ot_tcrz_a(koniec_wersji_obiektu);
vacuum analyze ot_tcrz_a(zrodlo_danych_geometrycznych);
vacuum analyze ot_tcrz_a(kategoria_istnienia);
vacuum analyze ot_tcrz_a(numer_crfop);
vacuum analyze ot_tcrz_a(nazwa);
vacuum analyze ot_tcrz_a(geom);

---------------------------------------------------------------------------------------------
--------------------------------------FUNKCJA------------------------------------------------
---------------------------------------------------------------------------------------------

create or replace function minibdot.funkcja_rezerwaty_miasta (
	lud integer
)
returns text as
$$
declare
wiersz record;
wierszyk record;
mnazwa text;
mgmtr geometry(POLYGON, 2180);
rnazwa text;
rrodzaj text;
rmodl real;

miasta cursor(liczba_lud integer) for
select a.nazwa as m_nazwa, a.geometria as m_geom
from minibdot.ot_adms_a as a
where  a.liczba_mieszkancow > liczba_lud;

begin
drop table if exists minibdot.tabela_rezerwaty_miasta;
create table minibdot.tabela_rezerwaty_miasta (
	id serial primary key,
	rodzaj text,
	nazwarezerwatu text,
	nazwamiasta text,
	odleglosc real
);

open miasta(lud);
loop
fetch miasta into wiersz;
exit when not found;

mnazwa := wiersz.m_nazwa;
mgmtr := wiersz.m_geom;

for wierszyk in 
(select r.nazwa as nazwa_rez, r.rodzaj as rodzaj_rez, ST_Distance(mgmtr, r.geometria) as odl
from minibdot.ot_tcrz_a as r
where ST_Distance(mgmtr, r.geometria) = min(ST_Distance(mgmtr, r.geometria))
group by r.rodzaj) loop
	rnazwa := wierszyk.nazwa_rez;
	rrodzaj := wierszyk.rodzaj_rez;
	rmodl := wierszyk.odl;
	insert into minibdot.tabela_rezerwaty_miasta(rodzaj, nazwarezerwatu, nazwamiasta, odleglosc) values (rrodzaj, rnazwa, mnazwa, rmodl);
	end loop;
end loop;
close miasta;
return 'Hurra, funkcja zwraca napis!';
end;
$$
language plpgsql;


select s.nzw as nazwa_r, s.dst as odl_rm
from (select ST_Distance(mgmtr, r.geometria) as dst, r.nazwa as rnzw from ot_tcrz_a as r where r.rodzaj = rrodzaj) as s
where s.dst = min(s.dst)




create or replace function minibdot.funkcja_rezerwaty_miasta (
	lud integer
)
returns text as
$$
declare
wiersz record;
wierszyk record;
miniwierszyk record;
mnazwa text;
mgmtr geometry(POLYGON, 2180);
rnazwa text;
rrodzaj text;
rmodl real;

begin
drop table if exists minibdot.tabela_rezerwaty_miasta;
create table minibdot.tabela_rezerwaty_miasta (
	id serial primary key,
	rodzaj text,
	nazwarezerwatu text,
	nazwamiasta text,
	odleglosc real
);

for wiersz in
(select a.nazwa as m_nazwa, a.geometria as m_geom
from minibdot.ot_adms_a as a
where  a.liczba_mieszkancow > lud)
loop
    mnazwa := wiersz.m_nazwa;
    mgmtr := wiersz.m_geom;

    for wierszyk in
	(select r.rodzaj as r_rodzaj
	from minibdot.ot_tcrz_a as r
	group by r.rodzaj)
    loop
        rrodzaj := wierszyk.r_rodzaj;
        miniwierszyk :=
		(select s.odl_rm, s.nazwa_r from 
		(select ST_Distance(mgmtr, r.geometria) as odl_rm, r.nazwa as nazwa_r 
		from minibdot.ot_tcrz_a as r 
		where r.rodzaj = rrodzaj) as s
		order by s.odl_rm
		limit 1);
		rnazwa := miniwierszyk.nazwa_r;
		rmodl := miniwierszyk.odl_rm;
		insert into minibdot.tabela_rezerwaty_miasta(rodzaj, nazwarezerwatu, nazwamiasta, odleglosc) values (rrodzaj, rnazwa, mnazwa, rmodl);
    end loop;
end loop;

return 'Hurra, funkcja zwraca text!';
end;
$$
language plpgsql;