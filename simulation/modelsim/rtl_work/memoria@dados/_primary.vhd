library verilog;
use verilog.vl_types.all;
entity memoriaDados is
    generic(
        memSize         : integer := 32
    );
    port(
        address         : in     vl_logic_vector(31 downto 0);
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        writeData       : in     vl_logic_vector;
        readData        : out    vl_logic_vector;
        clock           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of memSize : constant is 1;
end memoriaDados;
