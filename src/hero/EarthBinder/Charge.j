//! zinc
library Charge requires SpellEvent, BuffSystem {
constant integer BUFF_ID = 'A03C';
constant string  ART  = "Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl";
    function onEffect(Buff buf) {
        UnitProp[buf.bd.target].damageDealt += buf.bd.r0;
        //SetUnitVertexColor(buf.bd.target, 100, 255, 100, 100);
    }

    function onRemove(Buff buf) {
        UnitProp[buf.bd.target].damageDealt -= buf.bd.r0;
        //SetUnitVertexColor(buf.bd.target, 255, 255, 255, 255);
    }
    
    function onCast() {       
        Buff buf = Buff.cast(SpellEvent.CastingUnit, SpellEvent.CastingUnit, BUFF_ID);
        buf.bd.tick = -1;
        buf.bd.interval = 8.0 + 4.0 * GetUnitAbilityLevel(SpellEvent.CastingUnit, SID_CHARGE);
        UnitProp[buf.bd.target].damageDealt -= buf.bd.r0;
        buf.bd.r0 = 0.3;
        if (buf.bd.e0 == 0) {
            buf.bd.e0 = BuffEffect.create(ART, buf, "origin");
        }
        buf.bd.boe = onEffect;
        buf.bd.bor = onRemove;
        buf.run();
    }

    function onInit() {
        RegisterSpellEffectResponse(SID_CHARGE, onCast);
        BuffType.register(BUFF_ID, BUFF_MAGE, BUFF_POS);
    }


}
//! endzinc
