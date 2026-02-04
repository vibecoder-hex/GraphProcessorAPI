import { Network, DataSet } from 'vis-network/standalone'

export class NetworkVisualizer {
    static getNodesFromDistanceObject(distanceObject) {
        return Object.keys(distanceObject.Distances).map((node, index) => ({
            id: index + 1,
            label: node
        }))
    }

    static getEdgesFromDistanceObject(distanceObject) {
        const nodes = Object.keys(distanceObject.Distances)
        const edges = []

        const nodeIndexMap = new Map()
        nodes.forEach((node, nodeIndex) => nodeIndexMap.set(node, nodeIndex + 1))

        nodes.forEach(node => {
            const nodeIndex = nodeIndexMap.get(node)
            const neighbors = distanceObject.Distances[node]
            Object.keys(neighbors).forEach(neighbor => {
                const neighborIndex = nodeIndexMap.get(neighbor);
                edges.push({
                    from: nodeIndex,
                    to: neighborIndex
                })
            })
        })
        return edges
    }

    static generateNetworkCanvas(distanceObject, container) {
        const nodes = this.getNodesFromDistanceObject(distanceObject)
        const edges = this.getEdgesFromDistanceObject(distanceObject)
        const data = {
            nodes: new DataSet(nodes),
            edges: new DataSet(edges)
        }
        const options = {}
        return new Network(container, data, options)
    }

}