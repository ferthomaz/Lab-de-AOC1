module extensor(extensorS, saidaExtensor);

input [15:0] extensorS;
output reg [31:0] saidaExtensor;

always@(*) begin
case(extensorS[15])			//pega pra comparar so o bit de sinal (o mais significativo da entrada)
1'b0: saidaExtensor = {16'b0, extensorS};			//se for 0, ele aumenta 16 0's a frente
1'b1:	saidaExtensor = {16'b1111111111111111, extensorS};	 //se for 1, aumenta 16 1's a frente
endcase
end
endmodule
