module muxBinvert(seletora, saida);

input [2:0] seletora;
output reg saida;

always@(*) begin
case(seletora)		//analisa a seletora
3'b110: saida = 1'b1;
3'b111: saida = 1'b1;

default: saida = 1'b0;

endcase
end
endmodule
