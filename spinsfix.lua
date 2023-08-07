local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

repeat wait() until game:IsLoaded()
    wait(2)
    local clans = {"Yhwach"} -- Will SPIN TILL IT GETS ONE OF THESE U CAN ADD MORE IF U WANT
    local url = "https://discord.com/api/webhooks/1136471886742691984/Z6eRR2tQkqZ2WugiGgsWMkKzkYt6Sl-JlVhP17ByH_Ly9kUxKjanAm4-1Vq53qEk1iNL" -- put ur webhook here (NOTIFY YOU IF U GET ONE OF THE CLANS U WANT)
 
    game:GetService("ReplicatedStorage").Change_Slot:InvokeServer(1)
 
    function redeem()
        local a = {"JUICYRETURN", "ANOTHERSHUTDOWNSORRY", "SORRYFORWANDEN", "SORRY4BUGS", "110KLIKES", "SORRYFORSOMANY"}
 
        for _, itemName in pairs(a) do
            game:GetService("ReplicatedStorage").Code:InvokeServer(itemName)
        end
    end
 
    redeem()
    wait(2)
 
    function spin()
        local user = tostring(game.Players.LocalPlayer)
 
        _G.loop = true
        while _G.loop do
            game:GetService("ReplicatedStorage").Spin:InvokeServer(1)
            task.wait(0.1)
            local found = false
 
            for i=1, #clans do
                if clans[i]:lower() == game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value:lower() then
                    found = true
                    break
                end
            end
 
            if found then
                print("YAYYYYY YOU GOT "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
                game.Players.LocalPlayer:Kick('done')
                local data = {
                    ["content"] = "@everyone YOU ROLLED SOMETHING",
                    ["username"] = "Jon Jones",
                    ["avatar_url"] = "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2335639.png",
                    ["embeds"] = {
                        {
                            ["description"] = "**Project Mugetsu**\n\n```User: "..user.."\n\nClan: "..game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value.."```",
                            ["type"] = "rich",
                            ["color"] = tonumber(0x5a3812)
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                local headers = {
                    ["content-type"] = "application/json"
                }
                request = http_request or request or HttpPost or syn.request
                local send = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(send)
                _G.loop = false
            else
                print("Rolled "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
            end
        end
    end
 
    spin()
