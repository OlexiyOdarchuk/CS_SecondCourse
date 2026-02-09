import math
import help

def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")
    print("--- Завдання 1 ---")
    print(f"Результат виконання першого завдання: {first_task(*help.input_variables(float, amount=3))}")

    
def first_task(x: float, y: float, z: float) -> float:
    """Перше завдання

    Args:
        x (float): змінна X
        y (float): змінна Y
        z (float): змінна Z

    Returns:
        float: Результат обчислення
    """
    if x <= 0:
        return "Помилка: x має бути більше 0 для обчислення ln(x)"

    term1 = y - z
    numerator = y - (z ** (y - z))
    denominator = 1 + x**2
    ln_x = math.log(x)

    f = term1 * (numerator / denominator) + ln_x
    return f


if __name__ == "__main__":
    main()
