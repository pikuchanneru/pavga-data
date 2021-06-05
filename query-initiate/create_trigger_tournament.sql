CREATE TRIGGER set_timestamp 
BEFORE UPDATE ON tournament 
FOR EACH ROW 
EXECUTE PROCEDURE trigger_set_timestamp();