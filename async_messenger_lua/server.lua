local socket = require("socket")
local server_host = "127.0.0.1"
local server_port = 1001

function start_server()
    local clients = {}
    local server = assert(socket.bind(server_host, server_port))
    print("Server started on " .. server_host .. ":" .. server_port)

    local current_client_id = 1

    while true do
        -- Check if any new clients are ready to connect
        local new_clients, _, _ = socket.select({ server }, nil, 0)

        if new_clients[server] then
            local client = server:accept()

            if client then
                clients[current_client_id] = client
                print("Client " .. current_client_id .. " connected:", client:getpeername())

                current_client_id = current_client_id + 1
            end
        end

        -- Look for new messages from connected clients
        for id, cl in pairs(clients) do
            local ready, _, _ = socket.select({ cl }, nil, 0)

            if ready[cl] then
                local message, err = cl:receive()

                if not err then
                    print("Message from client " .. id .. ": " .. message)
                else
                    print("Client " .. id .. " disconnected")
                    cl:close()
                    break
                end
            end
        end
    end
end

start_server()
