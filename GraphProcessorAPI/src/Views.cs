using Src.DTOs;
using Src.GraphProcessor;
using System.Diagnostics;

namespace Src.Views
{
    public static class ValidationProcessor
    {
        public static bool IsValidForShortestPath(string start, string target, DistanceDataJsonDTO jsonData)
        {
            if (string.IsNullOrWhiteSpace(start) || string.IsNullOrWhiteSpace(target))
                return false;

            if (jsonData.Distances == null)
                return false;

            return true;
        }

        public static bool IsValidForDfs(string start, DistanceDataJsonDTO jsonData)
        {
            if (string.IsNullOrWhiteSpace(start) || jsonData.Distances == null)
                return false;

            return true;
        }
    }
    

    public static class AlgorithmViews
    {
        public static IResult BfsView(string start, string target, DistanceDataJsonDTO jsonData, ILogger<Program> logger)
        {
            if (!ValidationProcessor.IsValidForShortestPath(start, target, jsonData))
                return Results.BadRequest(new { Error = "Invalid input data or JSON is empty" });
            
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            List<string> bfsPath = DistanceGraphProcessing.BfsTraversal(jsonData.Distances, start, target);
            stopwatch.Stop();

            if (bfsPath.Count == 0)
            {
                logger.LogError($"BFS path from {start} to {target} vertexes not found");
                return Results.BadRequest(new { Error = "No path found between the specified nodes." });
            }
                

            var result = new BfsResultDTO
            {
                Algorithm = "BFS",
                StartVertex = start,
                TargetVertex = target,
                ShortestPath = bfsPath,
                TimeNs = (long)stopwatch.Elapsed.TotalNanoseconds, 
            };
            
            return Results.Ok(new { Result = result });
        }

        public static IResult DijkstraView(string start, string target, DistanceDataJsonDTO jsonData, ILogger<Program> logger)
        {
            if (!ValidationProcessor.IsValidForShortestPath(start, target, jsonData))
                return Results.BadRequest(new { Error = "Invalid input data or JSON is empty" });
            
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            (List<string> Path, int Dist) dijkstraPath = DistanceGraphProcessing.DijkstraShortestPath(jsonData.Distances, start, target);
            stopwatch.Stop();

            if (dijkstraPath.Path.Count == 0)
            {
                logger.LogError($"Dijkstra path from {start} to {target} vertexes not found");
                return Results.BadRequest(new { Error = "No path found between the specified nodes." });
            }
                

            var result = new DijkstraResultDTO
            {
                Algorithm = "Dijkstra",
                StartVertex = start,
                TargetVertex = target,
                ShortestPath = dijkstraPath.Path,
                TimeNs = (long)stopwatch.Elapsed.TotalNanoseconds,
                TotalDistance = dijkstraPath.Dist, // Placeholder for total distance
            };

            return Results.Ok(new { Result = result });
        }

        public static IResult DfsView(string start, DistanceDataJsonDTO jsonData, ILogger<Program> logger)
        {
            if (!ValidationProcessor.IsValidForDfs(start, jsonData))
                return Results.BadRequest(new { Error = "Invalid input data or JSON is empty" });
            
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            List<string> dfsPath = DistanceGraphProcessing.DfsTraversal(jsonData.Distances, start);
            stopwatch.Stop();

            if (dfsPath.Count == 0)
            {
                logger.LogError($"BFS path from {start} vertex not found");
                return Results.BadRequest(new { Error = "No nodes reachable from the specified start node." });
            }
                

            var result = new DfsResultDTO
            {
                Algorithm = "DFS",
                StartVertex = start,
                ShortestPath = dfsPath,
                TimeNs = (long)stopwatch.Elapsed.TotalNanoseconds,
            };
            return Results.Ok(new { Result = result });
        }
    }
}
