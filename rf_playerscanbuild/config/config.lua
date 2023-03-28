Config = {}

Config.RequireJob = false
Config.AllowedJobs = {'builder', 'lumberjack'}

Config.BuildableObjects = {}

Config.HammerItem = 'hammer' -- used to build
Config.ShovelItem = 'shovel' -- used to remove partial builds
Config.AxeItem = 'axe' -- used to remove built 

local customModelsPath = 'rf_playerscanbuild/custom_objects'

-- Read the custom models directory and add the models to the config
-- /custom_objects/model_name/model_name.lua script expected for each model's configuration 



function LoadCustomObjects()
    local fileExtension = '.lua'
    local modelDirectories = GetResourceKvpString(customModelsPath)
    local modelList = {}
    
    for _, modelName in ipairs(modelDirectories) do
        local modelConfigPath = customModelsPath .. '/' .. modelName .. '/' .. modelName .. fileExtension
        local modelConfig = LoadResourceFile(GetCurrentResourceName(), modelConfigPath)

        if modelConfig then
            local modelConfigTable = json.decode(modelConfig)

            table.insert(Config.BuildableObjects, {
                name = modelName,
                displayName = modelConfigTable.displayName,
                model = modelConfigTable.model,
                itemsRequired = modelConfigTable.itemsRequired,
                behaviorScript = customModelsPath .. '/' .. modelName .. '/' .. modelConfigTable.behaviorScript
            })
        end
    end
end


LoadCustomObjects()
