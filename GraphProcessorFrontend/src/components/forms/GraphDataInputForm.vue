<script setup lang="ts">
    import { ref } from 'vue'
    import UserInputVertexField from './form_components/fields/UserInputVertexField.vue'
    import PathSearchField from "@/components/forms/form_components/fields/PathSearchField.vue";
    import AlgorithmSelector from "@/components/forms/form_components/selectors/AlgorithmSelector.vue";
    import GraphTypeSelector from "@/components/forms/form_components/selectors/GraphTypeSelector.vue";
    import DistanceProcessingResult from "./form_components/submit_results/DistanceProcessingResult.vue";
    import type {
      IDistanceProcessingRootObject,
      IGraphParametersObject,
      IResponseOperationResult,
      Algorithm,
      GraphType
    } from "@/models/interfacesAndTypes.ts"
    import { GraphAlgorithmsRequests } from "@/services/http_requests/GraphAlgorithmsRequests.ts";
    import {NetworkCanvasProcessor} from "@/services/graphServices/networkCanvasService.ts";
    import { DataSet, type Edge, type Node } from "vis-network/standalone"

    const APIURL: string = "/api/GraphAlgorithms"
    
    const selectedAlgorithm = ref<Algorithm>("dijkstra")

    const startVertex = ref<string>("")
    const targetVertex = ref<string>("")

    const showGraphStructure = ref<boolean>(false)
    const distanceMap = ref<Map<string, Map<string, number>>>(new Map())
    const graphProcessingResult = ref<IDistanceProcessingRootObject | null>(null)
    const errorMessage = ref<string>("")

    const visNodes = new DataSet<Node>()
    const visEdges = new DataSet<Edge>()

    const selectedGraphType = ref<GraphType>("oriented")
    const isGraphTypeSelected = ref<boolean>(false)

    function getObjectFromMap(): IGraphParametersObject {
        const distanceObject: IGraphParametersObject = { Distances: {} }
        distanceMap.value.forEach((neighbors: Map<string, number>, node: string) => {
            distanceObject.Distances[node] = Object.fromEntries(neighbors)
        })
        return distanceObject
    }
    
    function downloadGraphStructure(distanceObject: IGraphParametersObject) {
        const link: HTMLAnchorElement = document.createElement('a');
        const distanceString: string = JSON.stringify(distanceObject, null, 4);
        const blob: Blob = new Blob([distanceString], { type: "application/json" });
        
        link.download = 'graph_structure.json';
        link.href = URL.createObjectURL(blob);
        link.click();
        
        URL.revokeObjectURL(link.href);
    }
    
    
    async function handleRequestedPath(): Promise<void> {
        const graphAlgorithmsRequests = new GraphAlgorithmsRequests(APIURL, getObjectFromMap(), selectedAlgorithm.value, startVertex.value, targetVertex.value)
        const pathRequest: IResponseOperationResult = await graphAlgorithmsRequests.getPathFromRequest();
        if (pathRequest && pathRequest.operation.isValid) {
            const shortestPath: IDistanceProcessingRootObject | null  = pathRequest.responseData
            if (shortestPath !== null) {
                graphProcessingResult.value = shortestPath
                errorMessage.value = ""
                NetworkCanvasProcessor.ResetColors(visEdges);
                NetworkCanvasProcessor.UpdateColor(visEdges, shortestPath.result.shortestPath);
            }
        }
        else {
             errorMessage.value = pathRequest.operation.errorMessage
             graphProcessingResult.value = null
        }
    }
    
</script>

<template>
    <form @submit.prevent>
        <GraphTypeSelector v-model:selectedGraphType="selectedGraphType" v-model:isGraphTypeSelected="isGraphTypeSelected"></GraphTypeSelector>
        <UserInputVertexField v-if="isGraphTypeSelected"
                              v-model:selectedGraphType="selectedGraphType"
                              v-model:distanceMap="distanceMap"
                              v-model:visEdges="visEdges"
                              v-model:visNodes="visNodes"/>
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
            
           <AlgorithmSelector v-model:selectedAlgorithm="selectedAlgorithm" />
           <PathSearchField v-model:selectedAlgorithm="selectedAlgorithm"
                                     v-model:startVertex="startVertex"
                                     v-model:targetVertex="targetVertex"
            />
            <button class="button is-primary" @click="handleRequestedPath()">Send path</button>
            <div v-if="graphProcessingResult">
                <DistanceProcessingResult :result="graphProcessingResult.result"/>
            </div>
            <div>{{ errorMessage }}</div>
        </div>
    </form>
</template>


<style scoped>
    .graph-structure {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
</style>