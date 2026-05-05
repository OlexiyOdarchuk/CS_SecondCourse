#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#let dstu-stroke = 0.7pt
#let shapes = fletcher.shapes

// ---------- НАЛАШТУВАННЯ СТОРІНКИ ----------
#set page(
  paper: "a4",
  margin: (top: 15mm, bottom: 15mm, left: 25mm, right: 10mm),
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
  leading: 0.65em,
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
  set par(first-line-indent: 0pt, justify: false, leading: 0.65em)
  block(
    inset: (x: 10pt, y: 8pt),
    width: 100%,
    text(font: "Times New Roman", size: 14pt, it),
  )
}


// ---------- ДОПОМІЖНІ ФУНКЦІЇ ----------

#let result(body) = block(
  inset: (x: 10pt, y: 8pt),
  radius: 2pt,
  width: 100%,
  {
    set par(first-line-indent: 0pt, justify: false, leading: 0.65em)
    set text(font: "Times New Roman", size: 14pt)
    show raw.where(block: true): it => it
    body
  },
)

// Блок-схема (fletcher diagram)
#let flowchart(body, caption: none) = {
  set par(first-line-indent: 0pt)
  align(center, {
    body
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
    #text(size: 14pt, weight: "bold")[
      НАЦІОНАЛЬНИЙ УНІВЕРСИТЕТ «ЛЬВІВСЬКА ПОЛІТЕХНІКА»
      ВІДОКРЕМЛЕНИЙ СТРУКТУРНИЙ ПІДРОЗДІЛ\
      «ФАХОВИЙ КОЛЕДЖ ІНФОРМАЦІЙНИХ ТЕХНОЛОГІЙ
      НАЦІОНАЛЬНОГО УНІВЕРСИТЕТУ «ЛЬВІВСЬКА ПОЛІТЕХНІКА»
    ]
    
    #v(3cm)
    
    #text(size: 16pt, weight: "bold")[КУРСОВА РОБОТА]
    
    #v(0.5cm)
    
    #text(size: 13pt)[На тему: ]
    #text(size: 16pt, weight: "bold")[
      «Розробка та програмна реалізація алгоритмів
      розв’язування математичних задач мовою Python»
    ]
    
    #v(3cm)
    
    #grid(
      columns: (1fr, 1fr),
      [],
      align(left)[
        Виконав студент групи МТ-22 \
        #text(weight: "bold")[Одарчук О.Р.] \
        Варіант 21 \
        Керівник: \
        Курсова робота перевірена і
        допущена до захисту
        «#underline[#h(20pt)]» #underline[#h(100pt)] 2026 р.
        Курсова робота при захисті
        оцінена:
      ],
    )
    
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
Знайти значення функції $ f = (y - z) dot frac(y - z^(y - z), 1 + x^2) + ln x $ Значення змінних х, y, z ввести з клавіатури.

== Програмна реалізація алгоритму

#code-style(
```
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
```
--- Курсова робота ---
--- Варіант 21 ---

--- Завдання 1 ---
Введіть значення: 25.825 12.02 3.298
Результат виконання завдання 1: -429.17216523536393
```
]

== Блок-схема алгоритму

#flowchart(
  caption: "Перше завдання",
  diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 9mm),
    mark-scale: 80%,

    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t1-start>),
    edge(<t1-start>, (0, 1), "-|>"),

    node((0, 1), [Введення $x, y, z$], shape: shapes.parallelogram, name: <t1-in>),
    edge(<t1-in>, (0, 2), "-|>"),

    node((0, 2), [$x <= 0$], shape: shapes.diamond, name: <t1-if>),

    edge(<t1-if>, (-2.2, 2), (-2.2, 3), "-|>", label: [Так], label-pos: 0.2),
    node((-2.2, 3), [Виведення «Помилка: $x > 0$»], shape: shapes.parallelogram, name: <t1-err>),
    edge(<t1-err>, (-2.2, 9), (0, 9), "-|>"),

    edge(<t1-if>, (0, 3), "-|>", label: [Ні], label-pos: 0.5),
    node((0, 3), [$t = y - z$], shape: rect, name: <t1-c1>),
    edge(<t1-c1>, (0, 4), "-|>"),

    node((0, 4), [$N = y - z^(y - z)$], shape: rect, name: <t1-c2>),
    edge(<t1-c2>, (0, 5), "-|>"),

    node((0, 5), [$D = 1 + x^2$], shape: rect, name: <t1-c3>),
    edge(<t1-c3>, (0, 6), "-|>"),

    node((0, 6), [$L = ln x$], shape: rect, name: <t1-c4>),
    edge(<t1-c4>, (0, 7), "-|>"),

    node((0, 7), [$f = t dot N slash D + L$], shape: rect, name: <t1-c5>),
    edge(<t1-c5>, (0, 8), "-|>"),

    node((0, 8), [Виведення $f$], shape: shapes.parallelogram, name: <t1-out>),
    edge(<t1-out>, (0, 9), "-|>"),

    node((0, 9), [Кінець], shape: rect, corner-radius: 10pt, name: <t1-end>),
  ),
)

#pagebreak()

// ============================================================
//  ЗАВДАННЯ 2 
// ============================================================
= ЗАВДАННЯ № 2

*Умова задачі:* Скласти алгоритм розв’язування задачі розгалуженого алгоритму відповідно до варіанта та зобразити його графічно у вигляді блок-схеми. Створити Python-програму. Варіанти завдань: Скласти програму для обчислення значення заданої функції y(x) за введеним з клавіатури значенням змінної x. Значення параметрів a, b або t задати самостійно.

Функція: $
  y = cases(
    sqrt(a + lg x) & text("       якщо ") x > 1,
    arcsin x & text("       якщо ") abs(x) < 1,
    x^a & text("       у решті випадків")
  )
$

== Програмна реалізація алгоритму

#code-style(
```
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
```
--- Курсова робота ---
--- Варіант 21 ---

--- Завдання 2 ---
Введіть значення: 5
Результат виконання завдання 2: 1.9490946627437105
```
]

== Блок-схема алгоритму

#flowchart(
  caption: "Друге завдання",
  diagram(
    node-stroke: dstu-stroke,
    spacing: (22mm, 12mm),
    mark-scale: 80%,

    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t2-start>),
    edge(<t2-start>, (0, 1), "-|>"),

    node((0, 1), [Введення $x$], shape: shapes.parallelogram, name: <t2-in>),
    edge(<t2-in>, (0, 2), "-|>"),

    node((0, 2), [$a = 3.1$], shape: rect, name: <t2-a>),
    edge(<t2-a>, (0, 3), "-|>"),

    node((0, 3), [$x > 1$], shape: shapes.diamond, name: <t2-if1>),

    // Гілка "Так" для x > 1 — ліворуч
    edge(<t2-if1>, (-2.2, 3), (-2.2, 5), "-|>", label: [Так], label-pos: 0.2),
    node((-2.2, 5), [$y = sqrt(a + lg x)$], shape: rect, name: <t2-b1>),

    // Гілка "Ні" для x > 1 — вниз до наступної умови
    edge(<t2-if1>, (0, 4), "-|>", label: [Ні], label-pos: 0.5),
    node((0, 4), [$abs(x) < 1$], shape: shapes.diamond, name: <t2-if2>),

    // Гілка "Так" для |x|<1 — вниз
    edge(<t2-if2>, (0, 5), "-|>", label: [Так], label-pos: 0.5),
    node((0, 5), [$y = arcsin x$], shape: rect, name: <t2-b2>),

    // Гілка "Ні" для |x|<1 — праворуч
    edge(<t2-if2>, (2.2, 4), (2.2, 5), "-|>", label: [Ні], label-pos: 0.2),
    node((2.2, 5), [$y = x^a$], shape: rect, name: <t2-b3>),

    // Збирання трьох гілок у точці (0, 6)
    edge(<t2-b1>, (-2.2, 6), (0, 6), "-|>"),
    edge(<t2-b2>, (0, 6), "-|>"),
    edge(<t2-b3>, (2.2, 6), (0, 6), "-|>"),

    node((0, 6), [Виведення $y$], shape: shapes.parallelogram, name: <t2-out>),
    edge(<t2-out>, (0, 7), "-|>"),

    node((0, 7), [Кінець], shape: rect, corner-radius: 10pt, name: <t2-end>),
  ),
)


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

Функція: $ f(x) = sum_(k=1)^6 ( sin(0.17 x^k) / (2k + x) ) $

== Програмна реалізація алгоритму

#code-style(
```
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
        sum += math.sin(0.17 * (x**k)) / ((2*k) + x)
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
        sum += math.sin(0.17 * (x**k)) / ((2*k) + x)
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
        sum += math.sin(0.17 * (x**k)) / ((2*k) + x)
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
```
--- Курсова робота ---
--- Варіант 21 ---

--- Завдання 3 ---
Введіть значення: -0.361
Виконання циклу з лічильником: 0.09331608870197027
Виконання циклу з передумовою: 0.09331608870197027
Виконання циклу з післяумовою: 0.09331608870197027
Результат виконання завдання 3: 0.09331608870197027
```
]

== Блок-схеми функцій

=== Блок-схема до основної функції third_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (22mm, 10mm),
    mark-scale: 80%,

    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t3-start>),
    edge(<t3-start>, (0, 1), "-|>"),

    node((0, 1), [Введення $x$], shape: shapes.parallelogram, name: <t3-in>),
    edge(<t3-in>, (0, 2), "-|>"),

    node((0, 2), [$r_1 = "for_cycle_third_task"(x)$], shape: rect, extrude: (2pt, 0pt), name: <t3-f1>),
    edge(<t3-f1>, (0, 3), "-|>"),

    node((0, 3), [$r_2 = "while_cycle_third_task"(x)$], shape: rect, extrude: (2pt, 0pt), name: <t3-f2>),
    edge(<t3-f2>, (0, 4), "-|>"),

    node((0, 4), [$r_3 = "while_true_cycle_third_task"(x)$], shape: rect, extrude: (2pt, 0pt), name: <t3-f3>),
    edge(<t3-f3>, (0, 5), "-|>"),

    node((0, 5), [Виведення $r_1, r_2, r_3$], shape: shapes.parallelogram, name: <t3-out>),
    edge(<t3-out>, (0, 6), "-|>"),

    node((0, 6), [$r_1 approx r_2 approx r_3$], shape: shapes.diamond, name: <t3-if>),

    edge(<t3-if>, (-2, 6), (-2, 7), "-|>", label: [Ні], label-pos: 0.2),
    node((-2, 7), [Помилка: \ «Результат відрізняється»], shape: shapes.parallelogram, name: <t3-err>),
    edge(<t3-err>, (-2, 8), (0, 8), "-|>"),

    edge(<t3-if>, (0, 7), "-|>", label: [Так], label-pos: 0.5),
    node((0, 7), [Повернути $r_1$], shape: rect, name: <t3-ret>),
    edge(<t3-ret>, (0, 8), "-|>"),

    node((0, 8), [Кінець], shape: rect, corner-radius: 10pt, name: <t3-end>),
  ),
)

=== Блок-схема до функції for_cycle_third_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 10mm),
    mark-scale: 80%,

    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t3f-start>),
    edge(<t3f-start>, (0, 1), "-|>"),

    node((0, 1), [Введення $x$], shape: shapes.parallelogram, name: <t3f-in>),
    edge(<t3f-in>, (0, 2), "-|>"),

    node((0, 2), [$S = 0$], shape: rect, name: <t3f-init>),
    edge(<t3f-init>, (0, 3), "-|>"),

    node((0, 3), [$k = 1, 6, 1$], shape: shapes.hexagon, name: <t3f-for>),
    edge(<t3f-for>, (0, 4), "-|>"),

    node((0, 4), [$S = S + sin(0.17 dot x^k) / (2*k + x)$], shape: rect, name: <t3f-body>),
    edge(<t3f-body>, (1.5, 4), (1.5, 3), <t3f-for>, "-|>"),

    edge(<t3f-for>, (-1.5, 3), (-1.5, 5), "-|>"),
    node((-1.5, 5), [Виведення $S$], shape: shapes.parallelogram, name: <t3f-out>),
    edge(<t3f-out>, (-1.5, 6), "-|>"),

    node((-1.5, 6), [Кінець], shape: rect, corner-radius: 10pt, name: <t3f-end>),
  ),
)

=== Блок-схема до функції while_cycle_third_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 10mm),
    mark-scale: 80%,

    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t3w-start>),
    edge(<t3w-start>, (0, 1), "-|>"),

    node((0, 1), [Введення $x$], shape: shapes.parallelogram, name: <t3w-in>),
    edge(<t3w-in>, (0, 2), "-|>"),

    node((0, 2), [$S = 0$, $k = 1$], shape: rect, name: <t3w-init>),
    edge(<t3w-init>, (0, 3), "-|>"),

    node((0, 3), [$k < 7$], shape: shapes.diamond, name: <t3w-if>),

    edge(<t3w-if>, (0, 4), "-|>", label: [Так], label-pos: 0.5),
    node((0, 4), [$S = S + sin(0.17 dot x^k) / (2*k + x)$], shape: rect, name: <t3w-body>),
    edge(<t3w-body>, (0, 5), "-|>"),

    node((0, 5), [$k = k + 1$], shape: rect, name: <t3w-inc>),
    edge(<t3w-inc>, (1.6, 5), (1.6, 3), <t3w-if>, "-|>"),

    edge(<t3w-if>, (-1.6, 3), (-1.6, 4), "-|>", label: [Ні], label-pos: 0.2),
    node((-1.6, 4), [Виведення $S$], shape: shapes.parallelogram, name: <t3w-out>),
    edge(<t3w-out>, (-1.6, 5), "-|>"),

    node((-1.6, 5), [Кінець], shape: rect, corner-radius: 10pt, name: <t3w-end>),
  ),
)

=== Блок-схема до функції while_true_cycle_third_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (22mm, 12mm),
    mark-scale: 80%,
    
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t3wt-start>),
    edge(<t3wt-start>, (0, 1), "-|>"),
    
    node((0, 1), [Введення $x$], shape: shapes.parallelogram, name: <t3wt-in>),
    edge(<t3wt-in>, (0, 2), "-|>"),
    
    node((0, 2), [$S = 0$, $k = 1$], shape: rect, name: <t3wt-init>),
    edge(<t3wt-init>, (0, 3), "-|>"),

    node((0, 3), [$S = S + sin(0.17 dot x^k) / (2*k + x)$], shape: rect, name: <t3wt-body>),
    edge(<t3wt-body>, (0, 4), "-|>"),

    node((0, 4), [$k = k + 1$], shape: rect, name: <t3wt-inc>),
    edge(<t3wt-inc>, (0, 5), "-|>"),

    node((0, 5), [$k >= 7$], shape: shapes.diamond, name: <t3wt-if>),
    edge(<t3wt-if>, (-1.6, 5), (-1.6, 3), <t3wt-body>, "-|>", label: [Ні], label-pos: 0.15),

    edge(<t3wt-if>, (0, 6), "-|>", label: [Так], label-pos: 0.5),
    node((0, 6), [Виведення $S$], shape: shapes.parallelogram, name: <t3wt-out>),
    edge(<t3wt-out>, (0, 7), "-|>"),

    node((0, 7), [Кінець], shape: rect, corner-radius: 10pt, name: <t3wt-end>),
  ),
)


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
```
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
```
--- Курсова робота ---
--- Варіант 21 ---

--- Завдання 4 ---
Введіть значення: 5
Результат виконання завдання 4: 22
```
]

== Блок-схема алгоритму

#flowchart(
  caption: "Четверте завдання",
  diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 10mm),
    mark-scale: 80%,
    
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t4-start>),
    edge(<t4-start>, (0, 1), "-|>"),
    
    node((0, 1), [Введення $n$], shape: shapes.parallelogram, name: <t4-in>),
    edge(<t4-in>, (0, 2), "-|>"),

    node((0, 2), [
      $A = ["randint"(0, 50)$ \
      $"для" _ "у діапазоні" [1, n]]$
    ], shape: rect, name: <t4-list>),
    edge(<t4-list>, (0, 3), "-|>"),

    node((0, 3), [$S = 0$], shape: rect, name: <t4-s>),
    edge(<t4-s>, (0, 4), "-|>"),

    node((0, 4), [для кожного $a in A$], shape: shapes.hexagon, name: <t4-for>),
    edge(<t4-for>, (0, 5), "-|>"),

    node((0, 5), [$a mod 2 != 0$], shape: shapes.diamond, name: <t4-if>),

    edge(<t4-if>, (0, 6), "-|>", label: [Так], label-pos: 0.5),
    node((0, 6), [$S = S + a$], shape: rect, name: <t4-add>),
    edge(<t4-add>, (1.6, 6), (1.6, 4), <t4-for>, "-|>"),

    edge(<t4-if>, (1.6, 5), (1.6, 4), <t4-for>, "-|>", label: [Ні], label-pos: 0.15),

    edge(<t4-for>, (-1.6, 4), (-1.6, 7), "-|>"),
    node((-1.6, 7), [Виведення $S$], shape: shapes.parallelogram, name: <t4-out>),
    edge(<t4-out>, (-1.6, 8), "-|>"),

    node((-1.6, 8), [Кінець], shape: rect, corner-radius: 10pt, name: <t4-end>),
  ),
)

#pagebreak()

// ============================================================
//  ЗАВДАННЯ 5
// ============================================================

= ЗАВДАННЯ № 5

*Умова задачі:* 
1. Обчислити елементи двовимірного масиву (матриці) розмірності 5 × 5, aij, де i,j = 1, 2, 3, 4, 5 за формулою, наведеною у таблиці відповідно до номера варіанта.
2. Використовуючи елементи двовимірного масиву aij обчислити елементи
одновимірного масиву (вектора) Xi (i = 0, 1, 2, 3, 4), за завданням, наведеним

у таблиці відповідно до номера варіанта.

3. В програмі використати чотири підпрограми:

1) для обчислення елементів двовимірного масиву (матриці);
2) для обчислення елементів одновимірного масиву (вектора);
3) для виведення елементів двовимірного масиву (матриці);
4) для виведення елементів одновимірного масиву (вектора).

4. Скласти блок-схеми для цих підпрограм.

== Програмна реалізація алгоритму

#code-style(
```
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


def print_matrix_fifth_task(matrix: help.Matrix1Based[float]):
    """Вивід матриці

    Args:
        matrix (help.Matrix1Based[float]): Матриця, яку потрібно буде вивести (виводить з елемента з індексом 0, а не 1)
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

def main():
    print("--- Курсова робота ---")
    print("--- Варіант 21 ---")

    tasks = [
        # ("Завдання 1", first_task, float, 3),
        # ("Завдання 2", second_task, float, 1),
        # ("Завдання 3", third_task, float, 1),
        # ("Завдання 4", fourth_task, int, 1)
    ]

    for title, func, data_type, args_count in tasks:
        print(f"\n--- {title} ---")
        
        data: list[list] = help.input_variables(data_type, amount=args_count)

        result = func(*data[0])
        
        print(f"Результат виконання {title.lower()}: {result}")
    
    print("\n--- Завдання 5 ---")
    fifth_task()

if __name__ == "__main__":
    main()

```
)

== Результат виконання коду

#result[
```
--- Курсова робота ---
--- Варіант 21 ---

--- Завдання 5 ---
Створена матриця:

                Стовп. 1    Стовп. 2    Стовп. 3    Стовп. 4    Стовп. 5
           ┌────────────────────────────────────────────────────────────
  Рядок 1  │       3.828       3.481       3.412       3.423       3.462
  Рядок 2  │       7.000       5.330       4.623       4.332       4.228
  Рядок 3  │      11.937       8.681       7.000       6.121       5.658
  Рядок 4  │      19.287      13.621      10.544       8.826       7.838
  Рядок 5  │      30.967      20.980      15.576      12.555      10.798

Створений вектор:
17.607 39.398 90.876
```
]

== Блок-схеми підпрограм

=== Блок-схема функції fifth_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (22mm, 10mm),
    mark-scale: 80%,
    
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t5m-start>),
    edge(<t5m-start>, (0, 1), "-|>"),
    
    node((0, 1), [$h = 5$, $w = 5$], shape: rect, name: <t5m-hw>),
    edge(<t5m-hw>, (0, 2), "-|>"),
    
    node((0, 2), [$M = "create_matrix_fifth_task"(h, w)$], shape: rect, extrude: (2pt, 0pt), name: <t5m-cm>),
    edge(<t5m-cm>, (0, 3), "-|>"),
    
    node((0, 3), [$V = "create_vector_fifth_task"(M)$], shape: rect, extrude: (2pt, 0pt), name: <t5m-cv>),
    edge(<t5m-cv>, (0, 4), "-|>"),
    
    node((0, 4), [$"print_matrix_fifth_task"(M)$], shape: rect, extrude: (2pt, 0pt), name: <t5m-pm>),
    edge(<t5m-pm>, (0, 5), "-|>"),
    
    node((0, 5), [$"print_vector_fifth_task"(V)$], shape: rect, extrude: (2pt, 0pt), name: <t5m-pv>),
    edge(<t5m-pv>, (0, 6), "-|>"),
    
    node((0, 6), [Кінець], shape: rect, corner-radius: 10pt, name: <t5m-end>),
  ),
)

=== Блок-схема функції create_matrix_fifth_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 10mm),
    mark-scale: 80%,
    
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t5cm-start>),
    edge(<t5cm-start>, (0, 1), "-|>"),
    
    node((0, 1), [Отримання $h, w$], shape: shapes.parallelogram, name: <t5cm-in>),
    edge(<t5cm-in>, (0, 2), "-|>"),
    
    node((0, 2), [$M = "Matrix1Based"(h, w)$], shape: rect, name: <t5cm-init>),
    edge(<t5cm-init>, (0, 3), "-|>"),
    
    node((0, 3), [$i = 1, h, 1$], shape: shapes.hexagon, name: <t5cm-fi>),
    edge(<t5cm-fi>, (0, 4), "-|>"),
    
    node((0, 4), [$j = 1, w, 1$], shape: shapes.hexagon, name: <t5cm-fj>),
    edge(<t5cm-fj>, (0, 5), "-|>"),
    
    node((0, 5), [$M_(i,j) = (3+i)/(i+j) dot sqrt(i^3 + j^2) + 2^(i-j)$], shape: rect, name: <t5cm-body>),
    edge(<t5cm-body>, (2, 5), (2, 4), <t5cm-fj>, "-|>"),
    
    edge(<t5cm-fj>, (-1.7, 4), (-1.7, 3), <t5cm-fi>, "-|>"),
    
    edge(<t5cm-fi>, (2.2, 3), (2.2, 6), "-|>"),
    node((2.2, 6), [Повернути $M$], shape: shapes.parallelogram, name: <t5cm-ret>),
    edge(<t5cm-ret>, (2.2, 7), "-|>"),
    
    node((2.2, 7), [Кінець], shape: rect, corner-radius: 10pt, name: <t5cm-end>),
  ),
)

=== Блок-схема функції create_vector_fifth_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (8mm, 10mm),
    mark-scale: 80%,
    
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t5cv-start>),
    edge(<t5cv-start>, (0, 1), "-|>"),
    
    node((0, 1), [Введення $M$], shape: shapes.parallelogram, name: <t5cv-in>),
    edge(<t5cv-in>, (0, 2), "-|>"),
    
    node((0, 2), [$V = [ ]$], shape: rect, name: <t5cv-init>),
    edge(<t5cv-init>, (0, 3), "-|>"),

    node((0, 3), [$i = 1, M."rows", 2$], shape: shapes.hexagon, name: <t5cv-for-i>),
    edge(<t5cv-for-i>, (0, 4), "-|>"),
    
    node((0, 4), [$"row_sum" = 0.0$], shape: rect, name: <t5cv-rs>),
    edge(<t5cv-rs>, (0, 5), "-|>"),
    
    node((0, 5), [$j = 1, M."cols", 1$], shape: shapes.hexagon, name: <t5cv-for-j>),
    edge(<t5cv-for-j>, (0, 6), "-|>"),
    
    node((0, 6), [$M_(i,j) != "None"$], shape: shapes.diamond, name: <t5cv-if>),

    edge(<t5cv-if>, (1.5, 6), "-|>", label: [Так], label-pos: 0.2),
    node((1.5, 6), [$"row_sum" += M_(i,j)$], shape: rect, name: <t5cv-add>),
    edge(<t5cv-add>, (1.5, 5), <t5cv-for-j>, "-|>"),

    edge(<t5cv-if>, (-1.5, 6), (-1.5, 5), <t5cv-for-j>, "-|>", label: [Ні], label-pos: 0.2),

    edge(<t5cv-for-j>, (2.5, 5), (2.5, 7), (0, 7), "-|>"),
    node((0, 7), [$V."append"("row_sum")$], shape: rect, name: <t5cv-app>),

    edge(<t5cv-app>, (-2.5, 7), (-2.5, 3), <t5cv-for-i>, "-|>"),

    edge(<t5cv-for-i>, (3.8, 3), (3.8, 8), "-|>"),
    node((3.8, 8), [Повернути $V$], shape: shapes.parallelogram, name: <t5cv-ret>),
    edge(<t5cv-ret>, (3.8, 9), "-|>"),
    
    node((3.8, 9), [Кінець], shape: rect, corner-radius: 10pt, name: <t5cv-end>),
  ),
)

=== Блок-схема функції print_matrix_fifth_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 10mm),
    mark-scale: 80%,
    
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t5pm-start>),
    edge(<t5pm-start>, (0, 1), "-|>"),
    
    node((0, 1), [Введення $M$], shape: shapes.parallelogram, name: <t5pm-in>),
    edge(<t5pm-in>, (0, 2), "-|>"),
    
    node((0, 2), [Виведення\ порожнього рядка], shape: shapes.parallelogram, name: <t5pm-nl>),
    edge(<t5pm-nl>, (0, 3), "-|>"),
    
    node((0, 3), [Виведення $M$], shape: shapes.parallelogram, name: <t5pm-out>),
    edge(<t5pm-out>, (0, 4), "-|>"),
    
    node((0, 4), [Кінець], shape: rect, corner-radius: 10pt, name: <t5pm-end>),
  ),
)

=== Блок-схема функції print_vector_fifth_task
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 10mm),
    mark-scale: 80%,
    
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <t5pv-start>),
    edge(<t5pv-start>, (0, 1), "-|>"),
    
    node((0, 1), [Введення $V$], shape: shapes.parallelogram, name: <t5pv-in>),
    edge(<t5pv-in>, (0, 2), "-|>"),
    
    node((0, 2), [Форматування ел-тів $V$\ (3 знаки після коми)], shape: rect, name: <t5pv-fmt>),
    edge(<t5pv-fmt>, (0, 3), "-|>"),
    
    node((0, 3), [Виведення вектора], shape: shapes.parallelogram, name: <t5pv-out>),
    edge(<t5pv-out>, (0, 4), "-|>"),
    
    node((0, 4), [Кінець], shape: rect, corner-radius: 10pt, name: <t5pv-end>),
  ),
)

#pagebreak()


// ============================================================
//  ДОДАТОК А
// ============================================================
#heading[ДОДАТОК А]
#align(center)[#text(weight: "bold")[Програмний код допоміжного модуля (help.py)]]

#v(1em)
#code-style(
```
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
        res: list[str] = []
        for row in self._data:
            res.append(
                " | ".join([str(item) if item is not None else "---" for item in row])
            )
        return "\n".join(res)

    def get(self) -> list[list[T | None]]:
        """Повертає raw-дані для обробки."""
        return self._data
```
)
== Блок-схеми підпрограм

=== Блок-схема функції input_variables
#flowchart(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (5mm, 14mm),
    mark-scale: 80%,
    
    // 1. Початок
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <start>),
    edge(<start>, (0, 1), "-|>"),
    
    // 2. Умова (Перевірка amount)
    node((0, 1), [ amount < 1 ], shape: shapes.diamond, name: <check-amount>),
    edge(<check-amount>, (1, 1), "-|>", label: [Так], label-pos: 0.2),
    node((1, 1), [ValueError ], shape: rect, name: <err-amount>),
    
    // 3. Ініціалізація
    edge(<check-amount>, (0, 2), "-|>", label: [Ні], label-pos: 0.2),
    node((0, 2), [ actual_cols = ... \ result = [] ], shape: rect, name: <init>),
    edge(<init>, (0, 3), "-|>"),
    
    // 4. Цикл FOR (по рядках)
    node((0, 3), [ r = 0, rows-1, 1 ], shape: shapes.hexagon, name: <for-r>),
    edge(<for-r>, (0, 4), "-|>"),
    
    // 5. Тіло циклу
    node((0, 4), [ Формування\ підказки (prompt) ], shape: rect, name: <prompt>),
    edge(<prompt>, (0, 5), "-|>"),
    
    node((0, 5), [ Введення рядка line ], shape: shapes.parallelogram, name: <input>),
    edge(<input>, (0, 6), "-|>"),
    
    // 6. Виклик вкладеної функції
    node((0, 6), [ Виклик process_line() ], shape: rect, extrude: (2pt, 0pt), name: <process>),
    edge(<process>, (0, 7), "-|>"),
    
    // 7. Перевірка на помилки
    node((0, 7), [ Виникла\ помилка? ], shape: shapes.diamond, name: <check-err>),
    
    // Гілка з помилкою
    edge(<check-err>, (-1.2, 7), "-|>", label: [Так], label-pos: 0.2),
    node((-1.2, 7), [ Виведення\ попередження ], shape: shapes.parallelogram, name: <print-warn>),
    edge(<print-warn>, (-1.2, 4), (0, 4), "-|>"), 
    
    // Гілка успіху
    edge(<check-err>, (0, 8), "-|>", label: [Ні], label-pos: 0.2),
    node((0, 8), [ result.append(row) ], shape: rect, name: <append>),
    
    // Повернення в цикл FOR
    edge(<append>, (1.2, 8), (1.2, 3), (0.6, 3), <for-r>, "-|>"),
    
    // 8. Вихід з циклу FOR
    edge(<for-r>, (2.2, 3), (2.2, 9), "-|>"),
    node((2.2, 9), [ Повернення result ], shape: shapes.parallelogram, name: <ret>),
    edge(<ret>, (2.2, 10), "-|>"),
    
    // 9. Кінець
    node((2.2, 10), [Кінець], shape: rect, corner-radius: 10pt, name: <end>),
  ),
)

=== Блок-схема функції process_line

#flowchart(
    diagram(
    node-stroke: dstu-stroke,
    spacing: (20mm, 12mm),
    mark-scale: 80%,
    
    // 1. Початок
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <start>),
    edge(<start>, (0, 1), "-|>"),
    
    // 2. Розбиття рядка
    node((0, 1), [ parts = line.split() ], shape: rect, name: <split>),
    edge(<split>, (0, 2), "-|>"),
    
    // 3. Умова перевірки кількості
    node((0, 2), [ len(parts) < exp ], shape: shapes.diamond, name: <chk-len>),
    edge(<chk-len>, (1.5, 2), "-|>", label: [Так], label-pos: 0.2),
    node((1.5, 2), [ ValueError ], shape: rect, name: <err1>),
    
    // 4. Обрізка і конвертація
    edge(<chk-len>, (0, 3), "-|>", label: [Ні], label-pos: 0.2),
    node((0, 3), [ parts = parts[:exp] ], shape: rect, name: <slice>),
    edge(<slice>, (0, 4), "-|>"),
    
    node((0, 4), [ Конвертація parts в T ], shape: rect, name: <conv>),
    edge(<conv>, (0, 5), "-|>"),
    
    // 5. Перевірка успішності конвертації
    node((0, 5), [ Помилка\ конвертації? ], shape: shapes.diamond, name: <chk-conv>),
    edge(<chk-conv>, (1.5, 5), "-|>", label: [Так], label-pos: 0.2),
    node((1.5, 5), [ ValueError ], shape: rect, name: <err2>),
    
    // 6. Цикл валідації
    edge(<chk-conv>, (0, 6), "-|>", label: [Ні], label-pos: 0.2),
    node((0, 6), [ val у parsed ], shape: shapes.hexagon, name: <for-val>),
    edge(<for-val>, (0, 7), "-|>"),
    
    // 7. Валідація довжини
    node((0, 7), [ Довжина\ некоректна? ], shape: shapes.diamond, name: <chk-len2>),
    edge(<chk-len2>, (1.5, 7), "-|>", label: [Так], label-pos: 0.2),
    node((1.5, 7), [ ValueError ], shape: rect, name: <err3>),
    
    // 8. Валідація діапазону
    edge(<chk-len2>, (0, 8), "-|>", label: [Ні], label-pos: 0.2),
    node((0, 8), [ Поза лімітами\ (min/max)? ], shape: shapes.diamond, name: <chk-lim>),
    edge(<chk-lim>, (1.5, 8), "-|>", label: [Так], label-pos: 0.2),
    node((1.5, 8), [ ValueError ], shape: rect, name: <err4>),
    
    // 9. Кастомний валідатор
    edge(<chk-lim>, (0, 9), "-|>", label: [Ні], label-pos: 0.2),
    node((0, 9), [ Не пройшло\ validator? ], shape: shapes.diamond, name: <chk-val>),
    edge(<chk-val>, (1.5, 9), "-|>", label: [Так], label-pos: 0.2),
    node((1.5, 9), [ ValueError ], shape: rect, name: <err5>),
    
    // Повернення на наступну ітерацію циклу
    edge(<chk-val>, (-1, 9), (-1, 6), <for-val>, "-|>", label: [Ні], label-pos: 0.1),
    
    // 10. Вихід з циклу
    edge(<for-val>, (2.5, 6), (2.5, 10), "-|>"),
    node((2.5, 10), [ Повернення parsed ], shape: shapes.parallelogram, name: <ret>),
    edge(<ret>, (2.5, 11), "-|>"),
    
    // 11. Кінець
    node((2.5, 11), [Кінець], shape: rect, corner-radius: 10pt, name: <end>),
  ),
)