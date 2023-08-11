module Adder(
	input wire clk,
	input wire [9:0] num,
	input wire [2:0] btn,
	output reg [17:0] bin_18
);
	reg [17:0] temp = 18'b0;// 숫자
	reg add_prev;
	always @(posedge clk or negedge btn[0]) begin
		if(btn[0] == 0)begin
			temp <= 'b0;
			bin_18 <= temp;
		end else begin

			if (~btn[2])begin
				if(add_prev) begin
				temp <= temp + {8'b0, num};
				end
			end

			if(btn[1] & btn[2])begin
				bin_18 <= {8'b0, num};
			end else begin
				bin_18 <= temp;
			end
			add_prev <= btn[2];
		end
	end

	
endmodule



