<template>
    <div>
        <p>Enter Nodes</p>
        <label>Node name:</label>
        <input v-model="nodeNameValue" type="text"><br><br>
        <button @click="NodeMethods.addNode()">Add Node</button> <button @click="NodeMethods.deleteNode()" >Delete node</button>
    </div>
    <br>
    <div>
        <p>Enter Edges</p>
        <label>From: </label>
        <input v-model="fromNodeValue" type="text">
        <label>To: </label>
        <input v-model="toNodeValue" type="text">
        <label>Distance</label>
        <input v-model="distanceNumber" type="number"><br><br>
        <button @click="EdgeMethods.addEdge()">Add path</button> <button @click="EdgeMethods.deleteEdge()">Delete path</button>
    </div>
    <button @click="printDataValue()">OK</button>
</template>
 
<script setup>
    import { defineModel, ref } from 'vue';

    const distanceMap = defineModel("distanceMap");
    const nodeNameValue = ref("")
    const fromNodeValue = ref("")
    const toNodeValue = ref("")
    const distanceNumber = ref(0)

    function printDataValue() {
        const distanceObject = {}
        distanceMap.value.forEach((neighbors, node) => {
            distanceObject[node] = Object.fromEntries(neighbors)
        })
        console.log(distanceObject)
    }

    class NodeMethods {
        static addNode() {
            if (!distanceMap.value.has(nodeNameValue.value)) {
                distanceMap.value.set(nodeNameValue.value, new Map())
            } else {
                alert("Incorrect node name value")
            }
        }
        static deleteNode() {
            if (distanceMap.value.has(nodeNameValue.value)) {
                distanceMap.value.delete(nodeNameValue.value)
            } else {
                alert("Incorrect node name value")
            }
        }
    }

    class EdgeMethods {
        static addEdge() {
            distanceMap.value
                .get(fromNodeValue.value)
                .set(toNodeValue.value, distanceNumber.value)
        }
        static deleteEdge() {
            distanceMap.value
                    .get(fromNodeValue.value)
                    .delete(toNodeValue.value)
        }
    }
    

</script>

<style scoped></style>