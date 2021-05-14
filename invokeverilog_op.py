
# returns the file content based upon the opname
def get_modified_content(a, b, opname):
    content = list()
    if(opname == 'ADD'):
        content = ['`include "Verilog_source_files/RecursiveAdder32bit/RecursiveAdder.v"\n', 'RecursiveAdder A(out, a, b);\n']
    elif(opname == 'FADD'):
        content = ['`include "Verilog_source_files/FloatingPointAdder32bit/FPA.v"\n', 'FPA A(a, b, out);\n']
    elif(opname == 'MUL'):
        content = ['`include "Verilog_source_files/WallaceMultiplier32bit/WallaceMultiplier.v"\n', 'WallaceMultiplier M(out, a, b);\n']
    elif(opname == 'FMUL'):
        content = ['`include "Verilog_source_files/FloatingPointMultiplier32bit/FPM.v"\n', 'FPM M(a, b, out);\n']
    content.append("\ta = 32'b"+ str(a) + ";\n")
    content.append("\tb = 32'b"+ str(b) + ";\n")
    return content

# prepares the 'testbench' for execution
def prepare_file(filename, a, b, opname):
    mod_content = get_modified_content(a, b, opname=opname)
    input_file = open(filename, "r")
    input_data = input_file.readlines()
    input_data[0] = mod_content[0]      # headerfile inclusion
    input_data[14] = mod_content[1]     # call the right exec unit
    input_data[18] = mod_content[2]     # change value of a
    input_data[19] = mod_content[3]     # change value of b
    input_file = open(filename, "w")
    input_file.writelines(input_data)
