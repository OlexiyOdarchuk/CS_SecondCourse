import math


def createArr(n: int) -> list[int]:
    arr = []
    for i in range(n):
        arr.append(math.e ** (2 * i) * math.sinh((1 + 2 * i) / 0.5))
    return arr


def selection_sort(arr: list[int]) -> list[int]:
    n = len(arr)

    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]

    return arr


def questNum() -> int:
    n = 0
    while True:
        try:
            n = int(
                input("Введіть кількість елементів в масиві: ")
            )
            break
        except Exception:
            print("Це має бути число")
    return n
