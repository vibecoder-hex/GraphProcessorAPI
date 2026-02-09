<template>
    <div id="network-container" ref="networkContainer"></div>
</template>

<script setup>
    import { onMounted, onUnmounted, defineProps, ref } from 'vue'
    import { NetworkCanvasProcessor } from "@/utils/networkCanvasProcessor.js";

    const props = defineProps({
        visNodes: Object,
        visEdges: Object,
    })
    
    const networkContainer = ref(null)
    let network = null
    
    onMounted(() => {
        network = NetworkCanvasProcessor.DrawVis(networkContainer, props.visNodes, props.visEdges)
    })
    onUnmounted(() => {
        if (network) {
            network.destroy()
        }
    })
</script>

<style scoped>
    #network-container {
        width: 600px;
        height: 300px;
        border: 1px solid black;
    }
</style>