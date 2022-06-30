local util = require "lspconfig.util"
return {
  root_dir = function (fname)
    return util.root_pattern('go.mod', '.git')(fname) or util.path.dirname(fname)
  end
}
