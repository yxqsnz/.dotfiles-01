local this = {}

function this.map(values, callback)
	for _, item in ipairs(values) do
		callback(item)
	end
end

return this
