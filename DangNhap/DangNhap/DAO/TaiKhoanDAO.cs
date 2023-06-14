using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DangNhap.DAO
{
    public class TaiKhoanDAO
    {
        private static TaiKhoanDAO instance;

        public static TaiKhoanDAO Instance
        {
            get 
            { if (instance == null) 
                    instance = new TaiKhoanDAO(); 
                return instance; 
            }
            private set { instance = value; }
        }
        private TaiKhoanDAO() { }
        public DataTable DangNhap(string TenDangNhap, string MatKhau)
        {
            string query = "USP_Dangnhap @TenDangNhap , @MatKhau";

            return DataProvider.Instance.ExecuteQuery(query, new object[] { TenDangNhap, MatKhau });
        }


        public void CapNhatMatKhau(string matkhau, int id)
        {
            string query = "DoiMK @TenDangNhap  , @MatKhauMoi";
            DataProvider.Instance.UpdateDatabase(query, new object[] { id, matkhau });
        }

    }

   

}
