export class GraphStructureGenerator {
    constructor() {
        this.adjList = new Map();
    }

    addVertex(vertex) {
        if (!this.adjList.has(vertex)) {
            this.adjList.set(vertex, new Map())
        }
    }

    addEdge(from, to, weight) {
        this.addVertex(from);
        this.addVertex(to);
        this.adjList.get(from).set(to, weight)
        this.adjList.get(to).set(from, weight)
    }

    getObject() {
        const graphObject = new Object();
        graphObject.Distances = new Object();
        this.adjList
            .forEach((neighborMap, vertex) => {
                graphObject.Distances[vertex] = Object.fromEntries(neighborMap)
            });
        return graphObject;
    }
}