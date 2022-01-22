function door(x, y)
    pkt = {}
    pkt.type = 7
    pkt.int_data = 18
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = getLocal().pos.x
    pkt.pos_y = getLocal().pos.y
    sendPacketRaw(pkt)
end

function sendPunch(x, y)
pkt = {}
pkt.type = 3
pkt.int_data = 18
pkt.int_x = x
pkt.int_y = y
pkt.pos_x = getLocal().pos.x
pkt.pos_y = getLocal().pos.y
sendPacketRaw(pkt)
end

function placeDirtSeed(x, y)
pkt = {}
pkt.type = 3
pkt.int_data = 3
pkt.int_x = x
pkt.int_y = y
pkt.pos_x = getLocal().pos.x
pkt.pos_y = getLocal().pos.y
sendPacketRaw(pkt)
end

function sendSpray(x, y)
pkt = {}
pkt.type = 3
pkt.int_data = 10672
pkt.int_x = x
pkt.int_y = y
pkt.pos_x = getLocal().pos.x
pkt.pos_y = getLocal().pos.y
sendPacketRaw(pkt)
end
function sendPlace(x, y)
pkt = {}
pkt.type = 3
pkt.int_data = 2
pkt.int_x = x
pkt.int_y = y
pkt.pos_x = getLocal().pos.x
pkt.pos_y = getLocal().pos.y
sendPacketRaw(pkt)
end

function sendPlaceWL(x, y)
pkt = {}
pkt.type = 3
pkt.int_data = 9640
pkt.int_x = x
pkt.int_y = y
pkt.pos_x = getLocal().pos.x
pkt.pos_y = getLocal().pos.y
sendPacketRaw(pkt)
end

function wear(id)
    local pkt={}
    pkt.type=10
    pkt.int_data=id
    sendPacketRaw(pkt)
end

function collectItems(range, delay, ispos)
    if not ispos then
        range = (range or 4)*32
    end

    delay=delay or 10

    local pos = getLocal().pos
    local pkt = {}
    pkt.type = 11

    for _, obj in pairs(getObjects()) do
        local posx = math.abs(pos.x-obj.pos.x)
        local posy = math.abs(pos.y-obj.pos.y)

        if posx<range and posy<range then
            pkt.int_data = obj.oid
            pkt.pos_x = obj.pos.x
            pkt.pos_y = obj.pos.y

            sendPacketRaw(pkt)
            sleep(delay)
        end
    end
end

findPath(86, 30)
sleep(250)
door(86, 30)
sleep(2500)
findPath(46, 23)
sleep(100)
sendPlace(47, 23)
sleep(4600)
sendPunch(47, 23)
sleep(4600)
sendPunch(47, 23)
sleep(4600)
sendPunch(47, 23)
sleep(4600)
sendPunch(47, 23)
sleep(4600)
collectItems(64, 400, true)
sleep(4600)
placeDirtSeed(47, 23)
sleep(400)
sendSpray(47, 23)
sleep(400)
sendPunch(47, 23)
sleep(250)
collectItems(64, 400, true)
sleep(4600)
wear(48)
sleep(4600)
sendPacket("action|quit_to_exit", 3)
sleep(250)
local totTxt = ""
for i = 1,19 do
totTxt = totTxt..string.char(math.random(97,122))
end
sendPacket("action|join_request\nname|" .. totTxt, 3)
sleep(4600)
pathx = getLocal().pos.x / 32
pathy = getLocal().pos.y / 32
pathy = pathy - 1
sendPlaceWL(pathx, pathy)