import math
from typing import Callable
import help


def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    print("\n--- Завдання 1 ---")
    data = help.input_variables(float, amount=3)
    print(
        f"Результат виконання першого завдання: {first_task(*data[0])}"
    )

    print("\n--- Завдання 2 ---")
    data = help.input_variables(float)
    print(
        f"Результат виконання другого завдання: {second_task(*data[0])}"
    )

    print("\n--- Завдання 3 ---")
    data = help.input_variables(float)
    print(f"Результат виконання третього завдання: {third_task(*data[0])}")


def first_task(x: float, y: float, z: float) -> float:
    """Перше завдання

    Args:
        x (float): змінна X, число з клавіатури
        y (float): змінна Y, число з клавіатури
        z (float): змінна Z, число з клавіатури

    Returns:
        float: результат виконання обчислення, описаного в 1 завданні курсової роботи для варіанту 21
    """
    if x <= 0:
        print("Помилка: x має бути більше 0 для обчислення ln(x)")
        return 0

    term1: float = y - z
    numerator: float = y - (z ** (y - z))
    denominator: float = 1 + x**2
    ln_x: float = math.log(x)

    f: float = term1 * (numerator / denominator) + ln_x
    return f


def second_task(x: float) -> float:
    """Друге завдання

    Args:
        x (float): число з клавіатури

    Returns:
        float: результат виконання обчислення, описаного в 2 завданні курсової роботи для варіанту 21
    """
    a: float = 3.1
    if x > 1:
        return math.sqrt(a + math.log10(x))
    if abs(x) < 1:
        return math.asin(x)
    else:
        return x**a

def third_task(x: float) -> float:
    """Третє завдання

    Args:
        x (float): число з клавіатури

    Raises:
        RuntimeError: Якщо алгоритми повертають не однаковий результат

    Returns:
        float: результат виконання обчислення, описаного в 3 завданні курсової роботи для варіанту 21
    """
    strategies: list[tuple[str, Callable[[float], float]]] = [
        ("Виконання циклу з лічильником", for_cycle_third_task),
        ("Виконання циклу з передумовою", while_cycle_third_task),
        ("Виконання циклу з післяумовою", while_true_cycle_third_task),
    ]
    result: list[float] = []
    for name, func in strategies:
         localResult = func(x)
         result.append(localResult)
         print(f"{name}: {localResult}")
    
    for i in range(len(result)):
         if math.isclose(result[i], result[0]):
              raise RuntimeError("Помилка. Результат відрізняється!")
         
    return result[0]

def for_cycle_third_task(x: float) -> float:
    """Цикл з лічильником для третього завдання

    Args:
        x (float): число з клавіатури

    Returns:
        float: результат виконання обчислення, описаного в 3 завданні курсової роботи для варіанту 21
    """
    sum: float = 0.0
    k: int = 1
    for k in range(1, 7):
        sum += math.sin(0.17 * (x**k)) / (k**2) + x ** (k * 2)
    return sum

def while_cycle_third_task(x: float) -> float:
    """Цикл з передумовою для третього завдання

    Args:
        x (float): число з клавіатури

    Returns:
        float: результат виконання обчислення, описаного в 3 завданні курсової роботи для варіанту 21
    """
    sum: float = 0.0
    k: int = 1
    while k < 7:
        sum += math.sin(0.17 * (x**k)) / (k**2) + x ** (k * 2)
        k += 1
    return sum

def while_true_cycle_third_task(x: float) -> float:
    """Цикл з післяумовою для третього завдання

    Args:
        x (float): число з клавіатури

    Returns:
        float: результат виконання обчислення, описаного в 3 завданні курсової роботи для варіанту 21
    """
    sum: float = 0.0
    k: int = 1
    while True:
        sum += math.sin(0.17 * (x**k)) / (k**2) + x ** (k * 2)
        k += 1
        if k >= 7:
            break
    return sum
    
if __name__ == "__main__":
    main()
