module muxAddress(a, b, seletora, saida);

input seletora;
input [4:0] a, b;
output reg [4:0] saida;

always@(*) begin
	case(seletora)
	1'b1: saida = a;
	1'b0: saida = b;
	default: saida = b;
	endcase
end

endmodule
