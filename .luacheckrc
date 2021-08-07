----------------------------------------
-- Setup
---

std = 'lua51'

----------------------------------------
-- Path Exclusions
---

exclude_files = {
	".luacheckrc",
	".docs",
}

----------------------------------------
-- Ignored Warnings
---

ignore = {
}

----------------------------------------
-- Read-Only Globals
---

read_globals = {
	-- WoW API
	"GetAddOnMetadata",
	"GetLocale",

	-- Libraries
	"LibStub",
}
