﻿#language: ru

@tree

Функционал: модуль 5 урок 4 циклы

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

//Контекст:
//	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
//
//Сценарий: изменени количества во всех строках таблицы
//
//	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
//		И в таблице "ItemList" в поле "Количество" я ввожу текст "10,00"
//	
//Сценарий: удаление строк таблицы
//
//	И пока в таблице "ItemList" количество строк ">" 0 Тогда
//		И в таблице "ItemList" я удаляю строку
		
Сценарий: изменение вида цен по условию

	И для каждой строки таблицы "ItemList" я выполняю
		Если таблица "ItemList" содержит строки Тогда:
			| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
			| 'Товар с характеристиками' | 'S/Красный'      | 'Ручное назначение' |
			И в таблице 'ItemList' я перехожу к строке
				| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
				| 'Товар с характеристиками' | 'S/Красный'      | 'Ручное назначение' |
			И в таблице 'ItemList' я выбираю текущую строку
			И в таблице 'ItemList' я нажимаю кнопку выбора у реквизита с именем 'ItemListPriceType'
			И в таблице 'List' я перехожу к строке:
				| "Валюта" | "Код" | "Наименование"      | "Ссылка"            |
				| "USD"    | "3"   | "Цена поставщика 1" | "Цена поставщика 1" |
			И в таблице 'List' я выбираю текущую строку	
	И таблица "ItemList" не содержит строки:
		| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
		| 'Товар с характеристиками' | 'S/Красный'      | 'Ручное назначение' |
				
// попытка выйти из бесконечного цикла, когда последняя строка не соответсвует условию из урока

Сценарий: перебор элеметов справочника Номенклатура
	
	И я активизирую окно текущего клиента тестирования
	И для каждой строки таблицы "List" я выполняю
		И в таблице "List" я выбираю текущую строку
		Тогда не появилось окно предупреждения системы
		И я закрываю текущее окно
		
Сценарий: создание большого объёма данных (справочник ед. измерения)

	И я запоминаю значение выражения '0' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"ед.изм." + $Шаг$' в переменную "ЕдиницаИзмерения"
		И я проверяю или создаю для справочника "Units" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en'     | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | ''     | 1          | ''          | ''    | '$ЕдиницаИзмерения$' | ''                 | ''               | ''               |          |          |          |          |         |

	
		
	
	
					
		