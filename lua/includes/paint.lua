include("config.lua")
include("funcs.lua")

function paintMapG( slf )
	DrawBlur( slf, 5, 6 )

	if rainbowMode == true then
		rR = math.sin(CurTime() * 4) * 127 + 128
		gR = math.sin(CurTime() * 4 + 2) * 127 + 128
		bR = math.sin(CurTime() * 4 + 4) * 127 + 128

		draw.RoundedBox(0,0,0,ScrW(),28,Color(rR,gR,bR))
		draw.RoundedBox(0,ScrW() - 148,0,8,ScrH(),Color(bR,gR,bR))
		draw.RoundedBox(0,ScrW() - 145,0,2,ScrH(), Color(0,0,0))
		draw.RoundedBox(0,0,27,ScrW(), 2, Color(0,0,0))
		draw.RoundedBox(0,ScrW() - 147,59,20,2,Color(0,0,0))
		draw.SimpleText( serverName, "ChatFont", 2, 5, HSVToColor(50,1,1))
		draw.RoundedBox(0,linePos,0, 2, ScrH(), Color(0,0,0))
	elseif fadeMode == true then
		rF = math.sin(CurTime() * 4) * 50 + fadeModeR
		gF = math.sin(CurTime() * 4) * 50 + fadeModeG
		bF = math.sin(CurTime() * 4) * 50 + fadeModeB

		draw.RoundedBox(0,0,0,ScrW(),28,Color(rF,gF,bF))
		draw.RoundedBox(0,ScrW() - 148,0,8,ScrH(),Color(rF,gF,bF))
		draw.RoundedBox(0,ScrW() - 145,0,2,ScrH(), Color(0,0,0))
		draw.RoundedBox(0,0,27,ScrW(), 2, Color(0,0,0))
		draw.RoundedBox(0,ScrW() - 147,59,20,2,Color(0,0,0))
		draw.SimpleText(serverName, "ChatFont", 2, 5, HSVToColor(50,1,1))
		draw.RoundedBox(0,linePos,0, 2, ScrH(), Color(0,0,0))
	else
		draw.RoundedBox(0,0,0,ScrW(),28,Color(bBr,gBr,bBr,trBr))
		draw.RoundedBox(0,ScrW() - 148,0,8,ScrH(),Color(bBr,gBr,bBr,trBr))
		draw.RoundedBox(0,ScrW() - 145,0,2,ScrH(), Color(0,0,0))
		draw.RoundedBox(0,0,27,ScrW(), 2, Color(0,0,0))
		draw.RoundedBox(0,ScrW() - 147,59,20,2,Color(0,0,0))
		draw.SimpleText(serverName, "ChatFont", 2, 5, HSVToColor(50,1,1))
		draw.RoundedBox(0,linePos,0, 2, ScrH(), Color(0,0,0))
	end
end


function paintMapT( slf )
	if rainbowMode == true then
		draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(rR,gR,bR))
		draw.RoundedBox(0,0,27,ScrW(),2,Color(0,0,0))
		draw.RoundedBox(0,108,0, 2, 25, Color(rR,gR,bR))
		draw.SimpleText("Toolbar", "ChatFont", 2, 5, HSVToColor(50,1,1))
		draw.RoundedBox(0,0,59,ScrW(),2,Color(0,0,0))
	elseif fadeMode == true then
		draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(rF,gF,bF))
		draw.RoundedBox(0,0,27,ScrW(),2,Color(0,0,0))
		draw.RoundedBox(0,108,0, 2, 25, Color(rF,gF,bF))
		draw.SimpleText("Toolbar", "ChatFont", 2, 5, HSVToColor(50,1,1))
		draw.RoundedBox(0,0,59,ScrW(),2,Color(0,0,0))
	else
		draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(255,255,255))
		draw.RoundedBox(0,0,27,ScrW(),2,Color(0,0,0))
		draw.RoundedBox(0,108,0, 2, 25, Color(rTB,gTB,bTB))
		draw.SimpleText("Toolbar", "ChatFont", 2, 5, HSVToColor(50,1,1))
		draw.RoundedBox(0,0,59,ScrW(),2,Color(0,0,0))
	end
end


function paintMapP( slf )
	local x, y = slf:LocalToScreen(0,0)
	local w, h = slf:GetSize()
	render.RenderView( {
		origin = mapCamPos,
		angles = Angle( 90, 270, 0 ),
		x = x,
		y = y,
		w = w,
		h = h,
	} )
	draw.SimpleText(debuginfo1, "Default", 2, 10, Color(255,255,255))
	draw.SimpleText(debuginfo2, "Default", 2, 20, Color(255,255,255))
	draw.SimpleText(debuginfo3, "Default", 2, 30, Color(255,255,255))
	draw.SimpleText(debuginfo4, "Default", 2, 40, Color(255,255,255))
	draw.SimpleText(debuginfo5, "Default", 2, 50, Color(255,255,255))
	draw.SimpleText(debuginfo6, "Default", 2, 70, Color(255,255,255))
	draw.SimpleText(debuginfo7, "Default", 2, 90, Color(255,255,255))
	draw.SimpleText(debuginfo8, "Default", 2, 100, Color(255,255,255))
end

