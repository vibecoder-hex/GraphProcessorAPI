<template>
    <form @submit.prevent>
        <InputTypeSelectionField v-model:selectedInputType="selectedInputType" :graphInputTypes="graphInputTypes"/>
        <br><br>
        <div v-if="selectedInputType === graphInputTypes.inputFields">
           <UserInputVertexField v-model:distanceJSONString="distanceJSONString"/>
        </div>
        <div v-else-if="selectedInputType === graphInputTypes.jsonFile">
            <JsonFileVertexField v-model:distanceJSONString="distanceJSONString"/>
        </div>
        <p>Or enter JSON string in text area</p>
        <textarea v-model="distanceJSONString" rows="15" cols="30"></textarea>
        <br><br>
        <div v-if="distanceJSONString">
            <AlgorithmSelectionField v-model:selectedAlgorithm="selectedAlgorithm"
                                     v-model:startVertex="startVertex"
                                     v-model:targetVertex="targetVertex"
            />
            <br>
            <button @click="getPathFromAPI()">Send path</button>
        </div>
    </form>
    <div v-if="graphProcessingResult">
        <DistanceProcessingResult :graphProcessingResult="graphProcessingResult"/>
    </div>
    <br>
    <div>{{ errorMessage }}</div>
</template>

<script setup>
    import { ref } from 'vue'
    import axios from 'axios'
    import InputTypeSelectionField from './form_components/GDIF_components/fields/InputTypeSelectionField.vue'
    import UserInputVertexField from './form_components/GDIF_components/fields/UserInputVertexField.vue'
    import JsonFileVertexField from './form_components/GDIF_components/fields/JsonFileVertexField.vue'
    import AlgorithmSelectionField from './form_components/GDIF_components/fields/AlgorithmSelectionField.vue'
    import DistanceProcessingResult from "./form_components/GDIF_components/submit_results/DistanceProcessingResult.vue";
    
    const APIURL = "http://localhost:5170/api/graph_processor"

    const graphInputTypes = {
        jsonFile: "Get graph structure by JSON",
        inputFields: "Get graph structure by input fields"
    }
    
    const selectedInputType = ref("")
    
    const selectedAlgorithm = ref("")
    const startVertex = ref("")
    const targetVertex = ref("")
    
    const distanceJSONString = ref("")
    const graphProcessingResult = ref(null)
    const errorMessage = ref("")
    
    
    async function getPathFromAPI() {
        const algorithmUrlPaths = {
            dfs: `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}`,
            bfs: `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}/${targetVertex.value}`,
            dijkstra: `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}/${targetVertex.value}`
        }
        const selectedUrl = algorithmUrlPaths[selectedAlgorithm.value]
        try {
            const distanceJSONObject = JSON.parse(distanceJSONString.value)
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