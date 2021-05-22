/*
Author: Hugo Gayoso
email: hugo.medeiros@ee.ufcg.edu.br
Design: testbench_DCT
Purpose:
*/
`timescale 1ns/1ps
`define CLK_PERIOD 10

module tb();
//Testbench drivers
  reg signed  [7:0] data_in[0:3];

//Testbench monitors
  reg signed [9:0] data_out_dir[0:3];
  reg signed [12:0] data_out_inv[0:3];

//design instance
  DCT my_dct (.dt_i(data_in),
              .dt_inv_o(data_out_inv),
              .dt_dir_o(data_out_dir));

//Test
initial begin
  $display("### TESTBENCH ### \n\n");

  data_in = {8'd5, 8'd10, 8'd20, 8'd0};
  #10 ;

  $display("Data_in -> Data_out_dir ; Data_out_inv");
  $display("Dataset 1: ");
  for (int i=0 ; i<4; i++)
    $display("%d(original_sample) -> %d (direct_DCT) ;%d (recovered_sample)",data_in[i], data_out_dir[i],data_out_inv[i]/20);


  data_in = {8'h27, 8'h53, 8'h50, 8'h06};
  #10;
  $display("Data_in -> Data_out_dir ; Data_out_inv");
  $display("Dataset 1: ");
  for (int i=0 ; i<4; i++)
    $display("%d(original_sample) -> %d (direct_DCT) ;%d (recovered_sample)",data_in[i], data_out_dir[i],data_out_inv[i]/20);
 end
endmodule
