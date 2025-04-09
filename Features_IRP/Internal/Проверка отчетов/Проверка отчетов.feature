﻿#language: ru

@tree
@Отчеты

Функционал: тестирование отчетов

Как Тестировщик я хочу
протестировать отчеты 
чтобы проверить что у пользователя не возникнет проблем   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0901 подготовительный сценарий (тестирование отчетов)

	Когда экспорт основных данных
	Когда экспорт документов закупок
	И я выполняю код встроенного языка на сервере
		| 'Документы.PurchaseOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'   |
		| 'Документы.PurchaseOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'   |
		| 'Документы.PurchaseOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'   |
		| 'Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.PurchaseInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |

Сценарий: _0902 проверка очета Информация о товарах

	И В командном интерфейсе я выбираю "Отчеты" "D0010 Информация по товарам"
	Тогда открылось окно "D0010 Информация по товарам"
	И я нажимаю на кнопку с именем 'FormGenerate'
	Дано Табличный документ "Result" равен макету "ИнформацияПоТоварам1" по шаблону
	И в табличном документе "Result" ячейка с адресом "R9C3" равна "78788989*" по шаблону
	
Сценарий: _0903 проверка очета по Закупкам

	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Отчеты" "D1001 Закупки"
	Тогда открылось окно "D1001 Закупки"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R16C4" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Закупки1" по шаблону
			
				