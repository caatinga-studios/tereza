local Types = require(script.Parent.Types)
local clone = require(script.Parent.DeepClone).clone

local Sort = {}

function Sort.selectionSort(tab: {}, comparator: Types.Comparator )
    local sorted = clone(tab)
    local tmp, minIndex

    for index = 1, #sorted, 1 do 
        minIndex = index

        for jndex = index + 1, #sorted, 1 do 
            if not comparator(sorted[jndex], sorted[minIndex]) then continue end

            minIndex = jndex
        end

        tmp = sorted[index]
        sorted[index] = sorted[minIndex]
        sorted[minIndex] = tmp
    end

    return sorted
end


return Sort