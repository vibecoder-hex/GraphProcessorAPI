<template>
    <button @click="addEdge()">Add edge</button>
    <button @click="removeEdge()">Remove edge</button>
    <div v-for="(item, index) of edgeObjects">
        <span>Edge {{ index + 1 }}</span>
        <input v-model="item.X" placeholder="X vertex" type="text" required>
        <input v-model="item.Y" placeholder="Y vertex" type="text" required>
        <input v-model="item.Distance" placeholder="Distance" type="number" value="0" required>
    </div>
    <button @click="generateGraphStructure()" >Generate graph structure</button>
</template>

<script setup>
    import { ref, defineModel } from 'vue'
    import { GraphStructureGenerator } from '../../../../utils/graphJsonTransposer.js'

    const edgeObjects = ref([])
    const distanceJSONString = defineModel('distanceJSONString')
    
    const isValidEdgeInput = (element) => (element.X && element.Y && element.Distance !== "")
    
    const addEdge = () => edgeObjects.value.push({X: '', Y: '', Distance: ''})
    
    function removeEdge() {
        if (edgeObjects.value.length > 1) {
            edgeObjects.value.splice(edgeObjects.value.length - 1, 1)
        }
    }
    
    function generateGraphStructure() {
        const graph = new GraphStructureGenerator()
        for (let element of edgeObjects.value) {
            if (isValidEdgeInput(element)) {
                graph.addVertex(element.X)
                graph.addEdge(element.X, element.Y, element.Distance)
            } else {
                alert("all fields must be filled")
                return 
            }
        }
        distanceJSONString.value = JSON.stringify(graph.getObject(), null, 4)
    }
    
    
    
</script>

<style scoped></style>