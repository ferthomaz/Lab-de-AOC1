//modulo de deteccao de overflow, considerando que o bit mais significativo é um bit de sinal
//tambem foi levado em consideracao que APENAS o operando b poderia ser invertido em complemento de 2 (negativo), como consta na imagem da pagina 3 pratica 4

module overflow(binvert, a, b, result, overflow);
input binvert; //sinaliza se a operação é soma (binvert = 0) ou subtracao (binvert = 1)
input a, b, result; //estes 3 inputs se referem aos bits de sinal do operando a, b e result
output overflow;

//logica combinacional de deteccao de overflow. ocorre apenas quando os dois operando tem sinais iguais (apos a alteracao do binvert)
assign overflow = (~binvert & ~a & ~b & result) | (binvert & ~a & b & result) | (binvert & a & ~b & ~result);
endmodule
