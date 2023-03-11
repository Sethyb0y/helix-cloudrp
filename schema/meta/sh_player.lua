local playerMeta = FindMetaTable("Player")

function playerMeta:IsCombine()
	local faction = self:Team()
	return faction == FACTION_MPF or faction == FACTION_OTA
end

function playerMeta:IsMale()
	local model = self:GetModel():lower()

	return (model:find("male") or model:find("art") or model:find("erdim") or model:find("eric") or model:find("joe") or model:find("van") or model:find("mike") or model:find("ted") or model:find("vance")) != nil or
		ix.anim.GetModelClass(model) == "citizen_male"
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
