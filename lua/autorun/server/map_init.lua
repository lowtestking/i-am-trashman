AddCSLuaFile( "addons/test/lua/includes/config.lua" )
AddCSLuaFile( "addons/test/lua/includes/vars.lua" )
AddCSLuaFile( "addons/test/lua/includes/funcs.lua" )
AddCSLuaFile( "addons/test/lua/includes/hooks.lua" )
AddCSLuaFile( "addons/test/lua/includes/paint.lua" )
util.AddNetworkString("openMap")


function OpenMap(ply)
	net.Start("openMap")
	net.Send(ply)
end

hook.Add("PlayerSay", "OpenMap", function( ply, text )
	if string.lower(text) == "!maps" then
		OpenMap(ply)
	end
end)
