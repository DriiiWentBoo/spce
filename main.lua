if not game:IsLoaded() then
	game.Loaded:Wait()
end
if isfolder("spce") --[[+ or krnl isfolder version]] then
	print("spce folder found")
else
	makefolder("spce")
end

local function checkforwhitelist()

	if game:GetService("Players").LocalPlayer:IsFriendsWith(546379820) or game:GetService("Players").LocalPlayer.UserId == "546379820" then

		return true
	else
		return false
	end


end

if checkforwhitelist() then
	print("loading")
else
	print("pre whitelist check returned false")
	script:Destroy()
end

_G.settings = {

	alreadyloaded = false,
	update = true
}

local function savesettings()

	local json
	local httpservice = game:GetService("HttpService")
	if writefile then
		json = httpservice:JSONEncode(_G.settings)
		writefile("spceloadersettings.txt", json)

	--[[elseif krnlwritefile then
		json = httpservice:JSONEncode(_G.settings)
		writefile("spceloadersettings", json)]]

	else

		print("executor not supported. try using krnl or synapse (krnl is literally free why not use it lol)")

	end

end

local function loadsettings()
	local httpservice = game:GetService("HttpService")
	if (readfile and isfile and isfile("spceloadersettings.txt")) then -- checks if there is a readfile and a isfile function in your executor, then checks if there is a file named spceloadersettings
		_G.settings = httpservice:JSONDecode(readfile("spceloadersettings.txt")) -- reads tge spceloadersettings and decodes the spceloadersettings file into lua and puts the settings into the settings table
	end
end	
loadsettings()
if _G.settings.update then
	print("update")
	delfile("spceloadersettings.txt")
end




loadsettings()


if _G.settings.alreadyloaded then
	print("execut")
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DriiiWentBoo/spce/main/spcething.lua"))()
	return
end



-- Instances:
local core = game:GetService("CoreGui")
local InsertedObjects = Instance.new("ScreenGui")
local sp = Instance.new("ImageLabel")
local notwhitelsited = Instance.new("ImageLabel")
local blacklisted = Instance.new("ImageLabel")

--Properties:

InsertedObjects.Name = "InsertedObjects"
InsertedObjects.Parent = core
InsertedObjects.ResetOnSpawn = false

sp.Name = "sp"
sp.Parent = InsertedObjects
sp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sp.BackgroundTransparency = 1.000
sp.Position = UDim2.new(0.158, 0,1, 0)
sp.Size = UDim2.new(0.721818209, 0, 0.992529333, 0)
sp.Image = "rbxassetid://10653708088"
sp.ScaleType = Enum.ScaleType.Crop

notwhitelsited.Visible = false
notwhitelsited.Name = "notwhitelsited"
notwhitelsited.Parent = InsertedObjects
notwhitelsited.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notwhitelsited.BackgroundTransparency = 1.000
notwhitelsited.Position = UDim2.new(0.245077938, 0, 0.187538072, 0)
notwhitelsited.Size = UDim2.new(0.50754714, 0, 0.486646891, 0)
notwhitelsited.Image = "rbxassetid://10665024181"
notwhitelsited.ScaleType = Enum.ScaleType.Crop

blacklisted.Visible = false
blacklisted.Name = "blacklisted"
blacklisted.Parent = InsertedObjects
blacklisted.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
blacklisted.BackgroundTransparency = 1.000
blacklisted.Position = UDim2.new(0.215094343, 0, 0.142433226, 0)
blacklisted.Size = UDim2.new(0.5679245, 0, 0.572700322, 0)
blacklisted.Image = "rbxassetid://10664172702"
blacklisted.ScaleType = Enum.ScaleType.Crop


local errorsound = Instance.new("Sound")
errorsound.SoundId = "rbxassetid://9075457706"










if _G.settings.alreadyloaded == false then
	-- tween stuff
	wait(2)
	sp:TweenPosition(UDim2.new(0.139, 0,-0.113, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quart, 2, false)
	wait(3)
	if checkforwhitelist() then
		print("Whitelisted")
	else
		errorsound:Play()
		notwhitelsited.Visible = true

		wait(10)
		InsertedObjects:Destroy()
		script:Destroy()
	end



	-- last check
	wait(6)
	InsertedObjects:Destroy()
	if checkforwhitelist() then

		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DriiiWentBoo/spce/main/spcething.lua"))()

	end

	_G.settings.alreadyloaded = true
	savesettings()
	_G.settings.update = false
	savesettings()
	script:Destroy()

end


