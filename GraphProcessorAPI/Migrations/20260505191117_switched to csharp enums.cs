using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GraphProcessorAPI.Migrations
{
    /// <inheritdoc />
    public partial class switchedtocsharpenums : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "role",
                table: "user",
                type: "accountrole",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "accounttype");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "role",
                table: "user",
                type: "accounttype",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "accountrole");
        }
    }
}
