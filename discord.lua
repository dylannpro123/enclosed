-- // Not a logger this will just make your discord open the enclosed server :O
local http = game:GetService('HttpService')
    local req = syn and syn.request or http and http and http.request or fluxus and flux.request
        if req then
            req({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = http:JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = http:GenerateGUID(false),
                    args = {code = 'enclosed'}
                })
            })
        end
