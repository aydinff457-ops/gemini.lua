-- [[ VERSI VIP GEMINI HUB - 99 NIGHTS IN THE FOREST ]] --
-- [[ REPOSITORY: aydinff457-ops ]] --

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Tampilan Window Utama Gemini Hub
OrionLib:MakeWindow({Name = "🟣 Gemini Hub | VIP Edition", HidePremium = false, SaveConfig = false, ConfigFolder = "GeminiConfig"})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local hum = character:WaitForChild("Humanoid")
local spawnJumlah = 500 -- Brutal 500 item sekaligus!

local TabMain = OrionLib:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- 1. FITUR TREE FARM (🪵)
TabMain:AddButton({
	Name = "🪵 Tree Farm (Spawn 500 Wood)",
	Icon = "rbxassetid://7733799616",
	Callback = function()
		pcall(function()
			for i = 1, spawnJumlah do
				game:GetService("ReplicatedStorage").Events.SpawnItem:FireServer("Wood", hrp.CFrame + Vector3.new(math.random(-8,8), 3, math.random(-8,8)))
			end
			OrionLib:MakeNotification({Name = "Gemini Hub", Content = "🪵 500 Kayu Berhasil Di-spawn!", Image = "rbxassetid://7733799616", Time = 3})
		end)
	end
})

-- 2. FITUR POWER FARM (⛽)
TabMain:AddButton({
	Name = "⛽ Power Farm (Spawn 500 Fuel)",
	Icon = "rbxassetid://10723385759",
	Callback = function()
		pcall(function()
			for i = 1, spawnJumlah do
				game:GetService("ReplicatedStorage").Events.SpawnItem:FireServer("Fuel", hrp.CFrame + Vector3.new(math.random(-8,8), 3, math.random(-8,8)))
				game:GetService("ReplicatedStorage").Events.SpawnItem:FireServer("Gasoline", hrp.CFrame + Vector3.new(math.random(-8,8), 3, math.random(-8,8)))
			end
			OrionLib:MakeNotification({Name = "Gemini Hub", Content = "⛽ Bensin & Fuel Berhasil Di-spawn!", Image = "rbxassetid://10723385759", Time = 3})
		end)
	end
})

-- 3. FITUR MINING FARM (⛏️)
TabMain:AddButton({
	Name = "⛏️ Mining Farm (Spawn 500 Ore)",
	Icon = "rbxassetid://7733715403",
	Callback = function()
		pcall(function()
			for i = 1, spawnJumlah do
				game:GetService("ReplicatedStorage").Events.SpawnItem:FireServer("Coal", hrp.CFrame + Vector3.new(math.random(-8,8), 3, math.random(-8,8)))
				game:GetService("ReplicatedStorage").Events.SpawnItem:FireServer("IronOre", hrp.CFrame + Vector3.new(math.random(-8,8), 3, math.random(-8,8)))
				game:GetService("ReplicatedStorage").Events.SpawnItem:FireServer("Scrap", hrp.CFrame + Vector3.new(math.random(-8,8), 3, math.random(-8,8)))
			end
			OrionLib:MakeNotification({Name = "Gemini Hub", Content = "⛏️ Material Tambang Berhasil Di-spawn!", Image = "rbxassetid://7733715403", Time = 3})
		end)
	end
})

-- 4. FITUR AUTO EAT (🍖)
TabMain:AddButton({
	Name = "🍖 Auto Eat (Spawn 500 Meat)",
	Icon = "rbxassetid://7733758362",
	Callback = function()
		pcall(function()
			for i = 1, spawnJumlah do
				game:GetService("ReplicatedStorage").Events.SpawnItem:FireServer("Meat", hrp.CFrame + Vector3.new(math.random(-8,8), 3, math.random(-8,8)))
			end
			OrionLib:MakeNotification({Name = "Gemini Hub", Content = "🍖 500 Daging Berhasil Di-spawn!", Image = "rbxassetid://7733758362", Time = 3})
		end)
	end
})

-- 5. FITUR ENTITY GODMODE (🛡️)
TabMain:AddToggle({
	Name = "🛡️ Entity Godmode",
	Icon = "rbxassetid://7733917120",
	Default = false,
	Callback = function(Value)
		getgenv().GodModeEnabled = Value
		if Value then
			pcall(function()
				if character:FindFirstChild("TakeDamage") then character.TakeDamage:Destroy() end
				if character:FindFirstChild("Health") then character.Health:Destroy() end
				hum.MaxHealth = 999999
				hum.Health = 999999
			end)
			OrionLib:MakeNotification({Name = "Gemini Hub", Content = "🛡️ God Mode AKTIF!", Image = "rbxassetid://7733917120", Time = 3})
		else
			hum.Health = 0 -- Matiin toggle = reset karakter biar normal lagi pas respawn
			OrionLib:MakeNotification({Name = "Gemini Hub", Content = "🛡️ God Mode NONAKTIF!", Image = "rbxassetid://7733917120", Time = 3})
		end
	end
})

-- Loop back-end penstabil God Mode
task.spawn(function()
    while task.wait(1) do
        if getgenv().GodModeEnabled and hum and hum.Parent then
            hum.Health = 999999
        end
    end
end)

OrionLib:Init()
