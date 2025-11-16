return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
                enable = true,
                -- disable = { "python" },

				-- disable highlighting for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end

                    -- disable for specific languages
                    return (function()
                        -- local _disable_languages = { "python" }
                        local _disable_languages = {}

                        for _, language in ipairs(_disable_languages) do
                            if language == lang then
                                return true
                            end
                        end
                        return false
                    end)()
                end,
            },
            -- enable indentation
			indent = { enable = false },
			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"python",
				"go",
				"rust",
				"c",
				"cpp",
			},
		})
	end,
}
