from typing import TypeVar, Callable

T = TypeVar("T")


def input_variables(
    convert_func: Callable[[str], T],
    message: str = "DEFAULT",
    digit_count: int = 0,
    min: int | None = None,
    max: int | None = None,
    amount: int = 1,
    rows: int = 1,
    cols: int = 0,
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
                current_msg = message
                if current_msg == "DEFAULT":
                    current_msg = f"Рядок {i + 1} (очікується {actual_cols} елем.): "

                parts: list[str] = input(current_msg).split()

                if len(parts) < actual_cols:
                    print(
                        f"Замало даних! Отримано {len(parts)}, потрібно {actual_cols}"
                    )
                    continue

                parts_to_process = parts[:actual_cols]

                try:
                    parsed_row = [convert_func(x) for x in parts_to_process]
                except ValueError:
                    print("Помилка типу даних! Спробуйте ще раз.")
                    continue

                if convert_func is int and digit_count > 0:
                    if any(len(p.lstrip("-")) != digit_count for p in parts_to_process):
                        print(
                            f"Некоректне число! Всі числа мають складатися з {digit_count} цифр."
                        )
                        continue

                if isinstance(parsed_row[0], (int, float)):
                    if min is not None and any(isinstance(val, (int, float)) and val < min for val in parsed_row):
                        print(f"Помилка! Значення не можуть бути меншими за {min}.")
                        continue
                    if max is not None and any(isinstance(val, (int, float)) and val > max for val in parsed_row):
                        print(f"Помилка! Значення не можуть бути більшими за {max}.")
                        continue

                matrix.append(parsed_row) # type: ignore
                break

        return matrix

    while True:
        current_msg = message
        if current_msg == "DEFAULT":
            current_msg = (
                f"Введіть {amount} елем. через пробіл: "
                if amount > 1
                else "Введіть значення: "
            )

        parts = input(current_msg).split()

        if len(parts) != amount:
            print(f"Помилка: введено {len(parts)}, а очікувалося {amount}.")
            continue

        try:
            parsed_list = [convert_func(x) for x in parts]
        except ValueError:
            print("Помилка типу даних! Спробуйте ще раз.")
            continue

        if convert_func is int and digit_count > 0:
            if any(len(p.lstrip("-")) != digit_count for p in parts):
                print(
                    f"Некоректне число! Всі числа мають складатися з {digit_count} цифр."
                )
                continue

        if isinstance(parsed_list[0], (int, float)):
            if min is not None and any(isinstance(val, (int, float)) and val < min for val in parsed_list):
                print(f"Помилка! Значення не можуть бути меншими за {min}.")
                continue
            if max is not None and any(isinstance(val, (int, float)) and val > max for val in parsed_list):
                print(f"Помилка! Значення не можуть бути більшими за {max}.")
                continue

        return parsed_list
