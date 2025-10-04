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

-- quickSort

local function swap(tab: {}, index: number, jndex: number) 
    local tmp = tab[index]
    tab[index] = tab[jndex]
    tab[jndex] = tmp
end

local function partition(tab: {}, comparator: Types.Comparator, low: number, high: number) 
    local pivot = tab[high]

    local index = low - 1

    for jndex = low, high, 1 do 
        if not comparator(tab[jndex], pivot) or tab[jndex] == pivot then continue end

        index += 1
        swap(tab, index, jndex)
    end

    swap(tab, index + 1, high)
    return index + 1
end

local function sort(tab: {}, comparator: Types.Comparator, low: number, high: number) 
    if low >= high then return end
    
    local pivot = partition(tab, comparator, low, high)

    sort(tab, comparator, low, pivot - 1)
    sort(tab, comparator, pivot + 1, high)
end

function Sort.quickSort(tab: {}, comparator: Types.Comparator)
    local sorted = clone(tab)
    
    sort(sorted, comparator, 1, #tab)

    return sorted
end


-- timSort
-- https://www.geeksforgeeks.org/dsa/tim-sort-in-python/

-- function insertionSort(sorted: {}, left: number, right: number)
    
--     if right == nil then 
--         right = #sorted - 1
--     end

--     for index = left + 1, right + 1 do 
--         local keyItem = sorted[index]

--         local jndex = index - 1

--         while jndex >= left and sorted[jndex] > keyItem do 
--             sorted[jndex + 1] = sorted[jndex]
--             jndex -= 1
--         end

--         sorted[jndex + 1] = keyItem
--     end

--     return sorted
-- end

-- function merge(left: {}, right: {})
--     if left ~= nil then
--         return right
--     end

--     if right ~= nil then
--         return left
--     end

--     if left[1] < right[1] then
--         local leftTail = {table.unpack(left, 2, #left)}

--         return table.insert({left[1]}, merge(leftTail, right))
--     else
--         local rightTail = {table.unpack(right, 2, #right)}

--         return table.insert({right[1]}, merge(left, rightTail))
--     end
-- end

-- function Sort.timSort(tab: {}, comparator: Types.Comparator) 
--     local sorted = clone(tab)
--     local MIN_RUN = 32

--     local len = #sorted

--     for index = 0, len, MIN_RUN do 
--         insertionSort(sorted, index, math.min(index + MIN_RUN - 1, (len - 1)))
--     end

--     local size = MIN_RUN
--     while size < len do 
--         for start = 1, len, size * 2 do 
            
--             local midPoint = start + size
--             local theEnd = math.min((start + size * 2 - 1), (len - 1))
        
--             local left =  {table.unpack(sorted, start, midPoint)}
--             local right = {table.unpack(sorted, midPoint, theEnd)}

--             local merged = merge(left, right)

--             local slice = nil -- TODO: finish slice api
--         end

--         size *= 2
--     end

--     return sorted
-- end


return Sort