//! zinc
library FortitudeAura requires TimerUtils, ZAMCore, UnitProperty {
constant real INTERVAL = 1.0;
constant real AOE = 900.0;
constant integer BUFF_ID = 'A04L';

    function onEffect(Buff buf) {}

    function onRemove(Buff buf) {
        UnitProp[buf.bd.target].ModLife(-100);
    }

    struct FortitudeAura {
        unit u;
        timer tm;
        
        static method check() {
            thistype this = GetTimerData(GetExpiredTimer());
            integer i = 0;
            Buff buf;
            if (!IsUnitDead(this.u)) {
                while (i < PlayerUnits.n) {
                    if (GetDistance.units2d(PlayerUnits.units[i], this.u) <= AOE && !IsUnitDead(PlayerUnits.units[i])) {
                        buf = Buff.cast(this.u, PlayerUnits.units[i], BUFF_ID);
                        buf.bd.tick = -1;
                        buf.bd.interval = INTERVAL * 2.0;
                        if (buf.bd.i0 != 6) {
                            UnitProp[buf.bd.target].ModLife(100);
                            buf.bd.i0 = 6;
                        }
                        buf.bd.boe = onEffect;
                        buf.bd.bor = onRemove;
                        buf.run();  
                    }
                    i += 1;
                }
            }
        }
        
        static method register(unit u) {
            thistype this = thistype.allocate();
            this.u = u;
            this.tm = NewTimer();
            SetTimerData(this.tm, this);
            TimerStart(this.tm, INTERVAL, true, function thistype.check);
        }
    }
    
    function registerFA(unit u) {
        if (GetUnitTypeId(u) == UTID_PRIEST) {
            FortitudeAura.register(u);
        }
    }
    
    function onInit() {
        RegisterUnitEnterMap(registerFA);
        BuffType.register(BUFF_ID, BUFF_PHYX, BUFF_POS);
    }
}



//! endzinc
