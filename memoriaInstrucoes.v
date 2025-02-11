module memoriaInstrucoes #(parameter memSize = 8) (
    input [4:0] readAddress,          // Endereço de leitura fornecido
    output reg [31:0] instruction     // Instrução lida da memória
);

    // Memória de instruções: 8 posições de 32 bits cada
    reg [31:0] memory [0:memSize-1];  

    // Inicializa a memória com algumas instruções
    initial begin
		  memory[0] = 32'b00000000000000000000000000000000; // nada
		  memory[1] = 32'b10001110000010000000000000000000; // lw $8, 0(16)
        memory[2] = 32'b10101110000010010000000000000000; // sw $9, 0($16)
        memory[3] = 32'b00000010000010010100000000100000; // add $8, $16, $9
		  memory[4] = 32'b10101110000010000000000000000100; // sw $8, 4($16)
		  memory[5] = 32'b10001110000010010000000000000100; // lw $9, 4($16)
		  memory[6] = 32'b00000000000000000000000000000000; // nada  
		  memory[7] = 32'b00000000000000000000000000000000; // nada
	 
        /*memory[0] = 32'b00100010001010000000000000001010; // addi $8, $17, 10
        memory[1] = 32'b00000010001100100100000000100010; // sub $8, $17, $18
        memory[2] = 32'b00000001000100010010010000100100; // and $9, $8, $17
		  memory[3] = 32'b00000001000100100101000000100101; // or $10, $8, $18
		  memory[4] = 32'b00000010001100100100100000101010; // slt $9, $17, $18
		  memory[5] = 32'b00000000000000000000000000000000; // nada  
		  memory[6] = 32'b00000000000000000000000000000000; // lw s2, 4(s1)
		  */
    end


    // Bloco para leitura da instrução baseado no endereço
    always @(*) begin
        if (readAddress < memSize)
            instruction = memory[readAddress];   // Lê a instrução da memória
        else
            instruction = 32'b0;               // Retorna zero se o endereço for inválido
    end

endmodule

