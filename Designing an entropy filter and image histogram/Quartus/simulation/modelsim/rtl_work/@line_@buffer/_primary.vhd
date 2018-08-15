library verilog;
use verilog.vl_types.all;
entity Line_Buffer is
    port(
        clken           : in     vl_logic;
        clock           : in     vl_logic;
        shiftin         : in     vl_logic_vector(11 downto 0);
        shiftout        : out    vl_logic_vector(11 downto 0);
        taps0x          : out    vl_logic_vector(11 downto 0);
        taps1x          : out    vl_logic_vector(11 downto 0)
    );
end Line_Buffer;
