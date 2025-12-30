package Counter;

import Vector::*;

(* synthesize *)
module mkCounter();

    Reg#(UInt#(8)) count <- mkReg(0);

    rule increment;
        count <= count + 1;
        $display("Counter value = %0d", count);
    endrule

endmodule

endpackage
