module memoriaInstrucoes #(parameter memSize = 8) (
    input [4:0] readAddress,          // Endereco de leitura fornecido
    output reg [31:0] instruction,     // Instrucao lida da memoria
	 input clock
);

    // MemÃ³ria de instruÃ§Ãµes: 8 posiÃ§Ãµes de 32 bits cada
    reg [31:0] memory [0:memSize-1];  

    // Inicializa a memÃ³ria com algumas instruÃ§Ãµes
    initial begin
		  memory[0] = 32'b00000000000000000000000000000000; // nada
		  memory[1] = 32'b00010001000010010000000000000001; // beq $8, $9, 1
        memory[2] = 32'b00100001000010000000000000000010; // addi $8, $8, 2
        memory[3] = 32'b10101101100010000000000000000000; // sw $8, 0($12)
		  memory[4] = 32'b10001101100100000000000000000000; // lw $16, 0($12)
		  memory[5] = 32'b00000010000010100100000000100010; // sub $8, $16, $10
		  memory[6] = 32'b00001000000000000000000000000000; // j 0  
		  memory[7] = 32'b00000000000000000000000000000000; // nada
	
    end


    // Bloco para leitura da instruÃ§Ã£o baseado no endereÃ§o
    always @(*) begin
        if (readAddress < memSize)
            instruction = memory[readAddress];   // LÃª a instruÃ§Ã£o da memÃ³ria
        else
            instruction = 32'b0;               // Retorna zero se o endereÃ§o for invÃ¡lido
    end

endmodule

