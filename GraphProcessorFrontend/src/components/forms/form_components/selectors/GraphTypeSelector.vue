<script setup lang="ts">
    import type { GraphType } from "@/models/interfacesAndTypes.ts";
    
    const selectedGraphType = defineModel<GraphType>("selectedGraphType");
    const isGraphTypeSelected = defineModel<boolean>("isGraphTypeSelected");
</script>

<template>
    <div class="select" v-if="!isGraphTypeSelected">
        <p class="is-size-5">Please select graph type</p>
        <select v-model="selectedGraphType">
            <option disabled value="">Select graph type</option>
            <option value="oriented">Oriented</option>
            <option value="non-oriented" >Non-Oriented</option>
        </select>
        <button @click="isGraphTypeSelected = true" class="button is-success">Select</button>
    </div>
</template>

<style scoped>
    .select {
        display: flex;
        @media (min-width: 1024px) {
            flex-direction: row;
            gap: 20px;
        }
        @media (max-width: 640px) {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
    }
</style>