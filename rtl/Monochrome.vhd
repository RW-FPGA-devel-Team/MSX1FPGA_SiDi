--------------------------------------------------------------------------------
-- Monochrome
--------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Monochrome IS
  GENERIC (
    vsWidth   : natural := 8--32;						-- VideoSignal Width
    );							-- Y Scale
  PORT (
    -- VGA IN
    i_r   : IN  unsigned(vsWidth-1 DOWNTO 0);
    i_g   : IN  unsigned(vsWidth-1 DOWNTO 0);
    i_b   : IN  unsigned(vsWidth-1 DOWNTO 0);
--    i_hs  : IN  std_logic;
--    i_vs  : IN  std_logic;
--    i_hb  : IN  std_logic;
--    i_vb  : IN  std_logic;
--    i_de  : IN  std_logic;
--    i_en  : IN  std_logic;
--    i_clk : IN  std_logic;

    -- VGA_OUT
    o_r   : OUT unsigned(vsWidth-1 DOWNTO 0);
    o_g   : OUT unsigned(vsWidth-1 DOWNTO 0);
    o_b   : OUT unsigned(vsWidth-1 DOWNTO 0);
--    o_hs  : OUT std_logic;
--    o_vs  : OUT std_logic;
--    o_hb  : OUT std_logic;
--    o_vb  : OUT std_logic;
--    o_de  : OUT std_logic;

    -- Control
    ena   : IN std_logic := '1';      -- Enable ON/OFF

	 mode  : IN unsigned (1 downto 0) := (OTHERS =>'0')      -- Enable ON/OFF
	 
    );
END ENTITY Monochrome;

--##############################################################################
ARCHITECTURE rtl OF Monochrome IS

    component rgbGrey 
	 port 
	 (
		i_r : in unsigned(vsWidth-1 DOWNTO 0);
		i_g : in unsigned(vsWidth-1 DOWNTO 0);
		i_b : in unsigned(vsWidth-1 DOWNTO 0);

		o_r : out unsigned(vsWidth-1 DOWNTO 0);
		o_g : out unsigned(vsWidth-1 DOWNTO 0);
		o_b : out unsigned(vsWidth-1 DOWNTO 0)
	);
	end component;


  SIGNAL o_r_Grey, o_g_Grey, o_b_Grey : unsigned(vsWidth-1 DOWNTO 0);

BEGIN

	Grey_T : rgbGrey port map
	(
		i_r => i_r,
		i_g => i_g,
		i_b => i_b,
		o_r => o_r_Grey,
		o_g => o_g_Grey,
		o_b => o_b_Grey
	);


  Video:PROCESS (i_r,i_g,i_b) IS
  BEGIN

   case mode is 
		when b"00" => 
				o_r <= o_r_Grey;
				o_g <= o_g_Grey;
				o_b <= o_b_Grey;
		when b"01" => 
			o_r<=i_r;
			o_g<=(OTHERS =>'0');
			o_b<=(OTHERS =>'0');
		when b"10" => 
			o_r<=(OTHERS =>'0');
			o_g<=i_g;
			o_b<=(OTHERS =>'0');
		when b"11" => 
			o_r<=(OTHERS =>'0');
			o_g<=(OTHERS =>'0');
			o_b<=i_b;
		when others =>   
			o_r<=i_r;
			o_g<=i_g;
			o_b<=i_b;

  end case;

END PROCESS Video;

 
 
  ----------------------------------------------------------
  END ARCHITECTURE rtl;
