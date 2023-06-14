using DangNhap.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DangNhap
{
    public class TaiKhoanBUS
    {
        private static TaiKhoanBUS instance;
        private string User = "";
        private string Pass = "";

        private TaiKhoanBUS() { }

        
        public static TaiKhoanBUS Instance
        {
            get { if (instance == null) instance = new TaiKhoanBUS(); return instance; }
            private set { TaiKhoanBUS.instance = value; }
        }
        void LuuThongTinNguoiDungHienTai(string user, string pass)
        {
            User = user;
            Pass = pass;
        }

        public void XoaThongTinNguoiDungGanNhat()
        {
            User = "";
            Pass = "";
        }
        public bool DangNhap(string TenDangNhap, string MatKhau)
        {

            DataTable result = TaiKhoanDAO.Instance.DangNhap(TenDangNhap, MatKhau);

            if (result.Rows.Count > 0)
            {
                LuuThongTinNguoiDungHienTai(TenDangNhap, MatKhau);
                return true;
            }
            return false;
        }
        public string LayTenTaiKhoan()
        {
            return User;
        }

        public string LayMatKhau()
        {
            return Pass;
        }

        public void CapNhatMatKhau(string matkhau, int id)
        {
            TaiKhoanDAO.Instance.CapNhatMatKhau(matkhau, id);
        }
    }
}
