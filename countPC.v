module countPC (pcin, reset, clock, pcout); 
	input [4:0] pcin; 
	input reset, clock; 
	output reg [4:0] pcout; 
	//wire [4:0] soma;
	
	initial begin
       pcout = 5'b0;  //pc = 0
   end

		
	always@(posedge clock or posedge reset)	//clock de borda de subida
	begin
		if(reset) begin //caso reset seja 1, reinicia PC para 0
			pcout	<= 5'b0;
		end
		
		else begin		//caso reset esteja desligado, PC le a proxima instrução
			pcout <= pcin;		
		end
	end

endmodule
