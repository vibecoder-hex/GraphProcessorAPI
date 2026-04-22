import { NetworkCanvasProcessor } from "./networkCanvasService.ts"
import type { Node, DataSet, Edge } from "vis-network/standalone"
import type { IOperationResult, GraphType } from "@/models/interfacesAndTypes.ts";

type DistanceMap = Map<string, Map<string, number>>



export class NodeMethods {
    public static addNode(nodeKey: string, distances: DistanceMap, nodes: DataSet<Node>): IOperationResult {
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
    
    public static deleteNode(nodeKey: string, distances: DistanceMap, nodes: DataSet<Node>): IOperationResult {
        if (distances.has(nodeKey)) {
            distances.delete(nodeKey)
            NetworkCanvasProcessor.RemoveVisNode(nodeKey, nodeKey, nodes)
        } else {
            return {
                isValid: false,
                errorMessage: `Node ${nodeKey} is not exist`
            }
        }
        return {
            isValid: true,
            errorMessage: ""
        }
    }
}

export class EdgeMethods {
    private static tryGetFromNode(fromNodeKey: string, distances: DistanceMap): Map<string, number> {
        const fromNode: Map<string, number> | undefined = distances.get(fromNodeKey)
        if (!fromNode) {
            throw new Error(`Node ${fromNodeKey} doesn't exist`)
        }
        return fromNode
    }
    
    private static tryGetToNode(toNodeKey: string, distances: DistanceMap): Map<string, number> {
        const toNode: Map<string, number> | undefined = distances.get(toNodeKey)
        if (!toNode) {
            throw new Error(`Node ${toNodeKey} doesn't exist`)
        }
        return toNode
    }
    public static addEdge(fromNodeKey: string, toNodeKey: string, distNumber: number, distances: DistanceMap, edges: DataSet<Edge>, selectedGraphType: GraphType): IOperationResult {
        try {
            const fromNode: Map<string, number> = this.tryGetFromNode(fromNodeKey, distances);
            const toNode: Map<string, number> = this.tryGetToNode(toNodeKey, distances);
            
            if (selectedGraphType === "oriented") {
                if (!fromNode.has(toNodeKey)) {
                    fromNode.set(toNodeKey, distNumber)
                } else {
                    return {
                        isValid: false,
                        errorMessage: `Path between ${fromNodeKey} and ${toNodeKey} is already exist`
                    }
                }
            } else if (selectedGraphType === "non-oriented") {
                if (!fromNode.has(toNodeKey) && !toNode.has(fromNodeKey)) {
                    fromNode.set(toNodeKey, distNumber)
                    toNode.set(fromNodeKey, distNumber)
                } else {
                    return {
                        isValid: false,
                        errorMessage: `Path between ${fromNodeKey} and ${toNodeKey} is already exist`
                    }
                }
            }
            NetworkCanvasProcessor.AddVisEdge(fromNodeKey, toNodeKey, distNumber, edges, selectedGraphType)
            return {
                isValid: true,
                errorMessage: ""
            }
        } catch (error) {
            return {
                isValid: false,
                // @ts-ignore
                errorMessage: error.message
            }
        }
    }
    public static deleteEdge(fromNodeKey: string, toNodeKey: string, distances: DistanceMap, edges: DataSet<Edge>, selectedGraphType: GraphType): IOperationResult {
        try {
            const fromNode: Map<string, number> = this.tryGetFromNode(fromNodeKey, distances);
            const toNode: Map<string, number> = this.tryGetToNode(toNodeKey, distances);
            if (selectedGraphType === "oriented") {
                if (fromNode.has(toNodeKey)) {
                    fromNode.delete(toNodeKey)
                } else {
                    return {
                        isValid: false,
                        errorMessage: `Path between ${fromNodeKey} and ${toNodeKey} does not exist`
                    }
                }
            } else if (selectedGraphType === "non-oriented") {
                if (fromNode.has(toNodeKey) && toNode.has(fromNodeKey)) {
                    fromNode.delete(toNodeKey)
                    toNode.delete(fromNodeKey)
                } else {
                    return {
                        isValid: false,
                        errorMessage: `Path between ${fromNodeKey} and ${toNodeKey} does not exist`
                    }
                }
            }
            NetworkCanvasProcessor.RemoveVisEdge(fromNodeKey, toNodeKey, edges)
            return {
                isValid: true,
                errorMessage: ""
            }
        } catch (error) {
            return {
                isValid: false,
                // @ts-ignore
                errorMessage: error.message
            }
        }
        
    }    
}