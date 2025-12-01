import math


class TheFirst:
    def __init__(self, side_a=10):
        if side_a <= 0:
            raise ValueError("Сторона трикутника має бути додатним числом.")
        self.a = side_a

    def calculate_triangle_area(self):
        return (self.a**2 * math.sqrt(3)) / 4

    def calculate_inradius(self):
        return (self.a * math.sqrt(3)) / 6

    def calculate_inscribed_circle_area(self):
        r = self.calculate_inradius()
        return math.pi * r**2

    def calculate_difference(self):
        STriangle = self.calculate_triangle_area()
        SCircle = self.calculate_inscribed_circle_area()
        return STriangle - SCircle

    def run(self):
        s_t = self.calculate_triangle_area()
        s_c = self.calculate_inscribed_circle_area()
        diff = self.calculate_difference()
        r = self.calculate_inradius()

        print(f"\n--- Завдання 1. Результати для сторони a = {self.a:.2f} ---")
        print(f"Радіус вписаного кола: {r:.4f}")
        print(f"Площа трикутника: {s_t:.4f}")
        print(f"Площа вписаного кола: {s_c:.4f}")
        print(f"Різниця площ: {diff:.4f}")
        print("-" * 50)
