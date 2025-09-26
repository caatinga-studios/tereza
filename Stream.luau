local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Types = require(script.Parent.Types)
local clone = require(script.Parent.DeepClone).clone
local selectionSort = require(ReplicatedStorage.Libs.Tereza.Sort).selectionSort

local Stream = {
    originTable = nil
}

function Stream.of(originTable: {})
    local stream = clone(Stream)
    stream.originTable = originTable

    return stream
end

function Stream:filter(predicate: Types.Predicate)
    local filteredTable = {}
    for _, value in pairs(self.originTable) do 
        if(predicate(value)) then
            table.insert(filteredTable, value)
        end
    end
    return Stream.of(filteredTable)
end

function Stream:map(mapper: Types.Function)
    local mappedValues = {}
    for _, value in pairs(self.originTable) do 
        table.insert(mappedValues, mapper(value))
    end
    return Stream.of(mappedValues)
end

function Stream:sorted(comparator: Types.Comparator)
    local sorted = {}

    if(#self.originTable <= 25) then 
        sorted = selectionSort(self.originTable, comparator)
    else
        sorted = selectionSort(self.originTable, comparator)
        -- TODO: use a good algorithm for larger data sets
    end

    return Stream.of(sorted)
end

function Stream:collect()
    return self.originTable
end

function Stream:count() 
    return #self.originTable
end

function Stream:findFirst()
    return self.originTable[1]
end

function Stream:forEach(consumer: Types.Consumer)
    for _, value in pairs(self.originTable) do 
        consumer(value)
    end
end

table.freeze(Stream)
return Stream