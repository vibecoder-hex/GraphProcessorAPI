
<script setup lang="ts">
    import type { IDistanceProcessingRootObject } from "@/models/interfacesAndTypes.ts"
    
    const props = defineProps<IDistanceProcessingRootObject>();
</script>

<template>
    <table class="table is-bordered">
        <thead>
            <tr>
                <td colspan="2">Results</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Start Vertex</th>
                <td>{{ props.result.startVertex }}</td>
            </tr>
            <tr v-if="props.result.targetVertex">
                <th>Target Vertex</th>
                <td>{{ props.result.targetVertex }}</td>
            </tr>
            <tr>
                <th>Algorithm</th>
                <td>{{ props.result.algorithm }}</td>
            </tr>
            <tr>
                <th>Path</th>
                <td>{{ props.result.shortestPath.join("->") }}</td>
            </tr>
            <tr>
                <th>Time</th>
                <td>{{ props.result.timeNs }}</td>
            </tr>
            <tr v-if="props.result.totalDistance">
                <th>Distance</th>
                <td>{{ props.result.totalDistance }}</td>
            </tr>
        </tbody>
    </table>
</template>

<style scoped>
    table {
      width: 100%;
      table-layout: fixed;
    }
</style>