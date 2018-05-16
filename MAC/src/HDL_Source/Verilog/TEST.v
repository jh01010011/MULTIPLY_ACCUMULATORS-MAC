timeunit 1ns;
timeprecision 1ps;

package TEST_PKG;

parameter X=3;
parameter Y=3;
localparam Z=X+Y;
import  MAC_PKG::*;

endpackage: TEST_PKG