/*
Author: Hugo Gayoso
email: hugo.medeiros@ee.ufcg.edu.br
Design: DCT
Purpose:
*/

module DCT(
  input signed   [7:0] dt_i [0:3],
  output reg signed  [12:0] dt_inv_o [0:3],
  output reg signed  [9:0] dt_dir_o [0:3]
);

reg signed [12:0] dir_inter [0:3], inv_inter [0:3], dt_dir_r[0:3];

always_comb begin
//Direct Transform Computation
  dir_inter[0] = dt_i[0]+dt_i[3];
  dir_inter[1] = dt_i[1]+dt_i[2];
  dir_inter[2] = dt_i[1]-dt_i[2];
  dir_inter[3] = dt_i[0]-dt_i[3];

  dt_dir_o[0] = dir_inter[0]+dir_inter[1];
  dt_dir_o[2] = dir_inter[0]-dir_inter[1];
  dt_dir_o[1] = dir_inter[2]+(dir_inter[3]<<1);
  dt_dir_o[3] = dir_inter[3]-(dir_inter[2]<<1);

//Normalize the direct input for the inverse Transform
  dt_dir_r[0] = (dt_dir_o[0]<<2)+dt_dir_o[0]; // x5 =
  dt_dir_r[1] = dt_dir_o[1]<<2; // x4
  dt_dir_r[2] = (dt_dir_o[2]<<2)+dt_dir_o[2]; // x5
  dt_dir_r[3] = dt_dir_o[3]<<2; // x4

//Inverse Transform Computation
// note: output sample is 20x larger
  inv_inter[0] = dt_dir_r[0]+dt_dir_r[2];
  inv_inter[1] = dt_dir_r[0]-dt_dir_r[2];
  inv_inter[2] = (dt_dir_r[1]>>>1)-dt_dir_r[3];
  inv_inter[3] = dt_dir_r[1]+(dt_dir_r[3]>>>1);

  dt_inv_o[0] = inv_inter[3]+inv_inter[0];
  dt_inv_o[1] = inv_inter[1]+inv_inter[2];
  dt_inv_o[2] = inv_inter[1]-inv_inter[2];
  dt_inv_o[3] = inv_inter[0]-inv_inter[3];
 end
 endmodule
