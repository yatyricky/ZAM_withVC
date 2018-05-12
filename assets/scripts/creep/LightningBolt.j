//! zinc
library LightningBolt requires CastingBar, Projectile, SpellReflection {
constant string  PATH  = "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl";

    function onhit(Projectile p) -> boolean {
        if (TryReflect(p.target)) {
            p.reverse();
            return false;
        } else {
            DamageTarget(p.caster, p.target, p.r0, SpellData.inst(SID_LIGHTNING_BOLT, SCOPE_PREFIX).name, false, false, false, WEAPON_TYPE_WHOKNOWS, false);
            return true;
        }
    }

    function response(CastingBar cd) {
        Projectile p = Projectile.create();
        p.caster = cd.caster;
        p.target = cd.target;
        p.path = PATH;
        p.pr = onhit;
        p.speed = 700;
        p.r0 = 320.0;
        //BJDebugMsg("1??");
        p.launch();
    }
    
    function onChannel() {
        CastingBar.create(response).launch();
    }

    function onInit() {
        RegisterSpellChannelResponse(SID_LIGHTNING_BOLT, onChannel);
    }

}
//! endzinc
