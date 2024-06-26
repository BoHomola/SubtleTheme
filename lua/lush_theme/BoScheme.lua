--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		ColorColumn({ bg = "#0f0f0f" }), -- Columns set with 'colorcolumn'
		Conceal({}), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = "#FFFFFF" }), -- Character under the cursor
		-- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = "#424242" }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = "#9B9B9B" }), -- Directory names (and other special names in listings)
		-- DiffAdd      { }, -- Diff mode: Added line |diff.txt|
		-- DiffChange   { }, -- Diff mode: Changed line |diff.txt|
		-- DiffDelete   { }, -- Diff mode: Deleted line |diff.txt|
		-- DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ fg = "#0f0f0f" }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor   { }, -- Cursor in a focused terminal
		-- TermCursorNC { }, -- Cursor in an unfocused terminal
		-- ErrorMsg     { }, -- Error messages on the command line
		-- VertSplit    { }, -- Column separating vertically split windows
		-- Folded       { }, -- Line used for closed folds
		-- FoldColumn   { }, -- 'foldcolumn'
		SignColumn({}), -- Column where |signs| are displayed
		-- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		LineNr({}), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr({}), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen({ bg = "#d6d6d6" }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg({ gui = "bold" }), -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg      { }, -- |more-prompt|
		NonText({ fg = "#FFFFFF" }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ fg = "#d1d1d1" }), --, bg="#0f0f0f"}, -- Normal text
		NormalFloat({ bg = "#2c2c2c" }), -- Normal text in floating windows.
		-- NormalNC     { }, -- normal text in non-current windows
		Pmenu({}), -- Popup menu: Normal item.
		PmenuSel({ bg = "#404040" }), -- Popup menu: Selected item.
		-- PmenuSbar    { }, -- Popup menu: Scrollbar.
		-- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
		-- Question     { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ bg = "#FFFFFF", fg = "#000000" }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine      {bg = Normal.bg},--{bg="#010101", fg="#BBBBBB"}, -- Status line of current window
		StatusLineNC({ bg = "#FFFFFF" }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine({ bg = "#000000" }), -- Tab pages line, not active tab page label
		TabLineFill({}), -- Tab pages line, where there are no labels
		-- TabLineSel   { }, -- Tab pages line, active tab page label
		Title({ fg = "#cb8fd9" }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = "#505050" }), -- Visual mode selection
		-- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg   { }, -- Warning messages
		-- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu     { }, -- Current match in 'wildmenu' completion

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = "#606060" }), -- Any comment

		-- Constant       { }, -- (*) Any constant
		-- String         { }, --   A string constant: "this is a string"
		-- Character      { }, --   A character constant: 'c', '\n'
		-- Number         { }, --   A number constant: 234, 0xff
		-- Boolean        { }, --   A boolean constant: TRUE, false
		-- Float          { }, --   A floating point constant: 2.3e10

		Identifier({}), -- (*) Any variable name
		Function({}), --   Function name (also: methods for classes)

		Statement({ fg = "#deb137", gui = "bold" }), -- (*) Any statement
		-- Conditional    { }, --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		Operator({ fg = "#facd55" }), --   "sizeof", "+", "*", etc.
		Keyword({}), --   any other keyword
		-- Exception      { }, --   try, catch, throw

		-- PreProc        { fg="#FFFFFF"}, -- (*) Generic Preprocessor
		-- Include        { fg="#FFFFFF"}, --   Preprocessor #include
		-- Define         { fg="#FFFFFF"}, --   Preprocessor #define
		-- Macro          { fg="#FFFFFF"}, --   Same as Define
		-- PreCondit      { fg="#FFFFFF"}, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = "#d6cf9a" }), -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special({ fg = "#fac86b" }), -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		-- Delimiter      { }, --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		-- Error          { }, -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		sym("@text.title")({ fg = "#FFFFFF" }), -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		sym("@string")({ fg = "#eeffcc" }), -- String
		sym("@string.escape")({ fg = "#bbe080", gui = "bold" }), -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		sym("@field")({ gui = "bold" }), -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		sym("@namespace")({ fg = "#e0d83a" }), -- Identifier
		sym("@include")({ fg = "#e89b9b" }), -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
