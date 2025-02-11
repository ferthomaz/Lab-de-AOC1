module memoriaDados #(parameter memSize = 32)
(address, memWrite, memRead, writeData, readData, clock); 
	input [31:0] address;
	input clock, memWrite, memRead;
	input [memSize-1:0] writeData;
	output reg [memSize-1:0] readData;
	reg [memSize-1:0] memory [31:0];
	
	initial
	begin		//carrega os dados do arquivo para a memoria
		memory[0] = 32'b0;
		memory[1] = 32'b100;
		memory[2] = 32'b10;
		memory[3] = 32'b11;
	end
	
	//bloco de memoria so é ativado quando o clock esta em borda de subida
	always@(posedge clock)
	begin
		if(memWrite)
		begin	//bloco foi setado para escrever na memoria
			memory[address] <= writeData;	//escreve os dados de writeData na memoria
		end
	end
	
	always@(negedge clock)
	begin
		if(memRead)
		begin //bloco foi setado para ler da memoria
			readData <= memory[address][31:0];	//elemento readData recebe as informacoes da memoria
		end
	end	
	

endmodule
