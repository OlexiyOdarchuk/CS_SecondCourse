from typing import TypeVar, Callable

T = TypeVar("T")


def input_variables(
    convert_func: Callable[[str], T], prompt: str = "DEFAULT", amount: int = 1, rows: int = 1, cols: int = 0
) -> list[T] | list[list[T]]:
    """Функція для вводу змінних з клавіатури

    Args:
        convert_func (Callable[[str], T]): функція для конвертації в тип данних, який буде повертатися
        prompt (str, optional): рядок, який буде виводитися, коли програма просить користувача ввести значення в термінал.
        amout (int, optional): кількість елементів, яку очікує ввод. Defaults to 1
        rows (int, optional): кількість рядків. Defaults to 1.
        cols (int, optional): кількість колон в рядку. Defaults to 0.

    Returns:
        list[T] | list[list[T]]: Результат у вигляді списку елементів, які ввів користувач
    """
    if amount < 1:
        raise ValueError("Кількість елементів має бути >= 1")
    
    actual_cols: int = cols if cols > 0 else amount

    if rows > 1:
        matrix: list[list[T]] = []
        for i in range(rows):
            while True:

                if prompt == "DEFAULT":
                    prompt: str = f"Рядок {i + 1} (очікується {actual_cols} елем.): "

                parts: str = input(prompt).split()

                if len(parts) < actual_cols:
                    print(f"Замало даних! Отримано {len(parts)}, потрібно {actual_cols}")
                    continue

                try:
                    matrix.append([convert_func(x) for x in parts[:actual_cols]])
                    break
                except ValueError:
                    print("Помилка типу даних! Спробуйте ще раз.")
        return matrix

    while True:

        if prompt == "DEFAULT":
            prompt = (
                f"Введіть {amount} елем. через пробіл: "
                if amount > 1
                else "Введіть значення: "
            )

        parts = input(prompt).split()

        if len(parts) != amount:
            print(f"Помилка: введено {len(parts)}, а очікувалося {amount}.")
            continue
        try:
            return [convert_func(x) for x in parts]
        except ValueError:
            print("Помилка типу даних! Спробуйте ще раз.")
