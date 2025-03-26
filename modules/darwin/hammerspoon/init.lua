--
-- ============= MODES =============
--
local hyper_mode = hs.hotkey.modal.new()
local open_mode = hs.hotkey.modal.new()
local browser_mode = hs.hotkey.modal.new()

--
-- ============= UTILS =============
--
local function enter_default_mode()
	hyper_mode:exit()
	open_mode:exit()
	browser_mode:exit()
	hs.alert.show("default")
end

local function enter_mode(mode, name)
	mode:enter()
	hs.alert.show(name)
end

hs.hotkey.bind({}, "F12", function()
	enter_default_mode()
	enter_mode(hyper_mode, "*")
end)

--
-- ============= HYPER MODE =============
--
hyper_mode:entered(function()
	hs.alert.show("*")
end)

hyper_mode:bind({}, "o", function()
	enter_mode(open_mode, "O")
	hyper_mode:exit()
end)

hyper_mode:bind({}, "f", function()
	enter_mode(browser_mode, "F")
	hyper_mode:exit()
end)

hyper_mode:bind({}, "e", function()
	hs.execute("open -a Alacritty")
	enter_default_mode()
end)

--
-- ============= OPEN MODE =============
--
open_mode:bind({}, "s", function()
	hs.execute("open -a Spotify")
	enter_default_mode()
end)

open_mode:bind({}, "m", function()
	hs.execute("open -a Messages")
	enter_default_mode()
end)

open_mode:bind({}, "v", function()
	hs.execute("open -a SurfShark")
	enter_default_mode()
end)

open_mode:bind({}, "d", function()
	hs.execute("open -a Digiexam")
	enter_default_mode()
end)

open_mode:bind({}, "n", function()
	hs.execute("open -a Notes")
	enter_default_mode()
end)

--
-- ============= BROWSER MODE =============
--
browser_mode:bind({}, "s", function()
	hs.execute("open -a Safari")
	enter_default_mode()
end)

browser_mode:bind({}, "g", function()
	hs.execute("open -a 'Google Chrome'")
	enter_default_mode()
end)

--
-- ============= EXIT =============
--
local modes = { hyper_mode, open_mode }
for _, m in ipairs(modes) do
	m:bind({}, "escape", function()
		enter_default_mode()
	end)
end
