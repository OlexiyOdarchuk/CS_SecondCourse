import math


def theFirst():
    print("\n--- Перше завдання ---і")
    p = 1
    for k in range(3, 12 + 1):
        p *= k**2 * (1 + math.cosh(k))
    return f"p = {p:.0f}"


def theSecond():
    print("\n--- Друге завдання ---і")
    terms = ["миша", "біт", "біт", "принтер", "сканер", "біт", "монітор", "байт"]
    return "біт " * terms.count("біт")


def main():
    print("--- Варіант 21 ---")
    print(theFirst())
    print(theSecond())


if __name__ == "__main__":
    main()
