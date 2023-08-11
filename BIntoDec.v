module BintoDec (//double dabble algorithm
    input wire [17:0] bin_18,
    output reg [3:0] digit_6,
    output reg [3:0] digit_5,
    output reg [3:0] digit_4,
    output reg [3:0] digit_3,
    output reg [3:0] digit_2,
    output reg [3:0] digit_1
);
integer i;
always @(bin_18) begin
    digit_6 = 4'd0;
    digit_5 = 4'd0;
    digit_4 = 4'd0;
    digit_3 = 4'd0;
    digit_2 = 4'd0;
    digit_1 = 4'd0;
    for(i=17; i>=0; i=i-1) begin
        if(digit_6 >= 4'b0101) begin
            digit_6 = digit_6 + 4'b0011;
        end
        if(digit_5 >= 4'b0101) begin
            digit_5 = digit_5 + 4'b0011;
        end
        if(digit_4 >= 4'b0101) begin
            digit_4 = digit_4 + 4'b0011;
        end
        if(digit_3 >= 4'b0101) begin
            digit_3 = digit_3 + 4'b0011;
        end
        if(digit_2 >= 4'b0101) begin
            digit_2 = digit_2 + 4'b0011;
        end
        if(digit_1>= 4'b0101) begin
            digit_1 = digit_1 + 4'b0011;
        end
        digit_6 = digit_6 << 1;
        digit_6[0] = digit_5[3];
        digit_5 = digit_5 << 1;
        digit_5[0] = digit_4[3];
        digit_4 = digit_4 << 1;
        digit_4[0] = digit_3[3];
        digit_3 = digit_3 << 1;
        digit_3[0] = digit_2[3];
        digit_2 = digit_2 << 1;
        digit_2[0] = digit_1[3];
        digit_1 = digit_1 << 1;
        digit_1[0] = bin_18[i];
    end
end

endmodule