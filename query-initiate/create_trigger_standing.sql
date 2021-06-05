CREATE TRIGGER set_timestamp 
BEFORE UPDATE ON standing 
FOR EACH ROW 
EXECUTE PROCEDURE trigger_set_timestamp();