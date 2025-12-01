import math


def task1_precondition():
    P = 1
    k = 3
    while k <= 12:
        P *= k**2 * (1 + math.log(k))
        k += 1
    return P


def task1_postcondition():
    print(
        """
Прямого оператору для циклу з післяумовою в мові програмування Python не існує,
тому ось результат з застосуванням його імітації"""
    )
    P = 1
    k = 3
    while True:
        P *= k**2 * (1 + math.log(k))
        k += 1
        if k > 12:
            break
    return P


def task1():
    print("\n--- Завдання 1 ---\n")
    while True:
        user_answer = int(
            input(
                "Який цикл ви хочете використовувати?\n(1 - цикл з передумовою. 2 - цикл з післяумовою, 0 - вихід): "
            )
        )

        match user_answer:
            case 1:
                print(
                    f"\nРезультат виконання виразу циклом з передумовою: {task1_precondition():.3f}\n"
                )
            case 2:
                print(
                    f"\nРезультат виконання виразу циклом з післяумовою: {task1_postcondition():.3f}\n"
                )
            case 0:
                print("Вихід...")
                break

            case _:
                print("Некоректне введення, будь ласка, спробуйте ще раз.\n")


def task2():
    print("\n--- Завдання 2 ---\n")
    custom_list = [2, 5, 7, 9, 15]
    index = 0
    while True:
        if custom_list[index] == 7:
            break
        index += 1

        if index == len(custom_list):
            index = -1
            break

    print(
        f"Число 7 знаходиться в списку під індексом {index}"
        if index != -1
        else "Числа 7 у списку не існує"
    )


def task3():
    print("\n--- Завдання 3 ---\n")
    custom_tuple = tuple(i for i in range(3, 41) if i % 3 == 0)
    index = 0
    while True:
        if index == len(custom_tuple):
            break
        index += 1
        if 14 < custom_tuple[index] < 31:
            continue
        print(custom_tuple[index])


def task4():
    print("\n--- Завдання 4 ---\n")
    number = input("Введіть число, суму цифр якого хочете дізнатися: ")
    index = 0
    S = 0
    while len(number) > index:
        S += int(number[index])
        index += 1
    print(f"Сума цифр вашого числа = {S}")


def main():
    print("--- Варіант 21 ---")
    task1()
    task2()
    task3()
    task4()


if __name__ == "__main__":
    main()
