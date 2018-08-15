library verilog;
use verilog.vl_types.all;
entity SEG7_LUT_8 is
    port(
        oSEG0           : out    vl_logic_vector(6 downto 0);
        oSEG1           : out    vl_logic_vector(6 downto 0);
        oSEG2           : out    vl_logic_vector(6 downto 0);
        oSEG3           : out    vl_logic_vector(6 downto 0);
        oSEG4           : out    vl_logic_vector(6 downto 0);
        oSEG5           : out    vl_logic_vector(6 downto 0);
        oSEG6           : out    vl_logic_vector(6 downto 0);
        oSEG7           : out    vl_logic_vector(6 downto 0);
        iDIG            : in     vl_logic_vector(31 downto 0)
    );
end SEG7_LUT_8;
