using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace StudentCURD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridview();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into Student values(@studentname,@subject,@standerd,@standerdid)";
            SqlCommand cmd = new SqlCommand(query,con);
           // cmd.Parameters.AddWithValue("@studentid", TextBox1.Text);
            cmd.Parameters.AddWithValue("@studentname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@subject", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@standerd", DropDownList2.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@standerdid",TextBox3.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script> alert('Insert successfully !')</script>");
                BindGridview();


            }
            else
            {
                Response.Write("<script> alert('Not Inserted !')</script>");
            }

            con.Close();
        }

        void BindGridview()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Student";
            SqlDataAdapter sda = new SqlDataAdapter(query,con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string queery = "update student set StudentName = @studentname, Subject = @subject, Standerd = @standerd, StanderdId = @standerdid where StudentId = @studentid ";
            SqlCommand cmd = new SqlCommand(queery,con);
            cmd.Parameters.AddWithValue("@studentid", TextBox1.Text);
            cmd.Parameters.AddWithValue("@studentname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@subject", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@standerd", DropDownList2.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@standerdid", TextBox3.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script> alert('Updated successfully !')</script>");
                BindGridview();


            }
            else
            {
                Response.Write("<script> alert('Not Update !')</script>");
            }

            con.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label lblId = (Label)row.FindControl("LabelId");
            Label lblName = (Label)row.FindControl("LabelName");
            Label lblSubject = (Label)row.FindControl("LabelSubject");
            Label lblStanderd = (Label)row.FindControl("LabelStanderd");
            Label lblStanderdId = (Label)row.FindControl("LabelStanderdId");

            TextBox1.Text =lblId.Text;  
            TextBox2.Text =lblName.Text;
            DropDownList1.Text = lblSubject.Text;
            DropDownList2.Text = lblStanderd.Text;
            TextBox3.Text = lblStanderdId.Text;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from Student where StudentId = @studentid";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@studentid", TextBox1.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script> alert('Delete successfully !')</script>");
                BindGridview();


            }
            else
            {
                Response.Write("<script> alert('Not Deleted !')</script>");
            }

            con.Close();
        }
    }
}