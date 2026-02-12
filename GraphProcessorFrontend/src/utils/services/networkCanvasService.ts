import { Network, DataSet, type Node, type Edge, type Data, type Options } from 'vis-network/standalone'

export class NetworkCanvasProcessor {
    static AddVisNode(id: string, node: string, nodes: DataSet<Node>): void {
        nodes.add({id: id, label: node})
    }
    
    static RemoveVisNode(id: string, node: string, nodes: DataSet<Node>) {
        nodes.remove({id: id, label: node})
    }
    
    static AddVisEdge(from: string, to: string, edges: DataSet<Edge>) {
        edges.add({from: from, to: to})
    }
    static RemoveVisEdge(from: string, to: string, edges: DataSet<Edge>) {
        const edgeToDelete: Edge | undefined = edges.get({
            filter: (item) => item.from === from && item.to === to
        })[0]
        if (edgeToDelete) {
            edges.remove(edgeToDelete)
        }
    }
    static DrawVis(container: HTMLElement, nodes: DataSet<Node>, edges: DataSet<Edge>, options: Options = {}) {
        const data: Data = {
            nodes: nodes,
            edges: edges
        }
        return new Network(container, data, options)
    }
}