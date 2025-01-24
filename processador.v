//modulo toplevel do processador. interliga os demais blocos
module processador(clock, reset, result, zero, overflow, PC, instruction, Data1, saidaMUX, registrador8, registrador9, registrador10, registrador17, registrador18);

input clock, reset;				

output[31:0] result;	//saida da ULA que entra no banco de registradores como writeData		
output zero, overflow;
output [4:0] PC;		 
output [31:0] registrador8, registrador9, registrador10, registrador17, registrador18;
wire [4:0] proxPC;
output [31:0] instruction;        //saida da memória de instrucoes

wire RegDst; //se for 1 o WriteReg pega instruction[15:11] se for 0 o writeReg pega o instruction[20:16]		
wire RegWrite; 	//pra ativar o bloco de escrita do bando de registradores
wire AluSrc; //quando é 0 é Data2 quando é 1 é saidaExtensor									
wire [1:0] AluOp;	//pra ir pra ULA 	

countPC blocodopc(proxPC, reset, clock, PC); 	  

//memoriaInstrucoes #(parameter memSize = 8) (input [4:0] readAddress, output reg [31:0] instruction);
memoriaInstrucoes #(.memSize(8)) blocoinstrucoes(PC, instruction);

output [31:0] Data1, saidaMUX;
wire [31:0] Data2;
wire [4:0] WriteRegister;
wire [4:0] ReadReg1, ReadReg2;
wire [31:0] WriteData, saidaExtensor; //O WRITE DATA VEM DA ULA
wire [15:0]extensorS; //receber os ultimos 16 bits que serÃ£o extendidos
wire [2:0] operation; //codigo da operacao depois do controle da ULA
assign ReadReg1 =  instruction[25:21];
assign ReadReg2 = instruction[20:16];
assign WriteData = result;

//module controlePrincipal(opcode, RegDst, AluSrc, MemparaReg, EscreveReg, LeMem, EscreveMem, Branch, AluOp);
controlePrincipal unidadeControle(instruction[31:26], RegDst, AluSrc, MemparaReg, RegWrite, LeMem, MemWrite, Branch, AluOp);

//instanciando o mux pra saber qual writeReg vai ser antes de chamar o banco de registradores
//multiplexador					(A, 							B, 			seletora, saida);
multiplexador muxWriteReg(instruction[20:16], instruction[15:11], RegDst, WriteRegister);	//WriteRegister recebe o valor relacionado a seletora (RegDst)

assign extensorS = instruction[15:0];

//instanciando bloco extensor que sera usado no mux antes da ULA 	
//module extensor		 (extensorS, saidaExtensor);
extensor blocoextensor(extensorS, saidaExtensor);
 
//instanciar o banco de registradores -> 5 bits para Read register 1, 5 para Read register 2, 5 para Write register e 16 bits para o extensor de sinal
//banco #(parameter size = 32)		(Read1,	 Read2,		WriteReg, WriteData, RegWrite, clock, Data1, Data2, registrador8, registrador9, registrador10, registrador17, registrador18);
banco #(.size(32)) bancoRegLeitura(ReadReg1, ReadReg2, WriteRegister, result, RegWrite, clock, Data1, Data2, registrador8, registrador9, registrador10, registrador17, registrador18);

//pegar a saidaExtensor e o Data2 e mandar pro mux pra entrar na ula
// multiplexador32			(A, 			B, 		seletora, saida)
multiplexador32 muxpreULA(Data2, saidaExtensor, AluSrc, saidaMUX);

//module ALUcontrol		(funct, 			  ALUop, operation);
ALUcontrol controleULA(instruction[5:0], AluOp, operation);

//manda saidaMux e data1 pra ULA
//ULA32bits			  (a, 		b, 		ALUop, zero, result, overflow);
ULA32bits blocoula(Data1, saidaMUX, operation, zero, result, overflow); 

//PC+1 
somador5bits incrementaPC(PC, 5'b1, proxPC); 


endmodule



