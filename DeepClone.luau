local DeepClone = {}

function DeepClone.clone(tab: {})
    local clone = {}
    for key, value in pairs(tab) do
        if type(value) == "table" then
            clone[key] = DeepClone.clone(value) -- Recursively deep clone nested tables
        else
            clone[key] = value -- Copy primitive values directly
        end
    end
    
    return clone
end

table.freeze(DeepClone)
return DeepClone