using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopGiayNhom09.Models;

namespace ShopGiayNhom09.Controllers
{
    public class NguoiDungController : Controller
    {
        //
        // GET: /NguoiDung/
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


        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(KhachHang kh, FormCollection f)
        {
            var hoten = f["HoTenKH"];
            var ngaysinh = String.Format("{0:MM/DD/YYYY}", f["NgaySinh"]);
            var dienthoai = f["DienThoai"];
            var tendn = f["TenDN"];
            var matkhau = f["MatKhau"];
            var rematkhau = f["ReMatKhau"];
            var email = f["Email"];
            var diachi = f["DiaChi"];

            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên không được bỏ trống!";
            }
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Tên đăng nhập không được bỏ trống!";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Mật khẩu không được bỏ trống!";
            }
            if (String.IsNullOrEmpty(rematkhau))
            {
                ViewData["Loi4"] = "Vui lòng nhập lại mật khẩu!";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi5"] = "Vui lòng nhập số điện thoại!";
            }
            if (!String.IsNullOrEmpty(hoten) && !String.IsNullOrEmpty(tendn) && !String.IsNullOrEmpty(matkhau) && !String.IsNullOrEmpty(rematkhau) && !String.IsNullOrEmpty(dienthoai))
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = tendn;
                kh.MatKhau = matkhau;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                kh.DiaChi = diachi;
                kh.Email = email;

                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            return View();
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            var tendn = f["TenDN"];
            var matkhau = f["MatKhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Tên đăng nhập không được bỏ trống!";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Vui lòng nhập mật khẩu!";
            }
            if (!String.IsNullOrEmpty(tendn) && !String.IsNullOrEmpty(matkhau))
            {
                KhachHang kh = db.KhachHangs.SingleOrDefault(s => s.TaiKhoan == tendn && s.MatKhau == matkhau);
                if (kh != null)
                {
                    ViewBag.tb = "Đăng nhập thành công!";
                    Session["taikhoan"] = kh;                    
                }
                else
                    ViewBag.tb = "Sai tên đăng nhập hoặc mật khẩu, vui lòng nhập lại!";               
            }
            return RedirectToAction("DatHang", "NguoiDung");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["taikhoan"] == null)
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("showALLSanPham", "QLBanGiay");
            }
            List<GioHang> listGioHang = layGioHang();
            ViewBag.tongSoLuong = tongSoLuong();
            ViewBag.tongThanhTien = tongThanhTien();

            return View(listGioHang);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection f)
        {
            //Thêm đơn hàng
            DonHang ddh = new DonHang();
            KhachHang kh = (KhachHang)Session["taikhoan"];
            List<GioHang> gh = layGioHang();
            ddh.MaKH = kh.MaKH;
            ddh.NgayDat = DateTime.Now;
            var ngayGiao = String.Format("{0:MM/dd/yyyy}", f["NgayGiao"]);
            ddh.NgayGiao = DateTime.Parse(ngayGiao);
            ddh.TinhTrangGiaoHang = 0;
            ddh.DaThanhToan = "Chưa thanh toán";
            db.DonHangs.InsertOnSubmit(ddh);
            db.SubmitChanges();
            foreach(var item in gh)
            {
                CT_DonHang ctdh = new CT_DonHang();
                ctdh.MaDonHang = ddh.MaDonHang;
                ctdh.MaGiay = item.iMaGiay;
                ctdh.SoLuong = item.iSoLuong;
                ctdh.DonGia = (decimal)item.dDonGia;
                db.CT_DonHangs.InsertOnSubmit(ctdh);
            }
            db.SubmitChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XacNhanDonHang", "GioHang");
        }
	}
}