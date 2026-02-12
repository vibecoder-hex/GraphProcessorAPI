<template>
    <div id="network-container" ref="networkContainer"></div>
</template>

<script setup lang="ts">
    import { onMounted, onUnmounted, ref } from 'vue'
    import { NetworkCanvasProcessor } from "../../utils/services/networkCanvasService.js";
    import type { DataSet, Node, Edge, Network } from "vis-network/standalone"

    interface IProps {
        visNodes: DataSet<Node>,
        visEdges: DataSet<Edge>
    }

    const props = defineProps<IProps>()
    
    const networkContainer = ref<HTMLElement | null>(null)
    let network: Network | null = null
    
    onMounted(() => {
        if (networkContainer.value) {
            network = NetworkCanvasProcessor.DrawVis(networkContainer.value, props.visNodes, props.visEdges)
        }
        
    })
    onUnmounted(() => {
        if (network) {
            network.destroy()
            network = null
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