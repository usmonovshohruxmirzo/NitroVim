-- plugin/folder_gen.lua
-- Single-file Neovim plugin to generate folder structure from pasted text

local M = {}

-- Helper: create folder or empty file
local function create_path(path)
    if path:match("%.%w+$") then
        -- Assume it's a file if it has an extension
        local f = io.open(path, "w")
        if f then f:close() end
    else
        -- It's a folder
        vim.fn.mkdir(path, "p")
    end
end

-- Split string by separator
local function split(inputstr, sep)
    if sep == nil then sep = "%s" end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

-- Process each line of pasted folder structure
local function process_structure(lines, root)
    local stack = { root }
    for _, line in ipairs(lines) do
        -- Remove tree symbols and trailing spaces
        local folder = line:gsub("^%s*├── ", "")
                          :gsub("^%s*└── ", "")
                          :gsub("%s*$", "")
        if folder ~= "" then
            -- Determine level by indentation (2 spaces per level)
            local indent = line:match("^(%s*)") or ""
            local level = #indent // 2
            stack[level + 1] = stack[level] .. "/" .. folder
            create_path(stack[level + 1])
        end
    end
end

-- Main function: get clipboard and generate structure
function M.generate_from_clipboard()
    local root = vim.fn.input("Root folder: ")
    if root == "" then
        print("Aborted: No root folder provided")
        return
    end

    -- Get clipboard content (you must copy the folder structure first)
    local clipboard = vim.fn.getreg("+"):gsub("\r", "")
    local lines = split(clipboard, "\n")
    process_structure(lines, root)
    print("Folder structure created at: " .. root)
end

-- Register command in Neovim
vim.api.nvim_create_user_command(
    "PasteFolderStructure",
    function() M.generate_from_clipboard() end,
    {}
)
