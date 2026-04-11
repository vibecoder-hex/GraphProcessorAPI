using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using GraphProcessorAPI.Models;
using GraphProcessorAPI.Services;

namespace GraphProcessorAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GraphAlgorithmsController : ControllerBase
    {
        private readonly ILogger<GraphAlgorithmsController> _logger;
        private readonly IDistanceGraphProcessorService _graphProcessorService;

        public GraphAlgorithmsController(ILogger<GraphAlgorithmsController> logger, IDistanceGraphProcessorService graphProcessorService)
        {
            _logger = logger;
            _graphProcessorService = graphProcessorService;
        }
        
        [HttpPost("dijkstra/{start}/{target}")]
        public IActionResult DijkstraHandle(string start, string target, DistanceDataJsonDTO jsonData)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            (List<string> Path, int Dist) dijkstraPath = _graphProcessorService.DijkstraShortestPath(jsonData.Distances, start, target);
            stopwatch.Stop();
            if (dijkstraPath.Path.Count == 0)
            {
                _logger.LogError($"Dijkstra path from {start} to {target} vertexes not found");
                return BadRequest(new { Error = "No path found between the specified nodes." });
            }
            var result = new DijkstraResultDTO
            {
                Algorithm = "Dijkstra",
                StartVertex = start,
                TargetVertex = target,
                ShortestPath = dijkstraPath.Path,
                TimeNs = (long)stopwatch.Elapsed.TotalNanoseconds,
                TotalDistance = dijkstraPath.Dist, 
            };
            return Ok(new { Result = result });
        }

        [HttpPost("bfs/{start}/{target}")]
        public IActionResult BfsHandle(string start, string target, DistanceDataJsonDTO jsonData)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            List<string> bfsPath = _graphProcessorService.BfsTraversal(jsonData.Distances, start, target);
            stopwatch.Stop();

            if (bfsPath.Count == 0)
            {
                _logger.LogError($"BFS path from {start} to {target} vertexes not found");
                return BadRequest(new { Error = "No path found between the specified nodes." });
            }
            
            var result = new BfsResultDTO
            {
                Algorithm = "BFS",
                StartVertex = start,
                TargetVertex = target,
                ShortestPath = bfsPath,
                TimeNs = (long)stopwatch.Elapsed.TotalNanoseconds, 
            };
            
            return Ok(new { Result = result });
        }

        [HttpPost("dfs/{start}")]
        public IActionResult DfsHandle(string start, DistanceDataJsonDTO jsonData)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            List<string> dfsPath = _graphProcessorService.DfsTraversal(jsonData.Distances, start);
            stopwatch.Stop();

            if (dfsPath.Count == 0)
            {
                _logger.LogError($"BFS path from {start} vertex not found");
                return BadRequest(new { Error = "No nodes reachable from the specified start node." });
            }
                

            var result = new DfsResultDTO
            {
                Algorithm = "DFS",
                StartVertex = start,
                ShortestPath = dfsPath,
                TimeNs = (long)stopwatch.Elapsed.TotalNanoseconds,
            };
            return Ok(new { Result = result });
        }
    }
}