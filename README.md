# Tomasulo-Architecture
Simulation of the Tomasulo algorithm using python and verilog.This project was done as the part of Computer Architecture course.

Instruction format is given in instructions.txt.

## Usage
- Install Icarus Verilog 
- ```python3 main.py```

## Technologies used
- Python3
- Verilog

# Register and Memory data (Input) 
```
 Registers.list[0].data = '10'
 Registers.list[1].data = '11'
 Registers.list[2].data = '12'
 Registers.list[3].data = '13'
 Registers.list[4].data = '14'
 Registers.list[5].data = '15'
 Registers.list[6].data = '16'
 Registers.list[7].data = '17'
 Registers.list[8].data = '18'
 Registers.list[9].data = '19'
 Registers.list[10].data = '30'

 Memory.write_memory(11, 40)
 Memory.write_memory(12, 42)
 Memory.write_memory(13, 43)
 Memory.write_memory(14, 44)
 Memory.write_memory(110,820)

```
# Instructions to be executed
```
ADD R11 R10 R10         
MUL R12 R0 R1           
FADD R13 R12 R8         
FMUL R14 R2 R4
LD R15 R12              
ST R8 R12 
```
# Output Screenshots

<img width="1680" alt="Output 1" src="https://user-images.githubusercontent.com/60811574/118236798-29015c00-b4b4-11eb-92bb-39b430930129.png">
<img width="1680" alt="Output 2" src="https://user-images.githubusercontent.com/60811574/118236832-33bbf100-b4b4-11eb-8330-4f8ba830b455.png">
<img width="1680" alt="Output 3" src="https://user-images.githubusercontent.com/60811574/118236847-374f7800-b4b4-11eb-8646-9e2761d26942.png">
