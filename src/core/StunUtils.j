//! zinc
library StunUtils requires NefUnion, Table, TimerUtils, UnitProperty {
constant integer STUN_ID = 'A001';
constant integer STUN_DEBUFF_ID = 'BPSE';
constant string  STUN_OSTR  = "thunderbolt";
    
    private struct StunUtils {
        private static HandleTable ht;
        private timer tm;
        private unit u;

        private method destroy() {
            ReleaseTimer(this.tm);
            UnitProp[this.u].stunned = false;
            UnitRemoveAbility(this.u, STUN_DEBUFF_ID);
            thistype.ht.flush(this.u);
            this.tm = null;
            this.u = null;
            this.deallocate();
        }
        
        private static method execute() {
            thistype this = GetTimerData(GetExpiredTimer());
            this.destroy();
        }

        static method terminate(unit u) {
            thistype this;
            if (thistype.ht.exists(u)) {
                this = thistype.ht[u];
                this.destroy();
            }
        }
        
        static method start(unit u, real dur) {
            thistype this;
            IssueImmediateOrderById(u, OID_STOP);
            if (thistype.ht.exists(u)) {
                this = thistype.ht[u];
                if (TimerGetRemaining(this.tm) >= dur) {
                    return;
                }
            } else {
                this = thistype.allocate();
                thistype.ht[u] = this;
                this.tm = NewTimer();
                SetTimerData(this.tm, this);
                this.u = u;
                DummyCast(u, STUN_ID, STUN_OSTR, u);
                UnitProp[u].stunned = true;
            }
            TimerStart(this.tm, dur, false, function thistype.execute);
        }
        
        private static method onInit() {
            thistype.ht = HandleTable.create();
        }
    }
    
    public function StunUnit(unit c, unit t, real dur) {
        if (!(GetPlayerId(GetOwningPlayer(t)) == MOB_PID && IsUnitType(t, UNIT_TYPE_HERO))) {
            StunUtils.start(t, dur);
        }
    }
    
    public function StunBoss(unit c, unit t, real dur) {
        StunUtils.start(t, dur);
    }

    public function RemoveStun(unit t) {
        StunUtils.terminate(t);
    }



}
//! endzinc
