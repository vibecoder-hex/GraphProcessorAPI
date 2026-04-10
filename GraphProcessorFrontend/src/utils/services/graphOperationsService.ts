import { NetworkCanvasProcessor } from "./networkCanvasService.ts"
import type { Node, DataSet, Edge } from "vis-network/standalone"
import type { IGraphOperationResult } from "@/utils/interfacesAndTypes.ts";

type DistanceMap = Map<string, Map<string, number>>


export class NodeMethods {
    public static addNode(nodeKey: string, distances: DistanceMap, nodes: DataSet<Node>): IGraphOperationResult {
        if (!distances.has(nodeKey)) {
            distances.set(nodeKey, new Map())
            NetworkCanvasProcessor.AddVisNode(nodeKey, nodeKey, nodes)
        } else {
            return { 
                isValid: false,
                errorMessage: `Node ${nodeKey} already exists`
            }
        }
        return { 
            isValid: true,
            errorMessage: ""
        }
    }
    
    public static deleteNode(nodeKey: string, distances: DistanceMap, nodes: DataSet<Node>): IGraphOperationResult {
        if (distances.has(nodeKey)) {
            distances.delete(nodeKey)
            NetworkCanvasProcessor.RemoveVisNode(nodeKey, nodeKey, nodes)
            return {
                isValid: true,
                errorMessage: ""
            }
        } else {
            return {
                isValid: false,
                errorMessage: `Node ${nodeKey} is not exist`
            }
        }
    }
}

export class EdgeMethods {
    public static addEdge(fromNodeKey: string, toNodeKey: string, distNumber: number, distances: DistanceMap, edges: DataSet<Edge>): IGraphOperationResult {
        if (distances.has(fromNodeKey)) {
            const fromNode: Map<string, number> | undefined = distances.get(fromNodeKey)
            if (!fromNode) {
                return {
                    isValid: false,
                    errorMessage: `Node ${fromNodeKey} does not exist`
                }
            }
            if (!fromNode.has(toNodeKey) && distances.has(toNodeKey)) {
                fromNode.set(toNodeKey, distNumber)
                NetworkCanvasProcessor.AddVisEdge(fromNodeKey, toNodeKey, distNumber, edges)
                return {
                    isValid: true,
                    errorMessage: ""
                }
            } else {
                return {
                    isValid: false,
                    errorMessage: `Node ${toNodeKey} is not exist`
                }
            }
        } else {
            return {
                isValid: false,
                errorMessage: `Node ${fromNodeKey} is not exist`
            }
        }
    }
    public static deleteEdge(fromNodeKey: string, toNodeKey: string, distances: DistanceMap, edges: DataSet<Edge>): IGraphOperationResult {
        if (distances.has(fromNodeKey)) {
            const fromNode: Map<string, number> | undefined = distances.get(fromNodeKey)
            if (!fromNode) {
                return {
                    isValid: false,
                    errorMessage: `Node ${fromNodeKey} does not exist`
                }
            }
            if (fromNode.has(toNodeKey) && fromNode) {
                fromNode.delete(toNodeKey)
                NetworkCanvasProcessor.RemoveVisEdge(fromNodeKey, toNodeKey, edges)
                return {
                    isValid: true,
                    errorMessage: ""
                }
            } else {
                return {
                    isValid: false,
                    errorMessage: `Node ${toNodeKey} is not exist`
                }
            }
        } else {
            return {
                isValid: false,
                errorMessage: `Node ${fromNodeKey} is not exist`
            }
        }
    }
}