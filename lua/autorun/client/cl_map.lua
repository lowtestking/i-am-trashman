include("includes/vars.lua")
include("includes/funcs.lua")
include("includes/config.lua")
include("includes/paint.lua")
include("includes/hooks.lua")

net.Receive("openMap", function()
    if(!isOpen) then
        OpenMap()
        isOpen = true
	else
		mapG:Close()
		mapT:Close()
		isOpen = false
    end
end)

--[[
DFrame mapG
	DPanel mapP

DFrame mapT
	DButton button_close
	DButton buttonLTR
	DComboBox comboBoxLO
--]]

function OpenMap()
 	setCamPos(LocalPlayer():GetPos() + Vector(0,0,2500))
    mapG = vgui.Create("DFrame")

    mapG:SetSize(ScrW() - 140,ScrH())
    mapG:SetDraggable(false)
    mapG:SetTitle("")
    mapG:ShowCloseButton(false)
    
    mapG:MakePopup()

    mapG.OnClose = mapG_Close

    mapG.Paint = paintMapG



    mapT = vgui.Create("DFrame")

    mapT:SetSize(140,ScrH())
    mapT:SetPos(ScrW() - 140, 0)
    mapT:ShowCloseButton(false)
    mapT:SetTitle("")
    mapT:SetDraggable(false)

    mapT:MakePopup()

    mapT.OnClose = mapT_Close

    mapT.Paint = paintMapT



    button_close = vgui.Create( "DButton", mapT )

    button_close:SetPos( 110 , 2 )
    button_close:SetSize( 30, 20 )
    button_close:SetText( "[X]" )
    button_close:SetFont( "ChatFont" )
    button_close:SetTextColor(HSVToColor(0,1,1))

    button_close.DoClick = button_close_DoClick

    function button_close:Paint( w, h ) end



    mapP = vgui.Create("DPanel", mapG)

    mapP:SetPos(0,29)
    mapP:SetSize(ScrW() - 145,ScrH())
    mapP:DockMargin(0,0,0,0)
	pwide = mapP:GetWide()
	ptall = mapP:GetTall()
	debuginfo7 = "Panel width: " .. pwide
	debuginfo8 = "Panel height: " .. ptall

    mapP.OnMouseWheeled = mapP_MouseWheeled
	mapP.OnMousePressed = mapP_MousePressed
	mapP.OnCursorMoved = mapP_CursorMoved
	mapP.OnMouseReleased = mapP_MouseReleased
	mapP.OnCursorEntered = function(slf)
		slf:RequestFocus()
	end
	mapP.OnCursorExited = function(slf)
		slf:KillFocus()
	end
	mapP.OnKeyCodePressed = mapP_KeyPressed

    mapP.Paint = paintMapP   

	
	buttonLTR = vgui.Create( "DButton", mapT )

	buttonLTR:SetPos( 3, 35 )
	buttonLTR:SetSize(133,20)    
	buttonLTR:SetTextColor(HSVToColor(50,1,1))
	buttonLTR:SetFont("ChatFont") 
	buttonLTR:SetText( "Look through roofs" )      
	buttonLTR:SetTooltipPanel(nil)
	buttonLTR:SetColor(Color(255,0,0))

	buttonLTR.DoClick = buttonLTR_DoClick



	comboBoxLO = vgui.Create( "DComboBox", mapT )

	comboBoxLO:SetPos( 3, 65 )
	comboBoxLO:SetSize( 133, 20 )
	comboBoxLO:SetValue( "Player Lockon" )

	plyList = player.GetAll()

	comboBoxLO.DoClick = plySelector_DoClick
	comboBoxLO.OnSelect = comboBoxLO_Select
end

hook.Add("PreDrawEffects", "test", function( )
	cam.Start3D()
	if(isOpen and cmx != nil) then
		render.SetColorMaterial()
		if(mapSelection) then
			render.DrawSphere( mapSelection.HitPos + Vector(0,0,0), 10, 20, 20, Color(255,0,0) )
		end
	end
	cam.End3D()
end)
