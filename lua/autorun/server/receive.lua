
util.AddNetworkString("clientWantsTeleportation")

net.Receive("clientWantsTeleportation", function( len, pl)
	target_ply = net.ReadEntity()
	target_pos = net.ReadVector()
	target_ply:SetPos(target_pos)
end)

