import random


class TheSecond:
    def __init__(self, size=7, min_val=5, max_val=15):
        self.dataList = [random.randint(min_val, max_val) for _ in range(size)]
        self.initialList = list(self.dataList)

    def find_extremes(self):
        if not self.dataList:
            return None, None
        return max(self.dataList), min(self.dataList)

    def remove_extremes(self, maxVal, minVal):
        if maxVal in self.dataList:
            self.dataList.remove(maxVal)

        if minVal in self.dataList:
            self.dataList.remove(minVal)

    def sort_list(self):
        self.dataList.sort()

    def run(self):
        print("\n--- Завдання 2. Робота зі списком випадкових чисел ---")
        print(f"Початковий список: {self.initialList}")

        maxVal, minVal = self.find_extremes()
        print(f"Максимальне значення: {maxVal}")
        print(f"Мінімальне значення: {minVal}")

        self.remove_extremes(maxVal, minVal)
        print(f"Список після вилучення Max/Min: {self.dataList}")

        self.sort_list()
        print(f"Список після сортування: {self.dataList}")
        print("-" * 50)
