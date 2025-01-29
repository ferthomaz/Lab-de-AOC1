library verilog;
use verilog.vl_types.all;
entity mux2 is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        seletora        : in     vl_logic;
        saida           : out    vl_logic
    );
end mux2;
