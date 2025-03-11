
module multiplexador(A, B, seletora, saida);

input [4:0] A, B;
input seletora;
output reg [4:0]saida;

always@(*) begin
case(seletora)		//analisa a seletora
1'b0: saida = A;	//se for 00 saída é A
1'b1: saida = B;	//se for 01 saida é B
endcase
end
endmodule
