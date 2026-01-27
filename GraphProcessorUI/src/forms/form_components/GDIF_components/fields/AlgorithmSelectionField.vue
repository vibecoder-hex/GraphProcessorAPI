<script setup>
    import { defineModel } from 'vue'
    
    const selectedAlgorithmModel = defineModel('selectedAlgorithm')
    const startVertexModel = defineModel('startVertex')
    const targetVertexModel = defineModel('targetVertex')
</script>

<template>
    <label for="algorithm">Select algorithm:</label>
    <select v-model="selectedAlgorithmModel">
        <option disabled value="">Select algorithm</option>
        <option>dfs</option>
        <option>bfs</option>
        <option>dijkstra</option>
    </select>
    <div v-if="selectedAlgorithmModel === 'bfs' || selectedAlgorithmModel === 'dijkstra'" >
        <input v-model="startVertexModel" type="text" placeholder="Enter start vertex" required>
        <input v-model="targetVertexModel" type="text" placeholder="Enter target vertex" required>
    </div>
    <div v-else-if="selectedAlgorithmModel === 'dfs'">
        <input v-model="startVertexModel" type="text" placeholder="Enter start vertex">
    </div>
</template>

<style scoped></style>