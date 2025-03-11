module processadorPinagem(SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR, LEDG);

input [17:0] SW;
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
output [17:0] LEDR;	
output [7:0] LEDG;

wire[4:0] PC; 
wire clock;			

assign clock = SW[17];
assign reset = SW[16];

	wire[31:0] result, instruction, Data1, Data2, registrador8, registrador9, registrador10, registrador12, registrador16;
wire zero, overflow;		 
wire [4:0] WriteRegister;
// processador(clock, reset, result, zero, overflow, PC, instruction, Data1, Data2, registrador8, registrador9, registrador10, registrador12, registrador16);
processador bloco20(clock, reset, result, zero, overflow, PC, instruction, Data1, Data2, registrador8, registrador9, registrador10, registrador12, registrador16);

assign LEDR[17:0] = instruction[17:0];
assign LEDG[4:0] = PC[4:0];
assign LEDG[7] = zero;

wire [7:0]entradareg8, entradareg9, entradareg10, entradareg12, entradareg16;

assign entradareg8 = registrador8[7:0];
assign entradareg9 = registrador9[7:0];
assign entradareg10 = registrador10[7:0];
assign entradareg12 = registrador12[7:0]; 
assign entradareg16 = registrador16[7:0];

wire [7:0] dezenareg8, unidadereg8;

//assign dezenareg8 = (entradareg8%100)/10;
assign unidadereg8 = (entradareg8%100)%10;

//instanciando decodificadores pro registrador8     
//decod bloco11(dezenareg8, HEX1);
decod bloco12(unidadereg8, HEX0);

wire [7:0] dezenareg9, unidadereg9;

//assign dezenareg9 = (entradareg9%100)/10;
assign unidadereg9 = (entradareg9%100)%10;

//instanciando decodificadores pro registrador9
//decod bloco13(dezenareg9, HEX3);
decod bloco14(unidadereg9, HEX1);


wire [7:0] dezenareg10, unidadereg10;

//assign dezenareg10 = (entradareg10%100)/10;
assign unidadereg10 = (entradareg10%100)%10;

//instanciando decodificadores pro registrador10
//decod bloco15(dezenareg16, HEX5);
decod bloco100(unidadereg10, HEX2);

wire [7:0] dezenareg12, unidadereg12;

//assign dezenareg12 = (entradareg12%100)/10;
assign unidadereg12 = (entradareg12%100)%10;

//instanciando decodificadores pro registrador12
//decod bloco15(dezenareg12, HEX5);
decod bloco101(unidadereg12, HEX3);

wire [7:0] dezenareg16, unidadereg16;

//assign dezenareg16 = (entradareg16%100)/10;
assign unidadereg16 = (entradareg16%100)%10;

//instanciando decodificadores pro registrador16
//decod bloco15(dezenareg16, HEX5);
decod bloco16(unidadereg16, HEX4);

endmodule











