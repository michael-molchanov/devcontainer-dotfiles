-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- OSC 52 clipboard.
local is_ssh = vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil

-- Enable OSC 52 clipboard in remote sessions (Neovim 0.10+)
if is_ssh and vim.fn.has("nvim-0.10") == 1 then
  local osc52 = require("vim.ui.clipboard.osc52")
  -- Copy-only OSC 52, paste falls back to the unnamed register
  local function fallback_paste(_)
    return function(_)
      local content = vim.fn.getreg('"')
      return vim.split(content, "\n")
    end
  end
  vim.opt.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = fallback_paste("+"),
      ["*"] = fallback_paste("*"),
    },
  }
end

vim.opt.colorcolumn = "120"
vim.opt.list = true
vim.opt.listchars = {
  tab = " ▸",
  space = " ",
  nbsp = "␣",
  trail = "•",
  extends = "»",
  precedes = "«",
}

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

-- LSP Server to use for Ruby.
-- Set to "solargraph" to use solargraph instead of ruby_lsp.
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "rubocop"

-- LSP Server to use for Rust.
-- Set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
-- only for diagnostics. The rest of LSP support will still be
-- provided by rust-analyzer.
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
