# oparser

[![OCaml](https://img.shields.io/badge/OCaml-ec6813?style=for-the-badge&logo=ocaml&logoColor=white)](https://ocaml.org/) [![Menhir](https://img.shields.io/badge/Menhir-FF6600?style=for-the-badge)](http://www.menhir.org/) [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/) [![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5)

`oparser` — инструмент для парсинга Java-кода и визуализации его AST дерева. Проект состоит из двух модулей:

- **parser** — анализ исходного кода.
- **visualize** — генерация и отображение AST дерева.

---

## Содержание

- [О проекте](#о-проекте)
- [Технологии](#технологии)
- [Начало работы](#начало-работы)
- [Сборка и запуск](#сборка-и-запуск)
- [Документация](#документация)
- [Контакты](#контакты)
- [Лицензия](#лицензия)

---

## О проекте

`oparser` создан для автоматизации анализа исходного кода Java и визуализации его абстрактного синтаксического дерева (AST). Благодаря разделению на два модуля — **parser** и **visualize** — проект помогает быстро понять структуру кода, облегчая анализ, отладку и документирование.

---

## Технологии

Проект использует следующие инструменты:

- [![OCaml](https://img.shields.io/badge/OCaml-ec6813?style=for-the-badge&logo=ocaml&logoColor=white)](https://ocaml.org/)
- [![Menhir](https://img.shields.io/badge/Menhir-FF6600?style=for-the-badge)](http://www.menhir.org/)
- [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
- [![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5)

---

## Начало работы

Перед тем как приступить к работе с `oparser`, убедитесь, что у вас установлен [OCaml](https://ocaml.org/docs/installing-ocaml).

Далее установите Menhir через opam:
```sh
opam install menhir
```

## Сборка и запуск
1. Подготовка файлов

Перед сборкой необходимо удалить тела методов в тестовом классе. Выполните следующую команду:
```sh
python3 visualize/remove_method_bodies.py parser/test/TestClass.java parser/test/TestClassStripped.java
```

2. Сборка проекта

Соберите проект с помощью dune:
```sh
dune build
```
3. Запуск парсера

Запустите парсер, который обработает исходный файл и сгенерирует AST в формате JSON:
```sh
dune exec ./parser/bin/main.exe parser/test/TestClassStripped.java visualize/ast.json
```

4. Запуск HTTP сервера

Запустите простой HTTP сервер для просмотра визуализации:
```sh
python3 -m http.server 8000
```

Откройте в браузере https://localhost:8080 и наслаждайтесь визуализацией AST дерева.

## Документация
Чтобы ознакомиться с документацией модуля parser, выполните следующие шаги:

1. Установите odoc:

```sh
opam install odoc
```

2. Соберите документацию:

```sh
dune build @doc
```

3. Откройте сгенерированную документацию:

```sh
open _build/default/_doc/_html/index.html
```

## Контакты
Telegram: 
- @weebat - по всем вопросам не связанным с работой обитаю тут
- @batapejka - рабочий аккаунт
Email: batareyka.work@gmail.com

## Лицензия 

Этот проект распространяется под лицензией MIT License. См. файл LICENSE.txt для подробной информации.
