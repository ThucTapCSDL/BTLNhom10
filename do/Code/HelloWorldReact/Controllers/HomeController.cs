using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IS.uni;
using IS.Base;
using IS.authen;
using IS.Sess;

namespace HelloWorldReact.Controllers
{
    public class HomeController : Controller
    {
        session ses = new session();
        //
        // GET: /Home/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult dologin()
        {
            //Kiểm tra mật khâu cơ sở dữ liệu ở đây
            STAFF_INFO staff = new STAFF_INFO();
            staff.CODE = "ABC";
            staff.NAME="Đã đăng nhập";
            staff.LOGTIME = DateTime.Now;
            ses.login(staff);

            return RedirectToAction("Index", "Home");
        }
        
       
        [CustomAuthentication]
        public ActionResult branch()
        {
            return View();
        }
        public ActionResult graduatestudentreact()
        {
            return View();
        }

        public JsonResult GetName()
        {
            return Json(new { name = "World from server side" }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ChiTiet(string studentcode)
        {
            detail_BUS bus = new detail_BUS();
            detail_OBJ obj = new detail_OBJ();
          
            List<detail_OBJ> li = bus.getAll();
            return View(li);
            //    obj = bus.GetByID("SV1");

            return View(li);
        }

    }
}