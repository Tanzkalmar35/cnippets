local function extractFieldNameAndType(line)
	local fieldName
	local fieldType
	local lastWord = ""
	local nextWordEnds = false

	for word in string.gmatch(line, "%S+") do
		-- print(word)
		-- If the word ends with ":", it is the name of the field followed by the type
		if nextWordEnds then
			fieldType = word
			-- After the type there should be no more.
			break
		end
		if string.sub(word, -1) == ":" then
			fieldName = word:sub(0, word:len() - 1)
			nextWordEnds = true
		elseif word == ":" then
			fieldName = lastWord
		elseif lastWord == ":" then
			fieldType = word
		end
		lastWord = word
	end

	return { fieldName, fieldType }
end

local function insertCode(code)
	local lineCount = vim.api.nvim_buf_line_count(0)
	vim.api.nvim_buf_set_lines(0, lineCount, lineCount, false, vim.split(code, "\n"))
end

local function printSelectedLines()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local nameTypePairs = {}

	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)

	for idx, line in ipairs(lines) do
		nameTypePairs[idx] = extractFieldNameAndType(line)
	end

	local code = [[

This is an example builder function!!!
HEYHEYHEY
This hs
	]]
	insertCode(code)
end

-- vim.api.nvim_create_user_command("PrintSelectedLines", function()
-- 	print_selected_lines()
-- end, {})

return {
	printSelectedLines = printSelectedLines,
}
