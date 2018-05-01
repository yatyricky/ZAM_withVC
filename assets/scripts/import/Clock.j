//! zinc
library Clock {
//==============================================================================
//  ʱ�ӣ�
//      ��õ�ǰ��Ϸ�ѹ�ʱ�䡣
//==============================================================================
//  real:   GetGameTime()
//      ����Ϊ��λ���ʱ�䡣
//  Time:   GetGameTimeDetail()
//      ���һ��Time�ṹ���͵ĵ�ǰʱ�䡣
//==============================================================================
//  Time
//      integer:    hour    //Сʱ
//      integer:    minute  //����
//      real:       second  //��
//      nothing:    destroy()
//          ���ٸ�ʱ��ṹ
//      string:     toString()
//          ����ʱ���� H:M:S �ĸ�ʽת��Ϊ�ַ���
//==============================================================================
//  [Warft]Nef.
//==============================================================================
    constant real INTERVAL = 60.0;
    real time;    
    timer clock;
    
    public struct Time {
        integer hour, minute;
        real second;
        
        method destroy() {
            this.deallocate();
        }
        
        method toString() -> string {
            return I2S(this.hour) + ":" + I2S(this.minute) + ":" + R2S(this.second);
        }
    }
    
    public function GetGameTime() -> real {
        return time + TimerGetElapsed(clock);
    }
    
    public function GetGameTimeDetail() -> Time {
        real ct = GetGameTime();
        Time t = Time.create();
        integer intct = R2I(ct);
        ct = ct - intct;
        t.hour = intct / 3600;
        intct -= t.hour * 3600;
        t.minute = intct / 60;
        intct -= t.minute * 60;
        t.second = intct + ct;
        return t;
    }
    
    function onInit() {
        clock = CreateTimer();
        time = 0.0;
        TimerStart(clock, INTERVAL, true, function() {
            time += INTERVAL;
        });
    }
}
//! endzinc
