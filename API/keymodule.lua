local module = {}

module.IDs = {
  ["Main"] = "892f6a026b91a86c14432a08dd0ab0c1"
}

module.init = module.IDs.Main
module.api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

module.api.script_id = module.init

module.Notify = nil


module.Functions = {
    CheckKey = function(Key)
        local status = module.api.check_key(Key)

        if status.code == "KEY_VALID" then
            script_key = Key
            return {STATUS=status,API=module.api,KEYSCRIPT=script}
        else
            if module.Notify ~= nil then
                module.Notify("Error",status.message,5)
            end
            return {STATUS=status,API=module.api,KEYSCRIPT=script}
        end
    end
}

return module
