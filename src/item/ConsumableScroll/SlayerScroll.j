//! zinc
library SlayerScroll requires SpellEvent, ZAMCore {
constant string  ART_CASTER  = "Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl";
constant string  ART_TARGET  = "Abilities\\Spells\\Other\\Levelup\\LevelupCaster.mdl";
constant integer BUFF_ID = 'A073';
    
    function onEffect(Buff buf) {
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).damageDealt += buf.bd.r0;
    }
    
    function onRemove(Buff buf) {
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).damageDealt -= buf.bd.r0;
    }

    function onCast() {
        integer i = 0;
        Buff buf;
        while (i < PlayerUnits.n) {
            if (GetDistance.units2d(PlayerUnits.units[i], SpellEvent.CastingUnit) <= 900.0 && !IsUnitDead(PlayerUnits.units[i])) {
                buf = Buff.cast(SpellEvent.CastingUnit, PlayerUnits.units[i], BUFF_ID);
                buf.bd.tick = -1;
                buf.bd.interval = 10.0;
                UnitProp.inst(buf.bd.target, SCOPE_PREFIX).damageDealt -= buf.bd.r0;
                buf.bd.r0 = 0.5;
                buf.bd.boe = onEffect;
                buf.bd.bor = onRemove;
                buf.run();
                AddTimedEffect.atUnit(ART_TARGET, PlayerUnits.units[i], "origin", 1.0);
            }
            i += 1;
        }
        AddTimedEffect.atUnit(ART_CASTER, SpellEvent.CastingUnit, "origin", 1.0);
    }

    function onInit() {
        RegisterSpellEffectResponse(SID_SLAYER_SCROLL, onCast);
        BuffType.register(BUFF_ID, BUFF_MAGE, BUFF_POS);
        
    }



}
//! endzinc
