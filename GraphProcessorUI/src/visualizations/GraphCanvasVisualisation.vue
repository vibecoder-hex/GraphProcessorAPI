<template>
    <div ref="networkContainer" id="network-container"></div>
</template>

<script setup>
    import { ref, onMounted, defineProps } from 'vue'
    import { NetworkVisualizer } from '@/utils/networkVisualizer.js'

    const networkContainer = ref(null)
    const props = defineProps({
        distanceJSONString: String
    })
    

    onMounted(() => {
        const distanceObject = JSON.parse(props.distanceJSONString)
        NetworkVisualizer.generateNetworkCanvas(distanceObject, networkContainer.value)
    })

</script>

<style scoped>
    #network-container {
        height: 720px;
        width: 1200px;

        border: 1px solid red
    }
</style>