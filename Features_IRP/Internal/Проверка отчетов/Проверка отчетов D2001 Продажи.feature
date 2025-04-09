﻿#language: ru

@tree
@Отчеты

Функционал: тестирование отчета D2001 Продажи

Как Тестировщик я хочу
протестировать отчет D2001 Продажи
чтобы проверить что у пользователя не возникнет проблем   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: _0412 подготовительный сценарий (тестирование отчета D2001 Продажи)

	Когда экспорт основных данных
	Когда загрузка документов Реализации и Возврата товаров
	И я выполняю код встроенного языка на сервере
		| 'Документы.SalesInvoice.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.SalesInvoice.НайтиПоНомеру(4).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.SalesReturn.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'  |
		| 'Документы.SalesReturn.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'  |

Сценарий: _0413 проверка очета D2001 Продажи

	И В командном интерфейсе я выбираю "Отчеты" "D2001 Продажи"
	Тогда открылось окно "D2001 Продажи"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R8C2" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Продажи1" по шаблону
					