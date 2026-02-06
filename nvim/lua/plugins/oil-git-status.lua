return {
    "refractalize/oil-git-status.nvim",
    dependencies = {
        "stevearc/oil.nvim",
    },
    opts = {
        show_ignored = true, -- show files that match gitignore with !!
        symbols = {          -- customize the symbols that appear in the git status columns
            index = {
                ["!"] = "!",
                ["?"] = "?",
                ["A"] = "A",
                ["C"] = "C",
                ["D"] = "D",
                ["M"] = "M",
                ["R"] = "R",
                ["T"] = "T",
                ["U"] = "U",
                [" "] = " ",
            },
            working_tree = {
                ["!"] = "!",
                ["?"] = "?",
                ["A"] = "A",
                ["C"] = "C",
                ["D"] = "D",
                ["M"] = "M",
                ["R"] = "R",
                ["T"] = "T",
                ["U"] = "U",
                [" "] = " ",
            },
        },
    },
}
