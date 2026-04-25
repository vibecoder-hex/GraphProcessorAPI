INSERT INTO graph_processor.graph (name, type, description, creationat, structure, user_id) VALUES
-- User 1: admin_root (ID 1) - 4 графа
('Trans-Siberian Dream', 'Oriented', 'Путь через всю Россию', NOW(), '{"Distance": {"Moscow": {"Vladivostok": 9288, "Irkutsk": 5185}}}', 1),
('Silk Road Revival', 'Oriented', 'Древний путь из Китая в Европу', NOW(), '{"Distance": {"Beijing": {"Samarkand": 4800, "Tehran": 5600}}}', 1),
('Pan-American Highway', 'Oriented', 'От Аляски до Огненной Земли', NOW(), '{"Distance": {"Anchorage": {"Los Angeles": 3900, "Mexico City": 5500}}}', 1),
('European Capitals', 'Non-oriented', 'Столицы Старого Света', NOW(), '{"Distance": {"Paris": {"Berlin": 1050, "Rome": 1420}}}', 1),

-- User 2: dev_maria (ID 2) - 3 графа
('Golden Ring Express', 'Oriented', 'Маршрут по Золотому Кольцу', NOW(), '{"Distance": {"Suzdal": {"Vladimir": 35, "Yaroslavl": 190}}}', 2),
('Silicon Valley Conn', 'Oriented', 'Связи IT-столиц', NOW(), '{"Distance": {"San Francisco": {"Seattle": 1100, "Austin": 2800}}}', 2),
('Mediterranean Cruise', 'Non-oriented', 'Круиз по Средиземноморью', NOW(), '{"Distance": {"Barcelona": {"Marseille": 500, "Naples": 1200}}}', 2),

-- User 3: ivanov_i (ID 3) - 3 графа
('Volga Mother Stream', 'Oriented', 'Вниз по Волге-матушке', NOW(), '{"Distance": {"Tver": {"Nizhny Novgorod": 350, "Kazan": 750}}}', 3),
('Route 66 Classic', 'Oriented', 'Главная дорога Америки', NOW(), '{"Distance": {"Chicago": {"St. Louis": 470, "Oklahoma City": 1100}}}', 3),
('Baltic Way', 'Non-oriented', 'Страны Балтии', NOW(), '{"Distance": {"Tallinn": {"Riga": 310, "Vilnius": 540}}}', 3),

-- User 4: olga_kuz (ID 4) - 2 графа (неактивный пользователь, но графы есть)
('Sleepy Hollows', 'Non-oriented', 'Деревни Нижегородской области', NOW(), '{"Distance": {"Pupkino": {"Zalupkino": 15, "Kukuevo": 25}}}', 4),
('Dacha Routes', 'Oriented', 'Путь до любимой дачи', NOW(), '{"Distance": {"City": {"Six Acres": 45}}}', 4),

-- User 5: dmitry_v (ID 5) - 3 графа
('Caucasus Peaks', 'Oriented', 'Горные вершины Кавказа', NOW(), '{"Distance": {"Mineralnye Vody": {"Elbrus": 120, "Dombay": 200}}}', 5),
('Australian Outback', 'Oriented', 'Через пустыни Австралии', NOW(), '{"Distance": {"Perth": {"Adelaide": 2700, "Alice Springs": 3600}}}', 5),
('Scandinavian Tour', 'Non-oriented', 'Фьорды и леса', NOW(), '{"Distance": {"Oslo": {"Stockholm": 530, "Copenhagen": 600}}}', 5),

-- User 6: elena_sm (ID 6) - 3 графа
('Japanese Shinkansen', 'Oriented', 'Скоростные поезда Японии', NOW(), '{"Distance": {"Tokyo": {"Osaka": 515, "Kyoto": 450}}}', 6),
('Indian Maharaja', 'Oriented', 'Золотой Треугольник Индии', NOW(), '{"Distance": {"Delhi": {"Agra": 230, "Jaipur": 280}}}', 6),
('Iceland Ring', 'Non-oriented', 'Вокруг Исландии', NOW(), '{"Distance": {"Reykjavik": {"Vik": 180, "Akureyri": 380}}}', 6),

-- User 7: sergey_p (ID 7) - 3 графа
('Ural Mountains', 'Oriented', 'Граница Европы и Азии', NOW(), '{"Distance": {"Perm": {"Ekaterinburg": 360, "Chelyabinsk": 580}}}', 7),
('Balkan Mix', 'Non-oriented', 'Запутанные дороги Балкан', NOW(), '{"Distance": {"Belgrade": {"Sarajevo": 300, "Zagreb": 400}}}', 7),
('Wine Road France', 'Oriented', 'Винодельни Бордо и Бургундии', NOW(), '{"Distance": {"Bordeaux": {"Lyon": 550, "Dijon": 650}}}', 7),

-- User 8: anna_leb (ID 8) - 3 графа
('Lake Baikal Magic', 'Non-oriented', 'Вокруг Священного Моря', NOW(), '{"Distance": {"Irkutsk": {"Listvyanka": 70, "Olkhon": 250}}}', 8),
('Patagonia Wild', 'Oriented', 'Дикая природа Патагонии', NOW(), '{"Distance": {"Bariloche": {"El Calafate": 1400, "Ushuaia": 2000}}}', 8),
('Tulip Fields', 'Non-oriented', 'Нидерланды весной', NOW(), '{"Distance": {"Amsterdam": {"Keukenhof": 40, "Rotterdam": 80}}}', 8),

-- User 9: max_nov (ID 9) - 2 графа
('Ghost Towns', 'Non-oriented', 'Заброшенные города США', NOW(), '{"Distance": {"Detroit": {"Gary": 450, "Centralia": 800}}}', 9),
('Siberian Rivers', 'Oriented', 'Обь, Енисей, Лена', NOW(), '{"Distance": {"Novosibirsk": {"Tomsk": 270, "Krasnoyarsk": 790}}}', 9),

-- User 10: nat_mor (ID 10) - 3 графа
('Alpine Ski Circuit', 'Non-oriented', 'Лучшие курорты Альп', NOW(), '{"Distance": {"Chamonix": {"Zermatt": 150, "Courchevel": 120}}}', 10),
('Caribbean Islands', 'Non-oriented', 'Пиратские маршруты', NOW(), '{"Distance": {"Havana": {"Kingston": 800, "Nassau": 550}}}', 10),
('Spice Route India', 'Oriented', 'Путь специй', NOW(), '{"Distance": {"Mumbai": {"Goa": 600, "Kochi": 1300}}}', 10),

-- User 11: admin_tech (ID 11) - 4 графа
('Network Backbone EU', 'Oriented', 'Магистральные узлы связи', NOW(), '{"Distance": {"Frankfurt": {"Amsterdam": 400, "London": 600}}}', 11),
('Data Center Alley', 'Non-oriented', 'Кластеры ЦОД в США', NOW(), '{"Distance": {"Ashburn": {"Dallas": 1900, "Phoenix": 3200}}}', 11),
('Submarine Cables', 'Oriented', 'Подводные кабели Атлантики', NOW(), '{"Distance": {"New York": {"London": 5585, "Brest": 5400}}}', 11),
('IX Points Russia', 'Non-oriented', 'Точки обмена трафиком', NOW(), '{"Distance": {"Moscow": {"St. Petersburg": 700, "Novosibirsk": 3300}}}', 11),

-- User 12: kate_fed (ID 12) - 3 графа
('Italian Romance', 'Non-oriented', 'Города любви Италии', NOW(), '{"Distance": {"Venice": {"Florence": 260, "Verona": 120}}}', 12),
('Greek Islands Hop', 'Non-oriented', 'Прыжки по Эгейскому морю', NOW(), '{"Distance": {"Athens": {"Mykonos": 150, "Santorini": 230}}}', 12),
('Provence Lavender', 'Non-oriented', 'Лавандовые поля Прованса', NOW(), '{"Distance": {"Avignon": {"Aix-en-Provence": 90, "Nice": 250}}}', 12),

-- User 13: pavel_zh (ID 13) - 3 графа
('Stans Adventure', 'Oriented', '5 республик Средней Азии', NOW(), '{"Distance": {"Tashkent": {"Bishkek": 650, "Almaty": 800}}}', 13),
('Great Wall Trek', 'Oriented', 'Пешком по Китайской стене', NOW(), '{"Distance": {"Beijing": {"Mutianyu": 80, "Badaling": 70}}}', 13),
('Mongolian Steppe', 'Oriented', 'Дороги Чингисхана', NOW(), '{"Distance": {"Ulaanbaatar": {"Karakorum": 370, "Gobi": 500}}}', 13),

-- User 14: tanya_or (ID 14) - 2 графа
('Karelia Woods', 'Non-oriented', 'Карельские озера', NOW(), '{"Distance": {"Petrozavodsk": {"Kizhi": 60, "Sortavala": 250}}}', 14),
('Suzdal Fairytale', 'Non-oriented', 'Сказочное Суздальское княжество', NOW(), '{"Distance": {"Vladimir": {"Suzdal": 35, "Bogolyubovo": 10}}}', 14),

-- User 15: igor_kom (ID 15) - 3 графа
('Arctic Circle', 'Oriented', 'За полярным кругом', NOW(), '{"Distance": {"Murmansk": {"Tromso": 500, "Kirkenes": 230}}}', 15),
('Kamchatka Geysers', 'Non-oriented', 'Долина Гейзеров', NOW(), '{"Distance": {"Petropavlovsk-Kamchatsky": {"Yelizovo": 30, "Milkovo": 300}}}', 15),
('Faroe Islands', 'Non-oriented', 'Овечьи острова', NOW(), '{"Distance": {"Torshavn": {"Klaksvik": 40, "Vagar": 45}}}', 15),

-- User 16: sveta_bel (ID 16) - 3 графа
('Belarusian Castles', 'Non-oriented', 'Замки Беларуси', NOW(), '{"Distance": {"Minsk": {"Mir": 100, "Nesvizh": 120}}}', 16),
('Polish Heritage', 'Oriented', 'Города Польши', NOW(), '{"Distance": {"Warsaw": {"Krakow": 300, "Gdansk": 340}}}', 16),
('Braslav Lakes', 'Non-oriented', 'Голубые озера', NOW(), '{"Distance": {"Braslav": {"Slobodka": 15, "Ikazn": 25}}}', 16),

-- User 17: roma_sok (ID 17) - 3 графа
('Rocky Mountains', 'Oriented', 'Скалистые горы Канады', NOW(), '{"Distance": {"Vancouver": {"Banff": 850, "Jasper": 800}}}', 17),
('Scottish Highlands', 'Non-oriented', 'Север Шотландии', NOW(), '{"Distance": {"Edinburgh": {"Inverness": 250, "Isle of Skye": 300}}}', 17),
('New Zealand South', 'Non-oriented', 'Южный остров НЗ', NOW(), '{"Distance": {"Christchurch": {"Queenstown": 480, "Milford Sound": 400}}}', 17),

-- User 18: lena_kov (ID 18) - 3 графа
('Tatarstan Heritage', 'Non-oriented', 'Казань, Булгар, Свияжск', NOW(), '{"Distance": {"Kazan": {"Bolgar": 180, "Sviyazhsk": 60}}}', 18),
('Crimea Coast', 'Non-oriented', 'Южный берег Крыма', NOW(), '{"Distance": {"Sevastopol": {"Yalta": 85, "Simferopol": 70}}}', 18),
('Sochi Olympic', 'Non-oriented', 'Наследие Олимпиады', NOW(), '{"Distance": {"Sochi": {"Krasnaya Polyana": 70, "Adler": 25}}}', 18),

-- User 19: andrey_mir (ID 19) - 2 графа
('Egypt Pyramids', 'Oriented', 'От Каира до Луксора', NOW(), '{"Distance": {"Cairo": {"Giza": 20, "Luxor": 650}}}', 19),
('Morocco Souks', 'Oriented', 'Рынки Марокко', NOW(), '{"Distance": {"Casablanca": {"Marrakech": 240, "Fes": 300}}}', 19),

-- User 20: julia_tar (ID 20) - 3 графа
('Texas Triangle', 'Oriented', 'Мегаполисы Техаса', NOW(), '{"Distance": {"Dallas": {"Houston": 380, "Austin": 310}}}', 20),
('Florida Keys', 'Oriented', 'На крайний юг США', NOW(), '{"Distance": {"Miami": {"Key West": 260, "Key Largo": 90}}}', 20),
('California Dream', 'Oriented', 'Побережье Калифорнии', NOW(), '{"Distance": {"San Diego": {"Los Angeles": 190, "San Francisco": 800}}}', 20),

-- User 21: admin_sup (ID 21) - 4 графа
('Failover Cluster A', 'Oriented', 'Резервирование Европа', NOW(), '{"Distance": {"Amsterdam": {"Frankfurt": 400, "Paris": 500}}}', 21),
('Backup Routes Asia', 'Oriented', 'Обходные пути Азия', NOW(), '{"Distance": {"Singapore": {"Hong Kong": 2500, "Tokyo": 5300}}}', 21),
('DRP Moscow', 'Non-oriented', 'Площадки Катастрофоустойчивости', NOW(), '{"Distance": {"Moscow": {"Dubna": 120, "Stavropol": 1400}}}', 21),
('Edge Locations', 'Non-oriented', 'Периферийные узлы', NOW(), '{"Distance": {"Vladivostok": {"Yuzhno-Sakhalinsk": 900, "Petropavlovsk": 2200}}}', 21),

-- User 22: vika_sh (ID 22) - 3 графа
('London Tube', 'Non-oriented', 'Схема метро Лондона', NOW(), '{"Distance": {"Kings Cross": {"Paddington": 5, "Waterloo": 3}}}', 22),
('Paris Metro', 'Non-oriented', 'Линии Парижа', NOW(), '{"Distance": {"Chatelet": {"Montparnasse": 6, "Gare du Nord": 4}}}', 22),
('Moscow MCC', 'Non-oriented', 'Центральное Кольцо', NOW(), '{"Distance": {"Leninsky Prospekt": {"Ploshchad Gagarina": 2, "Luzhniki": 3}}}', 22),

-- User 23: kirill_gal (ID 23) - 3 графа
('Altai Golden', 'Non-oriented', 'Золотые горы Алтая', NOW(), '{"Distance": {"Barnaul": {"Gorno-Altaysk": 250, "Belokurikha": 300}}}', 23),
('Baikal Amur Mainline', 'Oriented', 'БАМ - стройка века', NOW(), '{"Distance": {"Tayshet": {"Tynda": 2300, "Severobaykalsk": 1200}}}', 23),
('Sayan Ring', 'Non-oriented', 'Саянское кольцо', NOW(), '{"Distance": {"Abakan": {"Kyzyl": 400, "Shushenskoye": 80}}}', 23),

-- User 24: marina_pav (ID 24) - 2 графа
('Vologda Laces', 'Non-oriented', 'Вологодские кружева', NOW(), '{"Distance": {"Vologda": {"Kirillov": 130, "Ferapontovo": 120}}}', 24),
('Kostroma Moose', 'Non-oriented', 'Лосиная ферма', NOW(), '{"Distance": {"Kostroma": {"Susanino": 60, "Sumarokovo": 30}}}', 24),

-- User 25: ilya_sem (ID 25) - 3 графа
('Sakhalin Island', 'Oriented', 'Вдоль Сахалина', NOW(), '{"Distance": {"Yuzhno-Sakhalinsk": {"Kholmsk": 80, "Nogliki": 600}}}', 25),
('Kuril Ridge', 'Non-oriented', 'Курильская гряда', NOW(), '{"Distance": {"Iturup": {"Kunashir": 70, "Paramushir": 500}}}', 25),
('Chukotka Run', 'Oriented', 'Чукотка - край земли', NOW(), '{"Distance": {"Anadyr": {"Provideniya": 400, "Pevek": 600}}}', 25),

-- User 26: dasha_kr (ID 26) - 3 графа
('Belgrade Nightlife', 'Non-oriented', 'Тусовки Белграда', NOW(), '{"Distance": {"Savamala": {"Dorcol": 2, "Vracar": 3}}}', 26),
('Budapest Baths', 'Non-oriented', 'Купальни Будапешта', NOW(), '{"Distance": {"Szechenyi": {"Gellert": 4, "Rudas": 3}}}', 26),
('Prague Beer', 'Non-oriented', 'Пивной маршрут Праги', NOW(), '{"Distance": {"Staromestska": {"Zizkov": 3, "Hradcany": 4}}}', 26),

-- User 27: anton_vas (ID 27) - 3 графа
('Ural Industrial', 'Oriented', 'Заводы Урала', NOW(), '{"Distance": {"Magnitogorsk": {"Chelyabinsk": 300, "Nizhny Tagil": 400}}}', 27),
('Donbass Coal', 'Non-oriented', 'Шахты и Терриконы', NOW(), '{"Distance": {"Donetsk": {"Makeevka": 15, "Gorlovka": 40}}}', 27),
('Kuzbass Route', 'Oriented', 'Кузнецкий угольный бассейн', NOW(), '{"Distance": {"Kemerovo": {"Novokuznetsk": 220, "Prokopyevsk": 200}}}', 27),

-- User 28: vera_med (ID 28) - 3 графа
('Golden Sands Bulgaria', 'Non-oriented', 'Курорты Болгарии', NOW(), '{"Distance": {"Varna": {"Burgas": 130, "Nessebar": 100}}}', 28),
('Montenegro Bay', 'Non-oriented', 'Бока Которска', NOW(), '{"Distance": {"Kotor": {"Perast": 12, "Herceg Novi": 30}}}', 28),
('Croatia Coast', 'Oriented', 'Адриатическое шоссе', NOW(), '{"Distance": {"Split": {"Dubrovnik": 230, "Zadar": 160}}}', 28),

-- User 29: nikita_fom (ID 29) - 2 графа
('Pripyat Exclusion', 'Non-oriented', 'Зона отчуждения', NOW(), '{"Distance": {"Chernobyl": {"Pripyat": 4, "Duga": 15}}}', 29),
('Kolyma Highway', 'Oriented', 'Трасса Колыма', NOW(), '{"Distance": {"Magadan": {"Susuman": 600, "Ust-Nera": 1000}}}', 29),

-- User 30: alina_kon (ID 30) - 3 графа
('Maldives Atolls', 'Non-oriented', 'Райские острова', NOW(), '{"Distance": {"Male": {"Hulhumale": 5, "Maafushi": 30}}}', 30),
('Seychelles Granite', 'Non-oriented', 'Гранитные острова', NOW(), '{"Distance": {"Mahe": {"Praslin": 40, "La Digue": 50}}}', 30),
('Bali Temples', 'Non-oriented', 'Храмы Бали', NOW(), '{"Distance": {"Ubud": {"Tanah Lot": 25, "Uluwatu": 40}}}', 30),

-- User 31: admin_db (ID 31) - 4 графа
('Postgres Clusters', 'Oriented', 'Репликация БД', NOW(), '{"Distance": {"Master-DC1": {"Slave-DC2": 600, "Slave-DC3": 1200}}}', 31),
('Kafka Brokers', 'Non-oriented', 'Шина данных', NOW(), '{"Distance": {"Node1": {"Node2": 10, "Node3": 10}}}', 31),
('Elastic Nodes', 'Non-oriented', 'Кластер логов', NOW(), '{"Distance": {"Hot-Warm": {"Cold": 500, "Frozen": 1000}}}', 31),
('Redis Sentinel', 'Non-oriented', 'Кеширование', NOW(), '{"Distance": {"App-Server": {"Cache-1": 5, "Cache-2": 5}}}', 31),

-- User 32: galya_zh (ID 32) - 3 графа
('Vladimir Oblasts', 'Non-oriented', 'Малые города области', NOW(), '{"Distance": {"Vladimir": {"Gus-Khrustalny": 70, "Murom": 130}}}', 32),
('Ryazan Mushrooms', 'Non-oriented', 'Грибные места', NOW(), '{"Distance": {"Ryazan": {"Spas-Klepiki": 80, "Tuma": 120}}}', 32),
('Tula Gingerbread', 'Non-oriented', 'Пряничная столица', NOW(), '{"Distance": {"Tula": {"Yasnaya Polyana": 15, "Polenovo": 70}}}', 32),

-- User 33: stas_bar (ID 33) - 3 графа
('Stans 2.0', 'Oriented', 'Памирский тракт', NOW(), '{"Distance": {"Dushanbe": {"Khorog": 600, "Murghab": 900}}}', 33),
('Nepal Base Camp', 'Oriented', 'Трек к Эвересту', NOW(), '{"Distance": {"Lukla": {"Namche Bazar": 10, "Gorak Shep": 30}}}', 33),
('Bhutan Happiness', 'Non-oriented', 'Королевство счастья', NOW(), '{"Distance": {"Paro": {"Thimphu": 50, "Punakha": 70}}}', 33),

-- User 34: lida_gor (ID 34) - 2 графа
('Zalupkino-Moscow', 'Oriented', 'Электричка выходного дня', NOW(), '{"Distance": {"Zalupkino": {"Pupkino": 15, "Kukuevo": 20}}}', 34),
('Hogsmeade Express', 'Oriented', 'Хогвартс-экспресс (фан)', NOW(), '{"Distance": {"Kings Cross": {"Hogsmeade": 600, "Azkaban": 800}}}', 34),

-- User 35: timur_ali (ID 35) - 3 графа
('Kazakh Steppe', 'Oriented', 'Великая степь', NOW(), '{"Distance": {"Astana": {"Karaganda": 220, "Pavlodar": 400}}}', 35),
('Almaty Apples', 'Non-oriented', 'Яблочный край', NOW(), '{"Distance": {"Almaty": {"Talgar": 30, "Issyk": 50}}}', 35),
('Caspian Oil', 'Oriented', 'Нефтяные вышки', NOW(), '{"Distance": {"Atyrau": {"Aktau": 800, "Tengiz": 300}}}', 35),

-- User 36: yana_sol (ID 36) - 3 графа
('Valencia Orange', 'Non-oriented', 'Апельсиновые рощи', NOW(), '{"Distance": {"Valencia": {"Alicante": 170, "Castellon": 80}}}', 36),
('Andalusia Flamenco', 'Non-oriented', 'Юг Испании', NOW(), '{"Distance": {"Seville": {"Granada": 250, "Cordoba": 140}}}', 36),
('Basque Country', 'Non-oriented', 'Страна Басков', NOW(), '{"Distance": {"Bilbao": {"San Sebastian": 100, "Vitoria": 60}}}', 36),

-- User 37: bogdan_zh (ID 37) - 3 графа
('Kyiv Podil', 'Non-oriented', 'Киевский Подол', NOW(), '{"Distance": {"Podil": {"Obolon": 5, "Pechersk": 6}}}', 37),
('Lviv Coffee', 'Non-oriented', 'Львовские кофейни', NOW(), '{"Distance": {"Rynok Square": {"Opera House": 1, "High Castle": 2}}}', 37),
('Odesa Port', 'Non-oriented', 'Одесский порт', NOW(), '{"Distance": {"Deribasovskaya": {"Arcadia": 7, "Moldavanka": 3}}}', 37),

-- User 38: mila_pol (ID 38) - 3 графа
('Vienna Opera', 'Non-oriented', 'Музыкальная Вена', NOW(), '{"Distance": {"Staatsoper": {"Musikverein": 1, "Schonbrunn": 6}}}', 38),
('Salzburg Mozart', 'Non-oriented', 'По следам Моцарта', NOW(), '{"Distance": {"Mozarts Geburtshaus": {"Festung": 1, "Mirabell": 2}}}', 38),
('Hallstatt Views', 'Non-oriented', 'Озерный край', NOW(), '{"Distance": {"Hallstatt": {"Gosau": 10, "Bad Ischl": 20}}}', 38),

-- User 39: gleb_mak (ID 39) - 2 графа
('Secret Bunkers', 'Non-oriented', 'Секретные бункеры Москвы', NOW(), '{"Distance": {"Taganka": {"Ramenki": 10, "Sokolniki": 8}}}', 39),
('Abandoned Metro', 'Non-oriented', 'Заброшенные станции', NOW(), '{"Distance": {"Sovetskaya": {"Pervomayskaya": 5, "Kaluzhskaya": 7}}}', 39),

-- User 40: kira_erm (ID 40) - 3 графа
('Porto Wine', 'Non-oriented', 'Португальские винодельни', NOW(), '{"Distance": {"Porto": {"Vila Nova de Gaia": 3, "Douro Valley": 100}}}', 40),
('Lisbon Trams', 'Non-oriented', 'Маршрут 28', NOW(), '{"Distance": {"Martim Moniz": {"Graca": 1, "Estrela": 3}}}', 40),
('Sintra Palaces', 'Non-oriented', 'Дворцы Синтры', NOW(), '{"Distance": {"Sintra": {"Pena": 2, "Quinta da Regaleira": 1}}}', 40),

-- User 41: admin_sec (ID 41) - 4 графа
('Perimeter Network', 'Oriented', 'DMZ зоны', NOW(), '{"Distance": {"Ext-Firewall": {"Web-Server": 1, "Proxy": 1}}}', 41),
('Zero Trust Model', 'Oriented', 'Микросегментация', NOW(), '{"Distance": {"User-Laptop": {"Auth-Gateway": 10, "App-Pod": 15}}}', 41),
('SIEM Flow', 'Oriented', 'Сбор логов ИБ', NOW(), '{"Distance": {"Sensor-1": {"Collector": 50, "Storage": 50}}}', 41),
('VPN Gateways', 'Non-oriented', 'Точки входа VPN', NOW(), '{"Distance": {"Amsterdam-VPN": {"New-York-VPN": 6000, "Singapore-VPN": 9000}}}', 41),

-- User 42: lisa_sav (ID 42) - 3 графа
('Tokyo Districts', 'Non-oriented', 'Районы Токио', NOW(), '{"Distance": {"Shibuya": {"Shinjuku": 3, "Harajuku": 2}}}', 42),
('Osaka Street Food', 'Non-oriented', 'Дотонбори', NOW(), '{"Distance": {"Namba": {"Shinsaibashi": 1, "Umeda": 4}}}', 42),
('Hiroshima Peace', 'Non-oriented', 'Парк Мира', NOW(), '{"Distance": {"Memorial": {"Castle": 2, "Miyajima": 20}}}', 42),

-- User 43: artur_den (ID 43) - 3 графа
('Arbat Walk', 'Non-oriented', 'Старый и Новый Арбат', NOW(), '{"Distance": {"Arbatskaya": {"Smolenskaya": 1, "Novy Arbat": 1}}}', 43),
('VDNKh Park', 'Non-oriented', 'ВДНХ и Ботанический сад', NOW(), '{"Distance": {"Main Entrance": {"Space Pavilion": 1, "Botanical Garden": 2}}}', 43),
('Zaryadye Fly', 'Non-oriented', 'Парящий мост', NOW(), '{"Distance": {"Park Zaryadye": {"Red Square": 1, "Kitay-Gorod": 1}}}', 43),

-- User 44: sofiya_rog (ID 44) - 2 графа
('Dacha Pervaya', 'Non-oriented', 'СНТ Ромашка', NOW(), '{"Distance": {"Gate": {"Plot 5": 0.5, "Lake": 1}}}', 44),
('Dacha Vtoraya', 'Non-oriented', 'СНТ Березка', NOW(), '{"Distance": {"Plot 12": {"Neighbor": 0.1, "Well": 0.3}}}', 44),

-- User 45: mark_luk (ID 45) - 3 графа
('Tibet Railway', 'Oriented', 'Цинхай-Тибетская ЖД', NOW(), '{"Distance": {"Xining": {"Lhasa": 1956, "Golmud": 800}}}', 45),
('Peru Rail', 'Oriented', 'Мачу-Пикчу', NOW(), '{"Distance": {"Cusco": {"Aguas Calientes": 110, "Ollantaytambo": 60}}}', 45),
('Swiss Alps Train', 'Oriented', 'Glacier Express', NOW(), '{"Distance": {"Zermatt": {"St. Moritz": 290, "Andermatt": 100}}}', 45),

-- User 46: valya_kal (ID 46) - 3 графа
('Kaliningrad Oblast', 'Non-oriented', 'Янтарный край', NOW(), '{"Distance": {"Kaliningrad": {"Svetlogorsk": 40, "Yantarny": 50}}}', 46),
('Curonian Spit', 'Non-oriented', 'Куршская коса', NOW(), '{"Distance": {"Zelenogradsk": {"Lesnoy": 10, "Morskoye": 50}}}', 46),
('Baltic Fleet', 'Non-oriented', 'Балтийск', NOW(), '{"Distance": {"Baltiysk": {"Pillau": 2, "Vistula Spit": 20}}}', 46),

-- User 47: ivan_bur (ID 47) - 3 графа
('Arkhangelsk Pomor', 'Non-oriented', 'Поморские деревни', NOW(), '{"Distance": {"Arkhangelsk": {"Severodvinsk": 40, "Malye Korely": 25}}}', 47),
('Solovki Islands', 'Non-oriented', 'Соловецкий архипелаг', NOW(), '{"Distance": {"Bolshoy Solovetsky": {"Anzer": 20, "Bolshaya Muksalma": 10}}}', 47),
('Kizhi Pogost', 'Non-oriented', 'Кижский погост', NOW(), '{"Distance": {"Kizhi": {"Velikaya Guba": 15, "Sennaya Guba": 10}}}', 47),

-- User 48: nastya_vin (ID 48) - 3 графа
('St Pete Canals', 'Non-oriented', 'Реки и каналы СПб', NOW(), '{"Distance": {"Moika": {"Fontanka": 1, "Griboedov": 1}}}', 48),
('Peterhof Fountains', 'Non-oriented', 'Петергоф', NOW(), '{"Distance": {"Grand Palace": {"Monplaisir": 1, "Marly": 2}}}', 48),
('Pushkin Parks', 'Non-oriented', 'Царское Село', NOW(), '{"Distance": {"Catherine Palace": {"Alexander Palace": 2, "Cameron Gallery": 1}}}', 48),

-- User 49: filipp_tit (ID 49) - 2 графа
('Abandoned USSR', 'Non-oriented', 'Забытые заводы', NOW(), '{"Distance": {"ZIL": {"AZLK": 5, "Serp i Molot": 4}}}', 49),
('Defense Lines', 'Oriented', 'Линии обороны Москвы', NOW(), '{"Distance": {"Istra": {"Volokolamsk": 50, "Naro-Fominsk": 60}}}', 49),

-- User 50: zoya_koz (ID 50) - 3 графа
('Cote Azure', 'Oriented', 'Лазурный берег', NOW(), '{"Distance": {"Nice": {"Cannes": 30, "Monaco": 20}}}', 50),
('Normandy Beaches', 'Non-oriented', 'Пляжи высадки', NOW(), '{"Distance": {"Caen": {"Omaha Beach": 50, "Utah Beach": 70}}}', 50),
('Loire Castles', 'Non-oriented', 'Замки Луары', NOW(), '{"Distance": {"Tours": {"Chenonceau": 30, "Chambord": 60}}}', 50),

-- User 51: user_final (ID 51) - 3 графа
('Big Final Tour', 'Oriented', 'Вокруг света', NOW(), '{"Distance": {"Moscow": {"Vladivostok": 9288, "New York": 7500}}}', 51),
('Moon Base Alpha', 'Non-oriented', 'Лунные кратеры', NOW(), '{"Distance": {"Tranquility Base": {"Copernicus": 800, "Tycho": 1000}}}', 51),
('Mars Colony', 'Oriented', 'Марсианские станции', NOW(), '{"Distance": {"Olympus Mons": {"Valles Marineris": 3000, "Hellas Basin": 5000}}}', 51);
