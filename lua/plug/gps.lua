require("nvim-gps").setup({
	disable_icons = false,           -- Setting it to true will disable all icons
	icons = {
		["class-name"] = ' ',      -- Classes and class-like objects
	        -- ['class-name'] = 'ﴯ ',
                -- ['container-name'] = 'פּ ',
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' ',     -- Methods (functions inside class-like objects)
		["tag-name"] = '炙',         -- Tags (example: html tags)
                ["table-name"] = ' ',
		["array-name"] = ' ',
                ["module-name"] = ' ',
                ["container-name"] = ' ',
	},

	-- Add custom configuration per language or
	-- Disable the plugin for a language
	-- Any language not disabled here is enabled by default
	languages = {
		-- Some languages have custom icons
		["json"] = {
			icons = {
				["array-name"] = ' ',
				["object-name"] = ' ',
				["null-name"] = '[] ',
				["boolean-name"] = 'ﰰﰴ ',
				["number-name"] = '# ',
				["string-name"] = ' '
			}
		},
                -- ["svelte"] = {
                --     icons = {
                --     }
                -- },
		["toml"] = {
			icons = {
				["table-name"] = ' ',
				["array-name"] = ' ',
				["boolean-name"] = 'ﰰﰴ ',
				["date-name"] = ' ',
				["date-time-name"] = ' ',
				["float-name"] = ' ',
				["inline-table-name"] = ' ',
				["integer-name"] = '# ',
				["string-name"] = ' ',
				["time-name"] = ' '
			}
		},
		["verilog"] = {
			icons = {
				["module-name"] = ' '
			}
		},
		["yaml"] = {
			icons = {
				["mapping-name"] = ' ',
				["sequence-name"] = ' ',
				["null-name"] = '[] ',
				["boolean-name"] = 'ﰰﰴ ',
				["integer-name"] = '# ',
				["float-name"] = ' ',
				["string-name"] = ' '
			}
		},

                ["rust"] = {
                    icons = {
                        ["function-name"] = ' ',
                        ["method-name"] = ' ',
                        ["class-name"] = ' ',
                        ["container-name"] = '⛶ ',
                        ["tag-name"] = '炙'
                    }
                }

		-- Disable for particular languages
		-- ["bash"] = false, -- disables nvim-gps for bash
		-- ["go"] = false,   -- disables nvim-gps for golang

		-- Override default setting for particular languages
		-- ["ruby"] = {
		--	separator = '|', -- Overrides default separator with '|'
		--	icons = {
		--		-- Default icons not specified in the lang config
		--		-- will fallback to the default value
		--		-- "container-name" will fallback to default because it's not set
		--		["function-name"] = '',    -- to ensure empty values, set an empty string
		--		["tag-name"] = ''
		--		["class-name"] = '::',
		--		["method-name"] = '#',
		--	}
		--}
	},

	separator = ' › ', -- ❯

	-- limit for amount of context shown
	-- 0 means no limit
	-- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
	-- in context names (eg: function names, class names, etc)
	depth = 0,

	-- indicator used when context is hits depth limit
	depth_limit_indicator = "»"
})


-- usage
-- local gps = require("nvim-gps")

-- gps.is_available()  -- Returns boolean value indicating whether a output can be provided
-- gps.get_location()  -- Returns a string with context information
--
-- 
-- require("lualine").setup({
-- 	sections = {
-- 			lualine_c = {
-- 				{ gps.get_location, cond = gps.is_available },
-- 			}
-- 	}
-- })
