CREATE FUNCTION deactivated_unpaid_accounts() RETURNS void
LANGUAGE SQL
AS $$
	UPDATE generated SET prenume='Iorgulescu';
$$;

SELECT deactivated_unpaid_accounts();

SELECT * FROM generated;

CREATE PROCEDURE update_adress() 
LANGUAGE SQL
AS $$
	UPDATE generated SET adresa='Mun. Timisoara';
$$;
CALL update_adress();
SELECT deactivated_unpaid_accounts();

CREATE FUNCTION account_type_count(cnp text, id integer) RETURNS
LANGUAGE plpgsql
AS $$
	DECLARE account_count int;
BEGIN
	SELECT COUNT(*) INTO account_count
	FROM generated
	WHERE generated.cnp=$1 AND generated.id=$2;
	
	RETURN account_count;
END
$$;

select account_type_count('1234567890123');

