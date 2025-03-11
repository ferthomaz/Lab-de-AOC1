//modulo somador de 1 bit
module somador1bit(A, B, Te, Ts, S);
input A, B, Te;
output Ts, S;

//saida
assign S = (A ^ B) ^ Te;
//transporte de saida
assign Ts = (A & Te) | (A & B) | (B & Te);

endmodule
