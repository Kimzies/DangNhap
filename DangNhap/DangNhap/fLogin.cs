using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlTypes;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//using DangNhap;

namespace DangNhap
{
    public partial class fLogin : Form
    {
        public fLogin()
        {
            InitializeComponent();
        }
        bool DangNhap(string  TenDangNhap, string MatKhau)
        {
            return TaiKhoanBUS.Instance.DangNhap(TenDangNhap, MatKhau);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (tbDangNhap.Text.Length == 0)
            {
                MessageBox.Show("Vui lòng nhập tài khoản!");
            }
            else if (tbMatKhau.Text.Length == 0)
            {
                MessageBox.Show("Vui lòng nhập mật khẩu!");
            }
            else
            {
                string TenDangNhap = tbDangNhap.Text;
                string MatKhau = tbMatKhau.Text;
                if (DangNhap(TenDangNhap, MatKhau))
                {
                    MessageBox.Show("Đăng nhập thành công!", "Thông Báo");
                    fAdmin frm = new fAdmin();
                    this.Hide();
                    frm.ShowDialog();
                    this.Show();
                    tbDangNhap.Clear();
                    tbMatKhau.Clear();
                }
                else
                {
                    MessageBox.Show("Vui lòng kiểm tra lại tên hoặc mật khẩu!");
                }

            }
        } 

        /* private void button1_Click(object sender, EventArgs e)
         {
             fManager f = new fManager();
             this.Hide();
             f.ShowDialog();
             this.Show();
         } */
        private void button2_Click(object sender, EventArgs e)
        {
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void fLogin_FormClosing_1(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có thật sự muốn thoát chương trình?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

       
    }
}
