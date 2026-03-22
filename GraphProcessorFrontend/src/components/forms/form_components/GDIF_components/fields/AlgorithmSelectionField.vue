<template>
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
      <div v-if="selectedAlgorithmModel === 'bfs' || selectedAlgorithmModel === 'dijkstra'" class="shortest-path-fields">
          <input class="input" v-model="startVertexModel" type="text" placeholder="Enter start vertex" required>
          <input class="input" v-model="targetVertexModel" type="text" placeholder="Enter target vertex" required>
      </div>
      <div v-else-if="selectedAlgorithmModel === 'dfs'">
          <input class="input" v-model="startVertexModel" type="text" placeholder="Enter start vertex">
      </div>

</template>

<script setup lang="ts">
    const selectedAlgorithmModel = defineModel<string>('selectedAlgorithm')
    const startVertexModel = defineModel<string>('startVertex')
    const targetVertexModel = defineModel<string>('targetVertex')
</script>


<style scoped>
    @media(min-width: 1000px){
        .shortest-path-fields {
            display: flex;
            flex-direction: row;
        }
    }

</style>