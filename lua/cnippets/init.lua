local function extractFieldNameAndType(line)
	local fieldName
	local fieldType
	local lastWord = ""

	for word in string.gmatch(line, "%a+") do
		print(word)
		if string.match(word, "%a:") then
			fieldName = word:sub(0, word:len())
		elseif word == ":" then
			fieldName = lastWord
		end
		if lastWord == ":" then
			fieldType = word
		end
		lastWord = word
	end

	print(fieldName)
	print(fieldType)
end

local function printSelectedLines()
	print("Calling function!")
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")

	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)

	for _, line in ipairs(lines) do
		extractFieldNameAndType(line)
	end
end

-- vim.api.nvim_create_user_command("PrintSelectedLines", function()
-- 	print_selected_lines()
-- end, {})

return {
	printSelectedLines = printSelectedLines,
}
