<template>
    <div class="user-input">
        <div class="node-input card">
            <div class="card-content">
                <div class="content">
                    <p class="is-size-5">Enter Nodes</p>
                    <label class="label">Node name:</label>
                    <input class="input" v-model="nodeNameValue" type="text"><br><br>
                    <button class="button" @click="handleNodesOperation(NodeMethods.addNode(nodeNameValue, distanceMap, visNodes))">Add Node</button> <button class="button" @click="handleNodesOperation(NodeMethods.deleteNode(nodeNameValue, distanceMap, visNodes))" >Delete node</button>
                    <p class="has-text-warning">{{ nodeCardMessage }}</p>
                </div>  
            </div>
        </div>  
        <br>
        <div class="edge-input card">
            <div class="card-content">
                <div class="content">
                    <p class="is-size-5">Enter Edges</p>
                    <label>From: </label>
                    <input class="input" v-model="fromNodeValue" type="text">
                    <label>To: </label>
                    <input class="input" v-model="toNodeValue" type="text">
                    <label>Distance</label>
                    <input class="input" v-model="distanceNumber" type="number"><br><br>
                    <button class="button" @click="handleEdgeMethods(EdgeMethods.addEdge(fromNodeValue, toNodeValue, distanceNumber, distanceMap, visEdges))">Add path</button> <button class="button" @click="handleEdgeMethods(EdgeMethods.deleteEdge(fromNodeValue, toNodeValue, distanceMap, visEdges))">Delete path</button>
                </div>
                <p class="has-text-warning">{{ edgeCardMessage }}</p>
            </div>
        </div>
    </div>
    <div v-if="distanceMap.size > 0">
        <label>Show graph canvas</label> 
        <input type="checkbox" v-model="showCanvas">
        <div v-if="showCanvas">
            <NetworkVisualizationCanvas :visNodes="visNodes" :visEdges="visEdges"/>
            <button class="button is-danger" @click="NetworkCanvasProcessor.ResetColors(visEdges)">Reset edge colors</button>
        </div>
    </div>
    
</template>
 
<script setup lang="ts">
    import { ref } from 'vue';
    import NetworkVisualizationCanvas from "../../../graph_view/NetworkVisualisationCanvas.vue";
    import { NetworkCanvasProcessor } from "@/services/graphServices/networkCanvasService.ts";
    import { NodeMethods, EdgeMethods } from "@/services/graphServices/graphOperationsService.ts"
    import type { IOperationResult } from "@/models/interfacesAndTypes.ts";
    import { DataSet, type Node, type Edge } from "vis-network/standalone"

    const distanceMap = defineModel<Map<string, Map<string, number>>>("distanceMap", {required: true});
    const visNodes = defineModel<DataSet<Node>>("visNodes", {required: true});
    const visEdges = defineModel<DataSet<Edge>>("visEdges", {required: true});
    
    const nodeNameValue = ref<string>("")
    const fromNodeValue = ref<string>("")
    const toNodeValue = ref<string>("")
    const distanceNumber = ref(0)
    
    const showCanvas = ref<boolean>(false)
    
    const nodeCardMessage = ref<string>("")
    const edgeCardMessage = ref<string>("")
    
    function handleNodesOperation(operationResult: IOperationResult) {
        if (!operationResult.isValid) {
            nodeCardMessage.value = operationResult.errorMessage
        }
        else {
            nodeCardMessage.value = ""
            nodeNameValue.value = ""
        }
        
    }
    
    function handleEdgeMethods(operationResult: IOperationResult) {
        if (!operationResult.isValid) {
            edgeCardMessage.value = operationResult.errorMessage
        }
        else {
            edgeCardMessage.value = ""
            fromNodeValue.value = ""
            toNodeValue.value = ""
            distanceNumber.value = 0
              
        }
    }
    
</script>

<style scoped>
    @media (min-width: 1000px) {
        .user-input {
            display: flex;
            flex-direction: row;
            gap: 20px;
            margin-top: 20px;
        }
      .card {
          flex: 1;
      }
    }
    @media (max-width: 640px) {
        .user-input{
            display: flex;
            flex-direction: column;
        }
    }
</style>