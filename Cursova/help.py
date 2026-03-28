from typing import Any, Callable, Optional, TypeVar, Union

T = TypeVar("T")


def input_variables(
    convert_func: Callable[[str], T],
    message: str = "DEFAULT",
    digit_count: int = 0,
    min_val: Optional[Union[int, float]] = None,
    max_val: Optional[Union[int, float]] = None,
    amount: int = 1,
    rows: int = 1,
    cols: int = 0,
    validator: Optional[Callable[[T], bool]] = None,
) -> list[list[T]]:
    """
    Універсальний інструмент для зчитування та валідації даних з консолі.

    Функція забезпечує типізоване введення, підтримує створення матриць,
    перевірку діапазонів значень, довжини чисел та дозволяє передавати
    власні функції-валідатори для складної логіки.

    Args:
        convert_func: Функція для перетворення введеного рядка у тип T (напр. int, float).
        message: Рядок підказки для користувача. "DEFAULT" генерує автоматичне повідомлення.
        digit_count: Вимагає, щоб кожне число складалося саме з цієї кількості цифр.
        min_val: Мінімально допустиме значення для числових типів.
        max_val: Максимально допустиме значення для числових типів.
        amount: Кількість елементів, які очікуються в одному рядку.
        rows: Кількість рядків для зчитування.
        cols: Кількість колонок у матриці (якщо 0, використовується значення amount).
        validator: Опціональна функція, що приймає значення T і повертає True, якщо воно валідне.

    Returns:
        Двовимірний список (list[list[T]]).

    Raises:
        ValueError: Якщо параметр amount менший за 1.

    Example:
        >>> # Зчитати 3 парних числа від 10 до 99
        >>> nums = input_variables(int, amount=3, min_val=10, max_val=99, validator=lambda x: x % 2 == 0)
    """

    if amount < 1:
        raise ValueError("Кількість елементів має бути >= 1")

    actual_cols = cols if cols > 0 else amount

    def process_line(line: str, expected_count: int) -> list[T]:
        parts = line.split()
        if len(parts) < expected_count:
            raise ValueError(
                f"Замало даних! Очікувано {expected_count}, отримано {len(parts)}"
            )

        parts = parts[:expected_count]

        try:
            parsed = [convert_func(p) for p in parts]
        except Exception as e:
            raise ValueError(f"Помилка типу даних: {e}")

        for i, val in enumerate(parsed):
            if digit_count > 0:
                clean_str = str(parts[i]).lstrip("-").replace(".", "")
                if len(clean_str) != digit_count:
                    raise ValueError(f"Число '{parts[i]}' має мати {digit_count} цифр")

            if isinstance(val, (int, float)):
                if min_val is not None and val < min_val:
                    raise ValueError(f"Значення {val} менше за мінімальне ({min_val})")
                if max_val is not None and val > max_val:
                    raise ValueError(
                        f"Значення {val} більше за максимальне ({max_val})"
                    )

            if validator and not validator(val):
                raise ValueError(f"Значення {val} не пройшло кастомну валідацію")

        return parsed

    result: list[list[Any]] = []
    needed_rows = rows

    for r in range(needed_rows):
        while True:
            if message == "DEFAULT":
                prompt = (
                    f"Рядок {r + 1}/{rows} (очікується {actual_cols}): "
                    if rows > 1
                    else "Введіть значення: "
                )
            else:
                prompt = message

            try:
                row = process_line(input(prompt), actual_cols)
                result.append(row)
                break
            except ValueError as e:
                print(f"⚠️ {e}. Спробуйте ще раз.")

    return result
