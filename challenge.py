import sys

filename = sys.argv[1]
input = open(filename, 'r')
output = open("salida.txt", 'w')
total_cases = int(input.readline())
case = 1

for line in input:
	line = line.rstrip('\n')
	number = list(line)

	i = next((i for i in range(len(number) - 1) if number[i + 1] < number[i]), None)
	if i != None: 
		j = next((j for j in range(i, -1, -1) if j == 0 or number[j] != number[j - 1]), i)
		number[j + 1:] = ['9' for k in range(j + 1, len(number))]
		number[j] = str(int(number[j]) - 1)

	output.write("Caso %s: N=%s, O=%s\n" % (case, line, "".join(number).strip('0')))
	case += 1
	
input.close()
output.close()