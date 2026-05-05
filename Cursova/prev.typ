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
  ```,
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
