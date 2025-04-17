return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
        -- "rafamadriz/friendly-snippets",
        "rafamadriz/friendly-snippets"
    },
    config = function()
        local ls = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        ls.config.set_config({
            history = true,
            enable_autosnippets = true,
        })

        vim.keymap.set({ "i" }, "<C-e>", function() ls.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })
    end,
}
