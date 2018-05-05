//! zinc
library Rejuvenation requires BuffSystem, SpellEvent, UnitProperty {
constant integer BUFF_ID1 = 'A02I';
constant string  ART_TARGET  = "Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl";

    function returnHeal(integer lvl) -> real {
        return 50.0 + 100.0 * lvl;
    }
    
    function returnCriticalValue(integer lvl) -> integer {
        return 20 * lvl;
    }

    function onEffect(Buff buf) {
        real percent = GetUnitStatePercent(buf.bd.target, UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE);
        if (percent < buf.bd.i0) {
            percent = buf.bd.i0;
        }
        percent = (100.0 - percent) / (100 - buf.bd.i0) * 0.5;
        HealTarget(buf.bd.caster, buf.bd.target, buf.bd.r0, SpellData.inst(SID_REJUVENATION, SCOPE_PREFIX).name, percent);
        AddTimedEffect.atUnit(ART_TARGET, buf.bd.target, "origin", 0.3);
    }

    function onRemove(Buff buf) {
    }
    
    function onEffect1(Buff buf) {
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).dodge += buf.bd.r0;
    }

    function onRemove1(Buff buf) {
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).dodge -= buf.bd.r0;
    }

    function onCast() {
        Buff buf = Buff.cast(SpellEvent.CastingUnit, SpellEvent.TargetUnit, BID_REJUVENATION);
        integer lvl = GetUnitAbilityLevel(SpellEvent.CastingUnit, SID_REJUVENATION);
        buf.bd.r0 = returnHeal(lvl) + UnitProp.inst(SpellEvent.CastingUnit, SCOPE_PREFIX).SpellPower() * 1.2;
        buf.bd.i0 = returnCriticalValue(lvl);
        buf.bd.interval = 3.0 / (1.0 + UnitProp.inst(SpellEvent.CastingUnit, SCOPE_PREFIX).SpellHaste());
        buf.bd.tick = Rounding(rejuvtick[GetPlayerId(GetOwningPlayer(SpellEvent.CastingUnit))] * 3 / buf.bd.interval);
        buf.bd.i1 = buf.bd.tick;
        buf.bd.boe = onEffect;
        buf.bd.bor = onRemove;
        buf.run();
        
        // dodge buff
        buf = Buff.cast(SpellEvent.CastingUnit, SpellEvent.TargetUnit, BUFF_ID1);
        buf.bd.tick = -1;
        buf.bd.interval = 12.0;
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).dodge -= buf.bd.r0;
        buf.bd.r0 = 0.07;
        buf.bd.boe = onEffect1;
        buf.bd.bor = onRemove1;
        buf.run();
        
        AddTimedEffect.atUnit(ART_TARGET, SpellEvent.TargetUnit, "origin", 1.0);
    }
    
    function lvlup() -> boolean {
        if (GetLearnedSkill() == SID_REJUVENATION) {
            if (GetUnitAbilityLevel(GetTriggerUnit(), SID_REJUVENATION) == 3) {
                lbexcrit[GetPidofu(GetTriggerUnit())] = 0.5;
            }
        }
        return false;
    }

    function onInit() {
        BuffType.register(BID_REJUVENATION, BUFF_MAGE, BUFF_POS);
        BuffType.register(BUFF_ID1, BUFF_MAGE, BUFF_POS);
        RegisterSpellEffectResponse(SID_REJUVENATION, onCast);
        TriggerAnyUnit(EVENT_PLAYER_HERO_SKILL, function lvlup);
    }


}
//! endzinc
