--=================================================
--Options:

-- Window layout
-- style 1
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+                        |
-- |          |                        |
-- |   diff   |                        |
-- |          |                        |
-- +----------+------------------------+
-- Style 2
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+------------------------+
-- |                                   |
-- |   diff                            |
-- |                                   |
-- +-----------------------------------+
-- Style 3
-- +------------------------+----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- |                        +----------+
-- |                        |          |
-- |                        |   diff   |
-- |                        |          |
-- +------------------------+----------+
-- Style 4
-- +-----------------------++----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- +------------------------+----------+
-- |                                   |
-- |                            diff   |
-- |                                   |
-- +-----------------------------------+

local g = vim.g

g.undotree_WindowLayout = 4

-- e.g. using 'd' instead of 'days' to save some space
g.undotree_ShortIndicators = 0

-- undotree window width
if g.undotree_ShortIndicators == 1 then
    g.undotree_SplitWidth = 24
else 
    g.undotree_SplitWidth = 30
end

-- diff window height
g.undotree_DiffpanelHeight = 10

-- auto open diff window
g.undotree_DiffAutoOpen = 1

-- if set, let undotree window get focus after being opened,
-- otherwise focus will stay in current window
g.undotree_SetFocusWhenToggle = 1

-- tree node shape
g.undotree_TreeNodeShape = "*"

-- tree vertical shape
g.undotree_TreeVertShape = "|"

-- tree split shape
g.undotree_TreeSplitShape = "/"

-- tree return shape
g.undotree_TreeReturnShape = "\\"

g.undotree_DiffCommand = "diff"

-- relative timestamp
g.undotree_RelativeTimestamp = 1

-- Highlight changed text
g.undotree_HighlightChangedText = 1

-- Highlight changed text using signs in the gutter
g.undotree_HighlightChangedTextWithSign = 1

-- Highlight linked syntax type
-- You may choose your favorite through ":hi" command
g.undotree_HighlightSyntaxAdd = "DiffAdd"
g.undotree_HighlightSyntaxAdd = "DiffChange"
g.undotree_HighlightSyntaxAdd = "DiffDelete"

-- show help line
g.undotree_HelpLine = 1

-- show cursorline
g.undotree_CursorLine = 1

-- User commands
local usrcommand = vim.api.nvim_create_user_command
usrcommand(
    "UndotreeToggle",
    ":call undotree#UndotreeToggle()",
    {
        bar = true,
        nargs = 0,
        desc = "Toggle Undo Tree",
    }
)
usrcommand(
    "UndotreeHide",
    ":call undotree#UndotreeHide()",
    {
        bar = true,
        nargs = 0,
        desc = "Hide Undo Tree",
    }
)
usrcommand(
    "UndotreeShow",
    ":call undotree#UndotreeShow()",
    {
        bar = true,
        nargs = 0,
        desc = "Show Undo Tree",
    }
)
usrcommand(
    "UndotreeFocus",
    ":call undotree#UndotreeFocus()",
    {
        bar = true,
        nargs = 0,
        desc = "Focus Undo Tree",
    }
)
