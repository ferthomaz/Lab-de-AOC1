library verilog;
use verilog.vl_types.all;
entity multiplexador32 is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        seletora        : in     vl_logic;
        saida           : out    vl_logic_vector(31 downto 0)
    );
end multiplexador32;
