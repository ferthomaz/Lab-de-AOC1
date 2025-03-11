library verilog;
use verilog.vl_types.all;
entity processador is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        result          : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic;
        overflow        : out    vl_logic;
        PC              : out    vl_logic_vector(4 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0);
        Data1           : out    vl_logic_vector(31 downto 0);
        saidaMUX        : out    vl_logic_vector(31 downto 0);
        registrador8    : out    vl_logic_vector(31 downto 0);
        registrador9    : out    vl_logic_vector(31 downto 0);
        registrador10   : out    vl_logic_vector(31 downto 0);
        registrador12   : out    vl_logic_vector(31 downto 0);
        registrador16   : out    vl_logic_vector(31 downto 0)
    );
end processador;
