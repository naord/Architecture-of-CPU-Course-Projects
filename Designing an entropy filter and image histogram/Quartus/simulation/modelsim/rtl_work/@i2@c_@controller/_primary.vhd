library verilog;
use verilog.vl_types.all;
entity I2C_Controller is
    port(
        CLOCK           : in     vl_logic;
        I2C_SCLK        : out    vl_logic;
        I2C_SDAT        : inout  vl_logic;
        I2C_DATA        : in     vl_logic_vector(31 downto 0);
        GO              : in     vl_logic;
        \END\           : out    vl_logic;
        ACK             : out    vl_logic;
        RESET           : in     vl_logic
    );
end I2C_Controller;
