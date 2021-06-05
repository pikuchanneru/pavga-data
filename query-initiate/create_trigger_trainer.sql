CREATE TRIGGER set_timestamp 
BEFORE UPDATE ON trainer 
FOR EACH ROW 
EXECUTE PROCEDURE trigger_set_timestamp();