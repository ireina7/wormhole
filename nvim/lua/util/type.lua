Type = {}

function Type.as(this, type)
    this = this or {}
    setmetatable(this, type)
    type.type = type
    type.__index = type
end


return Type
