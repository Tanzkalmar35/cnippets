local function check_for_valid_ts_field(line)
	-- if line == nil or line == "" then
	-- 	print("Lines can not be empty.")
	-- 	return false
	-- end
	--
	-- if not line:match("^(%s*(public|private|protected)?)%s*(readonly%s+)?(%w+)%s*:%s*([%w%s]+)%s*;?") then
	-- 	print("At least 1 selected line is no valid ts field.")
	-- 	return false
	-- end

	for w in string.gmatch(line, "%a+") do
		print(w)
	end

	-- if wordInLine. then
	-- 	print("Visibility modifier found: " .. visibility)
	-- else
	-- 	print("No visibility modifier found.")
	-- end
	--
	-- -- Step 2: Check for field name
	-- local field_name = string.match(line, "readonly")
	-- if field_name then
	-- 	print("Field name found: " .. field_name)
	-- else
	-- 	print("No field name found.")
	-- end
	--
	-- -- Step 3: Check for type annotation
	-- local type_annotation = line:match(":%s*([%w%s]+)")
	-- if type_annotation then
	-- 	print("Type annotation found: " .. type_annotation)
	-- else
	-- 	print("No type annotation found.")
	-- end

	return true
end

local function print_selected_lines()
	print("Calling function!")
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")

	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)

	for _, line in ipairs(lines) do
		if check_for_valid_ts_field(line) then
			print(line)
		else
			print("Something strange happened...")
		end
	end
end

-- vim.api.nvim_create_user_command("PrintSelectedLines", function()
-- 	print_selected_lines()
-- end, {})

return {
	print_selected_lines = print_selected_lines,
}
