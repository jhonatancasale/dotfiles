-- In your plugins/semshi.lua or similar file

-- return {}
return {
  'numirias/semshi',
  ft = 'python', -- Load Semshi only for Python filetypes
  config = function()
    -- Optional: Configure Semshi settings here
    -- Add more Semshi configuration as needed
  end,
  -- You can add other lazy-loading options if desired,
  -- such as `event = "BufReadPost"`, but `ft = 'python'` is often sufficient
  -- for filetype-specific plugins.
}
