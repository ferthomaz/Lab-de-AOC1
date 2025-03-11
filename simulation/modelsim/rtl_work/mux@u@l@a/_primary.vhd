library verilog;
use verilog.vl_types.all;
entity muxULA is
    port(
        \AND\           : in     vl_logic;
        \OR\            : in     vl_logic;
        SOMADOR         : in     vl_logic;
        LESS            : in     vl_logic;
        seletora        : in     vl_logic_vector(2 downto 0);
        saida           : out    vl_logic
    );
end muxULA;
