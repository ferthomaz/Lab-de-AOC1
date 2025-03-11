module muxULA(AND, OR, SOMADOR, LESS, seletora, saida);
//mux	(andRES, orRES, somadorRES, less   , ALUop   , result);

input AND, OR, SOMADOR, LESS;
input [2:0] seletora;
output reg saida;

always@(*) begin
case(seletora)		//analisa a seletora
3'b000: saida = AND;			//se for 000 saída é AND
3'b001: saida = OR;			//se for 001 saida é OR
3'b010: saida = SOMADOR;	//se for 010 saida é ADD
3'b110: saida = SOMADOR;	//se for 110 saida é SUBTRACT
3'b111: saida = LESS; 		//se for 111 saida é SET LESS ON THAT
endcase
end
endmodule
