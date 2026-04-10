<template>
    <form @submit.prevent>
        <p class="is-size-5">Please enter graph params</p>
        <UserInputVertexField v-model:distanceMap="distanceMap"/>
        <div v-if="distanceMap.size > 0" class="graph-structure">
            <div>
                <label>Show graph structure</label>
                <input type="checkbox" v-model="showGraphStructure">
            </div>
            <div v-if="showGraphStructure">
                <pre><code>
                    {{ JSON.stringify(getObjectFromMap(), null, 2) }}
                </code></pre>
                <button class="button is-text" @click="downloadGraphStructure(getObjectFromMap())" >Download graph structure</button>
            </div>

           <AlgorithmSelectionField v-model:selectedAlgorithm="selectedAlgorithm"
                                     v-model:startVertex="startVertex"
                                     v-model:targetVertex="targetVertex"
            />
            <button class="button is-primary" @click="getPathFromAPI()">Send path</button>
            <div v-if="graphProcessingResult">
                <DistanceProcessingResult :result="graphProcessingResult.result"/>
            </div>
            <div>{{ errorMessage }}</div>
        </div>
    </form>
</template>

<script setup lang="ts">
    import { ref } from 'vue'
    import axios from 'axios'
    import UserInputVertexField from './form_components/fields/UserInputVertexField.vue'
    import AlgorithmSelectionField from './form_components/fields/AlgorithmSelectionField.vue'
    import DistanceProcessingResult from "./form_components/submit_results/DistanceProcessingResult.vue";
    import type { IDistanceProcessingRootObject, IDistanceRootObject } from "../../utils/interfacesAndTypes.ts"
    
    const APIURL: string = "/api/GraphAlgorithms"

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
    
    function downloadGraphStructure(distanceObject: IDistanceRootObject) {
        const link: HTMLAnchorElement = document.createElement('a');
        const distanceString: string = JSON.stringify(distanceObject, null, 4);
        const blob: Blob = new Blob([distanceString], { type: "application/json" });
        
        link.download = 'graph_structure.json';
        link.href = URL.createObjectURL(blob);
        link.click();
        
        URL.revokeObjectURL(link.href);
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
            if (axios.isAxiosError(error)) {
                errorMessage.value = `Error: ${error} ${error.response?.data.error}`
            }
            else {
                errorMessage.value = `Error: ${error}`
            }
            graphProcessingResult.value = null
        }
    }
</script>

<style scoped>
    .graph-structure {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
</style>