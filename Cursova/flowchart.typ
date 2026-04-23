#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#set text(font: "Times New Roman", lang: "uk", size: 10pt)

#let dstu-stroke = 0.7pt
#let shapes = fletcher.shapes

#figure(
  diagram(
    node-stroke: dstu-stroke,
    spacing: (18mm, 12mm),
    mark-scale: 80%,
    
    // 1. ПОЧАТОК
    node((0, 0), [Початок], shape: rect, corner-radius: 10pt, name: <start>),
    edge(<start>, (0, 1), "-|>"),
    
    // 2. ВВІД (Дані)
    node((0, 1), [Введення $A, n$], shape: shapes.parallelogram, name: <input>),
    edge(<input>, (0, 2), "-|>"),
    
    // 3. ПІДГОТОВКА (Цикл FOR - шестикутник за ДСТУ)
    node((0, 2), [ $i = 1, n, 1$ ], shape: shapes.hexagon, name: <for-loop>),
    edge(<for-loop>, (0, 3), "-|>"),
    
    // 4. ПРЕДУСТАНОВЛЕНИЙ ПРОЦЕС (Виклик функції/метод)
    node((0, 3), [ Виклик $f(A)$ ], shape: rect, extrude: (2pt, 0pt), name: <subroutine>),
    edge(<subroutine>, (0, 4), "-|>"),
    
    // 5. РІШЕННЯ (Умова IF)
    node((0, 4), [ $A[i] > 0$ ], shape: shapes.diamond, name: <if-cond>),
    
    // Гілка ТАК (прямо праворуч, без corner)
    edge(<if-cond>, (1, 4), "-|>", label: [Так], label-pos: 0.1),
    node((1, 4), [ $S = S + A[i]$ ], shape: rect, name: <process-1>),
    
    // Гілка НІ (прямо вниз)
    edge(<if-cond>, (0, 5), "-|>", label: [Ні], label-pos: 0.5),
    node((0, 5), [ $S = S - 1$ ], shape: rect, name: <process-2>),
    
    // Повернення в цикл (повністю ручне трасування точками)
    edge(<process-1>, (1, 6), (0, 6), "-|>"),
    edge(<process-2>, (0, 6), "-|>"),
    edge((0, 6), (-1, 6), (-1, 2), <for-loop>, "-|>"),
    
    // 6. ВИВІД ТА З'ЄДНУВАЧ
    // Вихід з циклу вправо і вниз (без corner)
    edge(<for-loop>, (1.5, 2), (1.5, 7), "-|>"),
    node((1.5, 7), [Виведення $S$], shape: shapes.parallelogram, name: <output>),
    edge(<output>, (1.5, 8), "-|>"),
    
    // 7. КІНЕЦЬ
    node((1.5, 8), [Кінець], shape: rect, corner-radius: 10pt, name: <end>),
    
    // Додатково: З'єднувач (коло)
    node((2.5, 7), [1], shape: circle, radius: 5pt, name: <conn>),
  ),
  caption: [Повна еталонна блок-схема згідно ДСТУ 19.701-90],
)