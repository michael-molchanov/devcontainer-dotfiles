return {
  {
    "mistricky/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    opts = {
      auto_start = true,
      log_level = "warn",
    },
  },
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "saghen/blink.cmp",
      "ravitemer/mcphub.nvim",
    },
    opts = {
      -- adapters = {
      --   http = {
      --     ["llama.cpp"] = function()
      --       return require("codecompanion.adapters").extend("openai_compatible", {
      --         env = {
      --           url = "http://127.0.0.1:8080",
      --           api_key = "TERM",
      --           chat_url = "/v1/chat/completions",
      --         },
      --       })
      --     end,
      --   },
      -- },
      interactions = {
        chat = {
          -- adapter = "llama.cpp",
          keymaps = {
            options = {
              modes = { n = "?" },
              callback = function()
                require("which-key").show({ global = false })
              end,
              description = "Codecompanion Keymaps",
              hide = true,
            },
          },
        },
        -- inline = {
        --   adapter = "llama.cpp",
        -- },
        -- cmd = {
        --   adapter = "llama.cpp",
        -- },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            -- MCP Tools
            make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
            show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
            add_mcp_prefix_to_tool_names = true, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
            show_result_in_chat = true, -- Show tool results directly in chat buffer
            format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
            -- MCP Resources
            make_vars = true, -- Convert MCP resources to #variables for prompts
            -- MCP Prompts
            make_slash_commands = true, -- Add MCP prompts as /slash commands
          },
        },
      },
    },
    keys = {
      { "<leader>acc", "<cmd>CodeCompanionChat<cr>", desc = "AI Chat", mode = { "n", "v", "x" } },
      { "<leader>acp", "<cmd>CodeCompanionChat Add<cr>", desc = "AI Chat Add", mode = { "v", "x" } },
      { "<leader>act", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat Toggle", mode = { "n" } },
      {
        "<leader>acr",
        "<cmd>CodeCompanionChat RefreshCache<cr>",
        desc = "AI Chat Refresh Cache",
        mode = { "n" },
      },
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions", mode = { "n", "v", "x" } },
      -- { "<leader>at", "<cmd>CodeCompanionCmd<cr>", desc = "AI Command", mode = { "n", "t" } },
      { "<leader>ap", "<cmd>CodeCompanion<cr>", desc = "AI Promt", mode = { "n" } },
      { "<leader>amh", "<cmd>MCPHub<cr>", desc = "MCP Hub", mode = { "n" } },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
  -- {
  --   "saghen/blink.cmp",
  --   dependencies = { "olimorris/codecompanion.nvim" },
  --   opts = {
  --     sources = {
  --       default = { "codecompanion" },
  --       providers = {
  --         codecompanion = {
  --           name = "CodeCompanion",
  --           module = "codecompanion.providers.completion.blink",
  --           enabled = true,
  --           score_offset = 10,
  --         },
  --       },
  --     },
  --   },
  -- },
}
