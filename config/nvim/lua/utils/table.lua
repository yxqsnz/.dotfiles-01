function MergeTable(self, other_table)
  return vim.tbl_deep_extend('force', self, other_table)
end
