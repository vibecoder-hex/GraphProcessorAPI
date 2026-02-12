<template>
    <div>
        <p>Enter Nodes</p>
        <label>Node name:</label>
        <input v-model="nodeNameValue" type="text"><br><br>
        <button @click="NodeMethods.addNode(nodeNameValue, distanceMap, visNodes)">Add Node</button> <button @click="NodeMethods.deleteNode(nodeNameValue, toNodeValue, distanceMap, visNodes)" >Delete node</button>
    </div>
    <br>
    <div>
        <p>Enter Edges</p>
        <label>From: </label>
        <input v-model="fromNodeValue" type="text">
        <label>To: </label>
        <input v-model="toNodeValue" type="text">
        <label>Distance</label>
        <input v-model="distanceNumber" type="number"><br><br>
        <button @click="EdgeMethods.addEdge(fromNodeValue, toNodeValue, distanceNumber, distanceMap, visEdges)">Add path</button> <button @click="EdgeMethods.deleteEdge(fromNodeValue, toNodeValue, distanceMap, visEdges)">Delete path</button>
    </div>
    <div v-if="distanceMap.size > 0">
        <NetworkVisualizationCanvas :visNodes="visNodes" :visEdges="visEdges"/>
    </div>
</template>
 
<script setup lang="ts">
    import { ref } from 'vue';
    import { DataSet, type Edge, type Node } from "vis-network/standalone"
    import NetworkVisualizationCanvas from "../../../../graph_view/NetworkVisualisationCanvas.vue";
    import { NodeMethods, EdgeMethods } from "../../../../../utils/services/graphOperationsService.ts"

    const distanceMap = defineModel<Map<string, Map<string, number>>>("distanceMap", {required: true});
    
    const nodeNameValue = ref<string>("")
    const fromNodeValue = ref<string>("")
    const toNodeValue = ref<string>("")
    const distanceNumber = ref(0)
    
    const visNodes = new DataSet<Node>()
    const visEdges = new DataSet<Edge>()
    

</script>

<style scoped></style>