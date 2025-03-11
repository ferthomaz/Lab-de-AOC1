module memoriaDados #(parameter memSize = 32)
(address, memWrite, memRead, writeData, readData, clock); 
	input [31:0] address;
	input clock, memWrite, memRead;
	input [memSize-1:0] writeData;
	output reg [memSize-1:0] readData;
	reg [memSize-1:0] memory [31:0];
	
	initial
	begin		//carrega os dados do arquivo para a memoria
		memory[0] = 32'b111;
		memory[1] = 32'b100;
		memory[2] = 32'b10;
		memory[3] = 32'b11;
	end

//bloco de memoria so ÃƒÆ’Ã‚Â© ativado quando o clock esta em borda de subida
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
			readData <= memory[address];	//elemento readData recebe as informacoes da memoria
			$display("Lendo endereÃƒÆ’Ã‚Â§o: %d, valor: %d", address, readData);
		end
	end	
	

endmodule
