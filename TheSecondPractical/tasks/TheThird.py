class TheThird:
    def __init__(
        self,
        initialList=[13, 29, 88, 7, 65, 22, 55, 123],
        targetValue=88,
        newValue=111,
        appendValue=11,
    ):
        self.dataList = initialList
        self.targetValue = targetValue
        self.newValue = newValue
        self.appendValue = appendValue

    def find_index(self, value):
        try:
            return self.dataList.index(value)
        except ValueError:
            return -1

    def replace_at_index(self, index, new_value):
        if 0 <= index < len(self.dataList):
            self.dataList[index] = new_value
            return True
        return False

    def append_value(self, value):
        self.dataList.append(value)

    def run(self):
        print("\n--- Завдання 3. Редагування статичного списку ---")
        print(f"Початковий список: {self.dataList}")

        target_index = self.find_index(self.targetValue)

        if target_index != -1:
            print(f"Індекс числа {self.targetValue}: {target_index}")

            self.replace_at_index(target_index, self.newValue)
            print(f"Замінено {self.targetValue} на {self.newValue}.")

            self.append_value(self.appendValue)
            print(f"Додано {self.appendValue} у кінець списку.")

            print(f"Кінцевий список: {self.dataList}")
        else:
            print(f"Помилка: Число {self.targetValue} не знайдено у списку.")

        print("-" * 50)
