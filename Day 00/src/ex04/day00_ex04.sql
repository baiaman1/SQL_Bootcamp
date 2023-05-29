select (p.name || ' (age:' || p.age || ',gender:''' || p.gender || ''',address:''' || p.address || ''')')
as person_information
from person p
order by person_information asc;