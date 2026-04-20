INSERT INTO graph_processor.edge (value, description, weight, graph_id, from_node, to_node) VALUES
-- Graph 1: Trans-Siberian Dream (nodes 1-3)
('Moscow-Irkutsk', 'Западный участок Транссиба через Урал', 5185, 1, 1, 3),
('Irkutsk-Vladivostok', 'Восточный участок Транссиба вдоль Байкала', 9288, 1, 3, 2),

-- Graph 2: Silk Road Revival (nodes 4-6)
('Beijing-Samarkand', 'Восточный сегмент Великого шелкового пути', 4800, 2, 4, 5),
('Samarkand-Tehran', 'Западный сегмент через Персию', 5600, 2, 5, 6),

-- Graph 3: Pan-American Highway (nodes 7-9)
('Anchorage-Los Angeles', 'Аляска через Канаду до Калифорнии', 3900, 3, 7, 8),
('Los Angeles-Mexico City', 'Мексиканский участок Панамериканского шоссе', 5500, 3, 8, 9),

-- Graph 4: European Capitals (nodes 10-12)
('Paris-Berlin', 'Скоростная магистраль Франция-Германия', 1050, 4, 10, 11),
('Berlin-Rome', 'Трансальпийский маршрут через Австрию', 1420, 4, 11, 12),

-- Graph 5: Golden Ring Express (nodes 13-15)
('Suzdal-Vladimir', 'Короткий перегон по Золотому кольцу', 35, 5, 13, 14),
('Vladimir-Yaroslavl', 'Северный маршрут Золотого кольца', 190, 5, 14, 15),

-- Graph 6: Silicon Valley Conn (nodes 16-18)
('San Francisco-Seattle', 'Тихоокеанское побережье техногигантов', 1100, 6, 16, 17),
('Seattle-Austin', 'Диагональ через Скалистые горы', 2800, 6, 17, 18),

-- Graph 7: Mediterranian Cruise (nodes 19-21)
('Barcelona-Marseille', 'Каталонско-Провансальский круиз', 500, 7, 19, 20),
('Marseille-Naples', 'Лигурийское море до Неаполя', 1200, 7, 20, 21),

-- Graph 8: Volga Mother Stream (nodes 22-24)
('Tver-Nizhny Novgorod', 'Верхняя Волга через Рыбинское вдхр', 350, 8, 22, 23),
('Nizhny Novgorod-Kazan', 'Средняя Волга до татарской столицы', 750, 8, 23, 24),

-- Graph 9: Route 66 Classic (nodes 25-27)
('Chicago-St. Louis', 'Начало Матери Дорог через Иллинойс', 470, 9, 25, 26),
('St. Louis-Oklahoma City', 'Прерии Миссури и Оклахомы', 1100, 9, 26, 27),

-- Graph 10: Baltic Way (nodes 28-30)
('Tallinn-Riga', 'Эстонско-Латвийское взморье', 310, 10, 28, 29),
('Riga-Vilnius', 'Латвийско-Литовский перегон', 540, 10, 29, 30),

-- Graph 11: Sleepy Hollows (nodes 31-33)
('Pupkino-Zalupkino', 'Проселочная дорога через овраг', 15, 11, 31, 32),
('Zalupkino-Kukuevo', 'Грунтовка мимо заброшенной фермы', 25, 11, 32, 33),

-- Graph 13: Caucasus Peaks (nodes 34-36)
('Mineralnye Vody-Elbrus', 'Дорога к подножию высочайшей вершины', 120, 13, 34, 35),
('Elbrus-Dombay', 'Кавказский хребет через перевалы', 200, 13, 35, 36),

-- Graph 14: Australian Outback (nodes 37-39)
('Perth-Adelaide', 'Пустыня Налларбор через юг континента', 2700, 14, 37, 38),
('Adelaide-Alice Springs', 'Дорога Стюарта в Красный центр', 3600, 14, 38, 39),

-- Graph 15: Scandinavian Tour (nodes 40-42)
('Oslo-Stockholm', 'Скандинавские горы и леса', 530, 15, 40, 41),
('Stockholm-Copenhagen', 'Эресуннский мост через пролив', 600, 15, 41, 42),

-- Graph 16: Japanese Shinkansen (nodes 43-45)
('Tokyo-Osaka', 'Токайдо-синкансэн мимо Фудзи', 515, 16, 43, 44),
('Osaka-Kyoto', 'Короткий перегон в культурную столицу', 450, 16, 44, 45),

-- Graph 19: Ural Mountains (nodes 46-48)
('Perm-Ekaterinburg', 'Западный склон Среднего Урала', 360, 19, 46, 47),
('Ekaterinburg-Chelyabinsk', 'Восточный склон к Челябинску', 580, 19, 47, 48),

-- Graph 20: Balkan Mix (nodes 49-51)
('Belgrade-Sarajevo', 'Сербско-Боснийский маршрут через горы', 300, 20, 49, 50),
('Sarajevo-Zagreb', 'Боснийско-Хорватская граница', 400, 20, 50, 51),

-- Graph 22: Lake Baikal Magic (nodes 52-54)
('Irkutsk-Listvyanka', 'Байкальский тракт к берегу священного моря', 70, 22, 52, 53),
('Listvyanka-Olkhon', 'Паромная переправа на остров Ольхон', 250, 22, 53, 54),

-- Graph 23: Patagonia Wild (nodes 55-57)
('Bariloche-El Calafate', 'Легендарная Ruta 40 через Патагонию', 1400, 23, 55, 56),
('El Calafate-Ushuaia', 'Огненная Земля до края света', 2000, 23, 56, 57),

-- Graph 26: Alpine Ski Circuit (nodes 58-60)
('Chamonix-Zermatt', 'Вокруг Монблана и Маттерхорна', 150, 26, 58, 59),
('Zermatt-Courchevel', 'Швейцарско-Французские Альпы', 120, 26, 59, 60),

-- Graph 28: Caribbean Islands (nodes 61-63)
('Havana-Kingston', 'Карибское море Куба-Ямайка', 800, 28, 61, 62),
('Kingston-Nassau', 'Багамский пролив', 550, 28, 62, 63),

-- Graph 31: Network Backbone EU (nodes 64-66)
('Frankfurt-Amsterdam', 'DE-CIX - AMS-IX магистраль', 400, 31, 64, 65),
('Amsterdam-London', 'Подводный кабель через Северное море', 600, 31, 65, 66),

-- Graph 33: Submarine Cables (nodes 67-69)
('New York-London', 'Трансатлантический кабель TAT-14', 5585, 33, 67, 68),
('London-Brest', 'Кабель через Ла-Манш', 5400, 33, 68, 69),

-- Graph 36: Italian Romance (nodes 70-72)
('Venice-Florence', 'Венето в сердце Тосканы', 260, 36, 70, 71),
('Florence-Verona', 'Тосканские холмы до дома Джульетты', 120, 36, 71, 72),

-- Graph 40: Stans Adventure (nodes 73-75)
('Tashkent-Bishkek', 'Узбекско-Кыргызская граница', 650, 40, 73, 74),
('Bishkek-Almaty', 'Чуйская долина до южной столицы Казахстана', 800, 40, 74, 75),

-- Graph 45: Kamchatka Geysers (nodes 76-78)
('Petropavlovsk-Kamchatsky-Yelizovo', 'Авачинская агломерация', 30, 45, 76, 77),
('Yelizovo-Milkovo', 'Центральная Камчатка к вулканам', 300, 45, 77, 78);