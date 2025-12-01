class TheFourth:
    def __init__(
        self,
        writers={
            "Іван Франко": "1856 – 1916",
            "Маркіян Шашкевич": "1811 – 1843",
            "Ольга Кобилянська": "1863 – 1942",
            "Осип Маковей": "1867 – 1925",
        },
        addWriterName="Леся Українка",
        addWriterYears="1871 – 1913",
        checkList=["Марко Вовчок", "Ольга Кобилянська"],
        targetWriter="Маркіян Шашкевич",
    ):
        self.writers = writers
        self.addWriterName = addWriterName
        self.addedWriterYears = addWriterYears
        self.checkList = checkList
        self.targetWriter = targetWriter

    def add_writer(self, name, years):
        self.writers[name] = years

    def check_presence(self, name):
        return name in self.writers

    def get_years_of_life(self, name):
        return self.writers.get(name, "Не знайдено")

    def run(self):
        print("\n--- Завдання 4. Словник українських письменників ---")
        print(f"Початковий словник: {self.writers}")

        self.add_writer(self.add_writer, self.addedWriterYears)
        print(f"\nПісля додавання {self.addWriterName}: {self.writers}")

        print("\nПеревірка наявності:")
        for name in self.checkList:
            is_present = self.check_presence(name)
            print(f"'{name}': {'Так' if is_present else 'Ні'}")

        years = self.get_years_of_life(self.targetWriter)
        print(f"\nРоки життя {self.targetWriter}: {years}")
        print("-" * 50)
