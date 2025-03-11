module somador5bits(a, b, s); 
	input [4:0] a; 	//operando 1
	input [4:0] b;		//operando 2
	wire [5:0] trans;	//carry in/out da soma 
	output [5:0] s;	//saida
	
	//variavel a ser utilizada no for do generate
	
	assign trans[0] = 1'b0; //inicializa o carry in com 0
	
	//execucao do somador de 1 bit 5 vezes usando for
	genvar i;
	generate
		for (i=0; i < 5; i=i+1) begin : somador
			somador1bit instancia(a[i], b[i], trans[i], trans[i+1], s[i]);
		end
	endgenerate

	//ultimo carry out vai para a saida
	//entradas: 5bits 
	//saida: 6bits
	assign s[5] = trans[5];
	
endmodule
