import re

file = open("htmlcontainingcolours.txt", "r")
txt = file.read()
file.close()

y = re.findall("\([0123456789,]{5,11}\)", txt)

x = []

for item in y:
    matchnumbers = re.findall("\d*", item)
    x.append(matchnumbers[1]+".0,"+matchnumbers[3]+".0,"+matchnumbers[5]+".0")


command = "vec3 color[] = vec3[]("
for col in x:
    command += "\n\tvec3("+str(col)+"),"

print(command[:-1]+");")

input()
