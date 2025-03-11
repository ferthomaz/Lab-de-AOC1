library verilog;
use verilog.vl_types.all;
entity muxBinvert is
    port(
        seletora        : in     vl_logic_vector(2 downto 0);
        saida           : out    vl_logic
    );
end muxBinvert;
