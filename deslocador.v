module deslocador(opcode, instruction15, immediate);
/*esse bloco é destinado a corrigir a restricao de alinhamento das instrucoes assembly mips
este processador n foi implementado seguindo esta restricao e portanto, o calculo de endereco so ocorre corretamente
apos passar por este bloco, o qual divide o endereco(parte imediata) por 4, caso seja instrucao lw ou sw*/
input [5:0] opcode;
input [15:0] instruction15;
output reg[15:0] immediate;

wire lw, sw;

assign lw = opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];	//100011	
assign sw = opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & opcode[0]; 	//101011

always@(*)
	begin
	if(lw || sw)begin
		immediate = instruction15 >> 2;
	end
	
	else begin
	immediate = instruction15;
	end
end

endmodule
