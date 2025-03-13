import re
import sys


def remove_method_bodies(code):
    """
    Удаляет тела методов и конструкторов из Java-кода с использованием регулярных выражений.
    """

    pattern = re.compile(r'''
        (
            (public|private|protected|static|final|abstract|\s)+      # Модификаторы
            [\w\<\>\[\]]+\s+                                         # Возвращаемый тип
            \w+\s*                                                   # Имя метода
            \([^)]*\)\s*                                             # Параметры
            \{                                                       # Открывающая скобка тела
        )
        ([^{}]*?)                                                   # Тело метода (без вложенных скобок)
        (\})                                                        # Закрывающая скобка тела
    ''', re.VERBOSE | re.DOTALL)

    def replacer(match):
        return match.group(1) + ' }'

    new_code = pattern.sub(replacer, code)
    return new_code


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Использование: python remove_method_bodies_regex.py <input.java> <output.java>")
        sys.exit(1)

    input_java = sys.argv[1]
    output_java = sys.argv[2]

    with open(input_java, 'r', encoding='utf-8') as f:
        code = f.read()

    stripped_code = remove_method_bodies(code)

    with open(output_java, 'w', encoding='utf-8') as f:
        f.write(stripped_code)

    print(f"Модифицированный код сохранён в {output_java}")
