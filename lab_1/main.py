import pandas
import random

def main():
	
	#city(10)
 	#nomer(1000)
	#chelovek(10)
	sadnnie_nomera(1000)
	#chelovek(1000)



def city(n):
	'''
	df1 = pandas.read_csv('cities.csv', sep = ';')
	array_people = [random.randint(10000, 10000000) for i in range(1000)]
	d = {'Population': array_people}
	df2 = pandas.DataFrame(data = d)
	df = pandas.merge(df1, df2, left_index = True, right_index = True)
	df.to_csv('out.csv', sep = ';', index = False)
	
	#df_country.drop(['city_id'], axis = 1, inplace = True)

	#df = pandas.merge(df_city, df_country, on='country_id', how='left')
	myarray = []
	array = random.sample(range(10969), 1000)
	for i in array:
		myarray.append(int(i))
	array_index = []
	array_countries = []
	array_city = []
	for i in range(len(myarray)):
		array_index.append(i)
		array_city.append(df['name_x'][myarray[i]])
		array_countries.append(df['name_y'][myarray[i]])
	d = {'City_id': array_index, 'City': array_city, 'Country': array_countries}
	df = pandas.DataFrame(data = d)
	df.to_csv('out.csv', sep = ';', index = False)
	print(df1)
	'''
	countries = ['Италия','Россия',  'Германия', 'Нидерланды', 'Франция']
	cities_germany = ['Мюнхен', 'Берлин', 'Франкфурт']
	cities_italy = ['Милан', 'Рим', 'Флоренция']
	cities_netherlands = ['Амстердам', 'Роттердам', 'Утрехт']
	cities_france = ['Париж', 'Лион', 'Дижон']
	cities_russia = ['Москва', 'Санкт-Петербург', 'Нижний Новгород']
	array_countries = []
	array_cities = []
	array_people = []
	array_index = []


	for i in range(n):
		array_countries.append(random.choice(countries))

		if array_countries[i] == 'Россия':
			#print("уолкпщшцкрпзхуцкшрп")
			array_cities.append(random.choice(cities_russia))
			if array_cities[-1] == 'Москва':
				array_people.append(12500000)
			elif array_cities[-1] == 'Санкт-Петербург':
				array_people.append(5351935)
			elif array_cities[-1] == 'Нижний Новгород':
				array_people.append(1259000)

		elif array_countries[i] == 'Италия':
			array_cities.append(random.choice(cities_italy))
			if array_cities[-1] == 'Милан':
				array_people.append(1352000)
			elif array_cities[-1] == 'Рим':
				array_people.append(2873000)
			elif array_cities[-1] == 'Флоренция':
				array_people.append(382000)

		elif array_countries[i] == 'Германия':
			array_cities.append(random.choice(cities_germany))
			if array_cities[-1] == 'Мюнхен':
				array_people.append(1450000)
			elif array_cities[-1] == 'Берлин':
				array_people.append(3575000)
			elif array_cities[-1] == 'Франкфурт':
				array_people.append(736000)

		elif array_countries[i] == 'Нидерланды':
			array_cities.append(random.choice(cities_netherlands))
			if array_cities[-1] == 'Амстердам':
				array_people.append(821000)
			elif array_cities[-1] == 'Роттердам':
				array_people.append(623000)
			elif array_cities[-1] == 'Утрехт':
				array_people.append(334000)

		elif array_countries[i] == 'Франция':
			array_cities.append(random.choice(cities_france))
			if array_cities[-1] == 'Париж':
				array_people.append(2200000)
			elif array_cities[-1] == 'Лион':
				array_people.append(500000)
			elif array_cities[-1] == 'Дижон':
				array_people.append(153000)

		array_index.append(i)

	d = {'CityId': array_index, 'Name': array_cities, 'Countries': array_countries, 'Population': array_people}
	df = pandas.DataFrame(data = d)
	df.to_csv('cities.csv', sep = ';', index = False)

def nomer(n):
	udobstva = ['Ванна', 'Душ']
	kondei = ['Не имеется', 'В наличии']
	bed = ['Объединенная', 'Разделенные']
	array_udobstva = []
	array_kondei = []
	array_bed = []
	array_number = [i for i in range(100, n + 100)]
	array_index = []
	for i in range(n):
		array_udobstva.append(random.choice(udobstva))
		array_kondei.append(random.choice(kondei))
		array_bed.append(random.choice(bed))
		array_index.append(i)


	d = {'NomerId': array_index, 'Nomer': array_number, 'Udobstva': array_udobstva, 'Kondei': array_kondei, 'Bed': array_bed}
	df = pandas.DataFrame(data = d)
	df.to_csv('rooms.csv', sep = ';', index = False)

def chelovek(n):
	names = ['Иван', 'Никита', 'Вася', 'Серега', 'Маша', 'Катя', 'Вера', 'Полина', 'Коля', 'Саша', 'Настя', 'Оля', 'София', 'Дима', 'Валерия', 'Елена', 'Алиса', 'Вадим', 'Илья', 'Макар', 'Радик', 'Федор', 'Цезарь', 'Чарьлз', 'Юлий', 'Мира', 'Марта', 'Одетта', 'Роза', 'Тая', 'Вероника', 'Урсула']
	families = ['Коваленко', 'Левченко', 'Маркес', 'Моралес', 'Плотейко', 'Басюк', 'Фрост', 'Берник', 'Йорк', 'Беккер', 'Миллер', 'Васейко', 'Шевченко', 'Франд', 'Шнайдер', 'Мельник', 'Ткаченко', 'Юрченко', 'Боленьчук', 'Васельчук', 'Родригес', 'Фернандес', 'Гонсалес', 'Перес', 'Санчес', 'Мартинес', 'Алварес', 'Торрес', 'Флорес', 'Гарсиа', 'Кастаьо', 'Ромеро']


	array_names = []
	array_families = []
	array_cityId = []
	array_index = []

	for i in range(len(names)):
		for j in range(len(families)):
			if len(array_names) < n:
				array_names.append(names[i])
				array_families.append(families[j])
	m = int(n / 200)
	for i in range(m):
		array_index = (random.sample(range(200), 200))
		for j in array_index:
			array_cityId.append(int(j))
	array_index = [i for i in range(n)]

	d = {'PersonId': array_index, 'Name': array_names, 'Families': array_families, 'CityId': array_cityId}
	df = pandas.DataFrame(data = d)
	df.to_csv('person.csv', sep = ';', index = False)

def sadnnie_nomera(n):
	df_room = pandas.read_csv('rooms.csv', sep = ';')
	df_person = pandas.read_csv('person.csv', sep = ';')
	array_days = []
	array_price = []
	array_personId = []
	array_nomerId = []
	for i in range(n):
		days = random.randint(1, 30)
		array_days.append(days)
		array_price.append(days * 1000)
		array_personId.append(random.randint(0, n - 1))
		array_nomerId.append(random.randint(0, n - 1))
	d = {'NomerId': array_nomerId, 'PersonId': array_personId, 'Days': array_days, 'Price': array_price}
	df = pandas.DataFrame(data = d)
	df.to_csv('sadnnie_nomera1.csv', sep = ';', index = False)

if __name__ == '__main__':
	main()


