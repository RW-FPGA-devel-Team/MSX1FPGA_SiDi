

module rgbGrey(
   // VGA_IN
   input [7:0] i_r,
   input [7:0] i_g,
   input [7:0] i_b,

    // VGA_OUT
   output [7:0] o_r,
   output [7:0] o_g,
   output [7:0] o_b
);

wire [7:0] o_tmp;

// 0,299*R + 0,587*G + 0,114*B
// Alternative :  0.21 R + 0.72 G + 0.07 B

assign o_tmp = (i_r >> 2) + (i_r >> 5) + (i_r >> 6) +
        (i_g >> 1) + (i_g >> 4) + (i_g >> 6) +
        (i_b >> 4) + (i_b >> 5) + (i_b >> 6);

assign o_r  = o_tmp;        
assign o_g  = o_tmp;
assign o_b  = o_tmp;
        
endmodule