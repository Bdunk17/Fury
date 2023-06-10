if true then
    ---------------------------------------------------------------
    -- run prio decurses if in combat
    if {0} then
        --print('you is in combat')

        -- scan raid for debuffs
        if InRaid() then

            -- maintank
            if {1} then
                for i = 1, GetNumRaidMembers() do
                    target = ""raid"" ..i
                    name = GetUnitName(target);
                    if not UnitIsDead(target) and UnitIsConnected(target) and
                            UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                            UnitExists(target) and
                            name == wrMaintank then
                        --print('found the tank:'..name);
                        for j=1,40 do
                            texture, count, debuffType = UnitDebuff(target, j);
                            if curetypes[debuffType] then
                                debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                if IsInside(debuff_name, PrioDecurseMaintank) then
                                    if not IsInside(debuff_name, BlacklistDecurseMaintank) then
                                        CureOrder = CureOrder .. name;
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if {2} then
                -- offtanks
                for i = 1, GetNumRaidMembers() do
                    target = ""raid"" ..i
                    name = GetUnitName(target);
                    if not UnitIsDead(target) and UnitIsConnected(target) and
                            UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                            UnitExists(target) and
                            IsInside(name, wrRaidOfftanks) then
                        --print('found an offtank:'..name);
                        for j=1,40 do
                            texture, count, debuffType = UnitDebuff(target, j);
                            if curetypes[debuffType] then
                                debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                if IsInside(debuff_name, PrioDecurseOfftanks) then
                                    if not IsInside(debuff_name, BlacklistDecurseOfftanks) then
                                        CureOrder = CureOrder .. name;
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if {3} then
                -- casters
                for i = 1, GetNumRaidMembers() do
                    target = ""raid"" ..i
                    name = GetUnitName(target);
                    if not UnitIsDead(target) and UnitIsConnected(target) and
                            UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                            UnitExists(target) and
                            IsInside(name, wrRaidCasters) then
                        --print('found a caster:'..name);
                        for j=1,40 do
                            texture, count, debuffType = UnitDebuff(target, j);
                            if curetypes[debuffType] then
                                debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                if IsInside(debuff_name, PrioDecurseCasters) then
                                    if not IsInside(debuff_name, BlacklistDecurseCasters) then
                                        CureOrder = CureOrder .. name;
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if {4} then
                -- healers
                for i = 1, GetNumRaidMembers() do
                    target = ""raid"" ..i
                    name = GetUnitName(target);
                    if not UnitIsDead(target) and UnitIsConnected(target) and
                            UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                            UnitExists(target) and
                            IsInside(name, wrRaidHealers) then
                        --print('found a caster:'..name);
                        for j=1,40 do
                            texture, count, debuffType = UnitDebuff(target, j);
                            if curetypes[debuffType] then
                                debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                if IsInside(debuff_name, PrioDecurseHealers) then
                                    if not IsInside(debuff_name, BlacklistDecurseHealers) then
                                        CureOrder = CureOrder .. name;
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if {5} then
                -- melee
                for i = 1, GetNumRaidMembers() do
                    target = ""raid"" ..i
                    name = GetUnitName(target);
                    if not UnitIsDead(target) and UnitIsConnected(target) and
                            UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                            UnitExists(target) and
                            IsInside(name, wrRaidMelee) then
                        --print('found a melee:'..name);
                        for j=1,40 do
                            texture, count, debuffType = UnitDebuff(target, j);
                            if curetypes[debuffType] then
                                debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                if IsInside(debuff_name, PrioDecurseMelee) then
                                    if not IsInside(debuff_name, BlacklistDecurseMelee) then
                                        CureOrder = CureOrder .. name;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
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
                if {1} then
                    for i = 1, GetNumRaidMembers() do
                        target = ""raid"" ..i
                        name = GetUnitName(target);
                        if not UnitIsDead(target) and UnitIsConnected(target) and
                                UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                                UnitExists(target) and
                                name == wrMaintank then
                            print('found the tank:'..name);
                            for j=1,40 do
                                texture, count, debuffType = UnitDebuff(target, j);
                                if curetypes[debuffType] then
                                    debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                    --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                    --if IsInside(debuff_name, NoPrioDecurseMaintank) then
                                    --    CureOrder = CureOrder .. name;
                                    --end
                                    CureOrder = CureOrder .. name;
                                end
                            end
                        end
                    end
                end

                if {2} then
                    -- offtanks
                    for i = 1, GetNumRaidMembers() do
                        target = ""raid"" ..i
                        name = GetUnitName(target);
                        if not UnitIsDead(target) and UnitIsConnected(target) and
                                UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                                UnitExists(target) and
                                IsInside(name, wrRaidOfftanks) then
                            print('found an offtank:'..name);
                            for j=1,40 do
                                texture, count, debuffType = UnitDebuff(target, j);
                                if curetypes[debuffType] then
                                    debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                    --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                    --if IsInside(debuff_name, NoPrioDecurseOfftanks) then
                                    --    CureOrder = CureOrder .. name;
                                    --end
                                    CureOrder = CureOrder .. name;
                                end
                            end
                        end
                    end
                end

                if {3} then
                    -- casters
                    for i = 1, GetNumRaidMembers() do
                        target = ""raid"" ..i
                        name = GetUnitName(target);
                        if not UnitIsDead(target) and UnitIsConnected(target) and
                                UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                                UnitExists(target) and
                                IsInside(name, wrRaidCasters) then
                            print('found a caster:'..name);
                            for j=1,40 do
                                texture, count, debuffType = UnitDebuff(target, j);
                                if curetypes[debuffType] then
                                    debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                    --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                    --if IsInside(debuff_name, NoPrioDecurseCasters) then
                                    --    CureOrder = CureOrder .. name;
                                    --end
                                    CureOrder = CureOrder .. name;
                                end
                            end
                        end
                    end
                end

                if {4} then
                    -- healers
                    for i = 1, GetNumRaidMembers() do
                        target = ""raid"" ..i
                        name = GetUnitName(target);
                        if not UnitIsDead(target) and UnitIsConnected(target) and
                                UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                                UnitExists(target) and
                                IsInside(name, wrRaidHealers) then
                            print('found a caster:'..name);
                            for j=1,40 do
                                texture, count, debuffType = UnitDebuff(target, j);
                                if curetypes[debuffType] then
                                    debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                    --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                    --if IsInside(debuff_name, NoPrioDecurseCasters) then
                                    --    CureOrder = CureOrder .. name;
                                    --end
                                    CureOrder = CureOrder .. name;
                                end
                            end
                        end
                    end
                end

                if {5} then
                    -- melee
                    for i = 1, GetNumRaidMembers() do
                        target = ""raid"" ..i
                        name = GetUnitName(target);
                        if not UnitIsDead(target) and UnitIsConnected(target) and
                                UnitIsVisible(target) and CheckInteractDistance(target, 4) and
                                UnitExists(target) and
                                IsInside(name, wrRaidMelee) then
                            print('found a melee:'..name);
                            for j=1,40 do
                                texture, count, debuffType = UnitDebuff(target, j);
                                if curetypes[debuffType] then
                                    debuff_name = WR_GetUnitDebuffName(target, j, texture);
                                    --table.insert(DebuffList, name .. ':' .. debuffType .. ':' .. debuff_name);
                                    --if IsInside(debuff_name, NoPrioDecurseCasters) then
                                    --    CureOrder = CureOrder .. name;
                                    --end
                                    CureOrder = CureOrder .. name;
                                end
                            end
                        end
                    end
                end
            end
    end
    print(CureOrder);
    --return CureOrder;
end
