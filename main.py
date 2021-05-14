
import memory_unit
import reservation_station
from dictionaries import (
    reservation_banks_range,
    cycles_required,
    num_to_opcode
)
from execution_unit import execute




def handle_tag_updates(bank):
    for item in ReservationStations.list:
        if(item.tag1 == bank.num):
            item.tag1 = 0
            #changes ALERT
            if(item.num >= 11):
                item.source1 = bank.destination
            else:
                item.source1 = bank.result

        if(item.tag2 == bank.num):
            item.tag2 = 0
            #changes ALERT
            if(item.num >= 11):
                item.source2 = bank.destination
            else:
                item.source2 = bank.result



def flush_FLR_entry(bank):
    for register in Registers.list:
        if(register.tag == bank.num and register.busy == True):
            register.data = bank.result
            register.busy = False
            register.tag = 0
            # print(f"{bank.result} is stored in R{register.num}")
    handle_tag_updates(bank)

def handle_FLR_update():
    for bank in ReservationStations.list:
        if(bank.finish_time == time):
            flush_FLR_entry(bank)
            bank.tag1 = -1
            bank.source1 = 0
            bank.tag2 = -1
            bank.source2 = 0
            bank.finish_time = -1
            bank.is_occupied = False
            bank.is_executing = False
            bank.destination = 0
            bank.result = 0           # answer of computation
            #changes ALERT
            n_bank = getattr(ReservationStations, num_to_opcode[bank.num] + '_available')
            setattr(ReservationStations, num_to_opcode[bank.num] + '_available', n_bank + 1) #INCREMENT
            # print(f"bank {bank.num} freed.")
    


def handle_load_store(bank, opname):
    # print(bank.source1, "line 51")
    # print("ld_st",opname, bank.source1, bank.source2, bank.num)
    if(opname == "LD"):
        # print("ld", bank.source1, bank.source2)
        Registers.list[int(bank.source1)].data = Memory.read_memory(Registers.list[int(bank.source2)].data)
    elif(opname == "ST"):
        # print("st", bank.source1, bank.source2, bank.num)
        #changes ALERT
        Memory.write_memory(Registers.list[int(bank.source2)].data, Registers.list[int(bank.source1)].data)


def handle_execution():
    for bank in ReservationStations.list:
        if(bank.tag1 == 0 and bank.tag2 == 0 and bank.is_executing == False):
            opname = num_to_opcode[bank.num]
            bank.is_executing = True
            if(bank.num >= 11): # a LD or ST operation
                handle_load_store(bank, opname)
            else:
                bank.result = execute(bank.source1, bank.source2, opname)
            bank.finish_time = time + cycles_required[opname]


# sets the source1, source2 based upon status of FLR
def source_setter(bank, src1, src2):
    register1 = Registers.list[int(src1)]
    register2 = Registers.list[int(src2)]
    if(register1.busy):
        bank.tag1 = register1.tag
        bank.source1 = None
    else:
        bank.tag1 = 0
        if(bank.num >= 11):
            # print(f'{num_to_opcode[bank.num]} : bank.sr1 = {bank.source1} register.num = {register1.num}')
            bank.source1 = register1.num
        else:
            bank.source1 = register1.data
    if(register2.busy):
        bank.tag2 = register2.tag
        bank.source2 = None
    else:
        bank.tag2 = 0
        if(bank.num >= 11):
            # print(f'{num_to_opcode[bank.num]} : bank.src2 = {bank.source2} register.num = {register1.num}')
            bank.source2 = register2.num
        else:
            bank.source2 = register2.data

        

# sets the destination register in the FLR
def destination_setter(bank, destination):
    if(destination is not None):
        dest_register = Registers.list[int(destination)]
        if(dest_register.busy):  # write after write case
            dest_register.tag = bank.num
        else:   # the register in FLR is free
            dest_register.busy = True
            dest_register.tag = bank.num
        # print(f"Bank {bank.num} tagged by R{dest_register.num}")



# returns the [dest, src1, src2]
def split_instruction(instruction):
    opname = instruction[0]
    destination = None
    source1 = None
    source2 = None
    if (opname == 'LD' or opname == 'ST'):
        source1 = instruction[1][1:]      # D     (dest)
        source2 = instruction[2][1:]      # S1    (source1)
    else:
        destination = instruction[1][1:]
        source1 = instruction[2][1:]
        source2 = instruction[3][1:]
    return destination, source1, source2

# after filling the reservation bank, returns the destination register# in FLR
def fill_reservation_bank(reservation_bank, instruction, opname, n_bank):
    [destination, source1, source2] = split_instruction(instruction)
    reservation_bank.is_occupied = True
    setattr(ReservationStations, opname + '_available', n_bank - 1) #decrement
    source_setter(reservation_bank, source1, source2)
    reservation_bank.destination = destination
    if opname == 'LD' or opname == 'ST':
        reservation_bank.destination = source1
    reservation_bank.instruction_no = program_counter
    return destination
    

# returns the empty reservation bank
def get_available_bank(opname):
    for i in reservation_banks_range[opname]:
        if(not(ReservationStations.list[i].is_occupied)):
            # print(f'{opname} requested and {ReservationStations.list[i].num} alloted')
            return ReservationStations.list[i]

def pending_execution():
    var = False
    for bank in ReservationStations.list:
        var |= bank.is_occupied
    return var

def main():
    global time, program_counter, Memory, Registers, ReservationStations
    time = 0
    program_counter = 1
    Memory = memory_unit.MainMemory()
    Registers = memory_unit.Registers()
    ReservationStations = reservation_station.ReservationStations()

    # global time, program_counter, Memory, Registers, ReservationStations
    #Instructions.txt
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

    #**********************************************************************************#

    instruction_file = open("Instructions.txt", "r")
    instructions_list = instruction_file.readlines()
    instructions = [line.rstrip().split(' ') for line in instructions_list]
    instructions.reverse()
    # print(instructions[3][3][1:])
    while(True):
        for _ in range(3):
            if(len(instructions) != 0):
                instruction = instructions.pop()
                # print(f'instruction being popped {instruction}')
                opname = instruction[0]
                number_of_available_banks = getattr(ReservationStations, opname + '_available')
                if(number_of_available_banks > 0):
                    current_bank = get_available_bank(opname)
                    # print(f"Reservation Bank {current_bank.num} is made occupied.")
                    current_bank.instruction_no = program_counter
                    destination = fill_reservation_bank(current_bank, instruction, opname, number_of_available_banks)
                    destination_setter(current_bank, destination)
                    program_counter += 1
                else:
                    instructions.append(instruction)
                    # print(f'instruction being pushed {instruction}')
                    break
        handle_execution()
        # print(f"PC = {program_counter}; t = {time}")
        handle_FLR_update()
        time += 1
        # Registers.print_registers()
        # ReservationStations.print_banks()
        if(not(pending_execution()) and len(instructions)==0):
            break
    print("Final::::::::::::::::")
    Registers.print_registers()
    Memory.print_memory(250)
    print(f"Time elapsed: {time}")

if __name__=="__main__":
    main()
    
  # Registers.list[0].data = '10'
    # Registers.list[1].data = '11'
    # Registers.list[2].data = '12'
    # Registers.list[4].data = '14'
    # Registers.list[6].data = '16'
    # Registers.list[8].data = '18'
    # Registers.list[10].data = '20'

    # Memory.write_memory(11, 50)
    # Memory.write_memory(12, 52)
    # Memory.write_memory(13, 53)
    # Memory.write_memory(14, 54)
    # Memory.write_memory(110, 550)
'''
    ADD R11 R10 R10         R11 = 40
    MUL R12 R0 R1           R12 = 110
    FADD R14 R12 R8         R14 = 128
    FMUL R15 R2 R4          R15 = 168
    LD R13 R12              R13 = 550
    ST R8 R12               M[18] = 110
'''

