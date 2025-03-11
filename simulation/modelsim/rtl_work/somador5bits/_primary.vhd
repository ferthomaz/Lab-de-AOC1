library verilog;
use verilog.vl_types.all;
entity somador5bits is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        s               : out    vl_logic_vector(5 downto 0)
    );
end somador5bits;
