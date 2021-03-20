local component = component or require("component")
local computer = computer or require("computer")

-- Get address used for response
local thisAddress = computer.address()

local ncon = {}

local event = require("event")
local function ModemMessageFunction(_, to, from, port, dist, header, msg)
    computer.pushSignal("nwm_" .. header, to, from, port, dist, msg)
    return true
end

event.ignore("modem_message", ModemMessageFunction)
ncon.id = event.listen("modem_message", ModemMessageFunction)



return ncon
