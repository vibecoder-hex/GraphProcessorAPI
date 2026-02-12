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

<script setup lang="ts">
    const selectedAlgorithmModel = defineModel<string>('selectedAlgorithm')
    const startVertexModel = defineModel<string>('startVertex')
    const targetVertexModel = defineModel<string>('targetVertex')
</script>


<style scoped></style>