namespace GraphProcessorAPI.Services
{
    // Basic graph algorithms implementations
    // 1. Depth-First-search
    // 2. Breadth-First-search
    // 3. Dijktra

    public interface IDistanceGraphProcessorService
    {
        List<string> BfsTraversal(Dictionary<string, Dictionary<string, int>> graph, string start, string target);
        List<string> DfsTraversal(Dictionary<string, Dictionary<string, int>> graph, string start);
        (List<string> Path, int Dist) DijkstraShortestPath(Dictionary<string, Dictionary<string, int>> graph, string start, string target);
    }
    
    public class DistanceGraphProcessingService : IDistanceGraphProcessorService
    {
        // Reconstruct shortest path
        
        private (List<string> Path, int Dist) ReconstructPath(string start, string target, Dictionary<string, string> parents, Dictionary<string, int>? distances = null) 
        {
            List<string> output = new List<string>();
            string current = target;
            while (current != start)
            {
                output.Add(current);
                current = parents[current];
            }
            output.Add(current);
            output.Reverse();
            if (distances != null)
                return (output, distances[target]);
            return (output, 0);
        }

        // Recursive Depth fisrt search function
        private void DfsRecursive(Dictionary<string, Dictionary<string, int>> graph, string currentVertex, List<string> output, HashSet<string> visited)
        {
            visited.Add(currentVertex);
            output.Add(currentVertex);
            foreach (var neighbour in graph[currentVertex])
            {
                if (!visited.Contains(neighbour.Key))
                {
                    DfsRecursive(graph, neighbour.Key, output, visited);
                }
            }
        }

        public List<string> BfsTraversal(Dictionary<string, Dictionary<string, int>> graph, string start, string target)
        {
            if (start == target || !graph.ContainsKey(start) || !graph.ContainsKey(target)) 
                return new List<string>();
            
            Queue<string> queue = new Queue<string>();
            HashSet<string> visited = new HashSet<string>();
            Dictionary<string, string> parents = new Dictionary<string, string>();

            queue.Enqueue(start);
            visited.Add(start);

            while (queue.Count != 0) 
            {
                string currentVertex = queue.Dequeue();

                if (currentVertex == target)
                {
                    List<string> output = ReconstructPath(start, target, parents).Path;
                    return output;
                }

                foreach (var neighbour in graph[currentVertex])
                {
                    if (!visited.Contains(neighbour.Key))
                    {
                        parents[neighbour.Key] = currentVertex;
                        visited.Add(neighbour.Key);
                        queue.Enqueue(neighbour.Key);
                    }
                }
            }

            return new List<string>();
        }

        public List<string> DfsTraversal(Dictionary<string, Dictionary<string, int>> graph, string start)
        {
            if (!graph.ContainsKey(start)) return new List<string>();
            
            List<string> output = new List<string>();
            HashSet<string> visited = new HashSet<string>();
            DfsRecursive(graph, start, output, visited);
            return output;
        }

        public (List<string> Path, int Dist) DijkstraShortestPath(Dictionary<string, Dictionary<string, int>> graph, string start, string target)
        {
            if (!graph.ContainsKey(start) || !graph.ContainsKey(target) || start == target)
                return (new List<string>(), -1);
            
            PriorityQueue<string, int> priorityQueue = new PriorityQueue<string, int>();
            Dictionary<string, string> parent = new Dictionary<string, string>();

            var distances = graph.Keys.ToDictionary(vertexVal => vertexVal, weight => int.MaxValue);

            priorityQueue.Enqueue(start, 0);
            distances[start] = 0;

            while (priorityQueue.TryDequeue(out var currentValue, out var currentDist))
            {
                if (currentDist > distances[currentValue]) continue;

                foreach(var (neighbour, weight) in graph[currentValue])
                {
                    int newDistance = currentDist + weight;
                    if (newDistance < distances[neighbour])
                    {
                        distances[neighbour] = newDistance;
                        priorityQueue.Enqueue(neighbour, newDistance);
                        parent[neighbour] = currentValue;
                    }
                }
            }

            (List<string> Path, int Dist) result = ReconstructPath(start, target, parent, distances);
            return result;
        }
    }
}
