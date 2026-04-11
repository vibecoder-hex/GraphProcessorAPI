using GraphProcessorAPI.Services;
using Xunit.Abstractions;

namespace GraphProcessorTest
{
    public class AlgorithmTestClass
    {
        private readonly IDistanceGraphProcessorService _graphProcessorService;
        private readonly ITestOutputHelper _output;
        public AlgorithmTestClass(ITestOutputHelper output)
        {
            _graphProcessorService = new DistanceGraphProcessingService();
            _output = output;
        }
        public static IEnumerable<object[]> ShortestPathAndPathSumData()
        {
            yield return new object[]
            {
                new Dictionary<string, Dictionary<string, int>> 
                {
                    
                    { "A", new Dictionary<string, int> { { "B", 70 }, { "E", 200 } } }, 
                    { "B", new Dictionary<string, int> { { "C", 30 }, { "D", 80 } } }, 
                    { "C", new Dictionary<string, int> { { "D", 20 } } }, 
                    { "D", new Dictionary<string, int> { { "E", 10 } } }, 
                    { "E", new Dictionary<string, int>() },
                }, 
                "A", "E",
                // Dijkstra test expectations
                new List<string> { "A", "B", "C", "D", "E" }, 130,
                // Bfs test expectations
                new List<string> { "A", "E" },
                // Dfs test expectations
                new List<string> { "A", "B", "C", "D", "E" }
            };
            
            // 2. Простой прямой путь
            yield return new object[]
            {
                new Dictionary<string, Dictionary<string, int>>
                {
                    { "A", new Dictionary<string, int> { { "B", 10 } } },
                    { "B", new Dictionary<string, int>() }
                },
                "A", "B",
                new List<string> { "A", "B" },
                10
            };

            // 3. Путь с альтернативными маршрутами
            yield return new object[]
            {
                new Dictionary<string, Dictionary<string, int>>
                {
                    { "A", new Dictionary<string, int> { { "B", 5 }, { "C", 2 } } },
                    { "B", new Dictionary<string, int> { { "D", 4 } } },
                    { "C", new Dictionary<string, int> { { "D", 8 } } },
                    { "D", new Dictionary<string, int>() }
                },
                "A", "D",
                new List<string> { "A", "B", "D" },
                9  // A->B->D = 5+4 = 9 (короче чем A->C->D = 2+8 = 10)
            };

            // 4. Циклический граф
            yield return new object[]
            {
                new Dictionary<string, Dictionary<string, int>>
                {
                    { "A", new Dictionary<string, int> { { "B", 2 } } },
                    { "B", new Dictionary<string, int> { { "C", 3 }, { "A", 1 } } },
                    { "C", new Dictionary<string, int> { { "A", 4 } } }
                },
                "A", "C",
                new List<string> { "A", "B", "C" },
                5
            };

            // 5. Звездообразный граф
            yield return new object[]
            {
                new Dictionary<string, Dictionary<string, int>>
                {
                    { "Center", new Dictionary<string, int> { { "A", 1 }, { "B", 2 }, { "C", 3 } } },
                    { "A", new Dictionary<string, int>() },
                    { "B", new Dictionary<string, int>() },
                    { "C", new Dictionary<string, int>() }
                },
                "Center", "C",
                new List<string> { "Center", "C" },
                3
            };
        }

        [Theory, MemberData(nameof(ShortestPathAndPathSumData))]
        public void ShortestPathAndSumTest(Dictionary<string, Dictionary<string, int>> graph, string start, string target, List<string> shortestPath, int pathSum)
        {
            _output.WriteLine($"Testing path from {start} to {target}");
            _output.WriteLine($"Graph has {graph.Count} vertices");
            
            _output.WriteLine("Starting test Dijkstra");
            _graphProcessorService.Graph = graph;
            var dijkstraResult = _graphProcessorService.DijkstraShortestPath(start, target);
            _output.WriteLine($"Found distance: {string.Join("->", dijkstraResult.Path)}");
            _output.WriteLine($"Path sum: {pathSum}");
                
            Assert.Equal(shortestPath, dijkstraResult.Path);
            Assert.Equal(pathSum, dijkstraResult.Dist);
            
            _output.WriteLine("Starting test Breadth First Search");
            var bfsResult = _graphProcessorService.BfsTraversal(start, target);
            _output.WriteLine($"Found distance: {string.Join("->", bfsResult)}");
            Assert.Equal(shortestPath, bfsResult);
            
            _output.WriteLine("Starting test Depth First Search");
            var dfsResult = _graphProcessorService.DfsTraversal(start);
            _output.WriteLine($"Found distance: {string.Join("->", dfsResult)}");
            Assert.Equal(shortestPath, dfsResult);
            
            _output.WriteLine("Tests completed");
        }
    }
}