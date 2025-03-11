module mux2(A, B, seletora, saida);

input A, B;
input seletora;
output reg saida;

always@(*) begin
case(seletora)		//analisa a seletora
1'b0: saida = A;	//se for 00 saída é A
1'b1: saida = B;	//se for 01 saida é B
endcase
end
endmodule
