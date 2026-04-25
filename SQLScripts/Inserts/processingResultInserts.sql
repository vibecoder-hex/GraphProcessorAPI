INSERT INTO graph_processor.processing_result (graph_id, algorithm, time_in_ns, start_vertex, target_vertex, shortest_path, total_distance) VALUES
-- Graph 1: Trans-Siberian Dream (Moscow -> Vladivostok)
(1, 'Dijkstra', 12450.5, 'Moscow', 'Vladivostok', ARRAY['Moscow', 'Irkutsk', 'Vladivostok'], 14473),
(1, 'BFS', 8320.3, 'Moscow', 'Irkutsk', ARRAY['Moscow', 'Irkutsk'], 5185),
(1, 'DFS', 15120.8, 'Irkutsk', 'Vladivostok', ARRAY['Irkutsk', 'Vladivostok'], 9288),

-- Graph 2: Silk Road Revival (Beijing -> Tehran)
(2, 'Dijkstra', 9830.1, 'Beijing', 'Tehran', ARRAY['Beijing', 'Samarkand', 'Tehran'], 10400),
(2, 'BFS', 6720.7, 'Beijing', 'Samarkand', ARRAY['Beijing', 'Samarkand'], 4800),

-- Graph 3: Pan-American Highway (Anchorage -> Mexico City)
(3, 'Dijkstra', 11420.2, 'Anchorage', 'Mexico City', ARRAY['Anchorage', 'Los Angeles', 'Mexico City'], 9400),
(3, 'DFS', 10250.9, 'Los Angeles', 'Mexico City', ARRAY['Los Angeles', 'Mexico City'], 5500),

-- Graph 4: European Capitals (Paris -> Rome)
(4, 'Dijkstra', 5430.6, 'Paris', 'Rome', ARRAY['Paris', 'Berlin', 'Rome'], 2470),
(4, 'BFS', 3210.4, 'Paris', 'Berlin', ARRAY['Paris', 'Berlin'], 1050),

-- Graph 5: Golden Ring Express (Suzdal -> Yaroslavl)
(5, 'Dijkstra', 3250.3, 'Suzdal', 'Yaroslavl', ARRAY['Suzdal', 'Vladimir', 'Yaroslavl'], 225),
(5, 'DFS', 4180.7, 'Vladimir', 'Yaroslavl', ARRAY['Vladimir', 'Yaroslavl'], 190),

-- Graph 6: Silicon Valley Conn (San Francisco -> Austin)
(6, 'Dijkstra', 7890.5, 'San Francisco', 'Austin', ARRAY['San Francisco', 'Seattle', 'Austin'], 3900),
(6, 'BFS', 5620.2, 'San Francisco', 'Seattle', ARRAY['San Francisco', 'Seattle'], 1100),

-- Graph 7: Mediterranian Cruise (Barcelona -> Naples)
(7, 'Dijkstra', 6320.8, 'Barcelona', 'Naples', ARRAY['Barcelona', 'Marseille', 'Naples'], 1700),
(7, 'BFS', 4450.1, 'Barcelona', 'Marseille', ARRAY['Barcelona', 'Marseille'], 500),

-- Graph 8: Volga Mother Stream (Tver -> Kazan)
(8, 'Dijkstra', 5210.4, 'Tver', 'Kazan', ARRAY['Tver', 'Nizhny Novgorod', 'Kazan'], 1100),
(8, 'DFS', 4980.9, 'Nizhny Novgorod', 'Kazan', ARRAY['Nizhny Novgorod', 'Kazan'], 750),

-- Graph 9: Route 66 Classic (Chicago -> Oklahoma City)
(9, 'Dijkstra', 8740.3, 'Chicago', 'Oklahoma City', ARRAY['Chicago', 'St. Louis', 'Oklahoma City'], 1570),
(9, 'BFS', 6120.6, 'Chicago', 'St. Louis', ARRAY['Chicago', 'St. Louis'], 470),

-- Graph 10: Baltic Way (Tallinn -> Vilnius)
(10, 'Dijkstra', 7230.7, 'Tallinn', 'Vilnius', ARRAY['Tallinn', 'Riga', 'Vilnius'], 850),
(10, 'BFS', 5340.2, 'Tallinn', 'Riga', ARRAY['Tallinn', 'Riga'], 310),

-- Graph 11: Sleepy Hollows (Pupkino -> Kukuevo)
(11, 'Dijkstra', 2150.9, 'Pupkino', 'Kukuevo', ARRAY['Pupkino', 'Zalupkino', 'Kukuevo'], 40),
(11, 'DFS', 1890.4, 'Zalupkino', 'Kukuevo', ARRAY['Zalupkino', 'Kukuevo'], 25),

-- Graph 13: Caucasus Peaks (Mineralnye Vody -> Dombay)
(13, 'Dijkstra', 8970.5, 'Mineralnye Vody', 'Dombay', ARRAY['Mineralnye Vody', 'Elbrus', 'Dombay'], 320),
(13, 'BFS', 6750.8, 'Mineralnye Vody', 'Elbrus', ARRAY['Mineralnye Vody', 'Elbrus'], 120),

-- Graph 14: Australian Outback (Perth -> Alice Springs)
(14, 'Dijkstra', 10450.3, 'Perth', 'Alice Springs', ARRAY['Perth', 'Adelaide', 'Alice Springs'], 6300),
(14, 'DFS', 9870.1, 'Adelaide', 'Alice Springs', ARRAY['Adelaide', 'Alice Springs'], 3600),

-- Graph 15: Scandinavian Tour (Oslo -> Copenhagen)
(15, 'Dijkstra', 8120.6, 'Oslo', 'Copenhagen', ARRAY['Oslo', 'Stockholm', 'Copenhagen'], 1130),
(15, 'BFS', 5980.4, 'Oslo', 'Stockholm', ARRAY['Oslo', 'Stockholm'], 530),

-- Graph 16: Japanese Shinkansen (Tokyo -> Kyoto)
(16, 'Dijkstra', 4520.2, 'Tokyo', 'Kyoto', ARRAY['Tokyo', 'Osaka', 'Kyoto'], 965),
(16, 'BFS', 3210.7, 'Tokyo', 'Osaka', ARRAY['Tokyo', 'Osaka'], 515),

-- Graph 19: Ural Mountains (Perm -> Chelyabinsk)
(19, 'Dijkstra', 9120.8, 'Perm', 'Chelyabinsk', ARRAY['Perm', 'Ekaterinburg', 'Chelyabinsk'], 940),
(19, 'DFS', 8450.3, 'Ekaterinburg', 'Chelyabinsk', ARRAY['Ekaterinburg', 'Chelyabinsk'], 580),

-- Graph 20: Balkan Mix (Belgrade -> Zagreb)
(20, 'Dijkstra', 6340.5, 'Belgrade', 'Zagreb', ARRAY['Belgrade', 'Sarajevo', 'Zagreb'], 700),
(20, 'BFS', 4870.9, 'Belgrade', 'Sarajevo', ARRAY['Belgrade', 'Sarajevo'], 300),

-- Graph 22: Lake Baikal Magic (Irkutsk -> Olkhon)
(22, 'Dijkstra', 7650.1, 'Irkutsk', 'Olkhon', ARRAY['Irkutsk', 'Listvyanka', 'Olkhon'], 320),
(22, 'DFS', 7120.4, 'Listvyanka', 'Olkhon', ARRAY['Listvyanka', 'Olkhon'], 250),

-- Graph 23: Patagonia Wild (Bariloche -> Ushuaia)
(23, 'Dijkstra', 11560.7, 'Bariloche', 'Ushuaia', ARRAY['Bariloche', 'El Calafate', 'Ushuaia'], 3400),
(23, 'BFS', 10230.2, 'Bariloche', 'El Calafate', ARRAY['Bariloche', 'El Calafate'], 1400),

-- Graph 26: Alpine Ski Circuit (Chamonix -> Courchevel)
(26, 'Dijkstra', 3980.3, 'Chamonix', 'Courchevel', ARRAY['Chamonix', 'Zermatt', 'Courchevel'], 270),
(26, 'BFS', 2450.8, 'Chamonix', 'Zermatt', ARRAY['Chamonix', 'Zermatt'], 150),

-- Graph 28: Caribbean Islands (Havana -> Nassau)
(28, 'Dijkstra', 8920.5, 'Havana', 'Nassau', ARRAY['Havana', 'Kingston', 'Nassau'], 1350),
(28, 'DFS', 8230.9, 'Kingston', 'Nassau', ARRAY['Kingston', 'Nassau'], 550),

-- Graph 31: Network Backbone EU (Frankfurt -> London)
(31, 'Dijkstra', 2840.6, 'Frankfurt', 'London', ARRAY['Frankfurt', 'Amsterdam', 'London'], 1000),
(31, 'BFS', 1980.2, 'Frankfurt', 'Amsterdam', ARRAY['Frankfurt', 'Amsterdam'], 400),

-- Graph 33: Submarine Cables (New York -> Brest)
(33, 'Dijkstra', 6870.3, 'New York', 'Brest', ARRAY['New York', 'London', 'Brest'], 10985),
(33, 'DFS', 6230.7, 'London', 'Brest', ARRAY['London', 'Brest'], 5400),

-- Graph 36: Italian Romance (Venice -> Verona)
(36, 'Dijkstra', 3670.1, 'Venice', 'Verona', ARRAY['Venice', 'Florence', 'Verona'], 380),
(36, 'BFS', 2540.4, 'Venice', 'Florence', ARRAY['Venice', 'Florence'], 260),

-- Graph 40: Stans Adventure (Tashkent -> Almaty)
(40, 'Dijkstra', 9450.8, 'Tashkent', 'Almaty', ARRAY['Tashkent', 'Bishkek', 'Almaty'], 1450),
(40, 'BFS', 7230.5, 'Tashkent', 'Bishkek', ARRAY['Tashkent', 'Bishkek'], 650),

-- Graph 45: Kamchatka Geysers (Petropavlovsk-Kamchatsky -> Milkovo)
(45, 'Dijkstra', 5620.9, 'Petropavlovsk-Kamchatsky', 'Milkovo', ARRAY['Petropavlovsk-Kamchatsky', 'Yelizovo', 'Milkovo'], 330),
(45, 'DFS', 4980.3, 'Yelizovo', 'Milkovo', ARRAY['Yelizovo', 'Milkovo'], 300);