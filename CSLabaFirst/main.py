import math


def calc_first_task(x: float, y: float, z: float) -> float:
    if x >= y:
        return (x ** (1 / 3)) + (x * y)
    return math.sinh(z + y) ** 2


def calc_second_task(a: float, b: float) -> float:
    if a > 2:
        if b > 3:
            return math.sqrt(a + b)
        return (a**3 + 3.5 * b,)
    return 2 * a * math.sqrt(math.sqrt(3 * a + 2.5 * b))


def print_first_task():
    print("--- Перше завдання ---")
    while True:
        try:
            print("")
            x = float(input("Введіть змінну 'x' для першого завдання: "))
            y = float(input("Введіть змінну 'y' для першого завдання: "))
            z = float(input("Введіть змінну 'z' для першого завдання: "))
            result = calc_first_task(x, y, z)
            print(f"Обчислення першого завдання - {result:.2f}")
            break
        except ValueError:
            print("")
            print("Помилка значення, приймаються тільки дійсні числа")
        except Exception as e:
            print("")
            print(f"Помилка: {e}")


def print_second_task():
    print("--- Друге завдання ---")
    while True:
        try:
            print("")
            a = float(input("Введіть змінну 'a' для друго завдання: "))
            b = float(input("Введіть змінну 'b' для друго завдання: "))
            result = calc_second_task(a, b)
            print(f"Обчислення другого завдання - {result:.3f}")
            break
        except ValueError:
            print("")
            print("Помилка значення, приймаються тільки дійсні числа")
        except Exception as e:
            print("")
            print(f"Помилка: {e}")


def main():
    print("------ Варіант 21 ------")
    print_first_task()
    print("")
    print_second_task()


if __name__ == "__main__":
    main()
