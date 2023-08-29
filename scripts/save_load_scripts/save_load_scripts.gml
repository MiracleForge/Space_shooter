// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function scr_selection_save_system()
{
    if (file_exists("save_ini_file")) file_delete("save_ini_file");
    
    // Open the INI file for writing
 ini_open("save_ini_file");
  if object_index == Owindows
  {
        // Loop through allpilots and save the pilots.block values
        for (var j = 0; j < number_of_pilots; j++) {
            var blockValue = ds_grid_get(allpilots, j, pilots.Block);
            var section = "pilot_" + string(j);
            ini_write_real(section, "block", blockValue);
        }
        for (var j = 0; j < number_of_ships; j++) {
            var blockValue = ds_grid_get(allships, j, status.Block);
            var section = "ships_" + string(j);
            ini_write_real(section, "block", blockValue);
        }
        show_debug_message("Pilots' block values saved successfully!");
  }
    // Save coins and Diamonds
   ini_write_real("Player", "Coins", global.player_coin);
   ini_write_real("Player", "Diamonds", global.player_diamond);
    
    // Close the INI file
    ini_close();
}


function scr_load_system()
{
    if file_exists("save_ini_file")
    {
        // Open the INI file for reading
        ini_open("save_ini_file");
        // numbers of pilots and ships blocked and unbloked , loop true grid and setting in 
        if object_index == Owindows
        {
            // Loop through all pilots and update the pilots.block values
            for (var j = 0; j < number_of_pilots; j++) {
                var section = "pilot_" + string(j);
                var blockValue = ini_read_real(section, "block", ds_grid_get(allpilots, j, pilots.Block));
                ds_grid_set(allpilots, j, pilots.Block, blockValue);
						show_debug_message("Reading from section: " + section);
						show_debug_message("Block value: " + string(blockValue));
            }
            
            // Loop through all ships and update the ships.block values
            for (var j = 0; j < number_of_ships; j++) {
                var section = "ships_" + string(j);
                var blockValue = ini_read_real(section, "block", ds_grid_get(allships, j, status.Block));
                ds_grid_set(allships, j, status.Block, blockValue);
						show_debug_message("Reading from section: " + section);
						show_debug_message("Block value: " + string(blockValue));
            }
        }
		// Player variables to save
        global.player_coin = ini_read_real("Player", "coins", global.player_coin);
        global.player_diamond = ini_read_real("Player", "Diamonds", global.player_diamond);
        
        ini_close();
    }
}

