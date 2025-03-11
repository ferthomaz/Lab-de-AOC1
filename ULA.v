//modulo da ula de 1 bit
//msb (bit mais significativo) é o bit de sinal
module ULA(a, b, binvert, cin, less, ALUop, result, cout, overf);
input a, b, binvert, cin, less;
input [2:0] ALUop;
output result, cout, overf;

//atualizacao do valor de b
wire bwire;
//module mux2(A, B, seletora, saida);
mux2 alteracaoB(b, ~b, binvert, bwire);

//criação de wires para utilização no mux de resultado
wire andRES, orRES, somadorRES;
assign andRES = a & b;
assign orRES = a | b;
//module somador1bit		 (A, B    , Te  , Ts  , S     );
			somador1bit soma(a, bwire, cin, cout, somadorRES);

//ALUop seleciona qual das saidas é utilizada
//module multiplexador	  (AND, 	  OR, 	SOMADOR   , LESS, 	seletora, saida);
			muxULA seletorResultado(andRES, orRES, somadorRES, less   , ALUop   , result);
			
//module overflow		  (binvert, a, b, 	 result, overflow);
			overflow check(binvert, a, b, result, overf);
endmodule
