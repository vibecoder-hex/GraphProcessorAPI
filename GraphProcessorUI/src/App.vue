<script setup>
    import { ref } from 'vue'
    import axios from 'axios'

    const APIURL = "http://localhost:5170/api/graph_processor"

    let selectedAlgorithm = ref("")
    let startVertex = ref("")
    let targetVertex = ref("")
    let distanceJSONString = ref("")
    let graphProcessingResult = ref(null)

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
            console.error("Vertex fields is empty")
            return
        }
        let shortestPathUrl = null
        switch (selectedAlgorithm.value) {
            case "dfs":
                shortestPathUrl = `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}`
                break
            case "bfs":
            case "dijkstra":
                shortestPathUrl = `${APIURL}/${selectedAlgorithm.value}/${startVertex.value}/${targetVertex.value}`
                break
            default:
                console.error("Algorithm don`t selected")
        }
        try {
            const jsonObject = JSON.parse(distanceJSONString.value)
            const response = await axios.post(shortestPathUrl, jsonObject)
            graphProcessingResult.value = response.data
        }
        catch (error) {
            console.log(error)
        }
    }

</script>

<template>
    <h1>GraphProcessor</h1>
    <form @submit.prevent>
        <input type="file" accept=".json" @input="getJsonDataFromFile($event)"><br>
        <p>Or enter JSON string in text area</p>
        <textarea v-model="distanceJSONString" rows="15" cols="30"></textarea><br><br>
        <select v-model="selectedAlgorithm">
            <option disabled value="">Select algorithm</option>
            <option>dfs</option>
            <option>bfs</option>
            <option>dijkstra</option>
        </select>
        <br><br>
        <div v-if="distanceJSONString">
            <div v-if="selectedAlgorithm == 'bfs' || selectedAlgorithm == 'dijkstra'" >
                <input v-model="startVertex" type="text" placeholder="Enter start vertex">
                <input v-model="targetVertex" type="text" placeholder="Enter target vertex">
            </div>
            <div v-else-if="selectedAlgorithm == 'dfs'">
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
</template>

<style scoped></style>
