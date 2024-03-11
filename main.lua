local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "VelvetX Key System", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})

_G.SpecialKeys = { -- Special keys with unique identifiers
    ["VXKEY_FTHghUYyT&YUr67rrU6rHYriHJTTDE5TR6YJRRSWES"] = true,
    ["VXKEY_fHtRTT876574ew6"] = true,
    ["VXKEY_hjuyGu7TuGFtRfRTYTGU6TRD6R7RI"] = true,
    ["VXKEY_UJYTGT7FGTJUtDfy6TFTRyfU6R4Udy7eDE"] = true,
    ["VXKEY_YT7Ughkgu.GG5deUFeYryt&usef"] = true,
    ["VXKEY_giuyGTUKKTiyTuYGuyrYyrtYGTiol"] = true,
    ["VXKEY_iobg8oyuju9s7927e0ejufdudu9"] = true,
    ["VXKEY_dhgsdgeuigdeyd9y9rgt"] = true,
    ["VXKEY_gGyJUgTu6yFYRkufy8fyy yirytgryfhugfi"] = true,
    ["VXKEY_dkushiwjdwuggdywyhdwuydjwdjhgeybgeygeli"] = true,
    ["VXKEY_dhuyetedtgeruuyyue7y8eytr7te7yure"] = true,
    ["VXKEY_hfi8yre8fy8fg8df7o8fd8tdttyded8"] = true,
    ["VXKEY_fuyheu7yrfe7y4ory4p6r94"] = true,
    ["VXKEY_kjdhf8wgfd7egftgefi"] = true,
    ["VXKEY_ueydiuewhdbuwi7dywed7i"] = true,
    ["VXKEY_di8ewidehgwilidywrig74rt3tu7eru6e"] = true,
    ["VXKEY_dey8ydeuw87twoeuy7tw8gtw86utd72"] = true,
    ["VXKEY_diuuhdcgysdfukwdwed8wfyew"] = true,
    ["VXKEY_df7d7wtrftgfuyewt6rdfsrfiueswfe78ge"] = true,
    ["VXKEY_hsgduhwgydwue7r8y72633656re"] = true,
    ["VXKEY_djuiwyry6hdtfjf8dbvyetwr346rtrd"] = true,
    ["VXKEY_diuwe8r7y438yr3ury6347jwsd8pur093f8rg"] = true,
    ["VXKEY_fehyr3f729rt378tre7t6ty64rt"] = true,
    ["VXKEY_dsh2387rg88fg8i3ye8uyh38gte3d"] = true,
    ["VXKEY_dfgrwhoef96fy86348u7834ut6u3i7u7"] = true
}

_G.KeyInput = "string"

function MakeScriptHub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Iamiak/Velvet-X/main/main.lua"))() -- Load and execute the provided script
    OrionLib:Destroy() -- Destroy the interface after executing the script
end

function CorrectKeyNotifications()
    OrionLib:MakeNotification({
        Name = "Correct Key",
        Content = "Welcome To The VelvetX Party :D",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function WrongKeyNotifications()
    OrionLib:MakeNotification({
        Name = "Wrong Key",
        Content = "You're Not on The List Kid",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

local function isKeyEnteredRecently()
    local hwid = getHWID()
    local lastEnteredTime = tonumber(localStorage.getItem('last_key_entry_' .. hwid))
    return lastEnteredTime and (os.time() - lastEnteredTime <= 24 * 60 * 60)
end

local Tab = Window:MakeTab({
    Name = "VelvetX Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "Enter Key",
    Default = "Enter Key",
    TextDisappear = true,
    Callback = function(Value)
        _G.KeyInput = Value
    end
})

Tab:AddButton({
    Name = "Check Key!",
    Callback = function()
        if _G.SpecialKeys[_G.KeyInput] then
            MakeScriptHub() -- Execute the script
            CorrectKeyNotifications()
            localStorage.setItem('last_key_entry_' .. getHWID(), os.time()) -- Save current time as last key entry time
        else
            WrongKeyNotifications()
        end
    end
})

Tab:AddButton({
    Name = "Get Key",
    Callback = function()
        toClipboard("https://velvetxcp1.netlify.app/")
    end
})

if isKeyEnteredRecently() then
    OrionLib:Destroy() -- Destroy the interface if the correct key was entered recently
end

