#changes ALERT
reservation_banks_range = {
    "FADD": (1,3),
    "FMUL": (4,5),
    "ADD" : (6,8),
    "MUL" : (9,10),
    "LD" : (11,13),
    "ST" : (14,16)
}

cycles_required = {
    "FADD": 10,
    "FMUL": 20,
    "ADD" : 7,
    "MUL" : 11,
    "LD" :  1,
    "ST" : 1
}


num_to_opcode = [
    "Invalid",
    "FADD",
    "FADD",
    "FADD",
    "FMUL",
    "FMUL",
    "ADD",
    "ADD",
    "ADD",
    "MUL",
    "MUL",
    "LD",
    "LD",
    "LD",
    "ST",
    "ST",
    "ST"
]