return {
  "lewis6991/gitsigns.nvim",
  event = {"BufReadPre", "BufNewFile"},
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mod, l, r, desc)
        vim.keymap.set(mod, l, r, {buffer = bufnr, desc = desc})
      end

      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "[h", gs.prev_hunk, "Prev hunk")

      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>hs", function()
        gs.stage_hunk ({vim.fn.line ".", vim.fn.line "v"})
      end, "Stage hunk (visual)")
      map("v", "<leader>hr", function()
        gs.reset_hunk ({vim.fn.line ".", vim.fn.line "v"})
      end, "Reset hunk (visual)")

      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>hb", function()
        gs.blame_line {full = true}
      end, "Blame line")
      map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle current line blame")

      map("n", "<leader>hd", gs.diffthis, "Diff this")
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
    end
  }
}
