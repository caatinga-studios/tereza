local Types = require(script.Parent.Types)

local Stream = {
    originTable = nil
}

function Stream.create(originTable: {})
    local stream = table.clone(Stream)
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
    return Stream.create(filteredTable)
end

function Stream:collect()
    return self.originTable
end

table.freeze(Stream)
return Stream