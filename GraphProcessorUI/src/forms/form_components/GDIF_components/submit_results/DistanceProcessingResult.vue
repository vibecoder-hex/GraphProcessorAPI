<template>
    <p>Result</p>
    <ul>
        <li>Start Vertex: {{ props.graphProcessingResult.result.startVertex }}</li>
        <li>Target Vertex: {{ props.graphProcessingResult.result.targetVertex }}</li>
        <li>Path: {{ props.graphProcessingResult.result.shortestPath.join("->") }}</li>
        <li>Algorithm: {{ props.graphProcessingResult.result.algorithm }}</li>
        <li>Time: {{ props.graphProcessingResult.result.timeNs }} nanoseconds</li>
    </ul>
</template>

<script setup>
    import { defineProps } from 'vue'
    
    const props = defineProps({
        graphProcessingResult: Object
    })
</script>

<style scoped></style>