library verilog;
use verilog.vl_types.all;
entity somador1bit is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Te              : in     vl_logic;
        Ts              : out    vl_logic;
        S               : out    vl_logic
    );
end somador1bit;
