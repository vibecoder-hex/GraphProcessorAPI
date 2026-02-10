<!-- ТЕХДОЛГ: 
    Адаптировать форму и класс генерации JSON для логики обновления Vis canvas.
    Тоесть разделить на компоненты поля ввода ребер и вершин.
    Прийдется избавится от текстового ввода JSON, оставив только поле с загрузкой файла.
    (В будущем и эта функция будет демонтирована, она была нужна для тестирования бэкенда).
    В остальных случаях для редактирования структуры графа(JSON) и vis canvas, использовать ТОЛЬКО поля ввода.
    Обязательно хорошо продебажить синхронизацию между canvas и JSON.
    Класс NetworkVisualizer нужно будет уничтожить, по причине неоптимальности(O(V^2) асимптотики, приводящей к падению производительности), 
    заменив непосредственную генерацию всего графа на последовательное добавление/удаление/изменение вершин.
    Граф будет динамическим.
-->
<!-- ЗАДАЧИ:
    1. Разделить на 2 отдельных компонента EdgesInputField и VertexInputField +
    2. Реализовать операции (add del upd) в структуре графа, синхронизировав DataSet с +
    объектом
    (Возможно изменить глобальную переменную distanceJSONObject на Map(хештаблицу),
    во избежания лишних вычислений при регенерации и увеличении скорости вставки/удаления)
    3. Начать думать об архитектуре SSR. Внедрить Nuxt.js
-->
<template>
    <form @submit.prevent>
        <UserInputVertexField v-model:distanceMap="distanceMap"/>
        <br><br>
        <div v-if="distanceMap.size > 0">
            <label>Show graph structure</label>
            <input type="checkbox" v-model="showGraphStructure"><br><br>
            <pre v-if="showGraphStructure"><code>
                {{ JSON.stringify(getObjectFromMap(), null, 2) }}
            </code></pre>
           <AlgorithmSelectionField v-model:selectedAlgorithm="selectedAlgorithm"
                                     v-model:startVertex="startVertex"
                                     v-model:targetVertex="targetVertex"
            />
            <br>
            <button @click="getPathFromAPI()">Send path</button>
            <div v-if="graphProcessingResult">
                <DistanceProcessingResult :graphProcessingResult="graphProcessingResult"/>
            </div>
            <br>
            <div>{{ errorMessage }}</div>
        </div>
    </form>
</template>

<script setup>
    import { ref } from 'vue'
    import axios from 'axios'
    import UserInputVertexField from './form_components/GDIF_components/fields/UserInputVertexField.vue'
    import AlgorithmSelectionField from './form_components/GDIF_components/fields/AlgorithmSelectionField.vue'
    import DistanceProcessingResult from "./form_components/GDIF_components/submit_results/DistanceProcessingResult.vue";
    
    const APIURL = "http://localhost:5170/api/graph_processor"

    const selectedAlgorithm = ref("")
    const startVertex = ref("")
    const targetVertex = ref("")

    const showGraphStructure = ref(false)
    
    const distanceMap = ref(new Map())
    const graphProcessingResult = ref(null)
    const errorMessage = ref("")

    function getObjectFromMap() {
        const distanceObject = {}
        distanceObject.Distances = {}
        distanceMap.value.forEach((neighbors, node) => {
            distanceObject.Distances[node] = Object.fromEntries(neighbors)
        })
        return distanceObject
    }
    
    
    async function getPathFromAPI() {
        const algorithmUrlPaths = {
            dfs: `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}`,
            bfs: `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}/${targetVertex.value}`,
            dijkstra: `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}/${targetVertex.value}`
        }
        const selectedUrl = algorithmUrlPaths[selectedAlgorithm.value]
        try {
            const distanceJSONObject = getObjectFromMap()
            const response = await axios.post(selectedUrl, distanceJSONObject)
            graphProcessingResult.value = response.data
            errorMessage.value = ""
        } catch(error) {
            errorMessage.value = `Error: ${error}`
            graphProcessingResult.value = ""
        }
    }
</script>

<style scoped></style>