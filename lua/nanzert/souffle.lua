vim.cmd [[autocmd BufNewFile,BufRead *.dl setfiletype souffle]]

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.souffle = {
  install_info = {
--  change this path to wherever you installed julienhenry/tree-sitter-souffle
    url = "~/repos/misc/tree-sitter-souffle",
    files = {"src/parser.c"}
  }
}
