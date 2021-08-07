local LSM3 = LibStub("LibSharedMedia-3.0", true)
local LSM2 = LibStub("LibSharedMedia-2.0", true)
local SML = LibStub("SharedMedia-1.0", true)

local SharedMediaFontin = {}
SharedMediaFontin.revision = tonumber(string.sub("$Revision$", 12, -3)) or 1

SharedMediaFontin.registry = { ["font"] = {} }

function SharedMediaFontin:Register(mediatype, key, data, langmask)
	if LSM3 then
		LSM3:Register(mediatype, key, data, langmask)
	end
	if LSM2 then
		LSM2:Register(mediatype, key, data)
	end
	if SML then
		SML:Register(mediatype, key, data)
	end
	if not SharedMediaFontin.registry[mediatype] then
		SharedMediaFontin.registry[mediatype] = {}
	end
	table.insert(SharedMediaFontin.registry[mediatype], { key, data, langmask})
end

function SharedMediaFontin.OnEvent(this, event, ...)
	if not LSM3 then
		LSM3 = LibStub("LibSharedMedia-3.0", true)
		if LSM3 then
			for m,t in pairs(SharedMediaFontin.registry) do
				for _,v in ipairs(t) do
					LSM3:Register(m, v[1], v[2], v[3])
				end
			end
		end
	end
	if not LSM2 then
		LSM2 = LibStub("LibSharedMedia-2.0", true)
		if LSM2 then
			for m,t in pairs(SharedMediaFontin.registry) do
				for _,v in ipairs(t) do
					LSM2:Register(m, v[1], v[2])
				end
			end
		end
	end
	if not SML then
		SML = LibStub("SharedMedia-1.0", true)
		if SML then
			for m,t in pairs(SharedMediaFontin.registry) do
				for _,v in ipairs(t) do
					SML:Register(m, v[1], v[2])
				end
			end
		end
	end
end

SharedMediaFontin.frame = CreateFrame("Frame")
SharedMediaFontin.frame:SetScript("OnEvent", SharedMediaFontin.OnEvent)
SharedMediaFontin.frame:RegisterEvent("ADDON_LOADED")

-- registrations for media from the client itself belongs in LibSharedMedia-3.0

if not SharedMediaFontin then return end
local revision = tonumber(string.sub("$Revision: 63551 $", 12, -3))
SharedMediaFontin.revision = (revision > SharedMediaFontin.revision) and revision or SharedMediaFontin.revision

-- -----
-- FONT
-- -----

SharedMediaFontin:Register("font", "Delicious Bold"            , [[Interface\Addons\SharedMedia_Fontin\Fonts\Delicious\Delicious_B_2021.otf]])
SharedMediaFontin:Register("font", "Delicious BoldItalic"      , [[Interface\Addons\SharedMedia_Fontin\Fonts\Delicious\Delicious_BI_2021.otf]])
SharedMediaFontin:Register("font", "Delicious Heavy"           , [[Interface\Addons\SharedMedia_Fontin\Fonts\Delicious\Delicious_H_2021.otf]])
SharedMediaFontin:Register("font", "Delicious Italic"          , [[Interface\Addons\SharedMedia_Fontin\Fonts\Delicious\Delicious_I_2021.otf]])
SharedMediaFontin:Register("font", "Delicious Regular"         , [[Interface\Addons\SharedMedia_Fontin\Fonts\Delicious\Delicious_R_2021.otf]])
SharedMediaFontin:Register("font", "Delicious SmallCaps"       , [[Interface\Addons\SharedMedia_Fontin\Fonts\Delicious\Delicious_SC_2021.otf]])

SharedMediaFontin:Register("font", "Diavlo Black"              , [[Interface\Addons\SharedMedia_Fontin\Fonts\Diavlo\Diavlo_BLACK_II_37.otf]])
SharedMediaFontin:Register("font", "Diavlo Bold"               , [[Interface\Addons\SharedMedia_Fontin\Fonts\Diavlo\Diavlo_BOLD_II_37.otf]])
SharedMediaFontin:Register("font", "Diavlo Book"               , [[Interface\Addons\SharedMedia_Fontin\Fonts\Diavlo\Diavlo_BOOK_II_37.otf]])
SharedMediaFontin:Register("font", "Diavlo Light"              , [[Interface\Addons\SharedMedia_Fontin\Fonts\Diavlo\Diavlo_LIGHT_II_37.otf]])
SharedMediaFontin:Register("font", "Diavlo Medium"             , [[Interface\Addons\SharedMedia_Fontin\Fonts\Diavlo\Diavlo_MEDIUM_II_37.otf]])

SharedMediaFontin:Register("font", "Fontin Bold"               , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin\Fontin-Bold.ttf]])
SharedMediaFontin:Register("font", "Fontin Italic"             , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin\Fontin-Italic.ttf]])
SharedMediaFontin:Register("font", "Fontin Regular"            , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin\Fontin-Regular.ttf]])
SharedMediaFontin:Register("font", "Fontin SmallCaps"          , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin\Fontin-SmallCaps.ttf]])

SharedMediaFontin:Register("font", "Fontin Sans Bold"          , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin Sans\Fontin_Sans_B_45b.otf]])
SharedMediaFontin:Register("font", "Fontin Sans BoldItalic"    , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin Sans\Fontin_Sans_BI_45b.otf]])
SharedMediaFontin:Register("font", "Fontin Sans Italic"        , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin Sans\Fontin_Sans_I_45b.otf]])
SharedMediaFontin:Register("font", "Fontin Sans Regular"       , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin Sans\Fontin_Sans_R_45b.otf]])
SharedMediaFontin:Register("font", "Fontin Sans SmallCaps"     , [[Interface\Addons\SharedMedia_Fontin\Fonts\Fontin Sans\Fontin_Sans_SC_45b.otf]])
