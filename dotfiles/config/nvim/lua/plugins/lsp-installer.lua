-- Required for html/cssls because Microsoft :/
-- https://github.com/ericlovesmath/dotfiles/blob/master/.config/nvim/init.vim#L189-L203
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {  }
    -- (optional) Customize the options passed to the server
    if server.name == "emmet_ls" then
      opts.filetypes = { 'html', 'css', 'typescriptreact', 'javascriptreact', 'vue' }
    end

    if server.name == "volar" then
      opts.typescript = {
        tsdk = '/usr/local/lib/node_modules/typescript/lib'
      }
    end

    if server.name == "cssls" then
      opts = vim.tbl_deep_extend("force", opts, {
        capabilities = capabilities,
      })
    end

    -- opts.on_attach = require'virtualtypes'.on_attach

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
