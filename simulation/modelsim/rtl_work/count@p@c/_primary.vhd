library verilog;
use verilog.vl_types.all;
entity countPC is
    port(
        pcin            : in     vl_logic_vector(4 downto 0);
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        pcout           : out    vl_logic_vector(4 downto 0)
    );
end countPC;
