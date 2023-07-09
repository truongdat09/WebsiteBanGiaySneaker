using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopGiayNhom09.Models;
namespace ShopGiayNhom09.Controllers
{
    public class QLBanGiayController : Controller
    {
        //
        // GET: /QLBanGiay
        QLBanGiayDataContext db = new QLBanGiayDataContext();
        public ActionResult showALLSanPham()
        {
            var listSP = db.Giays.OrderBy(s=>s.TenGiay).ToList();
            return View(listSP);
        }
        public ActionResult showSanPham2()
        {
            var listSP = db.Giays.Take(6).OrderBy(s => s.TenGiay).ToList();
            return View(listSP);
        }
        public ActionResult LoaiGiayPartial()
        {
            var listSPGiay = db.LoaiGiays.OrderBy(g => g.TenLoai).ToList();
            return View(listSPGiay);
        }
        public ActionResult GenderPartial()
        {
            var listSPGender = db.Genders.OrderBy(gender => gender.Gender1).ToList();
            return View(listSPGender);
        }
        public ActionResult giayTheoLoai(int maLoai)
        {
            var listGiay = db.Giays.Where(giay => giay.MaLoai == maLoai).ToList();
            if (listGiay.Count == 0)
            {
                ViewBag.thongBao = "KHÔNG CÓ SẢN PHẨM NÀO THUỘC THƯƠNG HIỆU NÀY !!!";
            }
            return View(listGiay);
        }
        public ActionResult giayTheoGender(int maGender)
        {
            var listGiay = db.Giays.Where(giay => giay.MaGender == maGender).ToList();
            if (listGiay.Count == 0)
            {
                ViewBag.thongBao = "KHÔNG CÓ SẢN PHẨM NÀO THUỘC GENDER NAY !";
            }
            return View(listGiay);
        }
     
        public ActionResult xemChiTiet(int maGiay)
        {
            Giay giay = db.Giays.Single(g => g.MaGiay == maGiay);
            if (giay == null)
            {
                return HttpNotFound();
            }
            return View(giay);
        }
        public ActionResult Index()
        {
            return View();
        }
	}
}