

#************************Binary-Decimal Intercoversion**************************#


def binary_to_decimal(bin_num):
    return int(bin_num,2)


def decimal_to_binary(num):
    return bin(num).replace("0b", "").zfill(32)

#*******************************************************************************#



#******************************Decimal to FP************************************#

# returns binary representation of a fraction(0 < x < 1)
def binaryOfFraction(fraction):
	binary = str()
	while (fraction):
		fraction *= 2
		if (fraction >= 1):
			int_part = 1
			fraction -= 1
		else:
			int_part = 0
		binary += str(int_part)
	return binary

# returns FP representation of real_no
def decimal_to_fp(decimal_num):
	real_no = float(decimal_num)
	sign_bit = 0
	if(real_no < 0):
		sign_bit = 1
	real_no = abs(real_no)
	int_str = bin(int(real_no))[2 : ]
	fraction_str = binaryOfFraction(real_no - int(real_no))
	ind = int_str.index('1')
	exp_str = bin((len(int_str) - ind - 1) + 127)[2 : ]
	mant_str = int_str[ind + 1 : ] + fraction_str
	mant_str = mant_str + ('0' * (23 - len(mant_str)))
	ieee_rep = (str(sign_bit) + exp_str + mant_str)[0:32]
	return ieee_rep

#*******************************************************************************#


#*******************************FP to Decimal***********************************#

# helper function to convert mantissa to int
def convertToInt(mantissa_str):
	power_count = -1
	mantissa_int = 0
	for i in mantissa_str:
		mantissa_int += (int(i) * pow(2, power_count))
		power_count -= 1
	return (mantissa_int + 1)

# returns decimal representation of IEEE FP number
def fp_to_decimal(ieee_32):
	sign_bit = int(ieee_32[0])
	exponent_bias = int(ieee_32[1 : 9], 2)
	exponent_unbias = exponent_bias - 127
	mantissa_str = ieee_32[9 : ]
	mantissa_int = convertToInt(mantissa_str)
	real_no = pow(-1, sign_bit) * mantissa_int * pow(2, exponent_unbias)
	return int(real_no)

#*******************************************************************************#


# Driver Code
# if __name__ == "__main__":
#     print(binary_to_decimal('11010101001010000111101010101'))
#     print(decimal_to_binary(0))
    # print(decimal_to_fp(-34343.45552))
    # print(decimal_to_fp(98.34))
    # print(fp_to_decimal('01000100011101101100011110101110'))
    
