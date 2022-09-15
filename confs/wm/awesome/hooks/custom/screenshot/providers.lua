local flameshot = {
  fullscreen = 'flameshot full -c',
  selection = 'flameshot gui',
  daemon = 'flameshot',
}
return function(provider)
  if provider == 'flameshot' then
    return flameshot
  end
end
