-----------{CONFIG}-----------
  maxMessages = "9"-- 3 is the mininum and 9 is the maximum
  firstMessage = "test"
  secondMessage = "tast"
  thirdMessage = "tost"
  fourthMessage = "testosterone"
  fifthMessage = ""
  sixthMessage = ""
  seventhMessage = ""
  eigthMessage = ""
  ninthMessage = ""
------------------------------






















isOpen = false

local blur = Material("pp/blurscreen")

local function DrawBlur( p, a, d )
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


function CalloutsOpen()
  if maxMessages == "9" then
    size = 272
    skreenhight = ScrH() / 4
  elseif maxMessages == "8" then
    size = 246
    skreenhight = ScrH() / 3.5
  elseif maxMessages == "7" then
    size = 223
    skreenhight = ScrH() / 3.5
  elseif maxMessages == "6" then
    size = 196
    skreenhight = ScrH() / 3
  elseif maxMessages == "5" then
    size = 170
    skreenhight = ScrH() / 3
  elseif maxMessages == "4" then
    size = 146
    skreenhight = ScrH() / 2.5
  elseif maxMessages == "3" then
    size = 120
    skreenhight = ScrH() / 2.5
  end
  local frame = vgui.Create("DFrame")
  isOpen = true
  frame:SetPos(0,skreenhight)
  frame:SetSize(250,size)
  frame:IsActive(true)
  frame:ShowCloseButton(false)
  frame:SetDraggable(false)
  frame:SetTitle("")


  function closeff()
    if isOpen == true then
      frame:Close()
      isOpen = false
    end
  end

  frame.Paint = function( slf )
    DrawBlur( slf, 5, 6 )
    if maxMessages == "9" then
      draw.RoundedBox(0,0,0,250,272,Color(0,0,0,210))
      draw.RoundedBox(0,0,0,250,15, Color(30,130,255))
      draw.RoundedBox(0,0,0,250,4, Color(70,180,255))
      draw.SimpleText("1. ".. firstMessage, "Trebuchet24", 4, 20, Color(30,130,255))
      draw.SimpleText("2. ".. secondMessage, "Trebuchet24", 5, 45, Color(30,130,255))
      draw.SimpleText("3. ".. thirdMessage, "Trebuchet24", 5, 70, Color(30,130,255))
      draw.SimpleText("4. ".. fourthMessage, "Trebuchet24", 5, 95, Color(30,130,255))
      draw.SimpleText("5. ".. fifthMessage, "Trebuchet24", 5, 120, Color(30,130,255))
      draw.SimpleText("6. ".. sixthMessage, "Trebuchet24", 5, 145, Color(30,130,255))
      draw.SimpleText("7. ".. seventhMessage, "Trebuchet24", 5, 170, Color(30,130,255))
      draw.SimpleText("8. ".. eigthMessage, "Trebuchet24", 5, 195, Color(30,130,255))
      draw.SimpleText("9. ".. ninthMessage, "Trebuchet24", 5, 220, Color(30,130,255))
      draw.SimpleText("0. Close", "Trebuchet24", 5, 245, Color(30,130,255))
    elseif maxMessages == "8" then
      draw.RoundedBox(0,0,0,250,272,Color(0,0,0,210))
      draw.RoundedBox(0,0,0,250,15, Color(30,130,255))
      draw.RoundedBox(0,0,0,250,4, Color(70,180,255))
      draw.SimpleText("1. ".. firstMessage, "Trebuchet24", 4, 20, Color(30,130,255))
      draw.SimpleText("2. ".. secondMessage, "Trebuchet24", 5, 45, Color(30,130,255))
      draw.SimpleText("3. ".. thirdMessage, "Trebuchet24", 5, 70, Color(30,130,255))
      draw.SimpleText("4. ".. fourthMessage, "Trebuchet24", 5, 95, Color(30,130,255))
      draw.SimpleText("5. ".. fifthMessage, "Trebuchet24", 5, 120, Color(30,130,255))
      draw.SimpleText("6. ".. sixthMessage, "Trebuchet24", 5, 145, Color(30,130,255))
      draw.SimpleText("7. ".. seventhMessage, "Trebuchet24", 5, 170, Color(30,130,255))
      draw.SimpleText("8. ".. eigthMessage, "Trebuchet24", 5, 195, Color(30,130,255))
      draw.SimpleText("0. Close", "Trebuchet24", 5, 220, Color(30,130,255))
    elseif maxMessages == "7" then
      draw.RoundedBox(0,0,0,250,272,Color(0,0,0,210))
      draw.RoundedBox(0,0,0,250,15, Color(30,130,255))
      draw.RoundedBox(0,0,0,250,4, Color(70,180,255))
      draw.SimpleText("1. ".. firstMessage, "Trebuchet24", 4, 20, Color(30,130,255))
      draw.SimpleText("2. ".. secondMessage, "Trebuchet24", 5, 45, Color(30,130,255))
      draw.SimpleText("3. ".. thirdMessage, "Trebuchet24", 5, 70, Color(30,130,255))
      draw.SimpleText("4. ".. fourthMessage, "Trebuchet24", 5, 95, Color(30,130,255))
      draw.SimpleText("5. ".. fifthMessage, "Trebuchet24", 5, 120, Color(30,130,255))
      draw.SimpleText("6. ".. sixthMessage, "Trebuchet24", 5, 145, Color(30,130,255))
      draw.SimpleText("7. ".. seventhMessage, "Trebuchet24", 5, 170, Color(30,130,255))
      draw.SimpleText("0. Close", "Trebuchet24", 5, 195, Color(30,130,255))
    elseif maxMessages == "6" then
      draw.RoundedBox(0,0,0,250,272,Color(0,0,0,210))
      draw.RoundedBox(0,0,0,250,15, Color(30,130,255))
      draw.RoundedBox(0,0,0,250,4, Color(70,180,255))
      draw.SimpleText("1. ".. firstMessage, "Trebuchet24", 4, 20, Color(30,130,255))
      draw.SimpleText("2. ".. secondMessage, "Trebuchet24", 5, 45, Color(30,130,255))
      draw.SimpleText("3. ".. thirdMessage, "Trebuchet24", 5, 70, Color(30,130,255))
      draw.SimpleText("4. ".. fourthMessage, "Trebuchet24", 5, 95, Color(30,130,255))
      draw.SimpleText("5. ".. fifthMessage, "Trebuchet24", 5, 120, Color(30,130,255))
      draw.SimpleText("6. ".. sixthMessage, "Trebuchet24", 5, 145, Color(30,130,255))
      draw.SimpleText("0. Close", "Trebuchet24", 5, 170, Color(30,130,255))
    elseif maxMessages == "5" then
      draw.RoundedBox(0,0,0,250,272,Color(0,0,0,210))
      draw.RoundedBox(0,0,0,250,15, Color(30,130,255))
      draw.RoundedBox(0,0,0,250,4, Color(70,180,255))
      draw.SimpleText("1. ".. firstMessage, "Trebuchet24", 4, 20, Color(30,130,255))
      draw.SimpleText("2. ".. secondMessage, "Trebuchet24", 5, 45, Color(30,130,255))
      draw.SimpleText("3. ".. thirdMessage, "Trebuchet24", 5, 70, Color(30,130,255))
      draw.SimpleText("4. ".. fourthMessage, "Trebuchet24", 5, 95, Color(30,130,255))
      draw.SimpleText("5. ".. fifthMessage, "Trebuchet24", 5, 120, Color(30,130,255))
      draw.SimpleText("0. Close", "Trebuchet24", 5, 145, Color(30,130,255))
    elseif maxMessages == "4" then
      draw.RoundedBox(0,0,0,250,272,Color(0,0,0,210))
      draw.RoundedBox(0,0,0,250,15, Color(30,130,255))
      draw.RoundedBox(0,0,0,250,4, Color(70,180,255))
      draw.SimpleText("1. ".. firstMessage, "Trebuchet24", 4, 20, Color(30,130,255))
      draw.SimpleText("2. ".. secondMessage, "Trebuchet24", 5, 45, Color(30,130,255))
      draw.SimpleText("3. ".. thirdMessage, "Trebuchet24", 5, 70, Color(30,130,255))
      draw.SimpleText("4. ".. fourthMessage, "Trebuchet24", 5, 95, Color(30,130,255))
      draw.SimpleText("0. Close", "Trebuchet24", 5, 120, Color(30,130,255))
    elseif maxMessages == "3" then
      draw.RoundedBox(0,0,0,250,272,Color(0,0,0,210))
      draw.RoundedBox(0,0,0,250,15, Color(30,130,255))
      draw.RoundedBox(0,0,0,250,4, Color(70,180,255))
      draw.SimpleText("1. ".. firstMessage, "Trebuchet24", 4, 20, Color(30,130,255))
      draw.SimpleText("2. ".. secondMessage, "Trebuchet24", 5, 45, Color(30,130,255))
      draw.SimpleText("3. ".. thirdMessage, "Trebuchet24", 5, 70, Color(30,130,255))
      draw.SimpleText("0. Close", "Trebuchet24", 5, 95, Color(30,130,255))
    end
  end
end

local Wait = false

hook.Add("KeyPress", "CalloutsOpen", function( ply, key )
  if isOpen == false then
    if ( key == IN_ZOOM ) then
      isOpen = true
      CalloutsOpen()
      timer.Simple( 1.7, function() closeff() end)
      hook.Add("Think", "CalloutsOpen", function()
        if isOpen == true then
          if input.IsKeyDown(KEY_1) && !Wait then
            LocalPlayer():ConCommand("say ".. firstMessage)
          end
          if input.IsKeyDown(KEY_2) && !Wait then
            LocalPlayer():ConCommand("say ".. secondMessage)
          end
          if input.IsKeyDown(KEY_3) && !Wait then
            LocalPlayer():ConCommand("say ".. thirdMessage)
          end
          if input.IsKeyDown(KEY_4) && !Wait then
            LocalPlayer():ConCommand("say ".. fourthMessage)
          end
          if input.IsKeyDown(KEY_5) && !Wait then
            LocalPlayer():ConCommand("say ".. fifthMessage)
          end
          if input.IsKeyDown(KEY_6) && !Wait then
            LocalPlayer():ConCommand("say ".. sixthMessage)
          end
          if input.IsKeyDown(KEY_7) && !Wait then
            LocalPlayer():ConCommand("say ".. seventhMessage)
          end
          if input.IsKeyDown(KEY_8) && !Wait then
            LocalPlayer():ConCommand("say ".. eigthMessage)
          end
          if input.IsKeyDown(KEY_9) && !Wait then
            LocalPlayer():ConCommand("say ".. ninthMessage)
          end
          if input.IsKeyDown(KEY_0) && !Wait then
            closeff()
          end
        end
      end)
    end
  end
end)
