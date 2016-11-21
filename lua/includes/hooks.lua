include("vars.lua")
include("funcs.lua")

function mapG_Close(s)
	render.OverrideDepthEnable( false, false)
	isOpen = false
	s:Remove()
end


function mapT_Close(s)
	isOpen = false
	s:Remove()
end

function button_close_DoClick()
	mapT:Close()
	mapG:Close()
end


function mapP_MousePressed(slf, keycode)
	if(keycode == MOUSE_LEFT) then
		mapP_mousedown = true
		mapP_curX_old, mapP_curY_old = mapP:CursorPos()
	end
end

function mapP_CursorMoved(slf, x, y)
	mapP_curX_new, mapP_curY_new = slf:CursorPos()

	local mx = slf:GetWide() / 2
	local my = slf:GetTall() / 2
	cmx = mapP_curX_new - mx
	cmy = mapP_curY_new - my
	debuginfo6 = "mousepos_panel_m:" .. cmx .. "," .. cmy

	if(mapP_mousedown == true and mapP_dragging == false) then --start dragging
		mapP_dragging = true
	end

	if(mapP_dragging == true) then --move cam according to drag
		local movement_x = mapP_curX_new - mapP_curX_old
		local movement_y = mapP_curY_new - mapP_curY_old

		moveCamPos(Vector(movement_x*mapScrollSpeed, -1 * movement_y*mapScrollSpeed, 0))
	end

	updateMapSelection()
	
	mapP_curX_old = mapP_curX_new
	mapP_curY_old = mapP_curY_new
end

function mapP_MouseReleased(slf, keycode)
	if(keycode == MOUSE_LEFT) then
		if(mapP_dragging == true) then
			mapP_dragging = false
		else
			print(mapSelection.Entity:IsPlayer())
		end
		mapP_mousedown = false
	end
end

function mapP_MouseWheeled( slf, amount )
	moveCamPos(Vector(0,0,(amount*mapZoomSpeed)))
end


function mapP_KeyPressed(slf, keyCode)
	if(keyCode==KEY_T) then
		if(input.IsKeyDown(KEY_LSHIFT)) then
			updatePlyList()
			test = DermaMenu()
			for k, v in pairs(plyList) do
				test:AddOption(v:Nick(),function()
											requestTeleport(v, mapSelection.HitPos)
										end)
			end
			test:Open(mapP_curX_new, mapP_curY_new, nil, mapP)
		else
			requestTeleport(LocalPlayer(), mapSelection.HitPos)
		end
	end
	if(keyCode==KEY_UP) then
		mapZoomSpeed = mapZoomSpeed + 200
	end
	if(keyCode==KEY_DOWN) then
		mapZoomSpeed = mapZoomSpeed - 200
	end
	if(keyCode==KEY_RIGHT) then
		mapScrollSpeed = mapScrollSpeed + 5
	end
	if(keyCode==KEY_LEFT) then
		mapScrollSpeed = mapScrollSpeed - 5
	end
	if(keyCode==KEY_F) then
		if(input.IsKeyDown(KEY_LSHIFT)) then
			updatePlyList()
			test = DermaMenu()
			for k, v in pairs(plyList) do
				test:AddOption(v:Nick(),function()
											setCamPos(v:GetPos() + Vector(0,0,3500))
										end)
			end
			test:Open(mapP_curX_new, mapP_curY_new, nil, mapP)
		else
			setCamPos(LocalPlayer():GetPos() + Vector(0,0,3500))
		end
	end


end

function buttonLTR_DoClick(slf)
	lookThroughRoofs = !lookThroughRoofs
	if lookThroughRoofs then
		slf:SetColor(Color(0,255,0))
		render.OverrideDepthEnable( true, false)
	else
		slf:SetColor(Color(255,0,0))
		render.OverrideDepthEnable( false, false)
	end
end

function plySelector_DoClick(slf)
	if(slf:IsMenuOpen()) then
		slf:CloseMenu()
	else
		updatePlyList()
		slf:Clear()
		for k, v in pairs(plyList) do
			slf:AddChoice(v:Nick())
		end
		slf:OpenMenu()
	end
end

function comboBoxLO_Select( panel, index, value )
	setCamPos(plyList[index]:GetPos() + Vector(0,0,3500))
end

