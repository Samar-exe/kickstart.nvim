return {
  { "nvchad/volt", lazy = true },
  { "nvchad/menu", lazy = true },
  config = function ()
    require('menu').open("default")
  end
}
