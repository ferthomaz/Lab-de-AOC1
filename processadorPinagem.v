module processadorPinagem(SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR, LEDG);

input [17:0] SW;
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
output [17:0] LEDR;	
output [7:0] LEDG;

wire[4:0] PC; 
wire clock;			

assign clock = SW[17];
assign reset = SW[16];

wire[31:0] result, instruction, Data1, Data2, registrador8, registrador9, registrador10, registrador17, registrador18;
wire zero, overflow;		 
wire [4:0] WriteRegister;
// processador(clock, reset, result, zero, overflow, PC, instruction, Data1, Data2, registrador8, registrador9, registrador10, registrador17, registrador18);
processador bloco20(clock, reset, result, zero, overflow, PC, instruction, Data1, Data2, registrador8, registrador9, registrador10, registrador17, registrador18);

assign LEDR[17:0] = instruction[17:0];
assign LEDG[4:0] = PC[4:0];

wire [7:0]entradareg8, entradareg9, entradareg10, entradareg17, entradareg18;

assign entradareg8 = registrador8[7:0];
assign entradareg9 = registrador9[7:0];
assign entradareg10 = registrador10[7:0];
assign entradareg17 = registrador17[7:0];
assign entradareg18 = registrador18[7:0];

wire [7:0] dezenareg8, unidadereg8;

assign dezenareg8 = (entradareg8%100)/10;
assign unidadereg8 = (entradareg8%100)%10;

//instanciando decodificadores pro registrador8     
decod bloco11(dezenareg8, HEX1);
decod bloco12(unidadereg8, HEX0);

wire [7:0] unidadereg9;

assign unidadereg9 = (entradareg9%100)%10;

//instanciando decodificadores pro registrador9
decod bloco14(unidadereg9, HEX2);

wire [7:0] unidadereg10;

assign unidadereg10 = (entradareg10%100)%10;

//instanciando decodificadores pro registrador10
decod bloco16(unidadereg10, HEX3);

wire [7:0] unidadereg17;

assign unidadereg17 = (entradareg17%100)%10;

//instanciando decodificadores pro registrador17
decod bloco17(unidadereg17, HEX4);

wire [7:0] unidadereg18;

assign unidadereg18 = (entradareg18%100)%10;

//instanciando decodificadores pro registrador18
decod bloco18(unidadereg18, HEX5);

endmodule











