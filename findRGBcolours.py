import re

file = open("htmlcontainingcolours.txt", "r")
txt = file.read()
file.close()

y = re.findall("\([0123456789,]{5,11}\)", txt)

x = []

for item in y:
    matchnumbers = re.findall("\d*", item)
    fl_numbers = [str( float(number) / 256.0) for number in matchnumbers if number != '']
    x.append(fl_numbers[0]+","+fl_numbers[1]+","+fl_numbers[2])


command = "vec3 colors[] = vec3[]("
for col in x:
    command += "vec3("+str(col)+"),"

print(command[:-1]+");")

input()
