import { NetworkCanvasProcessor } from "./networkCanvasService.ts"
import type { Node, DataSet, Edge } from "vis-network/standalone"

type DistanceMap = Map<string, Map<string, number>>

export class NodeMethods {
    static addNode(nodeKey: string, distances: DistanceMap, nodes: DataSet<Node>) {
        if (!distances.has(nodeKey)) {
            distances.set(nodeKey, new Map())
            NetworkCanvasProcessor.AddVisNode(nodeKey, nodeKey, nodes)
        } else {
            alert("Incorrect node name value")
        }
    }
    static deleteNode(nodeKey: string, toNodeKey: string, distances: DistanceMap, nodes: DataSet<Node>) {
        if (distances.has(nodeKey) && distances.has(toNodeKey)) {
            distances.delete(nodeKey)
            NetworkCanvasProcessor.RemoveVisNode(nodeKey, nodeKey, nodes)
        } else {
            alert("Incorrect node name value")
        }
    }
}

export class EdgeMethods {
    static addEdge(fromNodeKey: string, toNodeKey: string, distNumber: number, distances: DistanceMap, edges: DataSet<Edge>) {
        if (distances.has(fromNodeKey)) {
            const fromNode: Map<string, number> = distances.get(fromNodeKey)!
            if (!fromNode.has(toNodeKey) && distances.has(toNodeKey)) {
                fromNode.set(toNodeKey, distNumber)
                NetworkCanvasProcessor.AddVisEdge(fromNodeKey, toNodeKey, edges)
            } else {
                alert("Incorrect edge name value")
            }
        } else {
            alert(`${fromNodeKey} is not found`)
        }
    }
    static deleteEdge(fromNodeKey: string, toNodeKey: string, distances: DistanceMap, edges: DataSet<Edge>) {
        if (distances.has(fromNodeKey)) {
            const fromNode: Map<string, number> = distances.get(fromNodeKey)!
            if (fromNode.has(toNodeKey) && fromNode) {
                fromNode.delete(toNodeKey)
                NetworkCanvasProcessor.RemoveVisEdge(fromNodeKey, toNodeKey, edges)
            } else {
                alert("Incorrect edge name value")
            }
        } else {
            alert(`${fromNodeKey} is not found`)
        }
    }
}