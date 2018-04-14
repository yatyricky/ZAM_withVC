//! zinc
library Polymorph requires CastingBar, SpellReflection {

    unit sheepTarget[NUMBER_OF_MAX_PLAYERS];
    
    function returnDamageTaken(integer lvl) -> real {
        return 0.03 * lvl;
    }
    
    function onEffect(Buff buf) {
        Buff bufff;
        integer pid = GetPidofu(buf.bd.caster);
        // remove last
        if (sheepTarget[pid] != null) {
            if (sheepTarget[pid] != buf.bd.target) {
                bufff = BuffSlot[sheepTarget[pid]].getBuffByBid(BID_POLYMORPH);
                if (bufff != 0) {
                    BuffSlot[sheepTarget[pid]].dispelByBuff(bufff);
                    bufff.destroy();
                }
            }
        }
        // sheep effect
        if (!IsUnitBoss(buf.bd.target)) {
            DummyCast(buf.bd.caster, SID_POLYMORPH_DUMMY, "hex", buf.bd.target);
            UnitProp.inst(buf.bd.target, SCOPE_PREFIX).disabled += 1;
        }        
        sheepTarget[pid] = buf.bd.target;      
        // damage taken
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).damageTaken += buf.bd.r0;
    }
    
    function onRemove(Buff buf) {
        if (GetUnitAbilityLevel(buf.bd.target, 'B00I') > 0) {
            UnitRemoveAbility(buf.bd.target, 'B00I');
            UnitProp.inst(buf.bd.target, SCOPE_PREFIX).disabled -= 1;
        }
        sheepTarget[GetPlayerId(GetOwningPlayer(buf.bd.caster))] = null;        
        
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).damageTaken -= buf.bd.r0;
    }
    
    function onCasst() {
        Buff buf = Buff.cast(SpellEvent.CastingUnit, SpellEvent.TargetUnit, BID_POLYMORPH);
        integer lvl = GetUnitAbilityLevel(SpellEvent.CastingUnit, SID_POLYMORPH);
        buf.bd.tick = -1;
        buf.bd.interval = 10.0;
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).damageTaken -= buf.bd.r0;
        buf.bd.r0 = returnDamageTaken(lvl);
        buf.bd.boe = onEffect;
        buf.bd.bor = onRemove;
        buf.run();
                
        CounterSpell(SpellEvent.TargetUnit);
    }

    function onInit() {
        integer i;
        RegisterSpellEffectResponse(SID_POLYMORPH, onCasst);
        BuffType.register(BID_POLYMORPH, BUFF_MAGE, BUFF_NEG);
        
        i = 0;
        while (i < NUMBER_OF_MAX_PLAYERS) {
            sheepTarget[i] = null;
            i += 1;
        }
    }
}
//! endzinc
