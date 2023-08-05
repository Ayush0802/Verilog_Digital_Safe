`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2023 14:14:59
// Design Name: 
// Module Name: dd_project
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Code your design here

//module bcd_7seg(A,B,C,D,a,b,c,d,e,f,g);

//input A,B,C,D;
//output a,b,c,d,e,f,g;

//assign a = ~(A | C |(B&D) | (~B&~D));
//assign b = ~(~B |(C&D)|(~C&~D));
//assign c = ~(~C | D | B) ;
//assign d = ~(A | (B&~C&D) | (C&~D) |(~B&C)|(~B&~D));
//assign e = ~((C&~D) | (~B&~D));
//assign f = ~(A | (B&~D)| (B&~C) | (~C&~D));
//assign g = ~(A | (B&~D)| (B&~C) | (~B&C));

//endmodule

module dd_project(clk,reset,check,enter,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,green,red,blue,load,disp_7_seg, enb_7_seg);

input clk;
input a0,a1,a2,a3,a4,a5,a6,a7,a8,a9;
reg [2:0]mode = 2'b000;
input reset;
input load;
input check;
input enter;
output reg green,red,blue;
output reg [6:0]disp_7_seg=7'd1;
output reg [3:0]enb_7_seg = 4'b0111;
  
reg [3:0]r0 = 4'b0000;
reg [3:0]r1 = 4'b0001;
reg [3:0]r2 = 4'b0010;
reg [3:0]r3 = 4'b0011;
reg [3:0]r4 = 4'b0100;
reg [3:0]r5 = 4'b0101;
reg [3:0]r6 = 4'b0110;
reg [3:0]r7 = 4'b0111;
reg [3:0]r8 = 4'b1000;
reg [3:0]r9 = 4'b1001;

reg [3:0]c1 = 4'b0000;
reg [3:0]c2 = 4'b0000;
reg [3:0]c3 = 4'b0000;
reg [3:0]c4 = 4'b0000;

reg [3:0]d1 = 4'b0000;
reg [3:0]d2 = 4'b0000;
reg [3:0]d3 = 4'b0000;
reg [3:0]d4 = 4'b0000;

reg [1:0]wr=2'b00;
reg e=0;
reg [1:0]t=2'b00;
reg [1:0]ur=2'b00;
//reg [15:0] wait_time = 16'd0;

wire divclk;

freq_div q1(clk, divclk);

always@(posedge divclk) 
begin
  if(e==1'b0) 
    begin
      case(mode)

        3'b000:
        begin
            t <= 2'b00;
            ur <= 2'b00;
            green<=1'b0; red<=1'b0; blue<=1'b0;
            disp_7_seg <= 7'b1111111;
            if(reset == 1'b1)
            begin
                mode<=3'b001;
            end
            else if(enter == 1'b1)
            begin
                d1 = 4'b0000;
                d2 = 4'b0000;
                d3 = 4'b0000;
                d4 = 4'b0000;
                mode<=3'b010;
            end
            else if(check == 1'b1)
            begin
                mode<=3'b011;
            end 
        end
        
        
        3'b001 : 
        begin
            green<=1'b0; red<=1'b0; blue<=1'b0;
            if(load)
            begin
            if(a0==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r0;t<=t+2'b01; end
                    2'b01:begin c2<=r0;t<=t+2'b01; end
                    2'b10:begin c3<=r0;t<=t+2'b01; end
                    2'b11:begin c4<=r0;t<=t+2'b00; end   
                endcase 
                end
                
            else if(a1==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r1;t<=t+2'b01; end
                    2'b01:begin c2<=r1;t<=t+2'b01; end
                    2'b10:begin c3<=r1;t<=t+2'b01; end
                    2'b11:begin c4<=r1;t<=t+2'b00;mode<=3'b100; end   
                endcase 
                end 
                
            else if(a2==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r2;t<=t+2'b01; end
                    2'b01:begin c2<=r2;t<=t+2'b01; end
                    2'b10:begin c3<=r2;t<=t+2'b01; end
                    2'b11:begin c4<=r2;t<=t+2'b00; end   
                endcase 
                end
                
            else if(a3==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r3;t<=t+2'b01; end
                    2'b01:begin c2<=r3;t<=t+2'b01; end
                    2'b10:begin c3<=r3;t<=t+2'b01; end
                    2'b11:begin c4<=r3;t<=t+2'b00; end   
                endcase 
                end
                
            else if(a4==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r4;t<=t+2'b01; end
                    2'b01:begin c2<=r4;t<=t+2'b01; end
                    2'b10:begin c3<=r4;t<=t+2'b01; end
                    2'b11:begin c4<=r4;t<=t+2'b00; end   
                endcase 
                end 
                
            else if(a5==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r5;t<=t+2'b01; end
                    2'b01:begin c2<=r5;t<=t+2'b01; end
                    2'b10:begin c3<=r5;t<=t+2'b01; end
                    2'b11:begin c4<=r5;t<=t+2'b00; end   
                endcase 
                end
                
            else if(a6==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r6;t<=t+2'b01; end
                    2'b01:begin c2<=r6;t<=t+2'b01; end
                    2'b10:begin c3<=r6;t<=t+2'b01; end
                    2'b11:begin c4<=r6;t<=t+2'b00; end   
                endcase 
                end
                
            else if(a7==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r7;t<=t+2'b01; end
                    2'b01:begin c2<=r7;t<=t+2'b01; end
                    2'b10:begin c3<=r7;t<=t+2'b01; end
                    2'b11:begin c4<=r7;t<=t+2'b00; end   
                endcase 
                end 
                
            else if(a8==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r8;t<=t+2'b01; end
                    2'b01:begin c2<=r8;t<=t+2'b01; end
                    2'b10:begin c3<=r8;t<=t+2'b01; end
                    2'b11:begin c4<=r8;t<=t+2'b00; end   
                endcase 
                end
                
            else if(a9==1'b1)
                begin
                case(t)
                    2'b00:begin c1<=r9;t<=t+2'b01; end
                    2'b01:begin c2<=r9;t<=t+2'b01; end
                    2'b10:begin c3<=r9;t<=t+2'b01; end
                    2'b11:begin c4<=r9;t<=t+2'b00; end   
                endcase 
                end
            end 
            else if(reset == 1'b0)
            begin
                mode<=3'b000;
            end
        end       

        3'b010 :
        begin
            green<=1'b0; red<=1'b0; blue<=1'b0;
            if(load)
            begin
            if(a0==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r0;ur<=ur+2'b01; end
                    2'b01:begin d2<=r0;ur<=ur+2'b01; end
                    2'b10:begin d3<=r0;ur<=ur+2'b01; end
                    2'b11:begin d4<=r0;ur<=ur+2'b00; end   
                endcase 
                end
                
            else if(a1==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r1;ur<=ur+2'b01; end
                    2'b01:begin d2<=r1;ur<=ur+2'b01; end
                    2'b10:begin d3<=r1;ur<=ur+2'b01; end
                    2'b11:begin d4<=r1;ur<=ur+2'b00; end   
                endcase 
                end 
                
            else if(a2==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r2;ur<=ur+2'b01; end
                    2'b01:begin d2<=r2;ur<=ur+2'b01; end
                    2'b10:begin d3<=r2;ur<=ur+2'b01; end
                    2'b11:begin d4<=r2;ur<=ur+2'b00; end   
                endcase 
                end
                
            else if(a3==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r3;ur<=ur+2'b01; end
                    2'b01:begin d2<=r3;ur<=ur+2'b01; end
                    2'b10:begin d3<=r3;ur<=ur+2'b01; end
                    2'b11:begin d4<=r3;ur<=ur+2'b00; end   
                endcase 
                end
                
            else if(a4==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r4;ur<=ur+2'b01; end
                    2'b01:begin d2<=r4;ur<=ur+2'b01; end
                    2'b10:begin d3<=r4;ur<=ur+2'b01; end
                    2'b11:begin d4<=r4;ur<=ur+2'b00; end   
                endcase 
                end 
                
            else if(a5==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r5;ur<=ur+2'b01; end
                    2'b01:begin d2<=r5;ur<=ur+2'b01; end
                    2'b10:begin d3<=r5;ur<=ur+2'b01; end
                    2'b11:begin d4<=r5;ur<=ur+2'b00; end   
                endcase 
                end
                
            else if(a6==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r6;ur<=ur+2'b01; end
                    2'b01:begin d2<=r6;ur<=ur+2'b01; end
                    2'b10:begin d3<=r6;ur<=ur+2'b01; end
                    2'b11:begin d4<=r6;ur<=ur+2'b00; end   
                endcase 
                end
                
            else if(a7==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r7;ur<=ur+2'b01; end
                    2'b01:begin d2<=r7;ur<=ur+2'b01; end
                    2'b10:begin d3<=r7;ur<=ur+2'b01; end
                    2'b11:begin d4<=r7;ur<=ur+2'b00; end   
                endcase 
                end 
                
            else if(a8==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r8;ur<=ur+2'b01; end
                    2'b01:begin d2<=r8;ur<=ur+2'b01; end
                    2'b10:begin d3<=r8;ur<=ur+2'b01; end
                    2'b11:begin d4<=r8;ur<=ur+2'b00; end   
                endcase 
                end
                
            else if(a9==1'b1)
                begin
                case(ur)
                    2'b00:begin d1<=r9;ur<=ur+2'b01; end
                    2'b01:begin d2<=r9;ur<=ur+2'b01; end
                    2'b10:begin d3<=r9;ur<=ur+2'b01; end
                    2'b11:begin d4<=r9;ur<=ur+2'b00; end   
                endcase 
                end
            end
            else if(enter == 1'b0)
            begin
                mode<=3'b000;
            end
        end       
        
        3'b101:
        begin
            green<=1'b1; red<=1'b0; blue<=1'b0;
            disp_7_seg <= 7'b1000001;
            if(check == 1'b0)
                mode<=3'b000;
        end
        
        3'b111:
        begin
            green<=1'b0; red<=1'b1; blue<=1'b0;
            disp_7_seg <= 7'b1110001;
            if(check == 1'b0)
                mode<=3'b000;
        end
        
        3'b011:
        begin
            t=2'b00;
            if(c1==d1 && c2==d2 && c3==d3 && c4==d4)
            begin
                wr<=2'b00;
                green<=1'b1; red<=1'b0; blue<=1'b0;
                disp_7_seg <= 7'b1000001;
                mode<=3'b101;
            end    
            else             
            begin 
                wr<=wr+2'b01;
                if (wr == 2'b10) begin
                  e<=1'b1;
                  blue <= 1'b1; green<=1'b0; red<=1'b0;
                  disp_7_seg <= 7'b0011000;
                end
                else
                begin
                    green<=1'b0; red<=1'b1; blue<=1'b0; 
                    disp_7_seg <= 7'b1110001;
                    mode<=3'b111;
                end
            end
        end
      endcase
    end
  else
    begin
    blue <= 1'b1; green<=1'b0; red<=1'b0;
    disp_7_seg <= 7'b0011000;
    end 
end

endmodule


module freq_div(clk, out_clk);
    input clk;
    output reg out_clk;

    reg[30:0] counter = 31'd0;
    parameter DIVISOR = 31'd1250000;
    
    always @(posedge clk)
    begin
        counter <= counter + 1;
        if (counter >= (DIVISOR-1))
            counter <= 31'd0;
         
        out_clk <= (counter < DIVISOR/2) ? 1'b1 : 1'b0; 
    end
endmodule 