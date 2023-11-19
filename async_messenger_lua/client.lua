local socket = require("socket")
local server_host = "127.0.0.1"
local server_port = 1001

function start_client()
    local quit_msg = "!q"
    local client = assert(socket.connect(server_host, server_port))

    print("Client started")
    print("To send a message, type text and press enter")
    print("To quit type !q")

    while true do
        print("Enter a message: ")
        local msg = io.read()

        if msg == quit_msg then
            break
        end

        local success, err = client:send(msg .. "\n")
        if not success then
            print("Error sending message:", err)
        end
    end

    client:close()
end

start_client()
