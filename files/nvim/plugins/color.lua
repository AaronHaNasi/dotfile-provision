return {
  "abreujp/scholar.nvim",
  priority = 1000,
  config = function()
    require("scholar").setup({
      -- your configuration here
    })

    local function macos_background()
      local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
      if not handle then
        return "light"
      end
      local result = handle:read("*a")
      handle:close()
      return result:match("Dark") and "dark" or "light"
    end

    local function sync_background()
      local bg = macos_background()
      if vim.o.background ~= bg then
        vim.o.background = bg
      end
    end

    sync_background()
    vim.cmd("colorscheme scholar")

    vim.api.nvim_create_autocmd("FocusGained", {
      group = vim.api.nvim_create_augroup("ScholarMacOSAppearance", { clear = true }),
      callback = sync_background,
    })
  end,
}
