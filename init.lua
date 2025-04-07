if not isfolder("Luarmor_AOH") then
	makefolder("Luarmor_AOH")
end
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
local ImGui = loadstring(game:HttpGet('https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'))()

api.script_id = "892f6a026b91a86c14432a08dd0ab0c1"

local keyFile
if not isfile("Luarmor_AOH/key.txt") then
	writefile("Luarmor_AOH/key.txt","")
	keyFile = readfile("Luarmor_AOH/key.txt")
else
	keyFile = readfile("Luarmor_AOH/key.txt")
	local status = api.check_key(keyFile)
	if (status.code == "KEY_VALID") then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Found User",
			Text = "Key Found, Loading AntiOder Hub...",
			Duration = 5
		})
		script_key = keyFile
		api.load_script()
		script:Destroy()
		return

	end
end

local _PremiumAd = nil
local _KeySystem = nil
local ProgressBarWindow = ImGui:CreateWindow({
	Title = "AntiOder Hub",
	TabsBar = false,
	AutoSize = "Y",
	NoCollapse = true,
	NoResize = true
})

local progess = ProgressBarWindow:CreateTab({
	Name = "Demos",
})

local ProgressBar = progess:ProgressBar({
	Label = "Loading...",
	Percentage = 80
})

ProgressBarWindow:Center()
ProgressBarWindow:ShowTab(progess) 

local Percentage = 0
while Percentage < 100 do
		Percentage += 1
	ProgressBar:SetPercentage(Percentage % 100)
	task.wait(.01)
end
ProgressBarWindow.Close()

local KeySystem = ImGui:CreateWindow({
	Title = "AntiOder Hub",
	Size = UDim2.fromOffset(325,175),
	NoCollapse = true,
	NoResize = true
})
_KeySystem = KeySystem
	
KeySystem:Center()
local Content = KeySystem:CreateTab({
	Name = "Redeem"
})

local Key = Content:InputText({
	Label = "Key",
	PlaceHolder = "Key here",
	Value = "",
})

Content:Button({
	Text = "Enter",
	Callback = function()
		local status = api.check_key(Key:GetValue()); 
		if (status.code == "KEY_VALID") then
			writefile("Luarmor_AOH/key.txt",Key:GetValue())
			KeySystem:Close()
			script_key = Key:GetValue()
			api.load_script()
			script:Destroy()
		end
	end,
})
Content:Button({
	Text = "Copy Key Website",
	Callback = function()
		setclipboard("https://antioderhub.lol/keysystem/")
	end,
})




game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Init",
	Text = "Script loaded",
	Duration = 5
})


