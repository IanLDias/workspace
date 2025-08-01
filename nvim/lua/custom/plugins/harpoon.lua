return {
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = {
        { "<leader>ht", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon Mark" },
        { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon file 1" },
        { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon file 2" },
        { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon file 3" },
        { "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon quicknav" },
    }
}
