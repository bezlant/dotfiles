-- Autoinstall packer
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer, please restart Neovim..."
    vim.cmd [[ packadd packer.nvim ]]
end

-- Reload Neovim on plugins.lua save
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Pcall to be able to handle errors
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "Packer failed, please check your plugins.lua..."
    return
end

-- Popup window instead of a buffer
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins
return packer.startup(function(use)
    use { "wbthomason/packer.nvim", }
    use { "nvim-lua/popup.nvim", }
    use { "nvim-lua/plenary.nvim", }
    use { "Mofiqul/dracula.nvim", }
    use { "nvim-lualine/lualine.nvim", 
    requires = { "kyazdani42/nvim-web-devicons", opt = true} }

    -- Autoconfigure after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
