require("kunconfig.core.require")
require("kunconfig.lazy.lazy")

vim.cmd[[colorscheme tokyonight-night]]
-- setup colorbuddy
local colorbuddy = require("colorbuddy")
local Group = colorbuddy.Group
local colors = colorbuddy.colors
local styles = colorbuddy.styles

Group.new("visual", colors.NONE, colors.base03, styles.reverse, colors.base1)














