return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletion = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "strict",
                inlayHints = {
                  callArgumentNames = true,
                  functionReturnTypes = true,
                  genericTypes = true,
                  pytestParameters = true,
                  variableTypes = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
