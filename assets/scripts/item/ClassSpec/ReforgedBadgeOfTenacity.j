//! zinc
library ReforgedBadgeOfTenacity requires ItemAttributes, DamageSystem {
    HandleTable ht;
    
    public function HasReforgedBadgeOfTenacity(unit u) -> boolean {
        if (!ht.exists(u)) {
            return false;
        } else {
            return ht[u] > 0;
        }
    }

    function action(unit u, item it, integer fac) {
        UnitProp up = UnitProp.inst(u, SCOPE_PREFIX);
        up.ModAgi(10 * fac);
        up.ModArmor(5 * fac);
        up.ModLife(150 * fac);
        if (!ht.exists(u)) {ht[u] = 0;}
        ht[u] = ht[u] + fac;
    }
    
    function onCast() {
        CoolDown(SpellEvent.CastingUnit, SID_SURVIVAL_INSTINCTS);
    }

    function onInit() {
        ht = HandleTable.create();
        RegisterItemPropMod(ITID_REFORGED_BADGE_OF_TENACITY, action);
        RegisterSpellEffectResponse(SID_REFORGED_BADGE_OF_TENACITY, onCast);
    }
}
//! endzinc
