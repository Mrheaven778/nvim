return {
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        -- Configuración básica
        auto_update = true, -- Actualizar automáticamente la presencia
        neovim_image_text = "The One True Text Editor", -- Texto para la imagen de Neovim
        main_image = "neovim", -- Imagen principal (neovim o file)
        log_level = nil, -- Nivel de logs (opcional)
        debounce_timeout = 10, -- Tiempo de debounce para actualizaciones
        enable_line_number = false, -- Mostrar número de línea
        blacklist = {}, -- Lista de archivos o patrones para ignorar
        buttons = true, -- Mostrar botones en la presencia
      })
    end,
  },
}
