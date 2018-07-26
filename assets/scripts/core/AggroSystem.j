//! zinc
library AggroSystem requires MobInit, UnitProperty, Clock, DamageSystem, PlayerUnitList, BuffSystem, CreepsAction, CombatFacts {
//*****************************************************************************
//* function IsInCombat() -> boolean
//* function GetFirstAggro(unit u) -> unit    
//* function AggroTarget(unit a, unit b, real amt)    
//* function AggroAll(unit a, real amt)    
//* function AggroClear(unit a, real percentage)
//* 
//* struct AggroList
//*     unit aggros[MAX_PLAYER_UNITS];
//*     real aps[MAX_PLAYER_UNITS];
//*     integer aggrosN;  
//*     method destroy()        
//*     method locate(unit u) -> integer        
//*     method aggroBy(unit s, real amt)        
//*     method sort() -> unit        
//*     method add(unit u)        
//*     method remove(integer i)        
//*     method delete(unit u)    
//*     static method operator[](unit u) -> thistype        
//*     static method create(unit u) -> thistype
//*****************************************************************************
constant real TIME_TICK = 0.15;
constant integer MAX_PLAYER_UNITS = 50;
    
    public type CombatStateNotify extends function(boolean);
    private CombatStateNotify combatStateNotifyCallList[];
    private integer combatStateNotifyN = 0;
    public function RegisterCombatStateNotify(CombatStateNotify combatStateNotify) {
        combatStateNotifyCallList[combatStateNotifyN] = combatStateNotify;
        combatStateNotifyN += 1;
    }

    public type ResponseAggro extends function(unit);
    private ResponseAggro responseAggroCallList[];
    private integer responseAggroN = 0;
    public function RegisterAggroEvent(ResponseAggro responseAggro) {
        responseAggroCallList[responseAggroN] = responseAggro;
        responseAggroN += 1;
    }
    
    public function IsInCombat() -> boolean {
        return MobList.n > 0;
    }
    
    public struct AggroList {
        private static HandleTable ht;
        private unit u;
        unit aggros[MAX_PLAYER_UNITS];
        real aps[MAX_PLAYER_UNITS];
        integer aggrosN;  
        private texttag tt;
        
        method destroy() {
            DestroyTextTag(this.tt);
            thistype.ht.flush(this.u);
            this.u = null;
            this.tt = null;
            this.deallocate();
        }
        
        method locate(unit u) -> integer {
            integer i = 0;
            while (i < this.aggrosN) {
                if (this.aggros[i] == u) {
                    return i;
                } else {
                    i += 1;
                }
            }
            return -1;
        }
        
        method aggroBy(unit s, real amt, string trace) {
            integer index = this.locate(s);
            if (index == -1) {
                if (IsUnitUseless(s) == false) {
                    print(SCOPE_PREFIX+".aggroBy unit " + GetUnitNameEx(s)+" is not in list. trace: "+ trace);
                }
            } else {
                this.aps[index] += amt;
            }
        }
        
        method setAggro(unit s, real amt) {
            integer index = this.locate(s);
            if (index == -1) {
                print(SCOPE_PREFIX+".setAggro unit " + GetUnitNameEx(s)+" is not in list.");
            } else {
                this.aps[index] = amt;
            }
        }
        
        method getAggro(unit s) -> real {
            integer index = this.locate(s);
            if (index == -1) {
                print(SCOPE_PREFIX+".getAggro unit " + GetUnitNameEx(s)+" is not in list.");
                return 0.0;
            } else {
                return this.aps[index];
            }
        }

        static method prettyPrint(unit u) {
            integer i = 0;
            thistype this = AggroList[u];
            print(GetUnitName(u) + "'s threat list:");
            while (i < this.aggrosN) {
                print(I2S(i) + ". " + GetUnitNameEx(this.aggros[i]) + " - " + R2S(this.aps[i]));
                i += 1;
            }
        }
        /*
        method addAggro(unit ag) {
            this.aggros[this.aggrosN] = ag;
            this.tp[this.aggrosN] = 1.0 / (GetDistance.units2d(this.u, ag) + 1.0);
            this.aggrosN += 1;
        }*/
        
        private method getColourText() -> string {
            // unit taru = PlayerSelection[GetPlayerId(GetLocalPlayer())];
            // integer i, l;
            // string ret;
            // if (IsUnitDead(taru) || taru == null || GetPlayerId(GetOwningPlayer(taru)) >= NUMBER_OF_MAX_PLAYERS) {
            //     ret = ""; 
            // } else {
            //     ret = "|cffff0000..........";
            //     i = Rounding(this.aps[this.locate(taru)] / this.aps[0] * 10.0);
            //     ret = SubString(ret, 0, 10 + i) + "|r" + SubString(ret, 10 + i, 20);
            // }
            return "";
        }
        
        method sort() -> unit {
            integer i, j, mi;
            unit tmpu;
            real tmpr;
            if (this.aggrosN == 0) {
                print(SCOPE_PREFIX+">|cffff0000error|r. sorting, no threat targets in list or N == 0");
            }
            if (!IsInCombat()) {
                print(SCOPE_PREFIX+">|cffff0000error|r. sorting, not in combat");
            }
            /*
            i = 0;
            while (i < this.aggrosN) {
                if (IsUnitDead(this.aggros[i])) {
                    print(SCOPE_PREFIX+">|cffff0000error|r. sorting, death unit detected.");
                }
                this.aggrosN -= 1;
                this.aggros[i] = this.aggros[this.aggrosN];
                this.tp[i] = this.tp[this.aggrosN];
                this.aggros[this.aggrosN] = null;
                i += 1;
            }*/
            i = 0;
            while (i < this.aggrosN - 1) {
                mi = i;
                j = i + 1;
                while (j < this.aggrosN) {
                    if (this.aps[j] > this.aps[mi]) {
                        mi = j;
                    }
                    j += 1;
                }
                if (mi != i) {
                    tmpr = this.aps[mi];
                    this.aps[mi] = this.aps[i];
                    this.aps[i] = tmpr;
                    tmpu = this.aggros[mi];
                    this.aggros[mi]=  this.aggros[i];
                    this.aggros[i] = tmpu;
                }
                i += 1;
            }
            // Draw dots
            SetTextTagPos(this.tt, GetUnitX(this.u), GetUnitY(this.u), 16.0);
            SetTextTagText(this.tt, this.getColourText(), 0.024);
            //i = 0;
            //while (i < NUMBER_OF_MAX_PLAYERS) {
            //    tmpu = playerSelection[i];
            //    if (IsUnitDead(tmpu) || tmpu == null || GetPlayerId(GetOwningPlayer(tmpu)) >= NUMBER_OF_MAX_PLAYERS) {tmpu = null;}
            //    if (GetLocalPlayer() == Player(i)) {
            //        if (tmpu == null) {text = "";}
            //        else {}
            //    }
            //    i += 1;
            //}
            tmpu = null;
            return this.aggros[0];
        }
        
        method getFirst() -> unit {
            return this.aggros[0];
        }
        
        method add(unit u) {
            integer i = this.locate(u);
            if (i == -1) {
                this.aggros[this.aggrosN] = u;
                this.aps[this.aggrosN] = 1.0 / (GetDistance.units2d(this.u, u) + 1.0);
                this.aggrosN += 1;
            }
        }
        
        method remove(integer i) {
            if (i != -1) {
                this.aggrosN -= 1;
                this.aggros[i] = this.aggros[this.aggrosN];
                this.aps[i] = this.aps[this.aggrosN];
                if (this.aggrosN == 0) {
                    this.destroy();
                }
            }
        }
        
        method reset() {
            integer i = 0;
            while (i < this.aggrosN) {
                this.aps[i] = 100.0;
                i += 1;
            }
        }
        
        method delete(unit u) {
            this.remove(this.locate(u));
        }
    
        static method operator[](unit u) -> thistype {
            if (!thistype.ht.exists(u)) {
                return 0;
            } else {
                return thistype(thistype.ht[u]);
            }
        }
        
        static method create(unit u) -> thistype {
            thistype this = thistype.allocate();
            this.u = u;
            this.aggrosN = 0;
            while (this.aggrosN < PlayerUnits.n) {
                this.aggros[this.aggrosN] = PlayerUnits.units[this.aggrosN];
                this.aps[this.aggrosN] = 1.0 / (GetDistance.units2d(this.u, PlayerUnits.units[this.aggrosN]) + 1.0);
                this.aggrosN += 1;
            }
            this.tt = CreateTextTag();
            SetTextTagText(this.tt, "", 0.024);
            SetTextTagPos(this.tt, GetUnitX(u), GetUnitY(u), 16.0);
            SetTextTagVisibility(this.tt, true);
            SetTextTagPermanent(this.tt, true);
            thistype.ht[u] = this;
            return this;
        }
        
        private static method onInit() {
            thistype.ht = HandleTable.create();
        }
    }
    
    function LevelThem(DelayTask dt) {
        integer i = 0;
        if (CURRENT_HERO_LEVEL != 1) {
            while (i < PlayerUnits.n) {
                if (IsUnitType(PlayerUnits.units[i], UNIT_TYPE_HERO)) {
                    SetHeroLevel(PlayerUnits.units[i], CURRENT_HERO_LEVEL, true);
                }
                i += 1;
            }
        }
    }
    
    private function CheckHeroLevel() {
        DelayTask.create(LevelThem, 0.37);
    }
    
    // Resurrection Timer Dialogue
    private struct HeroResurrection {
        private static timer tm;
        private static timerdialog td;
        private static boolean done;
        
        private static method resurrect() {
            unit u = GetEnumUnit();
            if (IsUnitDead(u)) {
                ReviveHero(u, GetInitX(GetPlayerId(GetOwningPlayer(u))), GetInitY(GetPlayerId(GetOwningPlayer(u))), true);
                PlayerUnits.add(u);
                if (IsInCombat()) {
                    MobList.addToAll(u);
                }
            }
            u = null;
        }
        
        private static method run() {
            PauseTimer(thistype.tm);
            thistype.done = true;
            TimerDialogDisplay(thistype.td, false);
            ForGroup(PlayerUnits.g, function thistype.resurrect);
            CheckHeroLevel();
        }
        
        static method start() {
            CheckHeroLevel();
            if (thistype.done) {
                thistype.done = false;
                TimerDialogSetTitle(thistype.td, "Resurrecting");
                TimerDialogDisplay(thistype.td, true);
                TimerStart(thistype.tm, 10.0, false, function thistype.run);
            }
        }
        
        private static method onInit() {
            thistype.tm = CreateTimer();
            thistype.td = CreateTimerDialog(thistype.tm);
            thistype.done = true;
            TimerDialogDisplay(thistype.td, false);
        }
    }
    // End Resurrection Timer Dialogue

    public struct MobList {
        static timer combatTimer;
        static real combatTime;
        static HandleTable ht;
        static unit units[];
        static integer n;
        
        static method locate(unit u) -> integer {
            integer i = 0;
            while (i < thistype.n) {
                if (thistype.units[i] == u) {
                    return i;
                } else {
                    i += 1;
                }
            }
            return -1;
        }
        
        static method GetNum() -> integer {
            integer i = 0;
            integer ret = 0;
            while (i < thistype.n) {
                if (!IsUnitUseless(thistype.units[i])) {
                    ret += 1;
                }
                i += 1;
            }
            return ret;
        }
        
        static method endCombat() {
            integer i = 0;
            while (i < combatStateNotifyN) {
                combatStateNotifyCallList[i].evaluate(false);
                i += 1;
            }
            ClearTextMessages();
            BJDebugMsg("|cffffcc00Combat End|r");
            whichBoss = null;
            PauseTimer(thistype.combatTimer);
            thistype.combatTime = -1.0;
            while (thistype.n > 0) {
                thistype.n -= 1;
                if (IsUnitSummoned(thistype.units[thistype.n]) || !CanUnitAttack(thistype.units[thistype.n])) {
                    KillUnit(thistype.units[thistype.n]);
                } else {
                    ResetMob(thistype.units[thistype.n]);
                }
            }
            HeroResurrection.start();
        }

        static method findUnitByUTID(integer utid) -> unit {
            integer i = 0;
            unit ret = null;
            while (i < thistype.n && ret == null) {
                if (GetUnitTypeId(thistype.units[i]) == utid) {
                    ret = thistype.units[i];
                }
                i += 1;
            }
            return ret;
        }
        
        static method remove(integer i) {
            AggroList[thistype.units[i]].destroy();
            thistype.n -= 1;
            thistype.units[i] = thistype.units[thistype.n];
            if (thistype.n < 1) {
                thistype.endCombat();
            }
        }
        
        static method reorderMobs() {
            integer i = 0;
            unit target;
            thistype.combatTime += TIME_TICK;
            while (i < thistype.n) {
                target = AggroList[thistype.units[i]].sort();
                //print(GetUnitName(thistype.units[i]) + " wants to attack " + GetUnitName(target));
                //IssueTargetOrderById( SpellData['A02W'].oid, target);
                OrderCreeps(thistype.units[i], target, combatTime);
                i += 1;
            }
            target = null;
        }
        
        static method newCombat() {
            integer i = 0;
            while (i < combatStateNotifyN) {
                combatStateNotifyCallList[i].evaluate(true);
                i += 1;
            }
            ClearTextMessages();
            BJDebugMsg("|cffffcc00Combat Start|r");
            thistype.combatTime = 0.01;
            TimerStart(thistype.combatTimer, TIME_TICK, true, function thistype.reorderMobs);
        }
        
        static method add(unit u) {
            integer ii;
            if (thistype.n == 0) {
                thistype.newCombat();
            }
            if (thistype.locate(u) == -1) {
                AggroList.create(u);
                thistype.units[thistype.n] = u;
                thistype.n += 1;
            } else {
                // print(SCOPE_PREFIX+">|cffff0000Error|r, unit already in mob list");
            }
            ii = 0;
            while (ii < responseAggroN) {
                responseAggroCallList[ii].evaluate(u);
                ii += 1;
            }
        }
        
        static method getLowestHPPercent() -> unit {
            unit ret = null;
            real dis, td;
            integer i;
            if (thistype.n == 0) {
                return ret;
            } else {
                ret = thistype.units[0];
                dis = GetUnitStatePercent(thistype.units[0], UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE);
                i = 1;
                while (i < thistype.n) {
                    td = GetUnitStatePercent(thistype.units[i], UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE);
                    if (td < dis) {
                        dis = td;
                        ret = thistype.units[i];
                    }
                    i += 1;
                }
                return ret;
            }
        }
        
        static method getChanneling() -> unit {
            integer i = 0;
            if (thistype.n == 0) {
                return null;
            } else {
                while (i < thistype.n) {
                    if (IsUnitChannelingCounterable(thistype.units[i])) {
                        return thistype.units[i];
                    }
                    i += 1;
                }
                return null;
            }
        }
        
        static method getLowestHP() -> unit {
            unit ret;
            real dis, td;
            integer i;
            real damageReduc;
            if (thistype.n == 0) {
                return null;
            } else {
                ret = null;
                dis = 9999999.0;
                i = 0;
                while (i < thistype.n) {
                    if (!IsUnitUseless(thistype.units[i])) {
                        damageReduc = UnitProp.inst(thistype.units[i], SCOPE_PREFIX).DamageTaken();
                        if (damageReduc < 0.01) {damageReduc = 0.01;}
                        if (damageReduc > 2.5) {damageReduc = 999999.0;} // tinker priority
                        td = GetWidgetLife(thistype.units[i]) / damageReduc;
                        if (td < dis) {
                            dis = td;
                            ret = thistype.units[i];
                        }
                    }
                    i += 1;
                }
                return ret;
            }
        }
        
        static method getRandom() -> unit {
            if (thistype.n == 0) {
                return null;
            } else {
                return thistype.units[GetRandomInt(0, thistype.n - 1)];
            }
        }
        
        static method getNearestFrom(unit base) -> unit {
            unit ret = null;
            real dis = 9999.0;
            real tmp;
            integer i = 0;
            if (thistype.n == 0) {
                return ret;
            } else {
                while (i < thistype.n) {
                    if (!IsUnit(thistype.units[i], base)) {
                        tmp = GetDistance.units2d(base, thistype.units[i]);
                        if (tmp < dis) {
                            dis = tmp;
                            ret = thistype.units[i];
                        }
                    }
                    i += 1;
                }
                return ret;
            }
        }
        
        static method getNearestFromWithin(unit base, real rng) -> unit {
            unit ret = null;
            real dis = 9999.0;
            real tmp;
            integer i = 0;
            if (thistype.n == 0) {
                return ret;
            } else {
                while (i < thistype.n) {
                    if (!IsUnit(thistype.units[i], base)) {
                        tmp = GetDistance.units2d(base, thistype.units[i]);
                        if (tmp < dis && tmp <= rng) {
                            dis = tmp;
                            ret = thistype.units[i];
                        }
                    }
                    i += 1;
                }
                return ret;
            }
        }

        static method getWithoutBuff(integer bid) -> unit {
            integer i;
            for (0 <= i < thistype.n) {
                if (GetUnitAbilityLevel(thistype.units[i], bid) == 0) {
                    return thistype.units[i];
                }
            }
            return null;
        }
        
        // mob death
        static method flushDeath(unit u) {
            integer i = thistype.locate(u);
            if (i != -1) {
                thistype.remove(i);
            }
        }
        
        static method addToAll(unit u) {
            integer i = 0;
            while (i < thistype.n) {
                AggroList[thistype.units[i]].add(u);
                i += 1;
            }
        }
        
        static method clearForAll(unit u) {
            integer i = 0;
            while (i < thistype.n) {
                AggroList[thistype.units[i]].delete(u);
                i += 1;
            }
            if (AggroList[thistype.units[0]].aggrosN < 1) {
                MobList.endCombat();
            }
        }
        
        static method setForAll(unit u, real value) {
            integer i = 0;
            while (i < thistype.n) {
                AggroList[thistype.units[i]].setAggro(u, value);
                i += 1;
            }
        }
        
        private static method onInit() {
            thistype.ht = HandleTable.create();
            thistype.combatTimer = CreateTimer();
            thistype.combatTime = -1.0;
            thistype.n = 0;
            RegisterUnitDeath(thistype.flushDeath);
        }
    }
    
    
    public function GetFirstAggro(unit u) -> unit {
        return AggroList[u].sort();
    }
    
    public function AggroTarget(unit a, unit b, real amt, string trace) {
        if (!IsUnitDead(a) && !IsUnitDead(b)) {
            if (MobList.locate(b) == -1) {
                MobList.add(b);
            }
            AggroList[b].aggroBy(a, amt * UnitProp.inst(a, SCOPE_PREFIX).AggroRate(), "AggroSystem.AggroTarget < " + trace);
        }
        //print(GetUnitName(b)+"'s aggro list of " + GetUnitName(a) + " has increased by " + R2S(amt));
    }
    
    // any player 10 has acquired
    private function acquired() -> boolean {
        unit u = GetTriggerUnit();
        MobList.add(u);
        //print("TriggerUnit is " + GetUnitName(GetTriggerUnit()));
        if (IsUnitBoss(u)) {
            whichBoss = u;
        }
        u = null;
        return false;
    }

    private trigger acqtrg;
    
    // any unit enter map
    function register(unit u) {
        if (!IsUnitDummy(u) && !IsUnitIllusion(u)) {
            if (GetPlayerId(GetOwningPlayer(u)) == MOB_PID) {
                if (IsInCombat()) {
                    if (IsUnitSummoned(u) == true) {
                        MobList.add(u);
                    }
                }
                if (CanUnitAttack(u)) {
                    TriggerRegisterUnitEvent(acqtrg, u, EVENT_UNIT_ACQUIRED_TARGET);
                }
            } else if (GetPlayerId(GetOwningPlayer(u)) < NUMBER_OF_MAX_PLAYERS && !IsUnitUseless(u)) {
                PlayerUnits.add(u);
                if (IsInCombat()) {
                    RegisterUnitProperty(u);
                    MobList.addToAll(u);
                }
            }
        }
    }
    
    // player unit death
    function playerDeath(unit u) {
        if (GetPlayerId(GetOwningPlayer(u)) < NUMBER_OF_MAX_PLAYERS) {
            if (IsUnitUseless(u) == false) {
                PlayerUnits.delete(u);
            }
            if (IsInCombat()) {
                if (IsUnitUseless(u) == false) {
                    MobList.clearForAll(u);
                }
            }
        }
    }
    
    // any enermy unit damaged
    function setAggros() {
        if (IsUnitUseless(DamageResult.target) == true) return;
        if (GetPidofu(DamageResult.target) != MOB_PID) return;
        if (IsUnitDead(DamageResult.target) == true) return;
        if (IsUnitDead(DamageResult.source) == true) return;
        if (IsUnit(DamageResult.source, DamageResult.target) == true) return;
        if (GetPidofu(DamageResult.target) == GetPidofu(DamageResult.source)) return;

        if (!CanUnitAttack(DamageResult.target) && DamageResult.amount < GetUnitState(DamageResult.target, UNIT_STATE_MAX_LIFE)) {
            MobList.add(DamageResult.target);
        }
        AggroTarget(DamageResult.source, DamageResult.target, DamageResult.amount, SCOPE_PREFIX + "setAggros");
    }

    public function AggroAll(unit a, real amt) {
        integer i = 0;
        while (i < MobList.n) {
            AggroTarget(a, MobList.units[i], amt / I2R(MobList.n), SCOPE_PREFIX + "AggroAll");
            i += 1;
        }
    }
    
    public function AggroClear(unit a, real percentage) {
        integer i = 0;
        integer j;
        AggroList al;
        while (i < MobList.n) {
            al = AggroList[MobList.units[i]];
            j = 0;
            while (j < al.aggrosN) {
                if (al.aggros[j] == a) {
                    //print("Original AP " + R2S(al.aps[j]));
                    al.aggroBy(a, 0.0 - al.aps[j] * percentage, "AggroSystem.AggroClear");
                    //print("After AP " + R2S(al.aps[j]));
                }
                j += 1;
            }
            i += 1;
        }
    }
    
    function setAggrosHealed() {
        if (IsInCombat() && GetPlayerId(GetOwningPlayer(HealResult.source)) < NUMBER_OF_MAX_PLAYERS) {
            AggroAll(HealResult.source, HealResult.effective);
        }
    }

    function killInThread(DelayTask dt) {
        KillUnit(dt.u0);
    }

    function bossDeathSaki(unit u) {
        integer i;
        if (IsUnitBoss(u)) {
            i = 0;
            while (i < MobList.n) {
                if (IsUnitSummoned(MobList.units[i]) == true) {
                    DelayTask.create(killInThread, 0.01 * i).u0 = MobList.units[i];
                }
                i += 1;
            }
        }
    }
    
    private function onInit() {
        MobList.combatTime = -1.0;
        
        acqtrg = CreateTrigger();
        TriggerAddCondition(acqtrg, Condition(function acquired));
        RegisterUnitEnterMap(register);
        
        RegisterUnitDeath(playerDeath);
        RegisterUnitDeath(bossDeathSaki);
        RegisterDamagedEvent(setAggros);
        RegisterHealedEvent(setAggrosHealed);
    }

}
//! endzinc
