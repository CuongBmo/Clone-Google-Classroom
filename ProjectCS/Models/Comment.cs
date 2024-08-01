namespace ProjectCS.Models
{
    public class Comment
    {
        public string Id { get; set; } = null!;

        public string? CmtContent { get; set; }

        public DateTime CmtTime { get; set; }

        public string UserId { get; set; } = null!;

        public string AssignId { get; set; } = null!;

        public string LoaiId { get; set; } = null!;

        public virtual Assign Assign { get; set; } = null!;

        public virtual ApplicationUser User { get; set; } = null!;
    }
}
