# Параллельное вычисление суммы массива

## Постановка задачи

Проект состоит из двух независимых программ - клиента и сервера

Сервер запускается в отдельном процессе и принимает сообщения от клиентов, выводя их на консоль при получении

Клиенты подключаются к серверу в отдельных процессах. В консоль вводится текстовое сообщение, которое отправляется серверу. Сервер поддерживает произвольное количество клиентов одновременно

Взаимодействие между клиентами и сервером происходит с помощью сокетов

## Запуск

Для запуска программы нужна установленная библиотека [luasocket](https://github.com/lunarmodules/luasocket)

Программа тестировалась с Lua версии 5.1 и luasocket установленную с помощью пакетного менеджера [luarocks](https://github.com/luarocks/luarocks)

Проект состоит из двух программ: клиента и сервера. Обе запускаются из корневой директории проекта

Для запуска сервера используется команда `lua server.lua`. Для запуска могут понадобиться привилегии суперюзера

Для запуска клиента в отдельном терминале используется команда `lua client.lua`