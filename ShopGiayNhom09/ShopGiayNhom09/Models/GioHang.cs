using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopGiayNhom09.Models
{
    public class GioHang
    {

        QLBanGiayDataContext db = new QLBanGiayDataContext();
        public int iMaGiay { get; set; }
        public string sTenGiay { get; set; }
        public string sAnhBia { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double dThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }

        //Khoi tao gio hang

        public GioHang(int MaGiay)
        {
            iMaGiay = MaGiay;
            Giay giay = db.Giays.Single(g => g.MaGiay == iMaGiay);
            sTenGiay = giay.TenGiay;
            sAnhBia = giay.AnhBia;
            dDonGia = double.Parse(giay.GiaBan.ToString());
            iSoLuong = 1;
        }
    }
}