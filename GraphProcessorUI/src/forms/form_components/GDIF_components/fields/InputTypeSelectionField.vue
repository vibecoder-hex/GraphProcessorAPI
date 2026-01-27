<template>
    <select v-model="selectedInputTypeModel">
        <option disabled value="">Select input type</option>
        <option>{{ props.graphInputTypes.jsonFile }}</option>
        <option>{{ props.graphInputTypes.inputFields }}</option>
    </select>
</template>

<script setup>
    import { defineModel, defineProps } from 'vue'  
    
    const selectedInputTypeModel = defineModel('selectedInputType')
    const props = defineProps({ 
        graphInputTypes: Object 
    });
</script>

<style scoped></style>