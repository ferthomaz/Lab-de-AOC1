module decod(entrada, segmentos);

input [7:0] entrada;
output reg [0:6] segmentos;

always@(*) begin
case ({entrada}) // concatenar

8'b00000000: segmentos = 7'b0000001;
8'b00000001: segmentos = 7'b1001111;
8'b00000010: segmentos = 7'b0010010;
8'b00000011: segmentos = 7'b0000110;
8'b00000100: segmentos = 7'b1001100;
8'b00000101: segmentos = 7'b0100100;
8'b00000110: segmentos = 7'b0100000;
8'b00000111: segmentos = 7'b0001111;
8'b00001000: segmentos = 7'b0000000;
8'b00001001: segmentos = 7'b0000100;


default: segmentos = 7'b1111111;
endcase
end
endmodule
