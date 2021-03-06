CREATE OR REPLACE FUNCTION Insert_Comsumption(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO comsumptions (comsumption_cod, nif, comsumption_date) 
		SELECT nextval('comsumption_cod'),nif, comsumption_date FROM json_populate_record(
				NULL::comsumptions,
				$1 
		) returning comsumption_cod into id;	
        RETURN id;
END
$id$ LANGUAGE plpgsql;