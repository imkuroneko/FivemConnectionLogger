
-- Webhook URL
local hook = "https://discord.com/api/webhooks/_______/_____________________"

-- Footer text
local footer_text = "by KuroNeko"
local footer_icon = "https://kuroneko.im/assets/kuroneko.png"




-- Event for connections...
AddEventHandler('playerConnecting', function()
    local name = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local ping = GetPlayerPing(source)
    local steamhex = GetPlayerIdentifier(source)

    local content = {
        { ["name"] = "Nombre", ["value"] = name },
        { ["name"] = "Dirección IP", ["value"] = ip },
        { ["name"] = "Steam Hex", ["value"] = steamhex },
    }

    sendWebhook(hook, "4437349", "📥 Jugador Conectando", content)
end)


-- Event for desconnections/drops...
AddEventHandler('playerDropped', function(reason)
    local name = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local ping = GetPlayerPing(source)
    local steamhex = GetPlayerIdentifier(source)

    local content = {
        { ["name"] = "Nombre", ["value"] = name },
        { ["name"] = "Dirección IP", ["value"] = ip },
        { ["name"] = "Steam Hex", ["value"] = steamhex },
        { ["name"] = "Motivo Desconexión", ["value"] = reason },
    }

    sendWebhook(hook, "12402743", "📤 Jugador Desconectado", content)
end)

-- Unify the HTTPRequest thing in only one side...
function sendWebhook(hook, color, title, content)

    local data = 

    PerformHttpRequest( hook,
        function(err, text, headers) end,
        'POST',
        json.encode({
            embeds = { {
                ["color"] = color,
                ["title"] = title,
                ["fields"] = content,
                ["footer"] = {
                    ["text"] = footer_text,
                    ["icon_url"] = footer_icon
                }
            } }
        }),
        { ['Content-Type'] = 'application/json' }
    )
end
