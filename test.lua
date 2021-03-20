local computer = computer or require("computer")
local component = component or require("component")

local internet = component.proxy(component.list("internet")())
print("Internet card address = " .. internet.address)
assert(internet.isTcpEnabled())

local iconn = internet.connect("173.94.47.204", 6969)
--local goodCon = iconn.finishConnect()
--assert(goodCon)

local event = require("event")
local _, sock = event.pull("internet_ready")
local data = sock.read(64)
print(data)

sock.close()
