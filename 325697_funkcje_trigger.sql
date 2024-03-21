---------------------------------------------------------------------------------------------
--------------------------------------TRIGGER------------------------------------------------
---------------------------------------------------------------------------------------------

-- funkcja
create or replace function minibdot.fn_new_rezerw() returns trigger as
$$
begin
new.x_uzytkownik := current_user;
new.poczatek_wersji_obiektu := current_timestamp;
-- zakładamy, że rezerwat jest figurą zmkniętą i pierwszy wierzchołek liczyłby się podwójnie
new.x_inform_dodatkowa := (ST_NPoints(new.geometria) - 1)::text;

if tg_op = 'UPDATE' then
	if old.geometria is distinct from new.geometria then
		new.x_aktualnosc_g := current_date;
	end if;

	-- zmiana
	if old.idiip is distinct from new.idiip or
   		old.czy_obiekt_bdoo is distinct from new.czy_obiekt_bdoo or
		old.x_kod is distinct from new.x_kod or
		old.x_kat_dokl_geom is distinct from new.x_kat_dokl_geom or
		old.x_dokl_geom is distinct from new.x_dokl_geom or
		old.x_zrodlo_danych_g is distinct from new.x_zrodlo_danych_g or
		old.x_zrodlo_danych_a is distinct from new.x_zrodlo_danych_a or
		old.x_rodzaj_repr_geom is distinct from new.x_rodzaj_repr_geom or
		old.x_uwagi is distinct from new.x_uwagi or
		old.x_inform_dodatkowa is distinct from new.x_inform_dodatkowa or
		old.x_kat_istnienia is distinct from new.x_kat_istnienia or
		old.idksoch is distinct from new.idksoch or
		old.rodzaj is distinct from new.rodzaj or
		old.nazwa is distinct from new.nazwa then
			new.x_aktualnosc_a := current_date;
	end if;
else
	new.x_aktualnosc_g := current_date;
	new.x_aktualnosc_a := current_date;
end if;

return new;
end;
$$
language plpgsql volatile;

-- trigger
create trigger trg_new_rezerw
before insert or update
on minibdot.ot_tcrz_a for each row execute procedure minibdot.fn_new_rezerw();

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
		
        select s.odl_rm, s.nazwa_r
		into rmodl, rnazwa
		from 
		(select ST_Distance(mgmtr, r.geometria) as odl_rm, r.nazwa as nazwa_r 
		from minibdot.ot_tcrz_a as r 
		where r.rodzaj = rrodzaj) as s
		order by s.odl_rm
		limit 1;

		-- dodano
		rmodl := rmodl / 1000;

		insert into minibdot.tabela_rezerwaty_miasta(rodzaj, nazwarezerwatu, nazwamiasta, odleglosc) values (rrodzaj, rnazwa, mnazwa, rmodl);
	end loop;
end loop;

return 'Hurra, funkcja zwraca text!';
end;
$$
language plpgsql;