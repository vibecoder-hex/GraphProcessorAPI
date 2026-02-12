<template>
    <p>Result</p>
    <ul>
        <li>Start Vertex: {{ props.result.startVertex }}</li>
        <li>Target Vertex: {{ props.result.targetVertex }}</li>
        <li>Path: {{ props.result.shortestPath.join("->") }}</li>
        <li>Algorithm: {{ props.result.algorithm }}</li>
        <li>Time: {{ props.result.timeNs }} nanoseconds</li>
    </ul>
</template>

<script setup lang="ts">
    import type { IDistanceProcessingRootObject } from "../../../../../utils/interfaces.ts"
    
    const props = defineProps<IDistanceProcessingRootObject>();
</script>

<style scoped></style>