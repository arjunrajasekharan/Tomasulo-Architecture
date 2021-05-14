
# A single ReservationStation
class ReservationStation:
    def __init__(self, num):
        self.num = num       # the reservation station number
        self.instruction_no = 0  # instruction currently being executed 
        self.tag1 = -1       
        self.source1 = 0
        self.tag2 = -1
        self.source2 = 0
        self.destination = 0
        self.finish_time = -1      
        self.is_occupied = False
        self.result = 0           # answer of computation
        self.is_executing = False
    

# A set of Reservation Stations
class ReservationStations:
    def __init__(self):
        self.FADD_available = 3
        self.FMUL_available = 2
        self.ADD_available = 3
        self.MUL_available = 2
        self.LD_available = 3
        self.ST_available = 3
        self.list = [ReservationStation(i) for i in range(17)]

    def print_banks(self):
        for i in self.list:
            print(i.num, i.instruction_no, i.is_occupied, i.tag1, i.source1, i.tag2, i.source2, i.is_executing, i.finish_time, i.result)
