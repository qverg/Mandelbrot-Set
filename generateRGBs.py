num = 100
hues = [i * 360 / num for i in range(num)]

diff = (360 - hues[num-1]) / 2
for i in range(0, num):
    hues[i] += diff

c = [1.0 for i in range(num)]
x = [1 - abs(h/60 % 2 - 1) for h in hues]

rgb = []

for i in range(num):
    h = hues[i]
    if 0 <= h and h < 60:
        rgb.append((c[i], x[i], 0.0))
    elif 60 <= h and h < 180:
        rgb.append((x[i], c[i], 0.0))
    elif 120 <= h and h < 180:
        rgb.append((0.0, c[i], x[i]))
    elif 180 <= h and h < 240:
        rgb.append((0.0, x[i], c[i]))
    elif 240 <= h and h < 300:
        rgb.append((x[i], 0.0, c[i]))
    else:
        rgb.append((c[i], 0.0, x[i]))

command = "vec3 color[] = vec3[]("
for col in rgb:
    command += "vec3"+str(col)+","

print(command[:-1]+");")
