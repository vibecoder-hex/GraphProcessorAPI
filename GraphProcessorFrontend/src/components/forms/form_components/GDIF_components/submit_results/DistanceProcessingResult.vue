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
            <tr>
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
                <td>{{ props.result.timeNs}}</td>
            </tr>
            <tr>
                <th>Distance</th>
                <td>{{ props.result.totalDistance }}</td>
            </tr>
        </tbody>
    </table>
</template>

<script setup lang="ts">
    import type { IDistanceProcessingRootObject } from "../../../../../utils/interfaces.ts"
    
    const props = defineProps<IDistanceProcessingRootObject>();
</script>

<style scoped>
    @media (max-width: 768px) {
        table {
            width: 100%;
        }
    }
</style>