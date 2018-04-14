//! zinc
library ManaRegenPotion requires SpellEvent, BuffSystem {
constant integer BUFF_ID = 'A07U';
    
    function onEffect(Buff buf) {
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).manaRegen += buf.bd.r0;
    }
    
    function onRemove(Buff buf) {
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).manaRegen -= buf.bd.r0;
    }

    function onCast() {           
        Buff buf = Buff.cast(SpellEvent.CastingUnit, SpellEvent.CastingUnit, BUFF_ID);
        buf.bd.tick = -1;
        buf.bd.interval = 120.0;
        UnitProp.inst(buf.bd.target, SCOPE_PREFIX).manaRegen -= buf.bd.r0;
        buf.bd.r0 = 5;
        //if (buf.bd.e0 == 0) {buf.bd.e0 = BuffEffect.create(ART_TARGET, buf, "origin");}
        //if (buf.bd.e1 == 0) {buf.bd.e1 = BuffEffect.create(ART_RIGHT, buf, "hand, right");}
        buf.bd.boe = onEffect;
        buf.bd.bor = onRemove;
        buf.run();
    }

    function onInit() {
        RegisterSpellEffectResponse(SID_MANA_REGEN_POTION, onCast);
        BuffType.register(BUFF_ID, BUFF_MAGE, BUFF_POS);
        
    }

}
//! endzinc
