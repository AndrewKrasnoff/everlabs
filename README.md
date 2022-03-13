# README

## This is test application

### Task description

1. Створити кастомну адмінку за допомогою якої буде можливість створювати об’єкти:

    1.1 Усі лінки в адмін панелі мають починатися із ‘/admin’

    1.2 Додати сторінку логінки для адмінів (самого адміна створити через сіди/консоль)

    1.3 Має бути можливість створити об’єкт (може бути будь-яка модель) із полями (:title, :body, :position)

    1.4 При створенні/редагуванні об’єкта для поля ‘body’ має бути доданий редактор

2. Для Юзeрів

    2.1 Головне сторінка - індекс усіх створених об'єктів в адмін панелі

    2.2 Має бути сортування записів за наступними параметрами:

      2.2.1 - created_at

      2.2.2 - updated_at

      2.2.3 - top 5 (вивести перших 5 елементів по позиції)

      2.2.4 - last 5 (вивести останніх 5 елементів по позиції)

      2.2.5 - Юзер повинен мати змогу відсортувати від меншого до більшого і навпаки за кожним параметром окремо або разом.

    2.3. Додати пошук на сторінку. Пошук повинен повернути усі результати, які    містять текст із запиту в title, body.

3. Додати можливість писати коментарі до кожного елементу на сторінці. Коментарі по дефолту мають бути захованими. Якщо є хоча б один коментар, то на сторінці має бути кнопка “Показати коментар”, яка відкриє список з усіма коментарями.
