CREATE OR REPLACE PROCEDURE Insert_Menu_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO menu_items (menu_cod,item_cod) 
			SELECT menu_cod,item_cod FROM json_populate_record(
				NULL::menu_items,
				$1 
		);
END	
$$	