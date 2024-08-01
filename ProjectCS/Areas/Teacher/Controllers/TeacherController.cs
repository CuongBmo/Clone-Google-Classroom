using System;
using System.Collections.Frozen;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using Microsoft.DotNet.Scaffolding.Shared.ProjectModel;
using Microsoft.EntityFrameworkCore;
using ProjectCS.Data;
using ProjectCS.Models;


//them
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using ClosedXML.Excel;
using DocumentFormat.OpenXml.Office2010.Excel;


namespace ProjectCS.Areas.Teacher.Controllers
{
    [Area("Teacher")]
    [Authorize(Roles = "Teacher")]
    public class TeacherController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public TeacherController(UserManager<ApplicationUser> userManager, ApplicationDbContext context, IWebHostEnvironment environment)
        {
            _userManager = userManager;
            _context = context;
            _environment = environment;
        }

        // GET: Teacher/Teacher
        public async Task<IActionResult> Index()
        {
            var user = await _userManager.GetUserAsync(User);
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            // Tải lại danh sách lớp từ cơ sở dữ liệu
            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();

            var UserIds = classes.Select(u => u.UserId).Distinct().ToList();

            var createUser = _context.Users
                                     .Where(u => UserIds.Contains(u.Id))
                                     .ToList();

            ViewBag.CreateUser = createUser;

            return View(classes);
        }

        // GET: Teacher/Teacher/Create
        public async Task<IActionResult> Create()
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return RedirectToAction("Login", "Account");
            }

            ViewData["ClassId"] = new SelectList(_context.Classes, "ClassId", "Name");

            var random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var randomClassId = new string(Enumerable.Repeat(chars, 5)
                                          .Select(s => s[random.Next(s.Length)]).ToArray());


            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();

            if (userClasses == null || !userClasses.Any())
            {
                ViewBag.ListClass = new List<Class>();
            }
            else
            {
                var classes = _context.Classes.Where(c => userClasses.Contains(c.ClassId)).ToList();
                ViewBag.ListClass = classes;
            }

            var loaiList = _context.Loais.ToList();
            if (loaiList == null)
            {
                loaiList = new List<Loai>();
            }

            ViewBag.RandomClassId = randomClassId;
            ViewBag.LoaiList = new SelectList(loaiList, "LoaiId", "LoaiName");

            return View();
        }

        // POST: Teacher/Teacher/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ClassId,Name,Titlle,Topic,Room,Image")] Class @class)
        {
            var user = await _userManager.GetUserAsync(User);
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            // Tải lại danh sách lớp từ cơ sở dữ liệu
            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();
            
            ModelState.Remove("UserId");
            if (ModelState.IsValid)
            {
                var backgroundImages = GetBackgroundImages("wwwroot/Images");

                // Chọn một ảnh ngẫu nhiên từ danh sách
                string randomBackgroundImage = GetRandomBackgroundImage(backgroundImages);

                // Gán ảnh nền cho lớp học
                @class.Image = randomBackgroundImage.Replace("wwwroot/Images", "").Replace("\\", "");
                @class.UserId = user.Id;

                _context.Add(@class);
                var newList = new ListStudent { UserId = user.Id, ClassId = @class.ClassId };
                _context.Add(newList);

                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.ListClass = classes;

            return View(@class);
        }

        [HttpPost]
        public async Task<IActionResult> CreateAssign(string ClassId, string Description, string AssignName)
        {
            // Kiểm tra xem người dùng đã đăng nhập chưa
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return RedirectToAction("Login", "Account"); // Chuyển hướng đến trang Login nếu chưa đăng nhập
            }

            // Kiểm tra tính hợp lệ của ClassId
            if (string.IsNullOrEmpty(ClassId))
            {
                return RedirectToAction("Index", "Home"); // Chuyển hướng đến trang chính nếu ClassId không hợp lệ
            }

            // Lấy danh sách sinh viên trong lớp
            var listStudents = _context.ListStudents
                                       .Where(p => p.ClassId == ClassId)
                                       .ToList();
            if (listStudents == null || !listStudents.Any())
            {
                return RedirectToAction("Index", "Home"); // Chuyển hướng đến trang chính nếu không tìm thấy sinh viên trong lớp
            }

            // Tạo mới một Assign
            var random = new Random();
            var assignId = new string(Enumerable.Repeat("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", 5)
                                 .Select(s => s[random.Next(s.Length)]).ToArray());
            var newAssign = new Assign
            {
                AssignId = assignId,
                ClassId = ClassId,
                LoaiId = "1", // Assuming LoaiId is of string type
                AssignName = AssignName,
                Description = Description,
                Posttime = DateTime.Now
            };

            // Lưu Assign mới vào cơ sở dữ liệu
            _context.Add(newAssign);
            await _context.SaveChangesAsync();

            // Tạo mới danh sách ListAssign cho mỗi sinh viên trong lớp
            foreach (var student in listStudents)
            {
                var newListAssign = new ListAssign
                {
                    UserId = student.UserId,
                    AssignId = newAssign.AssignId,
                    LoaiId = newAssign.LoaiId
                };
                _context.Add(newListAssign);
            }

            // Lưu danh sách ListAssign vào cơ sở dữ liệu
            await _context.SaveChangesAsync();

            // Chuyển hướng người dùng đến trang chi tiết của lớp học
            return RedirectToAction("Details", "Teacher", new { id = ClassId });
        }

        public List<string> GetBackgroundImages(string directoryPath)
        {
            var imageExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };
            var files = Directory.GetFiles(directoryPath)
                                 .Where(file => imageExtensions.Contains(Path.GetExtension(file).ToLower()))
                                 .Select(file => file.Replace("wwwroot/Images", "").Replace("\\", ""))
                                 .ToList();
            return files;
        }

        public string GetRandomBackgroundImage(List<string> images)
        {
            if (images == null || images.Count == 0)
                return null;

            Random rand = new Random();
            int index = rand.Next(0, images.Count);
            return images[index];
        }

        // GET: Teacher/Teacher/Edit/5
        public async Task<IActionResult> Edit(string id)
        {

            var user = await _userManager.GetUserAsync(User);
            if (id == null)
            {
                return NotFound();
            }

            var @class = await _context.Classes.FindAsync(id);
            if (@class == null)
            {
                return NotFound();
            }
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            // Tải lại danh sách lớp từ cơ sở dữ liệu
            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();

            ViewBag.ListClass = classes;

            return View(@class);
        }

        // POST: Teacher/Teacher/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, Class updatedClass)
        {
            if (id != updatedClass.ClassId)
            {
                return NotFound();
            }

            // Lấy thông tin lớp học từ cơ sở dữ liệu để lấy ảnh cũ
            var existingClass = await _context.Classes
                                              .AsNoTracking()
                                              .FirstOrDefaultAsync(c => c.ClassId == id);

            if (existingClass == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Giữ lại đường dẫn ảnh cũ
                    updatedClass.Image = existingClass.Image;

                    _context.Update(updatedClass);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ClassExists(updatedClass.ClassId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            var user = await _userManager.GetUserAsync(User);
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();

            ViewBag.ListClass = classes;

            return View(updatedClass);
        }


        private bool ClassExists(string id)
        {
            return _context.Classes.Any(e => e.ClassId == id);
        }


        // GET: Teacher/Teacher/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            var user = await _userManager.GetUserAsync(User);
            if (id == null)
            {
                return NotFound();
            }

            var @class = await _context.Classes.FindAsync(id);
            if (@class == null)
            {
                return NotFound();
            }
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            // Tải lại danh sách lớp từ cơ sở dữ liệu
            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();

            ViewBag.ListClass = classes;

            return View(@class);
        }

        // POST: Teacher/Teacher/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var user = await _userManager.GetUserAsync(User);
            // Tìm lớp dựa trên id được cung cấp
            var @class = await _context.Classes.FindAsync(id);
            // Kiểm tra xem lớp có tồn tại không
            if (@class == null)
            {
                // Nếu không tồn tại, trả về NotFound
                return NotFound();
            }

            try
            {
                // Xóa lớp khỏi cơ sở dữ liệu
                _context.Classes.Remove(@class);
                // Tìm danh sách sinh viên liên quan đến lớp này và xóa chúng khỏi cơ sở dữ liệu
                var listStudents = _context.ListStudents.Where(ls => ls.ClassId == id);
                _context.ListStudents.RemoveRange(listStudents);

                var Assigns = _context.Assigns.Where(ls => ls.ClassId == id);
                _context.Assigns.RemoveRange(Assigns);

                var listAssigns = _context.ListAssigns.Where(ls => ls.Assign.ClassId == id);
                _context.ListAssigns.RemoveRange(listAssigns);
                // Lưu thay đổi vào cơ sở dữ liệu
                await _context.SaveChangesAsync();
            }
            catch (Exception)
            {
                // Xử lý nếu có lỗi xảy ra trong quá trình xóa
                return RedirectToAction(nameof(Index));
            }
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            // Tải lại danh sách lớp từ cơ sở dữ liệu
            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();

            ViewBag.ListClass = classes;
            // Chuyển hướng người dùng đến trang Index của lớp
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> ListStudent(string Id)
        {
            var user = await _userManager.GetUserAsync(User);

            var listStudent = _context.ListStudents
                                      .Where(ls => ls.ClassId == Id)
                                      .ToList();
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            // Tải lại danh sách lớp từ cơ sở dữ liệu
            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();
            var className = _context.Classes
                                    .Where(c => c.ClassId == Id).Select(c => c.Name)
                                    .FirstOrDefault();
            var classRoom = _context.Classes
                                    .Where(c => c.ClassId == Id).Select(c => c.Room)
                                    .FirstOrDefault();
            var classid = _context.Classes
                                  .Where(c => c.ClassId == Id).Select(c => c.ClassId)
                                  .FirstOrDefault();

            ViewBag.ListClass = classes;
            ViewBag.ListName = className;
            ViewBag.ListRoom = classRoom;
            ViewBag.ListId = classid;
            ViewBag.ClassId = Id; // Lưu ClassId vào ViewBag

            return View(listStudent);
        }

        public async Task<IActionResult> ListAssign(string Id)
        {
            var user = await _userManager.GetUserAsync(User);

            var teacherRoleId = _context.Roles
                                        .Where(r => r.Name == "Teacher")
                                        .Select(r => r.Id)
                                        .FirstOrDefault();

            // Lấy danh sách UserId của những người dùng có vai trò "Teacher"
            var teacherUserIds = _context.UserRoles
                                        .Where(ur => ur.RoleId == teacherRoleId)
                                        .Select(ur => ur.UserId)
                                        .ToList();

            var listAssign = _context.ListAssigns
                                      .Include(la => la.Assign)
                                      .ThenInclude(a => a.Class)  // Include Class của Assign
                                      .Include(la => la.User)
                                      .Include(la => la.ListFiles) // Include ListFile
                                      .Where(la => la.Assign.ClassId == Id && !teacherUserIds.Contains(la.UserId))
                                      .ToList();

            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();
            // Tải lại danh sách lớp từ cơ sở dữ liệu
            var classes = _context.Classes
                                      .Where(c => userClasses.Contains(c.ClassId))
                                      .ToList();
            var className = _context.Classes
                                      .Where(c => c.ClassId == Id)
                                      .Select(c => c.Name)
                                      .FirstOrDefault();
            var classRoom = _context.Classes
                                      .Where(c => c.ClassId == Id)
                                      .Select(c => c.Room)
                                      .FirstOrDefault();
            var classid = _context.Classes
                                      .Where(c => c.ClassId == Id)
                                      .Select(c => c.ClassId)
                                      .FirstOrDefault();

            ViewBag.ListClass = classes;
            ViewBag.ListName = className;
            ViewBag.ListRoom = classRoom;
            ViewBag.ListId = classid;
            ViewBag.ClassId = Id; // Lưu ClassId vào ViewBag

            return View(listAssign);
        }


        [HttpPost]
        public async Task<IActionResult> UpdatePoint(string assignId, string userId, decimal point)
        {
            if (point < 0)
            {
                return BadRequest("Điểm nhập vào không phù hợp!");
            }

            // Kiểm tra phần thập phân của point
            var fractionalPart = point - Math.Truncate(point);
            if (fractionalPart != 0.0m && fractionalPart != 0.5m)
            {
                return BadRequest("Điểm nhập vào phải là số nguyên hoặc kết thúc bằng 0.5!");
            }

            var listAssign = await _context.ListAssigns
                                            .FirstOrDefaultAsync(la => la.AssignId == assignId && la.UserId == userId);
            if (listAssign == null)
            {
                return NotFound();
            }

            listAssign.Point = point;

            _context.Update(listAssign);
            await _context.SaveChangesAsync();

            return Ok();
        }

        public async Task<IActionResult> Details(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return NotFound();
            }

            var @class = await _context.Classes
                                       .FirstOrDefaultAsync(m => m.ClassId == id);
            if (@class == null)
            {
                return NotFound();
            }

            var user = await _userManager.GetUserAsync(User);
            var userClasses = _context.ListStudents
                                      .Where(ls => ls.UserId == user.Id)
                                      .Select(ls => ls.ClassId)
                                      .ToList();

            var classes = _context.Classes
                                  .Where(c => userClasses.Contains(c.ClassId))
                                  .ToList();

            var listAssign = _context.Assigns
                                     .Include(a => a.ListAssigns)
                                     .Where(ls => ls.ListAssigns.Any(la => la.UserId == user.Id) && ls.ClassId == id)
                                     .ToList();

            var comments = _context.Comments
                                   .Include(c => c.User)
                                   .Where(c => listAssign.Select(a => a.AssignId).Contains(c.AssignId))
                                   .ToList();

            var commentsByAssignId = comments.GroupBy(c => c.AssignId)
                                             .ToDictionary(g => g.Key, g => g.ToList());

            ViewBag.ListClass = classes;
            ViewBag.ListAssign = listAssign;
            ViewBag.CommentsByAssignId = commentsByAssignId;
            ViewBag.ClassId = id;

            return View(@class);
        }

        [HttpPost]
        public async Task<IActionResult> PostComment(string assignId, string content)
        {
            if (string.IsNullOrEmpty(content))
            {
                return RedirectToAction("Details", new { id = assignId });
            }

            var user = await _userManager.GetUserAsync(User);
            var comment = new Comment
            {
                Id = Guid.NewGuid().ToString(),
                CmtContent = content,
                CmtTime = DateTime.Now,
                UserId = user.Id,
                AssignId = assignId,
                LoaiId = "1" // Thiết lập giá trị LoaiId phù hợp
            };

            _context.Comments.Add(comment);
            await _context.SaveChangesAsync();

            var assign = await _context.Assigns.FindAsync(assignId);
            return RedirectToAction("Details", new { id = assign.ClassId });
        }

        public IActionResult DownloadFile(string fileName)
        {
            var filePath = Path.Combine(_environment.WebRootPath, "uploads", fileName);
            if (!System.IO.File.Exists(filePath))
                return NotFound();

            var fileBytes = System.IO.File.ReadAllBytes(filePath);
            return File(fileBytes, "application/octet-stream", fileName);
        }

        public async Task<IActionResult> ExportToExcel(string Id)
        {
            var user = await _userManager.GetUserAsync(User);
            var userClasses = await _context.ListStudents
                                            .Where(ls => ls.UserId == user.Id)
                                            .Select(ls => ls.ClassId)
                                            .ToListAsync();

            var teacherRoleId = _context.Roles
                                        .Where(r => r.Name == "Teacher")
                                        .Select(r => r.Id)
                                        .FirstOrDefault();

            var teacherUserIds = _context.UserRoles
                                        .Where(ur => ur.RoleId == teacherRoleId)
                                        .Select(ur => ur.UserId)
                                        .ToList();

            var listAssigns = await _context.ListAssigns
                                            .Include(la => la.Assign)
                                            .ThenInclude(a => a.Class)
                                            .Include(la => la.User)
                                            .Include(la => la.ListFiles)
                                            .Where(la => la.Assign.ClassId == Id && !teacherUserIds.Contains(la.UserId))
                                            .OrderBy(la => la.Assign.AssignName)
                                            .ToListAsync();

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("ListAssign");

                worksheet.Cell(1, 1).Value = "Họ và Tên";
                worksheet.Cell(1, 2).Value = "Tên Bài Tập";
                worksheet.Cell(1, 3).Value = "File nộp bài tập";
                worksheet.Cell(1, 4).Value = "Điểm";

                for (int i = 0; i < listAssigns.Count; i++)
                {
                    var assign = listAssigns[i];
                    var files = assign.ListFiles.Select(f => f.FileName).ToList();

                    worksheet.Cell(i + 2, 1).Value = assign.User.FullName;
                    worksheet.Cell(i + 2, 2).Value = assign.Assign.AssignName;

                    int fileColumn = 3;
                    foreach (var file in files)
                    {
                        var cell = worksheet.Cell(i + 2, fileColumn);
                        cell.Value = file;

                        // Tạo URL tải về file
                        var fileUrl = Url.Action("DownloadFile", "Teacher", new { fileName = file }, protocol: Request.Scheme);

                        // Tạo liên kết cho ô
                        cell.SetHyperlink(new XLHyperlink(fileUrl, $"Tải xuống {file}"));
                        cell.Style.Font.Underline = XLFontUnderlineValues.Single;
                        cell.Style.Font.FontColor = XLColor.Blue;
                        cell.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;

                        fileColumn++;
                    }

                    worksheet.Cell(i + 2, 4).Value = assign.Point;
                }

                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    var content = stream.ToArray();

                    return File(content, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Diem.xlsx");
                }
            }
        }

    }
}
