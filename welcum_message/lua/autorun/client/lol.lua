--[[
    ____ __  __           ___ __  __       ____    __  __
   / __ )\ \/ /          /   |\ \/ /      / __ \  / / / /
  / __  | \  /          / /| | \  /      / /_/ / / / / / 
 / /_/ /  / /          / ___ | / /   _  / _, _/ / /_/ /  
/_____/  /_/          /_/  |_|/_/   (_)/_/ |_|  \____/   
                                                          
--]]

if CLIENT then
    local positions = {
        gm_construct = {
            textPosition = Vector(0.572196, 209.694351, 280.864197),
            smallTextPosition = Vector(0.572196, 209.694351, 200.864197)
        },
        
        gm_flatgrass = {
            textPosition = Vector(4.322309, -13.255089, -11967.118164), 
            smallTextPosition = Vector(4.322309, -13.255089, -12085.118164) 
        }
    }

    hook.Add("PostDrawOpaqueRenderables", "DrawTextAndImage", function()
        local mapName = game.GetMap()
        local color = Color(255,255,255)
        if positions[mapName] then
            local textPos = positions[mapName].textPosition
            local smallTextPos = positions[mapName].smallTextPosition
            local angle = Angle(0, RealTime() * 5 % 360, 90)
            local scale = 1

            cam.Start3D2D(textPos, angle, scale)
            draw.SimpleText("Welcome", "Eblanograd_Big", 0, 0, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            cam.End3D2D()

            cam.Start3D2D(textPos, Angle(180, RealTime() * 5 % 360, -90), scale)
            draw.SimpleText("Welcome", "Eblanograd_Big", 0, 0, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            cam.End3D2D()

            cam.Start3D2D(smallTextPos, angle, scale)
            draw.SimpleText("Map: " .. game.GetMap(), "Eblanograd_Small", 0, 0, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            cam.End3D2D()

            cam.Start3D2D(smallTextPos, Angle(180, RealTime() * 5 % 360, -90), scale)
            draw.SimpleText("Map: " .. game.GetMap(), "Eblanograd_Small", 0, 0, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            cam.End3D2D()
        end
    end)
end