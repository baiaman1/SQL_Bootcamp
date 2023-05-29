CREATE TABLE person_audit
(
    created    timestamp with time zone DEFAULT current_timestamp NOT NULL,
    type_event char(1)                  DEFAULT 'I'               NOT NULL,
    row_id     bigint                                             NOT NULL,
    name       varchar,
    age        integer,
    gender     varchar,
    address    varchar,
    CONSTRAINT ch_type_event CHECK ( type_event = 'I' OR type_event = 'D' OR type_event = 'U' )
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS
$person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I', NEW.*;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');