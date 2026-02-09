import help
import random

def main():
    n = help.questNum()
    task1(n)
    task2()
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

def task2():
    arr = []
    for i in range(12):
        while True:
            try:
                num = int(input(f"Введіть {i} елемент числового масиву (4-11): "))
                if num <= 11 and num >= 4:
                    arr.append(num)
                    break
                print("Число повинно бути більше 4 і менше 11")
            except Exception:
                print("Це має бути валідне число")
    print(arr, help.selection_sort(arr))

def task3(n: int):
    arr = [random.randint(-10, 51) for _ in range(n)]
    sum = 0
    for i in arr:
        if i %2 != 0:
            sum +=i
    print(sum)

if __name__ == "__main__":
    main()
