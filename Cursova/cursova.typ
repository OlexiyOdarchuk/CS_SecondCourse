// ---------- НАЛАШТУВАННЯ СТОРІНКИ ----------
#set page(
  paper: "a4",
  margin: (top: 20mm, bottom: 20mm, left: 30mm, right: 15mm),
  numbering: "1",
  number-align: center,
)

// ---------- ШРИФТ ----------
#set text(
  font: "Times New Roman",
  size: 14pt,
  lang: "uk",
)

#set par(
  justify: true,
  leading: 1.5em,
  first-line-indent: 1.25cm,
)

// ---------- ЗАГОЛОВКИ ----------
#set heading(numbering: "1.1.")

#show heading.where(level: 1): it => {
  set text(size: 14pt, weight: "bold")
  set par(first-line-indent: 0pt)
  v(1em)
  align(center, it.body)
  v(0.5em)
}

#show heading.where(level: 2): it => {
  set text(size: 14pt, weight: "bold")
  set par(first-line-indent: 0pt)
  v(0.75em)
  it
  v(0.25em)
}

#show heading.where(level: 3): it => {
  set text(size: 14pt, weight: "bold")
  set par(first-line-indent: 0pt)
  v(0.5em)
  it
  v(0.1em)
}

// ---------- КОД ----------
#show raw.where(block: true): it => {
  set par(first-line-indent: 0pt, justify: false)
  block(
    fill: luma(245),
    stroke: (left: 3pt + luma(160)),
    inset: (x: 10pt, y: 8pt),
    radius: 2pt,
    width: 100%,
    text(font: "Courier New", size: 11pt, it),
  )
}

// ---------- ДОПОМІЖНІ ФУНКЦІЇ ----------

// Блок "Результат виконання"
#let result(content) = block(
  fill: luma(250),
  stroke: 0.5pt + luma(180),
  inset: (x: 10pt, y: 8pt),
  radius: 2pt,
  width: 100%,
  {
    set par(first-line-indent: 0pt, justify: false)
    text(font: "Courier New", size: 11pt, content)
  },
)

// Блок-схема з SVG-файлу
#let flowchart(path, caption: none, width: 60%) = {
  set par(first-line-indent: 0pt)
  align(center, {
    image(path, width: width)
    if caption != none {
      v(0.3em)
      text(size: 12pt, style: "italic", caption)
    }
  })
}

// Підзаголовок підрозділу (3.1.1, 3.2.1 тощо) — жирний, не numbered
#let subsec(title) = {
  set par(first-line-indent: 0pt)
  v(0.5em)
  text(weight: "bold", title)
  v(0.1em)
}

// Стилізація коду
#let code-style(body) = {
  set text(size: 9pt) 
  show raw: set par(leading: 0.35em) 
  body
}

// ============================================================
//  ТИТУЛЬНА СТОРІНКА
// ============================================================
#page(numbering: none)[
  #set par(first-line-indent: 0pt, justify: false)
  #align(center)[
    #text(size: 13pt)[
      Міністерство освіти і науки України \
      Відокремлений структурний підрозділ "Фаховий коледж інформаційних технологій Національного університету "Львівська політехніка" \
      НАЗВА ЦИКЛОВОЇ КОМІСІЇ
    ]

    #v(3cm)

    #text(size: 16pt, weight: "bold")[КУРСОВА РОБОТА]

    #v(0.5cm)

    #text(size: 14pt)[з дисципліни "Інформатика"]

    #v(1cm)

    #text(size: 15pt, weight: "bold")[
      Тема: «Назва теми курсової роботи»
    ]

    #v(3cm)

    #align(right)[
      #table(
        columns: (auto, auto),
        stroke: none,
        inset: (x: 4pt, y: 4pt),
        [Виконав(ла):], [студент групи МТ-22],
        [], [Одарчук О.Р],
        [Перевірив(ла):], [посада],
        [], [Йосифів Л.Б.],
      )
    ]

    #v(1fr)

    #text(size: 13pt)[Львів — 2026]
  ]
]


// ============================================================
//  ЗМІСТ
// ============================================================
#page[
  #set par(first-line-indent: 0pt)
  #align(center, text(weight: "bold", size: 14pt)[ЗМІСТ])
  #v(1em)
  #outline(
    title: none,
    indent: 1.25cm,
    depth: 3,
  )
]


// ============================================================
//  ЗАВДАННЯ 1 
// ============================================================
= ЗАВДАННЯ № 1

*Умова задачі:* Скласти блок-схему та програму лінійного алгоритму на мові програмування Python та реалізувати її.
Знайти значення функції $ f = (y - z) dot frac((y - z)^(y - z), 1 + x^2) + ln x $ Значення змінних х, y, z ввести з клавіатури.

== Програмна реалізація алгоритму

#code-style(
```python
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

def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    tasks = [
        ("Завдання 1", first_task, float, 3),
    ]

    for title, func, data_type, args_count in tasks:
        print(f"\n--- {title} ---")
        
        data: list[list] = help.input_variables(data_type, amount=args_count)

        result = func(*data[0])
        
        print(f"Результат виконання {title.lower()}: {result}")

if __name__ == "__main__":
    main()
```
)

== Результат виконання коду

#result[
--- Курсова робота ---

--- Варіант 21 ---

--- Завдання 1 ---

Введіть значення: 25.825 12.02 3.298

Результат виконання завдання 1: -429.17216523536393
]

== Блок-схема алгоритму

#flowchart("first_task.svg", caption: "Перше завдання", width: 100%)

#pagebreak()

// ============================================================
//  ЗАВДАННЯ 2 
// ============================================================
= ЗАВДАННЯ № 2

*Умова задачі:* Скласти алгоритм розв’язування задачі розгалуженого алгоритму відповідно до варіанта та зобразити його графічно у вигляді блок-схеми. Створити Python-програму. Варіанти завдань: Скласти програму для обчислення значення заданої функції y(x) за введеним з клавіатури значенням змінної x. Значення параметрів a, b або t задати самостійно.

Функція: #image("second_func.png")

#pagebreak()

== Програмна реалізація алгоритму

#code-style(
```python
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

def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    tasks = [
        # ("Завдання 1", first_task, float, 3),
        ("Завдання 2", second_task, float, 1),
    ]

    for title, func, data_type, args_count in tasks:
        print(f"\n--- {title} ---")
        
        data: list[list] = help.input_variables(data_type, amount=args_count)

        result = func(*data[0])
        
        print(f"Результат виконання {title.lower()}: {result}")

if __name__ == "__main__":
    main()
```
)

== Результат виконання коду

#result[
--- Курсова робота ---

--- Варіант 21 ---

--- Завдання 2 ---

Введіть значення: 5

Результат виконання завдання 2: 1.9490946627437105
]

== Блок-схема алгоритму

#flowchart("second_task.svg", caption: "Друге завдання", width: 55%)


// ============================================================
//  ЗАВДАННЯ 3
// ============================================================

#pagebreak()

= ЗАВДАННЯ № 3

*Умова задачі:* Скласти алгоритм розв’язування задачі циклічного алгоритму відповідно до заданого варіанту та подати його у вигляді блок-схеми. Розробити Python-програму для реалізації цього алгоритму.

Варіанти завдань: Скласти блок-схему та розробити програму для
обчислення функції f(x) за значення змінної x, введеним з клавіатури.
Під час виконання завдання необхідно реалізувати обчислення виразу з
використанням:
- 1) оператора циклу з параметром (for);
- 2) оператора циклу з передумовою (while);
- 3) оператора циклу з післяумовою (while True з використанням break).

Функція: #image("third_func.png")

== Програмна реалізація алгоритму

#code-style(
```python
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

def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    tasks = [
        # ("Завдання 1", first_task, float, 3),
        # ("Завдання 2", second_task, float, 1),
        ("Завдання 3", third_task, float, 1),
    ]

    for title, func, data_type, args_count in tasks:
        print(f"\n--- {title} ---")
        
        data: list[list] = help.input_variables(data_type, amount=args_count)

        result = func(*data[0])
        
        print(f"Результат виконання {title.lower()}: {result}")

if __name__ == "__main__":
    main()
```
)

== Результат виконання коду

#result[
    --- Курсова робота ---

    --- Варіант 21 ---

    --- Завдання 3 ---
    
    Введіть значення: -0.361
    
    Виконання циклу з лічильником: 0.09331608870197027

    
    Виконання циклу з передумовою: 0.09331608870197027
    
    Виконання циклу з післяумовою: 0.09331608870197027
    
    Результат виконання завдання 3: 0.09331608870197027
]

== Блок-схеми функцій

=== Блок-схема до основної функції third_task 
#flowchart("third_task.svg", width: 100%)

=== Блок-схема до функції for_cycle_third_task 
#flowchart("for_cycle_third_task.svg", width: 100%)

=== Блок-схема до функції while_cycle_third_task 
#flowchart("while_cycle_third_task.svg", width: 100%)

=== Блок-схема до функції while_true_cycle_third_task 
#flowchart("while_true_cycle_third_task.svg", width: 80%)


// ============================================================
//  ЗАВДАННЯ 4
// ============================================================

#pagebreak()

= ЗАВДАННЯ № 4

*Умова задачі:* Скласти алгоритм розв’язування задачі відповідно до заданого варіанту та подати його у вигляді блок-схеми. Розробити Python-програму для реалізації цього алгоритму.

Варіанти завдань: Нехай задано список різних випадкових чисе [a1, ..., an], значення n визначає користувач програми. Використовуючи генератор випадкових чисел, заповнити список [a1, ..., an] елементами: 

а) цілими додатними числами, які лежать в діапазоні від 0 до 50 включно;

б) цілими додатними та від‘ємними числами, які лежать в діапазоні від – 10 до 10 включно.

Задано список (a). Написати програму визначення суми лише тих
елементів, які є непарними числами.

#pagebreak()

== Програмна реалізація алгоритму

#code-style(
```python
def fourth_task(n: int) -> int:
    """Четверте завдання

    Args:
        n (int): число з клавіатури, що показує кількість елементів в списку

    Returns:
        int: сума елементів списку, які є непарними числами
    """
    return sum([i for i in [random.randint(0, 50) for _ in range(n)] if i % 2 != 0])

def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    tasks = [
        # ("Завдання 1", first_task, float, 3),
        # ("Завдання 2", second_task, float, 1),
        # ("Завдання 3", third_task, float, 1),
        ("Завдання 4", fourth_task, int, 1)
    ]

    for title, func, data_type, args_count in tasks:
        print(f"\n--- {title} ---")
        
        data: list[list] = help.input_variables(data_type, amount=args_count)

        result = func(*data[0])
        
        print(f"Результат виконання {title.lower()}: {result}")

if __name__ == "__main__":
    main()
```
)

== Результат виконання коду

#result[
--- Курсова робота ---

--- Варіант 21 ---

--- Завдання 4 ---

Введіть значення: 5

Результат виконання завдання 4: 22
]

== Блок-схема алгоритму

#flowchart("fourth_task.svg", caption: "Четверте завдання", width: 80%)


// ============================================================
//  ЗАВДАННЯ 5
// ============================================================
//....

#pagebreak()
#heading(numbering: none)[ДОДАТОК А]
#align(center)[#text(weight: "bold")[Програмний код допоміжного модуля (help.py)]]

#v(1em)
#code-style(
```python
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
```
)
#flowchart("help.svg", caption: "Допоміжна функція input_variables", width: 60%)
