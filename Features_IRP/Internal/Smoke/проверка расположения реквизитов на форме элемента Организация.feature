﻿#language: ru

@tree
@SmokeTest

Функционал: проверка расположения реквизитов на форме элемента Организация

Как Тестировщик я хочу
проверить расположение реквизитов на форме элемента организации
чтобы всё выглядело красиво   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка расположения реквизитов на форме элемента Организация
	И В командном интерфейсе я выбираю "Справочники" "Организации"
	Тогда открылось окно "Организации"
	И я нажимаю на кнопку с именем 'FormCreate'
	@Screenshot
	Тогда открылось окно "Организация (создание)"