use prip_kurz;

select * -- id, email
from uzivatele
where
	-- id > 5 and id<10;
	-- and email not like '%email.cz';
	-- id > 5 or id < 3;
	-- email in ('novy@seznam.cz', 'nova@seznam.cz')
	-- email like 'nov%';
    -- email <> 'novy@seznam.cz'; -- <> je negace
    -- id between 5 and 10;
    -- email like '%o%'; -- % bezne nepuzivat, nuti fullscan
    vytvoren >= date(now());