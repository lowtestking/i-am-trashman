mapG = nil
mapP = nil
	mapP_mousedown = false
	mapP_dragging = false
	mapP_curX_old = 0
	mapP_curY_old = 0
	mapP_curX_new = 0
	mapP_curY_new = 0

mapT = nil
button_close = nil
buttonLTR = nil
	lookThroughRoofs = false
comboBoxLO = nil

surface.CreateFont( "map_text_font", {
    font = "Trebuchet24",
    extended = false,
    size = 30,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
} )

blur = Material("pp/blurscreen")

isOpen = false

mapSelection = nil

serverIP = game.GetIPAddress()
debuginfo1 = "debuginfo"
debuginfo2 = "debuginfo"
debuginfo3 = "debuginfo"
debuginfo4 = "debuginfo"
debuginfo5 = "debuginfo"
debuginfo6 = "debuginfo"
debuginfo7 = "debuginfo"
debuginfo8 = "debuginfo"
mapCamPos = Vector(0,0,0)
mapZoomSpeed = 400
mapScrollSpeed = 20
cmx = 0
cmy = 0
pwide = 0
ptall = 0

plyList = {}
