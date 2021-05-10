/*
Author: Hugo Gayoso
email: hugo.medeiros@ee.ufcg.edu.br
Design: DCT
Purpose:
*/

module DCT(
  input signed   [7:0] dt_i [0:3],
  output reg signed  [7:0] dt_inv_o [0:3],
  output reg signed  [9:0] dt_dir_o [0:3]
);

always_comb begin

   dt_dir_o[0] = dt_i[0] + dt_i[1] + dt_i[2] + dt_i[3];
   dt_dir_o[1] = (dt_i[0]<<1) + dt_i[1] - dt_i[2] - (dt_i[3]<<1);
   dt_dir_o[2] = dt_i[0] - dt_i[1] - dt_i[2] + dt_i[3];
   dt_dir_o[3] = dt_i[0] - (dt_i[1]<<1)+ (dt_i[2]<<1) -dt_i[3];

   dt_inv_o[0] = dt_dir_o[0]	+ dt_dir_o[1]      	+ dt_dir_o[2]       + (dt_dir_o[3]>>1);
   dt_inv_o[1] = dt_dir_o[0] 		+ (dt_dir_o[1]>>1) 	- (dt_dir_o[2])  	- (dt_dir_o[3]);
   dt_inv_o[2] = dt_dir_o[0]     	- (dt_dir_o[1]>>1)  - dt_dir_o[2]       + dt_dir_o[3];
   dt_inv_o[3] = (dt_dir_o[0]) 	- dt_dir_o[1]	+ dt_dir_o[2]  		- (dt_dir_o[3]>>1);
 end
 endmodule
