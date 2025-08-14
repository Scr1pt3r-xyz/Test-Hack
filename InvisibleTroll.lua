
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = true


-- StarterGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58);
G2L["2"]["Size"] = UDim2.new(0, 407, 0, 232);
G2L["2"]["Position"] = UDim2.new(0, 1391, 0, 417);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["BackgroundTransparency"] = 0.1;


-- StarterGui.ScreenGui.Frame.UIDragDetector
G2L["3"] = Instance.new("UIDragDetector", G2L["2"]);
G2L["3"]["DragUDim2"] = UDim2.new(0, -26, 0, 39);


-- StarterGui.ScreenGui.Frame.UICorner
G2L["4"] = Instance.new("UICorner", G2L["2"]);



-- StarterGui.ScreenGui.Frame.UIStroke
G2L["5"] = Instance.new("UIStroke", G2L["2"]);
G2L["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["5"]["Thickness"] = 5;
G2L["5"]["Color"] = Color3.fromRGB(45, 45, 45);


-- StarterGui.ScreenGui.Frame.TextButton
G2L["6"] = Instance.new("TextButton", G2L["2"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextSize"] = 14;
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
G2L["6"]["FontFace"] = Font.new([[rbxassetid://16658246179]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["6"]["BackgroundTransparency"] = 0.1;
G2L["6"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[Hide]];
G2L["6"]["Position"] = UDim2.new(0.25307, 0, 0.39224, 0);


-- StarterGui.ScreenGui.Frame.TextButton.UIStroke
G2L["7"] = Instance.new("UIStroke", G2L["6"]);
G2L["7"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["7"]["Thickness"] = 5;
G2L["7"]["Color"] = Color3.fromRGB(45, 45, 45);


-- StarterGui.ScreenGui.Frame.TextButton.UICorner
G2L["8"] = Instance.new("UICorner", G2L["6"]);



-- StarterGui.ScreenGui.Frame.TextButton.LocalScript
G2L["9"] = Instance.new("LocalScript", G2L["6"]);



-- StarterGui.ScreenGui.Frame.TextButton.UIAspectRatioConstraint
G2L["a"] = Instance.new("UIAspectRatioConstraint", G2L["6"]);
G2L["a"]["AspectRatio"] = 4;


-- StarterGui.ScreenGui.Frame.UIAspectRatioConstraint
G2L["b"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["b"]["AspectRatio"] = 1.75431;


-- StarterGui.ScreenGui.Frame.TextButton.LocalScript
local function C_9()
	local script = G2L["9"];
	local player = game.Players.LocalPlayer

	local char = player.Character or player.CharacterAdded:Wait()
	--local hrp = char:WaitForChild("BasePart"):: BasePart
	local hum = char:WaitForChild('Humanoid'):: Humanoid

	local btm = script.Parent
	local e = false
	--hrp.Color = Color3.new(1,0,0)
	local oldposition = Vector3.new(0,0,0)
	hum.AutomaticScalingEnabled = false

	local height = 1789


	game.UserInputService.InputBegan:Connect(function(input, gm)
		if gm then
			return 
		end

		if input.KeyCode == Enum.KeyCode.F then
			if player and char then
				if e == false then
					e = true
					hum.HipHeight = height
					btm.Text = 'Unhide'
					oldposition = char.PrimaryPart.Position
					hum.CameraOffset = Vector3.new(0,-hum.HipHeight,0)
					--hrp.Transparency = 0.5
				else
					e = false
					if hum.RigType == Enum.RigType.R15 then
						hum.HipHeight = 3
					else
						hum.HipHeight = 0
					end
					btm.Text = 'Hide'
					char:MoveTo(Vector3.new(char.PrimaryPart.Position.X,oldposition.Y,char.PrimaryPart.Position.Z))
					hum.CameraOffset = Vector3.new(0,-hum.HipHeight,0)
					--hrp.Transparency = 1
				end
			end
		end
	end)

	btm.MouseButton1Down:Connect(function()
		if player and char then
			if e == false then
				e = true
				hum.HipHeight = height
				btm.Text = 'Unhide'
				oldposition = char.PrimaryPart.Position
				hum.CameraOffset = Vector3.new(0,-hum.HipHeight,0)
			else
				e = false
				hum.HipHeight = 0
				btm.Text = 'Hide'
				char:MoveTo(Vector3.new(char.PrimaryPart.Position.X,oldposition.Y,char.PrimaryPart.Position.Z))
				hum.CameraOffset = Vector3.new(0,-hum.HipHeight,0)
			end
		end
	end)
end;
task.spawn(C_9);

return G2L["1"], require;
