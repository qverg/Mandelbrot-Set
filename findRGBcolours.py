import re

file = open("htmlcontainingcolours.txt", "r")
txt = file.read()
file.close()

y = re.findall("\([0123456789,]{5,11}\)", txt)

x = []

for item in y:
    matchnumbers = re.findall("\d*", item)
    x.append(matchnumbers[1]+".0,"+matchnumbers[3]+".0,"+matchnumbers[5]+".0")


print("\n =====> The following goes inside setup() in MandelbrotSet.pde")

for i in range(0, len(x)-1):
    print("sh.set(\"color"+str((i+1))+"\","+x[i]+");")

print("\n =====> The following goes under the global variables, OUTSIDE of main() in mandelbrotFrag.glsl")

for i in range(0, len(x)-1):
    print("uniform vec3 color"+str((i+1))+";")


insideFragFunctionCommand = "vec3 colors[] = {"

for i in range(0, len(x)-1):
    insideFragFunctionCommand += "color"+str((i+1))+"/256,"

print("\n =====> The following goes inside main() in mandelbrotFrag.glsl")
print(insideFragFunctionCommand[:-1]+"};")


input()
