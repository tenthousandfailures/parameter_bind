// DUT
module dut #(parameter X=3, parameter Y=2, parameter Z=1, parameter NAME="DEFAULT") ();
   initial begin
      $display("dut  %s value of X Y Z is: %d", NAME, X, Y, Z);
   end
endmodule

// BINDED TO DUT : BDUT
module bdut #(parameter X=4, Y=4, Z=4, NAME="DEFAULT") ();
   logic [X:0] bus;

   initial begin
      $display("bdut %s value of X Y Z is: %d %d %d", NAME, X, Y, Z);
   end
endmodule

// TOP LEVEL
module top();
   dut#(.NAME("dut1")) dut1();
   dut#(.NAME("dut2"),.X(100)) dut2();

   initial begin
      #1;
      $finish();
   end
endmodule

// BIND CONNECTING PARAMETERS FROM DUT INSTANCES TO BDUT
bind dut bdut#(.X(X), .Y(Y), .Z(), .NAME(NAME)) a_inst();

// OUTPUT
// dut  dut1 value of X Y Z is:           3          2          1
// bdut dut1 value of X Y Z is:           3          2          4
// dut  dut2 value of X Y Z is:         100          2          1
// bdut dut2 value of X Y Z is:         100          2          4
