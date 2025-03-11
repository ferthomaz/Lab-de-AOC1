library verilog;
use verilog.vl_types.all;
entity deslocador is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        instruction15   : in     vl_logic_vector(15 downto 0);
        immediate       : out    vl_logic_vector(15 downto 0)
    );
end deslocador;
