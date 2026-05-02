using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GraphProcessorAPI.Migrations
{
    /// <inheritdoc />
    public partial class Edithash_paswwordfieldmax_lengthfrom64to256 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "password_hash",
                table: "user",
                type: "character(256)",
                fixedLength: true,
                maxLength: 256,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character(64)",
                oldFixedLength: true,
                oldMaxLength: 64);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "password_hash",
                table: "user",
                type: "character(64)",
                fixedLength: true,
                maxLength: 64,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character(256)",
                oldFixedLength: true,
                oldMaxLength: 256);
        }
    }
}
