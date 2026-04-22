<script setup lang="ts">
    const selectedAlgorithmModel = defineModel<string>('selectedAlgorithm')
    const startVertexModel = defineModel<string>('startVertex')
    const targetVertexModel = defineModel<string>('targetVertex')
</script>

<template>
      <div class="algorithm-selection">
          <div v-if="selectedAlgorithmModel === 'bfs' || selectedAlgorithmModel === 'dijkstra'" class="shortest-path-fields">
              <input class="input" v-model="startVertexModel" type="text" placeholder="Enter start vertex">
              <input class="input" v-model="targetVertexModel" type="text" placeholder="Enter target vertex">
          </div>
          <div v-else-if="selectedAlgorithmModel === 'dfs'">
              <input class="input" v-model="startVertexModel" type="text" placeholder="Enter start vertex">
          </div>
      </div>
</template>

<style scoped>
    @media(min-width: 1000px){
        .shortest-path-fields {
            display: flex;
            flex-direction: row;
            gap: 20px;
        }
    }
    .algorithm-selection {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

</style>