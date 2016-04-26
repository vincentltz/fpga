module quad_decoder (
	input channel_a,
	input channel_b,
	input clk,
	output dir,
	output quad_en
);
	logic channel_a_delayed, channel_b_delayed;

	always_ff @ (posedge clk) begin
		channel_a_delayed <= channel_a;
	end

	always_ff @ (posedge clk) begin
		channel_b_delayed <= channel_b;
	end

	assign quad_en = channel_a ^ channel_a_delayed ^ channel_b ^ channel_b_delayed;
	assign dir = channel_a ^ channel_b_delayed;
endmodule
