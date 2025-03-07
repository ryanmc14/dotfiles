return {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
        { "folke/snacks.nvim" }, -- optional
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {
              ensure_installed = { "go" },
            },
        },
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDoc" },
    opts = {},
}
