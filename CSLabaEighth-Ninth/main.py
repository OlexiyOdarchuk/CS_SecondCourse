import help
import random

def main():
    n = help.questNum()
    task1(n)
    n = help.questNum()
    task2(n)
    n = help.questNum()
    task3(n)


def task1(n: int):
    arr = help.createArr(n)
    print(arr)
    min = arr[0]
    for i, v in enumerate(arr):
        if i == 0:
            continue
        if v < min:
            min = v
    print(min)


def task2(n: int):
    arr = []
    for i in range(n):
        while True:
            try:
                num = int(input(f"Введіть {i} елемент числового масиву (4-11): "))
                if num <= 11 and num >= 4:
                    arr.append(num)
                    break
                print("Число повинно бути більше 4 і менше 11")
            except Exception:
                print("Це має бути валідне число")
    print(f"Вихідний масив: {arr}")
    sortArr = help.selection_sort(arr)
    print(f"Відсортований масив: {sortArr}")



def task3(n: int):
    print(sum([i for i in [random.randint(0, 50) for _ in range(n)] if i % 2 != 0]))


if __name__ == "__main__":
    main()
