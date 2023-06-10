if true then
    ---------------------------------------------------------------
    -- run prio decurses if in combat
    if {0} then
        print('you is in combat')

        ---------------------------------------------------------------
        -- run non-prio decurses if not in combat
    else
        print('you aint in combat')
        --for i, spell in ipairs(NoPrioDecurseMaintank) do
        --    print (spell)
        --end

        -- scan raid for debuffs
        if InRaid() then
            -- maintank
            for i = 1, GetNumRaidMembers() do
                target = ""raid"" ..i
                name = GetUnitName(target);
                if not UnitIsDead(target) and UnitIsConnected(target) and
                        UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                        UnitExists(target) and
                        name == wrMaintank then
                    print('found the tank');
                    for j=1,40 do
                        texture, count, debuffType = UnitDebuff(target, j);
                        if curetypes[debuffType] then
                            debuff_name = WR_GetUnitDebuffName(target, j, texture);
                            --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                            for _,v in pairs(NoPrioDecurseMaintank) do
                                if v == debuff_name then
                                    CureOrder = CureOrder .. name;
                                    break
                                end
                            end
                        end
                    end
                end
            end

            -- offtanks
            for i = 1, GetNumRaidMembers() do
                target = ""raid"" ..i
                name = GetUnitName(target);
                if not UnitIsDead(target) and UnitIsConnected(target) and
                        UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                        UnitExists(target) and
                        IsInside(name, wrOfftanks) then
                    print('found an offtank');
                    for j=1,40 do
                        texture, count, debuffType = UnitDebuff(target, j);
                        if curetypes[debuffType] then
                            debuff_name = WR_GetUnitDebuffName(target, j, texture);
                            --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                            for _,v in pairs(NoPrioDecurseOfftanks) do
                                if v == debuff_name then
                                    CureOrder = CureOrder .. name;
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    print(CureOrder);
end