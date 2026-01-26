<template>
    <h1>GraphProcessor</h1>
    <form @submit.prevent>
        <select v-model="selectedInputType">
            <option disabled value="">Select input type</option>
            <option>{{ graphInputTypes.jsonFile }}</option>
            <option>{{ graphInputTypes.inputFields }}</option>
        </select><br><br>
        <div v-if="selectedInputType === graphInputTypes.inputFields">
            Riber count: <input v-model="riberCount" type="number" required><br><br>
            <div v-if="isValidRiberCountField">
                <div v-for="number of riberCount">
                    <input placeholder="X vertex" type="text" required>
                    <input placeholder="Y vertex" type="text" required>
                    <input placeholder="Distance" type="number" value="0" required>
                </div>
                <button>Generate graph structure</button>
            </div>
            <div v-else>Max length of ribers is {{ maxRiberCount }}</div>
        </div>
        <div v-else-if="selectedInputType === graphInputTypes.jsonFile">
            <input type="file" accept=".json" @input="getJsonDataFromFile($event)"><br>
        </div>
        <p>Or enter JSON string in text area</p>
        <textarea v-model="distanceJSONString" rows="15" cols="30"></textarea><br><br>
        <div v-if="distanceJSONString">
            <label for="algorithm">Select algorithm:</label>
            <select v-model="selectedAlgorithm">
                <option disabled value="">Select algorithm</option>
                <option>dfs</option>
                <option>bfs</option>
                <option>dijkstra</option>
            </select> <br><br>
            <div v-if="selectedAlgorithm === 'bfs' || selectedAlgorithm === 'dijkstra'" >
                <input v-model="startVertex" type="text" placeholder="Enter start vertex" required>
                <input v-model="targetVertex" type="text" placeholder="Enter target vertex" required>
            </div>
            <div v-else-if="selectedAlgorithm === 'dfs'">
                <input v-model="startVertex" type = "text" placeholder="Enter start vertex">
            </div> <br>
            <button @click="getPathFromAPI()">Send path</button>
        </div>
    </form>
    <div v-if="graphProcessingResult">
        <p>Result</p>
        <ul>
            <li>Start Vertex: {{ graphProcessingResult.result.startVertex }}</li>
            <li>Target Vertex: {{ graphProcessingResult.result.targetVertex }}</li>
            <li>Path: {{ graphProcessingResult.result.shortestPath.join("->") }}</li>
            <li>Algorithm: {{ graphProcessingResult.result.algorithm }}</li>
            <li>Time: {{ graphProcessingResult.result.timeNs }} nanoseconds</li>
        </ul>
    </div>
    <br>
    <div>{{ errorMessage }}</div>
</template>

<script setup>
    import { computed, ref } from 'vue'
    import axios from 'axios'

    const APIURL = "http://localhost:5170/api/graph_processor"
    const graphInputTypes = {
        jsonFile: "Get graph structure by JSON",
        inputFields: "Get graph structure by input fields"
    }

    const riberCount = ref(1)
    const selectedInputType = ref("")
    
    const selectedAlgorithm = ref("")
    const startVertex = ref("")
    const targetVertex = ref("")
    
    const distanceJSONString = ref("")
    const graphProcessingResult = ref(null)
    const errorMessage = ref("")
    
    const maxRiberCount = 100
    const isValidRiberCountField = computed(() => riberCount.value <= maxRiberCount)

    function getJsonDataFromFile(event) {
        const file = event.target.files[0]
        const reader = new FileReader()
        reader.readAsText(file)
        reader.onload = () => {
            distanceJSONString.value = reader.result;
        }
    }

    async function getPathFromAPI() {
        if (!startVertex.value || !targetVertex) {
            errorMessage.value = "Vertex fields is empty"
            return
        }
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
        } catch(error) {
            errorMessage.value = `Error: ${error}`
        }
    }
</script>

<style scoped></style>
