local M = {}
function M.err(text)
  printf("[error] %s", text)
end

function M.info(text)
  printf("[ info] %s", text)
end

function M.warn(text)
  printf("[ warn] %s", text)
end

function M.debug(text)
  printf("[debug] %s", text)
end

return M
