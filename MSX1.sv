//============================================================================
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//============================================================================



module MSX1_Mist
(       
        output        LED,                                              
        output  [5:0] VGA_R,
        output  [5:0] VGA_G,
        output  [5:0] VGA_B,
        output        VGA_HS,
        output        VGA_VS,
        output        AUDIO_L,
        output        AUDIO_R,  
        input         SPI_SCK,
        output        SPI_DO,
        input         SPI_DI,
        input         SPI_SS2,
        input         SPI_SS3,
        input         CONF_DATA0,
        input         CLOCK_27,
		  input         TAPE_IN,
		  input         UART_RX,
		  output        UART_TX,
		  
		          
		  output [12:0] SDRAM_A,
		  inout  [15:0] SDRAM_DQ,
        output        SDRAM_DQML,
        output        SDRAM_DQMH,
        output        SDRAM_nWE,
        output        SDRAM_nCAS,
        output        SDRAM_nRAS,
        output        SDRAM_nCS,
        output  [1:0] SDRAM_BA,
        output        SDRAM_CLK,
        output        SDRAM_CKE
);

	

///////// Default values for ports not used in this core /////////



assign LED = 0;

//////////////////////////////////////////////////////////////////


`include "build_id.v" 

localparam CONF_STR = {
        "MSX1;;",
        "S,VHD;",
        "OE,Reset after Mount,No,Yes;",
		  "O45,Scandoubler Fx,None,HQ2x,CRT 25%,CRT 50%;",
        "OD,Joysticks Swap,No,Yes;",
        "T0,Reset;",
        "V,v",`BUILD_DATE 
};


wire forced_scandoubler;
wire  [1:0] buttons;
wire  [1:0] switches;
wire [31:0] status;
wire [10:0] ps2_key;



//VHD	
wire [31:0] sd_lba;
wire   		sd_rd;
wire   		sd_wr;

wire        sd_ack;
wire        sd_conf;
wire        sd_sdhc;
wire  [8:0] sd_buff_addr;
wire  [7:0] sd_buff_dout;
wire  [7:0] sd_buff_din;
wire        sd_buff_wr;


wire        img_readonly;

wire        sd_ack_conf;
wire        ioctl_wait = ~pll_locked;

wire  [1:0] img_mounted;
wire [31:0] img_size;


//Keyboard Ps2
wire        ps2_kbd_clk_out;
wire        ps2_kbd_data_out;
wire        ps2_kbd_clk_in;
wire        ps2_kbd_data_in;

// Analog joySticks
wire       joystick_analog_0;
wire       joystick_analog_1;

wire ypbpr;

wire        ioctl_wr;
wire [24:0] ioctl_addr;
wire  [7:0] ioctl_dout;
wire        ioctl_download;
wire  [7:0] ioctl_index;


// PS2DIV : la mitad del divisor que necesitas para dividir el clk_sys que le das al hpio, para que te de entre 10Khz y 16Kzh

mist_io #(.STRLEN($size(CONF_STR)>>3), .PS2DIV(750)) mist_io
(
	.*,

	
	.conf_str(CONF_STR),
   .sd_conf(0),
   .sd_sdhc(1),
	.sd_rd(sd_rd),
   .sd_wr(sd_wr),
   .ioctl_ce(1),

   // unused
   .ps2_mouse_clk(),
   .ps2_mouse_data(),
	.ps2_mouse(),
   .joystick_analog_0(),
   .joystick_analog_1(),
	
   //Keyboard Ps2
   .ps2_kbd_clk(ps2_kbd_clk_in),
	.ps2_kbd_data(ps2_kbd_data_in),

//Joysticks	
	.joystick_0(joy_A),
	.joystick_1(joy_B)	
	
);


///////////////////////   CLOCKS   ///////////////////////////////

wire clock_sdram_s, sdram_clk_o, clock_vga_s, pll_locked;
wire clk_sys;

pll pll1
(
	.inclk0(CLOCK_27),
	.areset(0),
	.c0(clk_sys),	// 21.477 MHz					[21.484]
	.c1(clock_sdram_s),  // 85.908 MHz (4x master)	[85.937] - 85.908 ----- OJO con sdrammister 100
	.c2(sdram_clk_o),		// 85.908 MHz -90°
	.c3(clock_vga_s),		// 25.200
	.locked(pll_locked)
);

//wire reset = RESET | status[0] | buttons[1];
wire reset = status[0] | buttons[1] | !pll_locked | (status[14] && img_mounted);



//////////////////////////////////////////////////////////////////

//wire [1:0] col = status[4:3];

wire HBlank;
wire HSync;
wire VBlank;
wire VSync;
wire scandoubler_disable;




//////////////////   SD   ///////////////////

wire sdclk;
wire sdmosi;
wire sdmiso =vsdmiso ;
wire sdss;

reg vsd_sel = 0;
always @(posedge CLOCK_27) if(img_mounted) vsd_sel <= |img_size;





wire sdhc = 1;
wire vsdmiso;
sd_card sd_card
(
	.*,
	.clk_spi(clk_sys), 
	.sdhc(sdhc),
	.sck(sdclk),
	.ss(sdss | ~vsd_sel),
	.mosi(sdmosi),
	.miso(vsdmiso)
);

// VHD
assign SD_CS   = sdss   |  vsd_sel;
assign SD_SCK  = sdclk  & ~vsd_sel;
assign SD_MOSI = sdmosi & ~vsd_sel;




wire [15:0] joy_0 = status[13] ? joy_B : joy_A;
wire [15:0] joy_1 = status[13] ? joy_A : joy_B;
wire [15:0] joy_A;
wire [15:0] joy_B;



Mister_top Msx1Core
(
//		-- Clocks
//--		clock_50_i			: in    std_logic;


		.clock_master_s	(clk_sys),	//		: std_logic;
		.clock_sdram_s		(clock_sdram_s), 	//		: std_logic;
		.clock_vga_s		(clock_vga_s),		//		: std_logic;
		.pll_locked_s		(pll_locked), 		//		: std_logic;
		.reset				(reset),
		
//		-- Buttons
//		.btn_n_i				(),						//: in    std_logic_vector(4 downto 1);


//		-- SDRAM	(H57V256 = 16Mx16 = 32MB)
		.sdram_clk_o	(SDRAM_CLK),					//		: out   std_logic								:= '0';
		.sdram_cke_o	(SDRAM_CKE),					//			: out   std_logic								:= '0';
		.sdram_ad_o		(SDRAM_A),						//			: out   std_logic_vector(12 downto 0)	:= (others => '0');
		.sdram_da_io	(SDRAM_DQ),						//			: inout std_logic_vector(15 downto 0)	:= (others => 'Z');
		.sdram_ba_o		(SDRAM_BA),						//			: out   std_logic_vector( 1 downto 0)	:= (others => '0');
		.sdram_dqm_o	({SDRAM_DQMH,SDRAM_DQML}),	//		: out   std_logic_vector( 1 downto 0)	:= (others => '1');
		.sdram_ras_o	(SDRAM_nRAS),					//		: out   std_logic								:= '1';
		.sdram_cas_o	(SDRAM_nCAS),					//		: out   std_logic								:= '1';
		.sdram_cs_o		(SDRAM_nCS),					//	: out   std_logic								:= '1';
		.sdram_we_o		(SDRAM_nWE),					//			: out   std_logic								:= '1';

		
//		-- PS2
//		ps2_clk_io			: inout std_logic								:= 'Z';
//		ps2_data_io			: inout std_logic								:= 'Z';
		.ps2_clk_i		(ps2_kbd_clk_in),				//	: inout std_logic								:= 'Z';
		.ps2_data_i		(ps2_kbd_data_in),			//	: inout std_logic								:= 'Z';
		.ps2_clk_o		(ps2_kbd_clk_out),			//	: inout std_logic								:= 'Z';
		.ps2_data_o		(ps2_kbd_data_out),			//	: inout std_logic								:= 'Z';
//		ps2_mouse_clk_io  : inout std_logic								:= 'Z';
//		ps2_mouse_data_io : inout std_logic								:= 'Z';

//		-- SD Card
		.sd_cs_n_o		(sdss),								//: out   std_logic								:= '1';
		.sd_sclk_o		(sdclk),								//: out   std_logic								:= '0';
		.sd_mosi_o		(sdmosi),								//: out   std_logic								:= '0';
		.sd_miso_i		(sdmiso),								//: in    std_logic;


		
//		-- Joysticks
		.joy1_up_i		(~joy_0[3]),	//	: in    std_logic;
		.joy1_down_i	(~joy_0[2]),	//			: in    std_logic;
		.joy1_left_i	(~joy_0[1]),	//			: in    std_logic;
		.joy1_right_i	(~joy_0[0]),	//		: in    std_logic;
		.joy1_p6_i		(~joy_0[4]),	//		: in    std_logic;
		.joy1_p9_i		(~joy_0[5]),	//		: in    std_logic;
		.joy2_up_i		(~joy_1[3]),	//		: in    std_logic;
		.joy2_down_i	(~joy_1[2]),	//			: in    std_logic;
		.joy2_left_i	(~joy_1[1]),	//			: in    std_logic;
		.joy2_right_i	(~joy_1[0]),	//		: in    std_logic;
		.joy2_p6_i		(~joy_1[4]),	//		: in    std_logic;
		.joy2_p9_i		(~joy_1[5]),	//		: in    std_logic;
//--		joyX_p7_o			: out   std_logic								:= '1';

//		-- Audio
		.dac_l_o        (AUDIO_L),
		.dac_r_o			 (AUDIO_R),
//		.PreDac_l_s			(AUDIO_L_DAC),		//: out   std_logic_vector(15 downto 0);
//		.PreDac_r_s			(AUDIO_R_DAC),		//: out   std_logic_vector(15 downto 0);
		.ear_i				(tape_in),		//	: in    std_logic;
//		mic_o					: out   std_logic								:= '0';

//		-- VGA
		.vga_r_o			(Rx),		//			: out   std_logic_vector(4 downto 0)	:= (others => '0');
		.vga_g_o			(Gx),		//	: out   std_logic_vector(4 downto 0)	:= (others => '0');
		.vga_b_o			(Bx),		//	: out   std_logic_vector(4 downto 0)	:= (others => '0');
		.vga_hsync_n_o	(HSync),	//	: out   std_logic								:= '1';
		.vga_vsync_n_o	(VSync),	//	: out   std_logic								:= '1';
		.vga_blank		(vga_blank),			//
		.vga_DE			(vga_DE)
		

	);
	

reg [3:0] Rx, Gx, Bx;


/////////  EAR added by Fernando Mosquera & Rampa

wire tape_in;
assign tape_in = ~TAPE_IN;

mist_video mist_video
(
 .*,
 .scanlines  (scandoubler_disable ? 2'b00 : status[5:4]),
 .ce_divider (1'b0),
 .no_csync   (),
 .rotate     (),
 .blend      (),
 .R ({Rx,2'b0}),
 .G ({Gx,2'b0}),
 .B ({Bx,2'b0})
 
);





endmodule
