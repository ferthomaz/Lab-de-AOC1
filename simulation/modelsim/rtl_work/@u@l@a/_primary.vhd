library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        binvert         : in     vl_logic;
        cin             : in     vl_logic;
        less            : in     vl_logic;
        ALUop           : in     vl_logic_vector(2 downto 0);
        result          : out    vl_logic;
        cout            : out    vl_logic;
        overf           : out    vl_logic
    );
end ULA;
