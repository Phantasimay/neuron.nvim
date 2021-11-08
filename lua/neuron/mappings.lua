local api = vim.api
local config = require("neuron/config")

local M = {}

function M.map_buf(key, rhs)
  local lhs = string.format("%s%s", '<leader>n', key)
  api.nvim_buf_set_keymap(0, "n", lhs, rhs, {noremap = true, silent = true})
end

function M.map(key, rhs)
  local lhs = string.format("%s%s", '<leader>n', key)
  api.nvim_set_keymap("n", lhs, rhs, {noremap = true, silent = true})
end

function M.set_keymaps()
  api.nvim_buf_set_keymap(0, "n", "<CR>", ":lua require'neuron'.enter_link()<CR>", {noremap = true, silent = true})
  M.map("<CR>", "<cmd>lua require'neuron'.enter_link()<CR>")

  M.map("nn", "<cmd>lua require'neuron/cmd'.new_edit(require'neuron/config'.neuron_dir)<CR>")

  M.map("nz", "<cmd>lua require'neuron/telescope'.find_zettels()<CR>")
  M.map("nZ", "<cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>")

  M.map("nb", "<cmd>lua require'neuron/telescope'.find_backlinks()<CR>")
  M.map("nB", "<cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>")

  M.map("nt", "<cmd>lua require'neuron/telescope'.find_tags()<CR>")

  M.map("ns", "<cmd>lua require'neuron'.rib()<CR>")

  M.map("n]", "<cmd>lua require'neuron'.goto_next_extmark()<CR>")
  M.map("n[", "<cmd>lua require'neuron'.goto_prev_extmark()<CR>")
end

---setup the keymappings
function M.setup()
  M.set_keymaps()
  M.map("i", "<cmd>lua require'neuron'.goto_index()<CR>")
end

return M
