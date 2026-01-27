<template>
    Riber count: <input v-model="riberCount" type="number" required><br><br>
    <div v-if="isValidRiberCountField">
        <div v-for="number of riberCount">
            <input placeholder="X vertex" type="text" required>
            <input placeholder="Y vertex" type="text" required>
            <input placeholder="Distance" type="number" value="0" required>
        </div>
        <button>Generate graph structure</button>
    </div>
    <div v-else>Max length of ribers is {{ maxRiberCount }}</div>
</template>

<script setup>
    import { computed, ref } from 'vue'

    const riberCount = ref(1)
    const isValidRiberCountField = computed(() => riberCount.value <= maxRiberCount)
    const maxRiberCount = 100
</script>

<style scoped></style>