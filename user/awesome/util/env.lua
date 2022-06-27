local M = {}
function M.hide_home(str)
  local home = os.getenv('HOME')
  if home == nil then
    if Log then
      Log.warn('(Env) can\'t find $HOME enviroment variable.')
    end
    return nil
  end
  return str:gsub(home, '~')
end

return M
