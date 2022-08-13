local this = {}

function this.command(command, desc, buf)
	local map = { string.format("<cmd>%s<cr>", command), desc, noremap = true }

	if buf ~= nil then
		map.buffer = buf
	end

	return map
end
return this
