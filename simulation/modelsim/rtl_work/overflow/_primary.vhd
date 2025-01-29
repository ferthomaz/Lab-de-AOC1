library verilog;
use verilog.vl_types.all;
entity overflow is
    port(
        binvert         : in     vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        result          : in     vl_logic;
        overflow        : out    vl_logic
    );
end overflow;
