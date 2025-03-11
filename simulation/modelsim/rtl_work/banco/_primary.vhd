library verilog;
use verilog.vl_types.all;
entity banco is
    generic(
        size            : integer := 32
    );
    port(
        Read1           : in     vl_logic_vector(4 downto 0);
        Read2           : in     vl_logic_vector(4 downto 0);
        WriteReg        : in     vl_logic_vector(4 downto 0);
        WriteData       : in     vl_logic_vector;
        RegWrite        : in     vl_logic;
        clock           : in     vl_logic;
        Data1           : out    vl_logic_vector;
        Data2           : out    vl_logic_vector;
        registrador8    : out    vl_logic_vector;
        registrador9    : out    vl_logic_vector;
        registrador10   : out    vl_logic_vector;
        registrador12   : out    vl_logic_vector;
        registrador16   : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end banco;
