using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopGiayNhom09.Models;
namespace ShopGiayNhom09.Controllers
{
    public class GioHangController : Controller
    {
        //
        // GET: /GioHang/
        QLBanGiayDataContext db = new QLBanGiayDataContext();
        public List<GioHang> layGioHang()
        {
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang == null)
            {
                listGioHang = new List<GioHang>();
                Session["GioHang"] = listGioHang;
            }
            return listGioHang;
        }
        public ActionResult themGioHang(int mag, string strURL)
        {
            List<GioHang> listGioHang = layGioHang();
            GioHang sanPham = listGioHang.Find(sp => sp.iMaGiay == mag);
            if (sanPham == null)
            {
                sanPham = new GioHang(mag);
                listGioHang.Add(sanPham);
                return Redirect(strURL);
            }
            else
            {
                sanPham.iSoLuong++;
                return Redirect(strURL);
            }
        }
        private int tongSoLuong()
        {
            int tsl = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                tsl += listGioHang.Sum(sp => sp.iSoLuong);
            }
            return tsl;
        }
        private double tongThanhTien()
        {
            double ttt = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null)
            {
                ttt += listGioHang.Sum(sp => sp.dThanhTien);
            }
            return ttt;
        }
        public ActionResult index()
        {
            return View();
        }
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("index", "GioHang");
            }
            List<GioHang> listGioHang = layGioHang();
            ViewBag.tongSoLuong = tongSoLuong();
            ViewBag.tongThanhTien = tongThanhTien();
            return View(listGioHang);
        }
        public ActionResult GioHangPartial()
        {
            ViewBag.tongSoLuong = tongSoLuong();
            return PartialView();
        }

        public ActionResult xoaGioHang(int mag)
        {
            List<GioHang> listGioHang = layGioHang();
            GioHang sp = listGioHang.Single(g => g.iMaGiay == mag);
            if (sp != null)
            {
                listGioHang.RemoveAll(s => s.iMaGiay == mag);
                return RedirectToAction("GioHang", "GioHang");
            }
            if (listGioHang.Count == 0)
            {
                return RedirectToAction("Index1", "QLBanGiay");
            }
            return RedirectToAction("GioHang", "GioHang");
        }
        public ActionResult XoaAll()
        {
            List<GioHang> lstGioHang = layGioHang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "QLBanGiay");
        }
        public ActionResult capNhat(int mag, FormCollection form)
        {
            List<GioHang> listGioHang = layGioHang();
            GioHang sp = listGioHang.Single(g => g.iMaGiay == mag);
            if (sp != null)
            {
                sp.iSoLuong = int.Parse(form["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang", "GioHang");
        }

        public ActionResult XacNhanDonHang()
        {
            return View();
        }
	}
}