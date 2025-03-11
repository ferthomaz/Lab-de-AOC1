module banco #(parameter size = 32)(
input [4:0] Read1,Read2,WriteReg,			
input [size-1:0] WriteData,			//conteudo para escrita
input RegWrite, clock,					
output reg [size-1:0] Data1, Data2,
output reg [size-1:0] registrador8, registrador9, registrador10, registrador12, registrador16
);

reg [size-1:0] registradores [size-1:0];		//32 registradores de 32 bits cada

reg inicializa = 0;

always @(posedge clock) begin
    if (!inicializa) begin
        //inicializa os registradores 
        registradores[8] <= 32'b101;
        registradores[9] <= 32'b101;
        registradores[10] <= 32'b1;
		  registradores[12] <= 32'b100;
		  registradores[16] <= 32'b1;		
        registradores[17] <= 32'b11;
        registradores[18] <= 32'b1;
        inicializa <= 1;  //depois que inicializa coloca como 1 para n entrar no if de novo
    end
    else if (RegWrite) begin
        registradores[WriteReg] <= WriteData;
    end
end


//bloquinho pra ler
always@(*)		//sempre ativado
begin 
	Data1 = registradores[Read1];		//le read1  colocando os primeiros bits pq n cabe 32 bits pro ledr
	Data2 = registradores[Read2];		//le read2
	
	registrador8 = registradores[8];   //atualiza saída do registrador 8
   registrador9 = registradores[9];   //atualiza saída do registrador 9
	registrador10 = registradores[10]; //atualiza saída do registrador 10
   registrador12 = registradores[12]; //atualiza saída do registrador 12
	registrador16 = registradores[16]; //atualiza saída do registrador 16
	
	// Exibe no terminal os valores lidos dos registradores
    $display("Lendo o registrador %d: %d", Read1, Data1);
    $display("Lendo o registrador %d: %d", Read2, Data2);
end	 
endmodule
