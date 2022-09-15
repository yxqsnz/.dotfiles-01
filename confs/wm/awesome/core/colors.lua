local escape = string.char(27) .. '[%dm'

return {
  green = escape:format('32'),
  red = escape:format('31'),
  cyan = escape:format('36'),
  yellow = escape:format('33'),
  dim = escape:format('2'),
  reset = escape:format('0'),
}
