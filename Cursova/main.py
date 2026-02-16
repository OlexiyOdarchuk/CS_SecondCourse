import math
import help


def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    print("\n--- Завдання 1 ---")
    print(
        f"Результат виконання першого завдання: {first_task(*help.input_variables(float, amount=3))}"
    )
    
    print("\n--- Завдання 2 ---")
    print (
        f"Результат виконання другого завдання: {second_task(*help.input_variables(float))}"
    )

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

    term1: float = y - z
    numerator: float = y - (z ** (y - z))
    denominator: float = 1 + x**2
    ln_x: float = math.log(x)

    f: float = term1 * (numerator / denominator) + ln_x
    return f

def second_task(x: float) -> float:
    """Друге завдання

    Args:
        x (float): вхідні данні

    Returns:
        float: результат виконання обчислення
    """
    a: float = 3.1
    if x > 1:
        return math.sqrt(a + math.log10(x))
    if abs(x) < 1:
        return math.asin(x)
    else:
        return x**a

if __name__ == "__main__":
    main()


