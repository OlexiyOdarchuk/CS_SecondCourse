from collections.abc import Callable


def input_variables[T](
    convert_func: Callable[[str], T],
    message: str = "DEFAULT",
    digit_count: int = 0,
    min_val: int | float | None = None,
    max_val: int | float | None = None,
    amount: int = 1,
    rows: int = 1,
    cols: int = 0,
    validator: Callable[[T], bool] | None = None,
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
        raise ValueError("the number of elements (amount) must be >= 1")

    actual_cols = cols if cols > 0 else amount

    def process_line(line: str, expected_count: int) -> list[T]:
        parts = line.split()
        if len(parts) < expected_count:
            raise ValueError(
                f"not enough data; expected {expected_count}, received {len(parts)}"
            )

        parts = parts[:expected_count]

        try:
            parsed = [convert_func(p) for p in parts]
        except Exception as e:
            raise ValueError(e)

        for i, val in enumerate(parsed):
            if digit_count > 0:
                clean_str = str(parts[i]).lstrip("-").replace(".", "")
                if len(clean_str) != digit_count:
                    raise ValueError(
                        f"the number '{parts[i]}' must consist of {digit_count} digits"
                    )

            if isinstance(val, (int, float)):
                if min_val is not None and val < min_val:
                    raise ValueError(f"the value of {val} is less than the minimum ({min_val})")
                if max_val is not None and val > max_val:
                    raise ValueError(
                        f"the value of {val} is greater than the maximum ({max_val})"
                    )

            if validator and not validator(val):
                raise ValueError(f"the value {val} did not pass validation")

        return parsed

    result: list[list[T]] = []
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


class _RowProxy[T]:
    """Допоміжний клас для обробки другого індексу matrix[i][j]"""

    def __init__(self, row_ref: list[T | None], cols_count: int) -> None:
        self.row: list[T | None] = row_ref
        self.cols: int = cols_count

    def __getitem__(self, j: int) -> T | None:
        if not (1 <= j <= self.cols):
            raise IndexError(f"column index {j} out of range [1..{self.cols}]")
        return self.row[j - 1]

    def __setitem__(self, j: int, value: T) -> None:
        if not (1 <= j <= self.cols):
            raise IndexError(f"column index {j} out of range [1..{self.cols}]")
        self.row[j - 1] = value


class Matrix1Based[T]:
    """
    Матриця з індексацією від 1 для завдання 5.
    """

    def __init__(self, rows: int, cols: int, default_value: T | None = None) -> None:
        self.rows: int = rows
        self.cols: int = cols
        self._data: list[list[T | None]] = [
            [default_value for _ in range(cols)] for _ in range(rows)
        ]

    def __getitem__(self, i: int) -> _RowProxy[T]:
        if not (1 <= i <= self.rows):
            raise IndexError(f"row index {i} out of range [1..{self.rows}]")

        return _RowProxy(self._data[i - 1], self.cols)

    def __repr__(self) -> str:
        """Форматований вивід таблиці з українськими назвами та вирівнюванням."""
        if not self._data:
            return "Матриця порожня"

        col_width = 12
        row_label_width = 10
        res: list[str] = []

        header = " " * (row_label_width + 2) 
        for j in range(1, self.cols + 1):
            header += f"{f'Стовп. {j}':>{col_width}}"
        res.append(header)

        separator = " " * row_label_width + " ┌" + "─" * (self.cols * col_width)
        res.append(separator)

        for i, row in enumerate(self._data, 1):
            row_label = f"Рядок {i:<2}"
            line = f"{row_label:>{row_label_width}} │"

            for item in row:
                if item is not None:
                    line += f"{item:>{col_width}.3f}"
                else:
                    line += f"{'---':>{col_width}}"
            res.append(line)

        return "\n".join(res)

    def get(self) -> list[list[T | None]]:
        """Повертає raw-дані для обробки."""
        return self._data