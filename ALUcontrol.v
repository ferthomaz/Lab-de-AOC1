//modulo de controle da ula
module ALUcontrol(funct, ALUop, operation);

//funct sao os 5 ultimos bits da instrucao
input [5:0] funct;
//2 bits ALUop sao provenientes da unidade de controle principal
input [1:0] ALUop;
//operation sera a entrada da ula, definindo a operacao a ser realizada
output [2:0] operation;

//dois wires, um destinado a logica do operation[2] e outro para operation[0]
wire wAND2, wOR0;

assign wAND2 = ALUop[1] & funct[1];
assign wOR0 = funct[0] | funct[3];

assign operation[0] = wOR0 & ALUop[1];
assign operation[1] = ~funct[2] | ~ALUop[1];
assign operation[2] = wAND2 | ALUop[0];

endmodule
