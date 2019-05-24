@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 8bfef0fe0f3f4657b7b3141897a9c070 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot my_ALU_tb_behav xil_defaultlib.my_ALU_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
