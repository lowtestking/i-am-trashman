include("vars.lua")

function DrawBlur( p, a, d )
    local x, y = p:LocalToScreen(0, 0)
  
    surface.SetDrawColor( 255, 255, 255 )
  
    surface.SetMaterial( blur )
  
    for i = 1, d do 
    
        blur:SetFloat( "$blur", (i / d ) * ( a ) )
    
        blur:Recompute()

        render.UpdateScreenEffectTexture()
    
        surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )

    end
end

function requestTeleport(ply, pos)
	net.Start("clientWantsTeleportation")
	net.WriteEntity(ply)
	net.WriteVector(pos)
	net.SendToServer()
end

function VectorToString(vec)
	return "X:" .. math.Round(vec.x, 0) .. "|Y:" .. math.Round(vec.y, 0) .. "|Z:" .. math.Round(vec.z,0)
end

local lastZDIFF = 2
function updateMapSelection()
	local tracestart = mapCamPos + Vector(-1*(cmx*(((pwide/ptall)/875.77160493827)*lastZDIFF )), cmy*(((pwide/ptall)/985.243055555)*lastZDIFF), 0)
	local traceend = Vector(0, 0, -100000)
	local traceResult = util.QuickTrace( tracestart, traceend, nil )
	if(traceResult.Hit) then
		lastZDIFF = tracestart.z - traceResult.HitPos.z
		mapSelection = traceResult
	end
	return nil
end

function setCamPos(newPos)
	mapCamPos = newPos
end

function moveCamPos(moveVec)
	mapCamPos = mapCamPos + moveVec
end

function updatePlyList()
	plyList = player.GetAll()
end
