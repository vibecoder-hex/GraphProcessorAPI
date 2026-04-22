<script setup lang="ts">
    const selectedAlgorithmModel = defineModel<string>("selectedAlgorithm", {required: true})
</script>

<template>
    <div>
        <label for="algorithm">Select algorithm:</label>
        <div class="control">
            <div class="select">
                <select v-model="selectedAlgorithmModel">
                    <option disabled value="">Select algorithm</option>
                    <option value="dfs">DFS (в глубину)</option>
                    <option value="bfs">BFS (в ширину)</option>
                    <option value="dijkstra">Dijkstra</option>
                </select>
            </div>
        </div>
    </div>
</template>

<style scoped>

</style>