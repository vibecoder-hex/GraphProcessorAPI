namespace Src.DTOs
{
    public record DistanceDataJsonDTO(Dictionary<string, Dictionary<string, int>> Distances);

    public abstract class AlgorithmResultDTO
    {
        public string Algorithm { get; set; }
        public string StartVertex { get; set; }
        public List<string> ShortestPath { get; set; }
        public long TimeNs { get; set; }
    }

    public class DijkstraResultDTO : AlgorithmResultDTO
    {
        public string TargetVertex { get; set; }
        public int TotalDistance { get; set; }
    }

    public class BfsResultDTO : AlgorithmResultDTO
    {
        public string TargetVertex { get; set; }
    }

    public class DfsResultDTO : AlgorithmResultDTO
    {

    }

}