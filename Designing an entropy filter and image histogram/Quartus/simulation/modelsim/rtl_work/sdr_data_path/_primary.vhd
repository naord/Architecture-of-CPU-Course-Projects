library verilog;
use verilog.vl_types.all;
entity sdr_data_path is
    generic(
        INIT_PER        : integer := 24000;
        REF_PER         : integer := 1024;
        SC_CL           : integer := 3;
        SC_RCD          : integer := 3;
        SC_RRD          : integer := 7;
        SC_PM           : integer := 1;
        SC_BL           : integer := 1;
        SDR_BL          : vl_notype;
        SDR_BT          : vl_logic := Hi0;
        SDR_CL          : vl_notype
    );
    port(
        CLK             : in     vl_logic;
        RESET_N         : in     vl_logic;
        DATAIN          : in     vl_logic_vector(15 downto 0);
        DM              : in     vl_logic_vector(1 downto 0);
        DQOUT           : out    vl_logic_vector(15 downto 0);
        DQM             : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INIT_PER : constant is 1;
    attribute mti_svvh_generic_type of REF_PER : constant is 1;
    attribute mti_svvh_generic_type of SC_CL : constant is 1;
    attribute mti_svvh_generic_type of SC_RCD : constant is 1;
    attribute mti_svvh_generic_type of SC_RRD : constant is 1;
    attribute mti_svvh_generic_type of SC_PM : constant is 1;
    attribute mti_svvh_generic_type of SC_BL : constant is 1;
    attribute mti_svvh_generic_type of SDR_BL : constant is 3;
    attribute mti_svvh_generic_type of SDR_BT : constant is 1;
    attribute mti_svvh_generic_type of SDR_CL : constant is 3;
end sdr_data_path;
