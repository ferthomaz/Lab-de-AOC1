library verilog;
use verilog.vl_types.all;
entity muxAddress is
    port(
        a               : in     vl_logic_vector(4 downto 0);
        b               : in     vl_logic_vector(4 downto 0);
        seletora        : in     vl_logic;
        saida           : out    vl_logic_vector(4 downto 0)
    );
end muxAddress;
