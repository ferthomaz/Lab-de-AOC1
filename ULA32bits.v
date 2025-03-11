//ULA toplevel. ira executar 32 ulas de 1 bit
module ULA32bits(a, b, ALUop, zero, result, overflow);
input [31:0] a, b;
input [2:0] ALUop;

output [31:0] result;
output overflow, zero;

wire binvert;
wire [30:0] overflow_unused;
wire carry[31:0];
//OBS.: no bloco 0, o carry in sempre sera o binvert, pra que a soma/subtracao ocorram corretamente

//module muxBinvert(binvert, seletora, saida);
muxBinvert inversora(ALUop, binvert);
//torna B negativo caso seja operacao sub ou slt, e realiza a soma a+(~b+1)

//module ULA(a   , b   , binvert, cin	  , less		  , ALUop, result   , cout    , overf				  );
  ULA bloco0(a[0], b[0], binvert, binvert, ~carry[31], ALUop, result[0], carry[0], overflow_unused[0]);
  
 genvar i;
 generate
	for(i = 1; i < 31; i = i+1) begin : loopULA
	//module (a   , b   , binvert, cin	     , less , ALUop, result   , cout    , overf				   );
	ULA bloco(a[i], b[i], binvert, carry[i-1], 0    , ALUop, result[i], carry[i], overflow_unused[i]);
	end
 endgenerate
 
 //moduleULA(a    , b    , binvert, cin	   , less		 , ALUop, result    , cout     , overflow);
 ULA bloco31(a[31], b[31], binvert, carry[30], 0   		 , ALUop, result[31], carry[31], overflow);
 
 assign zero = ~(|result);
 
 endmodule
 