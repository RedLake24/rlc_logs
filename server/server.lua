local webhookUrl = "https://discord.com/api/webhooks/1275202973664018442/eTcW6PDo2UIw1wAKY4UP-y-CtrxAOK75ePDyHLMD-tbOrqTgd524qDXv9sy__Vhdb3Tj"

local function sendToDiscord(content)
    local data = {
        ["content"] = content,
    }

    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('baseevents:onPlayerKilled', function(killerId, data)
    local victimId = source
    local killerName = GetPlayerName(killerId)
    local victimName = GetPlayerName(victimId)

    local message = string.format("**%s** was killed by **%s**", victimName, killerName)
    sendToDiscord(message)
end)

AddEventHandler('baseevents:onPlayerRespawn', function()
    local playerId = source
    local playerName = GetPlayerName(playerId)

    local message = string.format("**%s** has respawned", playerName)
    sendToDiscord(message)
end)
