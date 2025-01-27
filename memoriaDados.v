module memoriaDados #(parameter memSize = 32)
(address, memWrite, memRead, clock, writeData, readData, HEX0); 
	input [4:0] address;
	input memWrite, memRead, clock;
	input [memSize-1:0] writeData;
	output reg [memSize-1:0] readData;
	reg [memSize-1:0] memory [4:0];
	output [0:6] HEX0;
	
	initial
	begin		//carrega os dados do arquivo para a memoria
		memory[0] = 'b0;
		memory[1] = 'b1;
		memory[2] = 'b10;
		memory[3] = 'b11;
	end
	
	//bloco de memoria so é ativado quando o clock esta em borda de subida
	always@(posedge clock)
	begin
		if(memWrite) 
		begin	//bloco foi setado para escrever na memoria
			memory[address] <= writeData;	//escreve os dados de writeData na memoria
		end
	
		else if(memRead)
		begin //bloco foi setado para ler da memoria
			readData <= memory[address][31:0];	//elemento readData recebe as informacoes da memoria
		end
	end	
	
	decod(readData, HEX0);
	//CRIAR TOP LEVEL PARA PINAR LA, INSTANCIAR ESSE MODULO E INSTANCIAR O DECODIFICADOR COM A SAIDA DESSE MODULO
	
endmodule
