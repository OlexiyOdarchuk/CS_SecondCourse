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
//  ЗАВДАННЯ 1  (приклад — повністю заповнений)
// ============================================================
= ЗАВДАННЯ № 1

*Умова задачі:* Скласти блок-схему та програму лінійного алгоритму на мові програмування Python та реалізувати її.
Знайти значення функції $ f = (y - z) dot frac((y - z)^(y - z), 1 + x^2) + ln x $ Значення змінних х, y, z ввести з клавіатури.

== Оператор циклу з параметром (`for`)

=== Програмна реалізація алгоритму

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
    print("\n--- Завдання 1 ---")
    print(
        f"Результат виконання першого завдання: {first_task(*help.input_variables(float, amount=3))}"
    )

if __name__ == "__main__":
    main()
```

=== Результат виконання коду

#result[
--- Курсова робота ---

--- Варіант 21 ---

--- Завдання 1 ---

Введіть 3 елем. через пробіл: 6 4 2

Результат виконання першого завдання: 1.791759469228055
]

=== Блок-схема алгоритму

#flowchart("first_task.svg", caption: "Перше завдання", width: 100%)

#pagebreak()

// ============================================================
//  ЗАВДАННЯ 2  (шаблон — тільки структура, заповнити самому)
// ============================================================
= ЗАВДАННЯ № 2

*Умова задачі:* Скласти алгоритм розв’язування задачі розгалуженого алгоритму відповідно до варіанта та зобразити його графічно у вигляді блок-схеми. Створити Python-програму. Варіанти завдань: Скласти програму для обчислення значення заданої функції y(x) за введеним з клавіатури значенням змінної x. Значення параметрів a, b або t задати самостійно.

Функція: #image("second_func.png")

Значення змінної $x =$ 4

== Програмна реалізація алгоритму

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

    print("\n--- Завдання 2 ---")
    print (
        f"Результат виконання другого завдання: {second_task(*help.input_variables(float))}"
    )

if __name__ == "__main__":
    main()
```

== Результат виконання коду

#result[
--- Курсова робота ---

--- Варіант 21 ---

--- Завдання 2 ---

Введіть значення: 2

Результат виконання другого завдання: 1.8441881670979188
]

== Блок-схема алгоритму

#flowchart("second_task.svg", caption: "Друге завдання", width: 55%)


// ============================================================
//  ЗАВДАННЯ 3 — 5  (просто скопіюй структуру Завдання 2)
// ============================================================

// = ЗАВДАННЯ № 3
// ...

// = ЗАВДАННЯ № 4
// ...

// = ЗАВДАННЯ № 5
// ...

// ... (після всіх завдань) ...

#pagebreak()
#heading(numbering: none)[ДОДАТОК А]
#align(center)[#text(weight: "bold")[Програмний код допоміжного модуля (my_lib.py)]]

#v(1em)

```python
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
```

#flowchart("help.svg", caption: "Допоміжна функція input_variables", width: 70%)
