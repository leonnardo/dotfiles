return {
  {
    "nvim-mini/mini.surround",
    opts = function(_, opts)
      opts.custom_surroundings = opts.custom_surroundings or {}

      opts.custom_surroundings.m = {
        input = { "```[^\n]*\n().-()\n```" },
        output = function()
          local lang = require("mini.surround").user_input("Code fence language")
          if lang == nil then
            return nil
          end

          return {
            left = "```" .. lang .. "\n",
            right = "\n```",
          }
        end,
      }
    end,
  },
}
