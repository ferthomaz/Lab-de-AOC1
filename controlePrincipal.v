module controlePrincipal(opcode, RegDst, AluSrc, MemparaReg, EscreveReg, LeMem, EscreveMem, Branch, AluOp, jump);
//chama esse depois da memoria de instruçoes e antes do mux do banco de registradores
input [5:0] opcode; //instruction [31:26]
output RegDst, AluSrc, MemparaReg, EscreveReg, LeMem, EscreveMem, Branch, jump;
output [1:0] AluOp; 

wire Rformat, lw, sw, beq, addi;

assign Rformat = &(~opcode);	//000000
assign lw = opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];	//100011	
assign sw = opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & opcode[1] & opcode[0]; 	//101011
assign beq = ~opcode[5] & ~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];	//000100
assign addi = ~opcode[5] & ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];	//001000
assign j = ~opcode[5] & ~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0];	//000010

assign RegDst = Rformat;		//RegDst só é um em operacoes R-format
assign AluSrc = lw | sw | addi;		//AluSrc é 1 em Sw ou Lw 
assign MemparaReg = lw;			
assign EscreveReg = Rformat | lw | addi;		//tanto operacoes Rformat quanto lw e addi escrevem no registrador
assign LeMem = lw;
assign EscreveMem = sw;
assign Branch = beq;
assign AluOp[1] = Rformat;				//aluOp vai ser 10 para add e addi
assign AluOp[0] = beq;
assign jump = j;			//só é 1 quando é j

endmodule
