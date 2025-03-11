library verilog;
use verilog.vl_types.all;
entity memoriaInstrucoes is
    generic(
        memSize         : integer := 8
    );
    port(
        readAddress     : in     vl_logic_vector(4 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0);
        clock           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of memSize : constant is 1;
end memoriaInstrucoes;
