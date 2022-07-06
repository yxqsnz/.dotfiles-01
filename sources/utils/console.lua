local colors = require('sources.utils.colors')
BLOCK = string.format("%s::%s", colors.cyan, colors.reset)
function Printf(...)
    io.write(string.format(...))
end
function ERROR(text)
   Printf("%s::%s %s\n", colors.magenta, colors.red, text)
end

function INFO(text)
    Printf("%s %s%s%s\n", BLOCK, colors.green, text, colors.reset)
end

function ASK_FMT(text)
    return string.format("%s %s%s%s", BLOCK, colors.yellow, text, colors.reset)
end

function QUESTION(text)
    io.write(string.format("%s [%sN%s/%sy%s] ", ASK_FMT(text), colors.red, colors.reset, colors.green, colors.reset)
        ..
        colors.reset)
    return io.read("l") == 'y'
end
