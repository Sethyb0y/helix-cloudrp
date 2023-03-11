local playerMeta = FindMetaTable("Player")

function meta:IsMale()
	local model = self:GetModel():lower()

	return (model:find("male") or model:find("alyx") or model:find("mossman")) != nil or
		ix.anim.GetModelClass(model) == "citizen_male"
end

function playerMeta:IsCombine()
	local faction = self:Team()
	return faction == FACTION_MPF or faction == FACTION_OTA
end

function playerMeta:IsDispatch()
	local name = self:Name()
	local faction = self:Team()
	local bStatus = faction == FACTION_OTA

	if (!bStatus) then
		for k, v in ipairs({ "SCN", "DvL", "SeC" }) do
			if (Schema:IsCombineRank(name, v)) then
				bStatus = true

				break
			end
		end
	end

	return bStatus
end
