import pandas
import random

#n - кол-во столбцов
def generator(n):
	df = pandas.read_csv('file_read.csv', sep = ';')
	trains = ['Русич', 'Москва', 'Ока']

	array_trains = []
	array_vagons = []
	array_passangers = []
	d_index = []
	for i in range(n):
		array_trains.append(random.choice(trains))
		d_index.append(i)
		array_vagons.append(random.randint(1, 10))
		array_passangers.append(random.randint(1, 1000))
	d = {'Trains': array_trains}
	df1 = pandas.DataFrame(data = d, index = d_index)

	d2 = {'Line': df['Line'], 'Vagons': array_vagons, 'Passangers': array_passangers}
	df2 = pandas.DataFrame(data = d2)

	df = pandas.merge(df1, df2, left_index = True, right_index = True)
	df.to_csv('out.csv', sep = ';')


