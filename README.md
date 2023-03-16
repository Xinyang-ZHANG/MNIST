# MNIST
MNIST using tensorflow, c++ and fpga (zynq7010)

Python version is from Internet, and it can reach to 98% precision. C++ versions are modified from Internet, and it can reach 82.3% precision in validation. 
C++ version added batch normalization treatment compared to the resources from Internet, which allows it to use 2 conv layers and 1 fcnn layer. 
Compiling C++ version requires a lot of time(6 days), but the aim is to get a CNN structure for further FPGA study, so I didn't optimize it.
C++ version can also store .coe files for FPGA usages.

ZYNQ7010 is chosen as FPGA. There are 2 projects and the "serial" one can be implemented because of its low resource cost. These 2 projects can both treat data
within one frame time of ov5640 (1280x720), so despite of the serial structure, the "serial" one can also achieve real-time data processing.

