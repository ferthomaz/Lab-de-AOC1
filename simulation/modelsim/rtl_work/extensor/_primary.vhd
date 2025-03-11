library verilog;
use verilog.vl_types.all;
entity extensor is
    port(
        extensorS       : in     vl_logic_vector(15 downto 0);
        saidaExtensor   : out    vl_logic_vector(31 downto 0)
    );
end extensor;
