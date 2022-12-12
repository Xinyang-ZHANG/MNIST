# MNIST
MNIST study project using python, C++ and FPGA

Python version is from Internet, and it can reach to 98% precision. C++ version are modified from Internet, and it can reach 82.3% precision in validation. C++ version added batch normalization treatment compared to the resources from Internet, which allows it to use 2 conv layers and 1 fcnn layer. Compiling C++ version requires a lot of time(6 days), but the aim is to get a CNN structure for further FPGA study, so I didn't optimize it.

C++ version can also store .coe files for FPGA usages
