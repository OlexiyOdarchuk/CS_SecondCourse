from typing import TypeVar, Callable

T = TypeVar("T")


def input_variables(
    convert_func: Callable[[str], T], amount: int = 1, rows: int = 1, cols: int = 0
) -> list[T] | list[list[T]]:
    """Функція для вводу змінних з клавіатури

    Args:
        convert_func (Callable[[str], T]): функція для конвертації в тип данних, який буде повертатися
        amout (int, optional): кількість елементів, яку очікує ввод. Defajults to 1
        rows (int, optional): кількість рядків. Defaults to 1.
        cols (int, optional): кількість колон в рядку. Defaults to 0.

    Returns:
        list[T] | list[list[T]]: Результат у вигляді списків елементів
    """
    if amount < 1:
        print("Помилка в коді. Не можна ввести менше 1 елементу")
        exit(1)
    actual_cols: int = cols if cols > 0 else amount

    if rows > 1:
        matrix: list[T] = []
        for i in range(rows):
            while True:
                line: str = input(
                    f"Рядок {i + 1} (треба {actual_cols} елем. Вводьте через пробіл): "
                ).split()
                if len(line) < actual_cols:
                    print(f"Замало даних! Треба хоча б {actual_cols}")
                    continue

                try:
                    matrix.append([convert_func(x) for x in line[:actual_cols]])
                    break
                except ValueError:
                    print("Помилка типу даних! Спробуйте ще раз.")
        return matrix
    else:
        while True:
            if amount%10 == 1:
                line: str = input("Введіть значення: ").split()
            elif amount%10 < 5:
                line: str = input(
                    f"Введіть {amount} елементи (через пробіл): "
                ).split()
            else:
                line: str = input(f"Введіть {amount} елементів (через пробіл): ").split()
            if len(line) != amount:
                print(f"Ви ввели {len(line)}, а треба {amount}. Спробуйте ще раз.")
                continue

            try:
                return [convert_func(x) for x in line]
            except ValueError:
                print("Помилка типу даних! Спробуйте ще раз.")
