using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace A3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            txtLoanAmount.Select();
            cmbYears.SelectedIndex = 4;
        }



        public double calcPayment(double presentValue, double financingPeriod, double interestRatePerYear)
        {
            double a, b, x;
            double monthlyPayment;
            a = (1 + interestRatePerYear / 1200);
            b = financingPeriod * 12;
            x = Math.Pow(a, b);
            x = 1 / x;
            x = 1 - x;
            monthlyPayment = (presentValue) * (interestRatePerYear / 1200) / x;
            return (monthlyPayment);
        }
        private void SomeEvent(object sender, EventArgs e)
        {
            double payment = calcPayment(50000, 30, 8.5);
            MessageBox.Show(payment.ToString());
        }

        private void btnCalculatePayment_Click(object sender, EventArgs e)
        {
            double loanAmount = 0.00;
            double fixedInterestRate = 0.00;
            double monthlyPayment;
            int years = 0;
            int numberOfPayments = 0;
            double paymentTotal = 0.0;
            double interestPaid = 0.0;

            //Do all calculations
            try
            {
                loanAmount = Convert.ToDouble(txtLoanAmount.Text);
                errorProvider1.SetError(txtLoanAmount, "");
            }
            catch
            {
                errorProvider1.SetError(txtLoanAmount, "Invalid Loan Amount");
                txtLoanAmount.Select();
                return;

            }

            try
            {
                fixedInterestRate = Convert.ToDouble(txtFixedInterestRate.Text);
                errorProvider1.SetError(txtFixedInterestRate, "");
            }
            catch
            {
                errorProvider1.SetError(txtFixedInterestRate, "Invalid Interest Rate");
                txtFixedInterestRate.Select();
                return;

            }


            fixedInterestRate = Convert.ToDouble(txtFixedInterestRate.Text);
            years = Convert.ToInt16(cmbYears.Text);
            monthlyPayment = calcPayment(loanAmount, years, fixedInterestRate);
            numberOfPayments = years * 12;
            paymentTotal = numberOfPayments * monthlyPayment;
            interestPaid = paymentTotal - loanAmount;
            txtMonthlyPayment.Text = String.Format("{0:c}", monthlyPayment);
            txtNumberOFPayment.Text = Convert.ToString(numberOfPayments);
            txtPaymentTotal.Text = String.Format("{0:c}", paymentTotal);
            txtInterestPaid.Text = String.Format("{0:c}", interestPaid);
        }

        private void cmbYears_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnChooseFont_Click(object sender, EventArgs e)
        {
            
            fontDialog1.ShowDialog();
            lblfont.Font = fontDialog1.Font;
        }

        private void btnChooseColor_Click(object sender, EventArgs e)
        {
            colorDialog1.ShowDialog();
            pnlColor.BackColor = colorDialog1.Color;
        }

        private void btnChooseImage_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            try
            {
                pictureBox1.Image = Image.FromFile(openFileDialog1.FileName);
            }
            catch
            {
                MessageBox.Show("Invalid Image File!!");
            }
        }

        private void normalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pictureBox1.SizeMode = PictureBoxSizeMode.Normal;
        }
        private void stretchToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }
        private void autoSizeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pictureBox1.SizeMode = PictureBoxSizeMode.AutoSize;
        }
        private void centerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pictureBox1.SizeMode = PictureBoxSizeMode.CenterImage;

        }
        private void zoomToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pictureBox1.SizeMode = PictureBoxSizeMode.Zoom;

        }
    }
}
