<template>
    <div class="user-input">
        <div class="node-input card">
            <div class="card-content">
                <div class="content">
                </div>
                    <p class="is-size-5">Enter Nodes</p>
                    <label class="label">Node name:</label>
                    <input class="input" v-model="nodeNameValue" type="text"><br><br>
                    <button class="button" @click="NodeMethods.addNode(nodeNameValue, distanceMap, visNodes)">Add Node</button> <button class="button" @click="NodeMethods.deleteNode(nodeNameValue, distanceMap, visNodes)" >Delete node</button>
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
                    <button class="button" @click="EdgeMethods.addEdge(fromNodeValue, toNodeValue, distanceNumber, distanceMap, visEdges)">Add path</button> <button class="button" @click="EdgeMethods.deleteEdge(fromNodeValue, toNodeValue, distanceMap, visEdges)">Delete path</button>
                </div>
            </div>
        </div>
    </div>
    <div v-if="distanceMap.size > 0">
        <label>Show graph canvas</label> 
        <input type="checkbox" v-model="showCanvas">
        <NetworkVisualizationCanvas v-if="showCanvas" :visNodes="visNodes" :visEdges="visEdges"/>
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
    
    const showCanvas = ref<boolean>(false);
    

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