# GraphProcessorAPI

Основная идея: Нахождение кратчайших путей от одной стартовой вершины до всех остальных в взвешенном графе с неотрицательными весами рёбер.

Как работает (жадный алгоритм):

Присвоить начальной вершине расстояние 0, а всем остальным — бесконечность.

Поместить все вершины в приоритетную очередь (Min-Heap) по текущему расстоянию.

Пока очередь не пуста:

Извлечь вершину u с минимальным текущим расстоянием.

Для каждого соседа v вершины u:

Вычислить новое расстояние: расстояние_до_u + вес_ребра(u, v).

Если это расстояние меньше текущего известного расстояния до v, то обновить расстояние до v и запомнить u как предшественника v (для восстановления пути).

Повторять, пока не будут обработаны все вершины.

Ключевые свойства:

Работает только с неотрицательными весами рёбер. Отрицательные веса нарушают его логику.

Гарантированно находит оптимальные кратчайшие пути.

Сложность зависит от реализации структуры данных:

С массивом: O(V² + E) — хорошо для плотных графов.

С бинарной кучей (приоритетной очередью): O((V + E) log V) — лучше для разреженных графов.

С более продвинутыми кучами (Фибоначчи) можно улучшить до O(E + V log V).

Где применяется:

Маршрутизация в сетях (протоколы типа OSPF, IS-IS).

Построение карт и навигация (поиск кратчайшего пути по времени или расстоянию).

Моделирование потоков.

Как основа для более сложных алгоритмов (например, A* с эвристикой).


```
GraphProcessorAPI
├─ .dockerignore
├─ .DS_Store
├─ .idea
│  └─ .idea.GraphProcessorAPI
│     └─ .idea
│        ├─ codeStyles
│        │  └─ codeStyleConfig.xml
│        ├─ encodings.xml
│        ├─ indexLayout.xml
│        └─ vcs.xml
├─ GraphProcessor.sql
├─ GraphProcessorAPI
│  ├─ .DS_Store
│  ├─ appsettings.Development.json
│  ├─ appsettings.json
│  ├─ Dockerfile
│  ├─ GraphProcessorAPI.csproj
│  ├─ Program.cs
│  ├─ Properties
│  │  └─ launchSettings.json
│  └─ src
│     ├─ ApiEndpointsProcessor.cs
│     ├─ DTOs.cs
│     ├─ GraphProcessor.cs
│     └─ Views.cs
├─ GraphProcessorAPI.slnx
├─ GraphProcessordiagram.png
├─ GraphProcessorFrontend
│  ├─ dist
│  │  ├─ assets
│  │  │  ├─ index-2tQpaWhK.css
│  │  │  └─ index-xyfuJH-U.js
│  │  ├─ favicon.ico
│  │  └─ index.html
│  ├─ env.d.ts
│  ├─ index.html
│  ├─ package-lock.json
│  ├─ package.json
│  ├─ public
│  │  └─ favicon.ico
│  ├─ README.md
│  ├─ src
│  │  ├─ App.vue
│  │  ├─ components
│  │  │  ├─ forms
│  │  │  │  ├─ form_components
│  │  │  │  │  └─ GDIF_components
│  │  │  │  │     ├─ fields
│  │  │  │  │     │  ├─ AlgorithmSelectionField.vue
│  │  │  │  │     │  └─ UserInputVertexField.vue
│  │  │  │  │     └─ submit_results
│  │  │  │  │        └─ DistanceProcessingResult.vue
│  │  │  │  └─ GraphDataInputForm.vue
│  │  │  └─ graph_view
│  │  │     └─ NetworkVisualisationCanvas.vue
│  │  ├─ main.ts
│  │  ├─ router
│  │  │  └─ index.ts
│  │  ├─ utils
│  │  │  ├─ interfaces.ts
│  │  │  └─ services
│  │  │     ├─ graphOperationsService.ts
│  │  │     └─ networkCanvasService.ts
│  │  └─ views
│  │     ├─ AboutPageView.vue
│  │     └─ GraphDataInputView.vue
│  ├─ tsconfig.app.json
│  ├─ tsconfig.json
│  ├─ tsconfig.node.json
│  └─ vite.config.ts
└─ README.md

```