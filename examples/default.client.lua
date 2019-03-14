-- default.client.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local ObjectHighlighter = require(ReplicatedStorage:FindFirstChild("ObjectHighlighter"))

-- This screen gui will contain our ViewportFrames
local myScreenGui = Instance.new("ScreenGui")
myScreenGui.Name = "ObjectHighlighter"
myScreenGui.Parent = Players.LocalPlayer.PlayerGui

local myRenderer = ObjectHighlighter.Renderer.new(myScreenGui)

-- Assume we have a Model as a direct child of Workspace
local myHighlight = ObjectHighlighter.Highlight.fromTarget(Workspace.Model)
myHighlight.color = Color3.fromRGB(255, 255, 0)

-- Apply our highlight object to our Renderer stack.
-- We can add as many highlight objects to a renderer as we need
myRenderer:addToStack(myHighlight)

RunService.RenderStepped:Connect(function(dt)
	-- Our renderer will not render until it steps
	myRenderer:step(dt)
end)