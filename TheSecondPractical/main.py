from tasks import TheFirst, TheSecond, TheThird, TheFourth, TheFifth


def main():
    print("--- ЗАПУСК ВСІХ ЗАВДАНЬ ---")

    calculator = TheFirst(10)
    calculator.run()

    list_handler = TheSecond()
    list_handler.run()

    list_editor = TheThird()
    list_editor.run()

    writer_manager = TheFourth()
    writer_manager.run()

    calculator2 = TheFifth()
    calculator2.run()


if __name__ == "__main__":
    main()
