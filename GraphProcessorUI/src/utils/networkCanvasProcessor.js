import { Network } from 'vis-network/standalone'

export class NetworkCanvasProcessor {
    static AddVisNode(id, node, nodes) {
        nodes.add({id: id, label: node})
    }
    
    static RemoveVisNode(id, node, nodes) {
        nodes.remove({id: id, label: node})
    }
    
    static AddVisEdge(from, to, edges) {
        edges.add({from: from, to: to})
    }
    static RemoveVisEdge(from, to, edges) {
        const edgeToDelete = edges.get({
            filter: (item) => item.from === from && item.to === to
        })[0]
        if (edgeToDelete) {
            edges.remove(edgeToDelete.id)
        }
    }
    static DrawVis(container, nodes, edges, options = {}) {
        const data = {
            nodes: nodes,
            edges: edges
        }
        return new Network(container.value, data, options)
    }
}