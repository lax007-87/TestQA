﻿#language: ru

@tree
@SmokeTest

Функционал: проверка константы использовать организации

Как Тетсировщик я хочу
проверить работу константы использовать организации
чтобы убедиться в правильности её работы   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка константы использовать организации
	И Я устанавливаю в константу "UseCompanies" значение "False"
	И Пауза 5
	И В командном интерфейсе я выбираю "Продажи" "Заказы покупателей"
	Тогда открылось окно "Заказы покупателей"
	И я нажимаю на кнопку с именем 'FormCreate'
	И элемент формы с именем 'Company' существует и невидим на форме
	И я закрываю все окна клиентского приложения
	И Я устанавливаю в константу "UseCompanies" значение "True"	
	И Пауза 5
//	Когда Проверяю шаги на Исключение: //Проверка негативных кейсов
//		|'И элемент формы с именем 'Company' существует и невидим на форме'|
		