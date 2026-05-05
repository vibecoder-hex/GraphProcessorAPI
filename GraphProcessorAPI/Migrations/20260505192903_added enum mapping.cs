using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GraphProcessorAPI.Migrations
{
    /// <inheritdoc />
    public partial class addedenummapping : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.AlterDatabase()
            //    .Annotation("Npgsql:Enum:accountrole", "admin,user")
            //    .Annotation("Npgsql:Enum:accountrole.user_role", "user,admin")
            //    .Annotation("Npgsql:Enum:algorithm_type", "bfs,dfs,dijkstra")
            //    .Annotation("Npgsql:Enum:algorithm_type.algorithm_type", "dfs,bfs,dijkstra")
            //    .Annotation("Npgsql:Enum:graphtype", "non_oriented,oriented")
            //    .Annotation("Npgsql:Enum:graphtype.graph_type", "oriented,non_oriented")
            //    .OldAnnotation("Npgsql:Enum:accountrole.user_role", "user,admin")
            //    .OldAnnotation("Npgsql:Enum:algorithm_type.algorithm_type", "dfs,bfs,dijkstra")
            //    .OldAnnotation("Npgsql:Enum:graphtype.graph_type", "oriented,non_oriented");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.AlterDatabase()
            //    .Annotation("Npgsql:Enum:accountrole.user_role", "user,admin")
            //    .Annotation("Npgsql:Enum:algorithm_type.algorithm_type", "dfs,bfs,dijkstra")
            //    .Annotation("Npgsql:Enum:graphtype.graph_type", "oriented,non_oriented")
            //    .OldAnnotation("Npgsql:Enum:accountrole", "admin,user")
            //    .OldAnnotation("Npgsql:Enum:accountrole.user_role", "user,admin")
            //    .OldAnnotation("Npgsql:Enum:algorithm_type", "bfs,dfs,dijkstra")
            //    .OldAnnotation("Npgsql:Enum:algorithm_type.algorithm_type", "dfs,bfs,dijkstra")
            //    .OldAnnotation("Npgsql:Enum:graphtype", "non_oriented,oriented")
            //    .OldAnnotation("Npgsql:Enum:graphtype.graph_type", "oriented,non_oriented");
        }
    }
}
