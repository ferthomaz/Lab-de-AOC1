library verilog;
use verilog.vl_types.all;
entity controlePrincipal is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        AluSrc          : out    vl_logic;
        MemparaReg      : out    vl_logic;
        EscreveReg      : out    vl_logic;
        LeMem           : out    vl_logic;
        EscreveMem      : out    vl_logic;
        Branch          : out    vl_logic;
        AluOp           : out    vl_logic_vector(1 downto 0);
        jump            : out    vl_logic
    );
end controlePrincipal;
