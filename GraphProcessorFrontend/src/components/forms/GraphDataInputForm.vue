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
                <DistanceProcessingResult :result="graphProcessingResult.result"/>
            </div>
            <br>
            <div>{{ errorMessage }}</div>
        </div>
    </form>
</template>

<script setup lang="ts">
    import { ref } from 'vue'
    import axios from 'axios'
    import UserInputVertexField from './form_components/GDIF_components/fields/UserInputVertexField.vue'
    import AlgorithmSelectionField from './form_components/GDIF_components/fields/AlgorithmSelectionField.vue'
    import DistanceProcessingResult from "./form_components/GDIF_components/submit_results/DistanceProcessingResult.vue";
    import type { IDistanceProcessingRootObject, IDistanceRootObject } from "../../utils/interfaces.ts"
    
    const APIURL: string = "http://localhost:5170/api/graph_processor"

    type Algorithm = "bfs" | "dfs" | "dijkstra"
    const selectedAlgorithm = ref<Algorithm>("dijkstra")

    const startVertex = ref<string>("")
    const targetVertex = ref<string>("")

    const showGraphStructure = ref<boolean>(false)
    const distanceMap = ref<Map<string, Map<string, number>>>(new Map())
    const graphProcessingResult = ref<IDistanceProcessingRootObject | null>(null)
    const errorMessage = ref<string>("")


    function getObjectFromMap(): IDistanceRootObject {
        const distanceObject: IDistanceRootObject = { Distances: {} }
        distanceMap.value.forEach((neighbors: Map<string, number>, node: string) => {
            distanceObject.Distances[node] = Object.fromEntries(neighbors)
        })
        return distanceObject
    }
    
    function getSelectedUrl(): string {
        const baseUrl = `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}`
        switch (selectedAlgorithm.value) {
            case "bfs":
            case "dijkstra":
                return `${baseUrl}/${targetVertex.value}`
            case "dfs":
                return baseUrl
        }
    }
    
    async function getPathFromAPI() {
        const selectedUrl: string = getSelectedUrl()
        try {
            const distanceJSONObject = getObjectFromMap()
            const response = await axios.post(selectedUrl, distanceJSONObject)
            graphProcessingResult.value = response.data
            errorMessage.value = ""
        } catch(error) {
            errorMessage.value = `Error: ${error}`
            graphProcessingResult.value = null
        }
    }
</script>

<style scoped></style>