using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ProjectCS.Data.Migrations
{
    /// <inheritdoc />
    public partial class v6 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Class",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Assign",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateTable(
                name: "Comment",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false),
                    AssignId = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false),
                    LoaiId = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: false),
                    CmtContent = table.Column<string>(type: "nvarchar(450)", maxLength: 450, nullable: true),
                    CmtTime = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comment", x => new { x.Id, x.UserId, x.AssignId, x.LoaiId });
                    table.ForeignKey(
                        name: "FK_Comment_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Comment_Assign_AssignId",
                        column: x => x.AssignId,
                        principalTable: "Assign",
                        principalColumn: "AssignId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Comment_AssignId",
                table: "Comment",
                column: "AssignId");

            migrationBuilder.CreateIndex(
                name: "IX_Comment_UserId",
                table: "Comment",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Comment");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Class");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Assign");
        }
    }
}
