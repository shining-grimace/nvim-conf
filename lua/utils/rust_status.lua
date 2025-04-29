
local M = {}
M.status = ""

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
    local val = result.value
    if val.kind then
        if val.kind == "begin" then
            M.status = val.title or "Indexing..."
        elseif val.kind == "report" then
            M.status = val.message or M.status
        elseif val.kind == "end" then
            M.status = ""
        end
    end
end

function M.get()
    return M.status
end

return M

