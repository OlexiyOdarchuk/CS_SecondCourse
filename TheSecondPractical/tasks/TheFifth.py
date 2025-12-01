import math


class TheFifth:
    def __init__(self):
        self.a = None
        self.b = None
        self.c = None

    def get_input_values(self):
        while True:
            try:
                self.a = float(input("Введіть a (дійсне): "))
                self.b = float(input("Введіть b (дійсне): "))
                self.c = int(input("Введіть c (ціле): "))
                break
            except ValueError:
                print("Помилка вводу. Спробуйте ще раз.")

    def calculate_y(self):
        a, b, c = self.a, self.b, self.c

        if b * c < 0:
            raise ValueError("Помилка: Вираз під коренем від'ємний.")

        sqrtBC = math.sqrt(b * c)

        denominator = 1.6 * a + sqrtBC

        if denominator == 0:
            raise ValueError("Помилка: Знаменник дорівнює нулю.")

        numerator = 2 * math.sqrt(3) * a + 3.5 * (a**3 - c)

        y = numerator / denominator
        return y

    def run(self):
        print("\n--- Завдання 5. Обчислення математичного виразу ---")
        self.get_input_values()
        result = self.calculate_y()
        print("\nРезультат обчислення:")
        print(f"y = {result:.4f}")
        print("-" * 50)
