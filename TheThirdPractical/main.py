import math


def task2():
    print("\n--- Завдання 2 ---\n")
    sum_of_numbers = 0

    print("Числа, які кратні 3 і не входять в діапазон [31; 61]:")

    for i in range(5, 76):
        if 31 <= i <= 61:
            continue

        if i % 3 == 0:
            print(i, end=" ")
            sum_of_numbers += i

    print("\n---")
    print(f"Сума знайдених чисел S = {sum_of_numbers}")


def task3():
    print("\n--- Завдання 3 ---\n")
    radius = 2.0
    increase = 0.5
    num_of_balls = 6

    print("Обчислення площі поверхні перших шести куль (S = 4 * π * R²):")
    print("-" * 35)
    print(f"{'Куля №':<8} | {'Радіус (см)':<12} | {'Площа (см²)'}")
    print("-" * 35)

    for i in range(1, num_of_balls + 1):
        surface_area = 4 * math.pi * (radius**2)

        print(f"{i:<8} | {radius:<12.1f} | {surface_area:.2f}")

        radius += increase


def main():
    task2()
    task3()


if __name__ == "__main__":
    main()
