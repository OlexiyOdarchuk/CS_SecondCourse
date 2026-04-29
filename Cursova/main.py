import math
from typing import Callable
import help
import random

def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    tasks = [
        ("Завдання 1", first_task, float, 3),
        ("Завдання 2", second_task, float, 1),
        ("Завдання 3", third_task, float, 1),
        ("Завдання 4", fourth_task, int, 1)
    ]

    for title, func, data_type, args_count in tasks:
        print(f"\n--- {title} ---")
        
        data: list[list] = help.input_variables(data_type, amount=args_count)

        result = func(*data[0])
        
        print(f"Результат виконання {title.lower()}: {result}")

    print("\n--- Завдання 5 ---")
    fifth_task()

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
         if not math.isclose(result[i], result[0]):
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
    

def fourth_task(n: int) -> int:
    """Четверте завдання

    Args:
        n (int): число з клавіатури, що показує кількість елементів в списку

    Returns:
        int: сума елементів списку, які є непарними числами
    """
    return sum([i for i in [random.randint(0, 50) for _ in range(n)] if i % 2 != 0])


def fifth_task():
    """Запуск п'ятого завдання
    """
    height, width = 5, 5
    matrix = create_matrix_fifth_task(height, width)
    vector = create_vector_fifth_task(matrix)
    print("Створена матриця:")
    print_matrix_fifth_task(matrix)
    print("\nСтворений вектор:")
    print_vector_fifth_task(vector)

def create_matrix_fifth_task(
    height: int = 5, width: int = 5
) -> help.Matrix1Based[float]:
    """
    Створення матриці для п'ятого завдання.

    Args:
        height: висота матриці (кількість рядків).
        width: ширина матриці (кількість стовпців).

    Returns:
        help.Matrix1Based[float]: об'єкт матриці з обчисленими значеннями.
    """
    matrix = help.Matrix1Based[float](height, width)

    for i in range(1, height + 1):
        for j in range(1, width + 1):
            value: float = ((3 + i) / (i + j)) * math.sqrt(i**3 + j**2) + 2 ** (i - j)
            matrix[i][j] = value

    return matrix


def create_vector_fifth_task(matrix: help.Matrix1Based[float]) -> list[float]:
    """
    Створення вектора на основі сум непарних рядків матриці.

    Args:
        matrix: Об'єкт Matrix1Based, з якого беруться дані.

    Returns:
        list[float]: список сум (для рядків 1, 3, 5).
    """
    vector: list[float] = []

    for i in range(1, matrix.rows + 1, 2):
        row_sum = 0.0
        for j in range(1, matrix.cols + 1):
            val = matrix[i][j]
            if val is not None:
                row_sum += val
        vector.append(row_sum)

    return vector


def print_matrix_fifth_task(matrix: help.Matrix1Based):
    """Вивід матриці

    Args:
        matrix (help.Matrix1Based): Матриця, яку потрібно буде вивести (виводить з елемента з індексом 0, а не 1)
    """
    print()
    print(matrix)


def print_vector_fifth_task(vector: list[float]):
    """Вивід вектора

    Args:
        vector (list[float]): Вектор, який потрібно вивести
    """
    formatted_elements: list[str] = [f"{item:.3f}" for item in vector]
    print(*formatted_elements)


if __name__ == "__main__":
    main()
