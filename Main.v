module Main(
    input wire [9:0] num,
    input wire [2:0] btn,
    input wire clk,
    output wire [6:0] seg_1,
    output wire [6:0] seg_2,
    output wire [6:0] seg_3,
    output wire [6:0] seg_4,
    output wire [6:0] seg_5,
    output wire [6:0] seg_6,
	output wire [3:0] LED
);
		wire [3:0] digit_1, digit_2, digit_3, digit_4, digit_5, digit_6;
		wire [17:0] bin_18;
		Adder addr(.clk(clk),.num(num),.btn(btn),.bin_18(bin_18));
		BintoDec btd(.bin_18(bin_18),.digit_6(digit_6),.digit_5(digit_5),.digit_4(digit_4),.digit_3(digit_3),.digit_2(digit_2),.digit_1(digit_1));
		assign LED = 'b0;
		SevenSegmentDisplay sev1(.num(digit_1),.seg(seg_1));
		SevenSegmentDisplay sev2(.num(digit_2),.seg(seg_2));
		SevenSegmentDisplay sev3(.num(digit_3),.seg(seg_3));
		SevenSegmentDisplay sev4(.num(digit_4),.seg(seg_4));
		SevenSegmentDisplay sev5(.num(digit_5),.seg(seg_5));
		SevenSegmentDisplay sev6(.num(digit_6),.seg(seg_6));
endmodule