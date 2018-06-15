//! zinc
library ThunderClap requires SpellEvent, DamageSystem {
constant string  ART_CASTER  = "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl";
constant integer BUFF_ID = 'A09Y';
    
    function onEffect(Buff buf) {
        DamageTarget(buf.bd.caster, buf.bd.target, buf.bd.r0, SpellData.inst(SID_THUNDER_CLAP, SCOPE_PREFIX).name, false, false, false, WEAPON_TYPE_WHOKNOWS, false);
    }
    
    function onRemove(Buff buf) {
    }

    function onCast() {
        integer i = 0;
        Buff buf;
        while (i < PlayerUnits.n) {
            if (GetDistance.units2d(PlayerUnits.units[i], SpellEvent.CastingUnit) <= 400.0 + 197.0 && !IsUnitDead(PlayerUnits.units[i])) {                
                DamageTarget(SpellEvent.CastingUnit, PlayerUnits.units[i], 400, SpellData.inst(SID_THUNDER_CLAP, SCOPE_PREFIX).name, false, false, false, WEAPON_TYPE_WHOKNOWS, false);
                if (GetUnitAbilityLevel(PlayerUnits.units[i], 'A09X') > 0) {
                    buf = Buff.cast(SpellEvent.CastingUnit, PlayerUnits.units[i], BUFF_ID);
                    buf.bd.tick = 6;
                    buf.bd.interval = 1.0;
                    buf.bd.r0 = 100.0;
                    if (buf.bd.e0 == 0) {buf.bd.e0 = BuffEffect.create(ART_PurgeBuffTarget, buf, "origin");}
                    //if (buf.bd.e1 == 0) {buf.bd.e1 = BuffEffect.create(ART_RIGHT, buf, "hand, right");}
                    buf.bd.boe = onEffect;
                    buf.bd.bor = onRemove;
                    buf.run();
                }
            }
            i += 1;
        }
        AddTimedEffect.atUnit(ART_CASTER, SpellEvent.CastingUnit, "origin", 1.0);
    }

    function onInit() {
        RegisterSpellEffectResponse(SID_THUNDER_CLAP, onCast);
        BuffType.register(BUFF_ID, BUFF_MAGE, BUFF_NEG);
    }



}
//! endzinc
