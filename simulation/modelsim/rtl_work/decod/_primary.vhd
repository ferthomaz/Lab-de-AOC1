library verilog;
use verilog.vl_types.all;
entity decod is
    port(
        entrada         : in     vl_logic_vector(7 downto 0);
        segmentos       : out    vl_logic_vector(0 to 6)
    );
end decod;
