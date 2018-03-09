//! zinc
library FireBomb requires SpellEvent, ZAMCore, DamageSystem, WarlockGlobal {
constant string  MISSILE  = "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl";
constant string  EXPLOSION_ART  = "Abilities\\Weapons\\Mortar\\MortarMissile.mdl";
constant integer MISSILE_SPEED = 35;
constant integer NUM_MISSILES = 40;
constant real H_OVER_D = 0.45;

    struct Parabola {
        private timer tm;
        private unit missile;
        private effect eff;
        private real cosAng, sinAng;
        private real distance;
        private integer count;
        
        private method destroy() {
            DestroyEffect(this.eff);
            KillUnit(this.missile);
            ReleaseTimer(this.tm);
            this.tm = null;
            this.missile = null;
            this.eff = null;
            this.deallocate();
        }
        
        private static method run() {
            thistype this = GetTimerData(GetExpiredTimer());
            real tx = GetUnitX(this.missile) + this.cosAng * MISSILE_SPEED;
            real ty = GetUnitY(this.missile) + this.sinAng * MISSILE_SPEED;
            real height;
            this.count += 1;
            height = Sin(this.count * MISSILE_SPEED / this.distance * 3.1415) * this.distance * H_OVER_D;
            if (height < 0.0) {
                height = 0.0;
                FireBombGroup.add(CreateUnit(Player(10), UTID_FIRE_BOMB, GetUnitX(this.missile), GetUnitY(this.missile), GetUnitFacing(this.missile)));
                // MarkFireBomb(GetUnitX(this.missile), GetUnitY(this.missile), true);
                this.destroy();
            } else {            
                SetUnitX(this.missile, tx);
                SetUnitY(this.missile, ty);
            }
            SetUnitFlyHeight(this.missile, height, 0.0);
        }
        
        static method create(unit caster, real angle, real distance) -> thistype {
            thistype this = thistype.allocate();
            this.missile = CreateUnit(Player(10), DUMMY_ID, GetUnitX(caster), GetUnitY(caster), angle * bj_RADTODEG);
            SetUnitFlyable(this.missile);
            this.eff = AddSpecialEffectTarget(MISSILE, this.missile, "origin");
            this.cosAng = Cos(angle);
            this.sinAng = Sin(angle);
            this.distance = distance;
            this.count = 0;
            this.tm = NewTimer();
            SetTimerData(this.tm, this);
            TimerStart(this.tm, 0.04, true, function thistype.run);
            return this;
        }
    }
    
    function explosion(DelayTask dt) {
        integer i, j;
        for (0 <= j < FireBombGroup.size) {
            i = 0;
            while (i < PlayerUnits.n) {
                if (GetDistance.units2d(PlayerUnits.units[i], FireBombGroup.bombs[j]) < DBMWarlock.fireBombRadius && !IsUnitDead(PlayerUnits.units[i])) {
                    DamageTarget(dt.u0, PlayerUnits.units[i], 350.0 + GetRandomReal(0.0, 200.0), SpellData[SIDFLAMEBOMB].name, false, false, false, WEAPON_TYPE_WHOKNOWS);
                    AddTimedEffect.atUnit(MISSILE, PlayerUnits.units[i], "origin", 0.0);
                }
                i += 1;
            }
            AddTimedEffect.atUnit(EXPLOSION_ART, FireBombGroup.bombs[j], "origin", 0.0);
            KillUnit(FireBombGroup.bombs[j]);
        }
        // MarkFireBombClear(true);
        // printMarkMap();
        FireBombGroup.clear();
        DBMWarlock.isFireBomb = false;
    }

    function response(CastingBar cd) {
        real angle = GetRandomReal(0.0, 6.283);
        real distance = SquareRoot(GetRandomReal(1.0, platformRadius * platformRadius)); // 950^2
        Parabola.create(cd.caster, angle, distance);
    }

    function onChannel() {
        integer i = 0;
        real portion;
        location loc;
        SetUnitX(SpellEvent.CastingUnit, WLKSQRCENTREX);
        SetUnitY(SpellEvent.CastingUnit, WLKSQRCENTREY);
        if (PlayerUnits.n > 0) {
            portion = 6.283 / PlayerUnits.n;
        }
        while (i < PlayerUnits.n) {
            SetUnitX(PlayerUnits.units[i], WLKSQRCENTREX + 200 * Cos(portion * i));
            SetUnitY(PlayerUnits.units[i], WLKSQRCENTREY + 200 * Sin(portion * i));
            i += 1;
        }
        loc = Location(WLKSQRCENTREX, WLKSQRCENTREY);
        AddTimedLight.atCoords3D("CLPB", WLKSQRCENTREX, WLKSQRCENTREY, GetLocationZ(loc) + 900.0, WLKSQRCENTREX, WLKSQRCENTREY, GetLocationZ(loc), 1.0).setColour(1.0, 0.0, 0.0, 1.0);
        CastingBar.create(response).channel(NUM_MISSILES);
        DelayTask.create(explosion, 13.0).u0 = SpellEvent.CastingUnit;
        DBMWarlock.isFireBomb = true;
    }

    function onInit() {
        RegisterSpellChannelResponse(SIDFLAMEBOMB, onChannel);
    }





}
//! endzinc
