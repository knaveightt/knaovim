local options = {
	mouse = 'a',          -- mouse support (try resizing splits)
	showmode = false,     -- dont show the -- Insert -- message
	breakindent = true,   -- maintain indents on line breaks
	undofile = true,      -- save undo files
	backup = false,       -- no backup file
	swapfile = false,     -- no swap file use
	ignorecase = true,    -- ignore cases for searching
	smartcase = true,     -- case-insensitive unless cases are used
	hlsearch = true,      -- highlight matches when searching
	splitbelow = true,    -- force splits below
	splitright = true,    -- force v splits to the right
	termguicolors = true, -- plugins require this to allow correct colors
	signcolumn = 'yes',   -- always show sign column
	number = true,        -- show line numbers
	list = true,          -- how to display whitespace in editor
	listchars = { tab = '» ', trail = '·', nbsp = '␣' },
	inccommand = 'split', -- show substitutions live in a split
	cursorline = false,    -- show which line the cursor is on
	scrolloff = 0,        -- minimum lines to keep before scrolling the window
	expandtab = true,     -- convert tabs to spaces
	autoindent = true,    -- automatically indent based on previous line
	shiftwidth = 4,       -- autoindents will be 4 spaces
	tabstop = 4,          -- make tabs 4 spaces long
	numberwidth = 3,      -- width of line number column
	wrap = false,         -- show long lines without wrapping
	conceallevel = 2,     -- set conceal level, primarily for markdown
	foldlevelstart = 99,  -- sets the starting state of folds as unfolded
	updatetime = 50,      -- speed up updates (like lsp)
	colorcolumn = "80",   -- color the 80th column
	winborder = "rounded" -- rounded floating window border
}
for k, v in pairs(options) do
	vim.opt[k] = v
end
