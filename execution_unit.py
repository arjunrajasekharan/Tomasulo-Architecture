# 
import os
import invokeverilog_op

from config import (
    binary_to_decimal,
    fp_to_decimal,
    decimal_to_binary,
    decimal_to_fp
)



# returns the output after execution
def execute(a, b, opname):
    filename = 'testbench.v'
    if(opname == "ADD" or opname == "MUL"):
        a = decimal_to_binary(int(a))
        b = decimal_to_binary(int(b))
    elif(opname == "FADD" or opname == "FMUL"):
        a = decimal_to_fp(a)
        b = decimal_to_fp(b)
    invokeverilog_op.prepare_file(filename, a, b, opname=opname)
    stream = os.popen('iverilog ' + filename + ' && ./a.out')
    output = stream.readline().rstrip()
    if(opname == "ADD" or opname == "MUL"):
        output = binary_to_decimal(output)
    elif (opname == "FADD" or opname == "FMUL"):
        output = fp_to_decimal(output)
    # print(f"Executed {opname} {a} {b} = {output}")
    return output


def main():
    a = '01000100100110100000101011111010'
    b = '01000111101110110110011000010001'
    cin = 0
    print(execute(a, b, opname='FADD'))

if __name__=="__main__":
    main()