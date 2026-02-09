<template>
    <div>
        <p>Enter Nodes</p>
        <label>Node name:</label>
        <input v-model="nodeNameValue" type="text"><br><br>
        <button @click="NodeMethods.addNode()">Add Node</button> <button @click="NodeMethods.deleteNode()" >Delete node</button>
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
        <button @click="EdgeMethods.addEdge()">Add path</button> <button @click="EdgeMethods.deleteEdge()">Delete path</button>
    </div>
    <div v-if="distanceMap.size > 0">
        <NetworkVisualizationCanvas :visNodes="visNodes" :visEdges="visEdges"/>
    </div>
</template>
 
<script setup>
    import { defineModel, ref } from 'vue';
    import { DataSet } from "vis-network/standalone"
    import { NetworkCanvasProcessor } from "@/utils/networkCanvasProcessor.js";
    import NetworkVisualizationCanvas from "@/graph_view/NetworkVisualisationCanvas.vue";

    const distanceMap = defineModel("distanceMap");
    
    const nodeNameValue = ref("")
    const fromNodeValue = ref("")
    const toNodeValue = ref("")
    const distanceNumber = ref(0)
    
    const visNodes = new DataSet()
    const visEdges = new DataSet()
    
    
    class NodeMethods {
        static addNode() {
            if (!distanceMap.value.has(nodeNameValue.value)) {
                distanceMap.value.set(nodeNameValue.value, new Map())
                NetworkCanvasProcessor.AddVisNode(nodeNameValue.value, nodeNameValue.value, visNodes)
            } else {
                alert("Incorrect node name value")
            }
        }
        static deleteNode() {
            if (distanceMap.value.has(nodeNameValue.value) && distanceMap.value.has(toNodeValue.value)) {
                distanceMap.value.delete(nodeNameValue.value)
                NetworkCanvasProcessor.RemoveVisNode(nodeNameValue.value, nodeNameValue.value, visNodes)
            } else {
                alert("Incorrect node name value")
            }
        }
    }

    class EdgeMethods {
        static addEdge() {
            const fromNode = distanceMap.value.get(fromNodeValue.value)
            if (!fromNode.has(toNodeValue.value) && distanceMap.value.has(toNodeValue.value)) {
                fromNode.set(toNodeValue.value, distanceNumber.value)
                NetworkCanvasProcessor.AddVisEdge(fromNodeValue.value, toNodeValue.value, visEdges)
            } else {
                alert("Incorrect edge name value")
            }
        }
        static deleteEdge() {
            const fromNode = distanceMap.value.get(fromNodeValue.value)
            if (fromNode.has(toNodeValue.value) && fromNode) {
                fromNode.delete(toNodeValue.value)
                NetworkCanvasProcessor.RemoveVisEdge(fromNodeValue.value, toNodeValue.value, visEdges)
            } else {
                alert("Incorrect edge name value")
            }
        }
    }
    

</script>

<style scoped></style>