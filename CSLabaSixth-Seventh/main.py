import random

a = [random.randint(1, 9) for _ in range(10)]

b = "".join(map(str, a))
print(b)

