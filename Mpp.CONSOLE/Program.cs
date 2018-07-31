using Mpp.BUSINESS;
using Mpp.UTILITIES;
using Mpp.BUSINESS.DataLibrary;
using Mpp.BUSINESS.Scheduler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Mpp.UTILITIES.Statics;
using System.Data.SqlClient;
using System.Data;

namespace Mpp.CONSOLE
{

    class Program
    {
        static void Main(string[] args)
        {
            AccountData userregistrationData = new AccountData();
            try
            {

                JobScheduler_beta.start();

                ReportsAPI r = new ReportsAPI();
                r.ProcessInventoryReports(ReportStatus.NOTSET_SIGNUP, ReportStatus.SET_SIGNUP);
                // Console.WriteLine("Connection started");
                // Console.ReadKey();

                // SqlCommand cmd = new SqlCommand();
                //  //SqlConnection con = new SqlConnection(@"Server=VE290418B_NSEZ\SQLEXPRESS2017;User Id=sa;password=pass@123;Initial Catalog=MyppcPalDBSandbox1");
                //SqlConnection con = new SqlConnection(@"Server=Server=T-MPPIIS\SQLEXPRESS;User Id=mppuser;password=~80-wall-BREAD-join-LIFE-19~r;Initial Catalog=MyppcPalDB");
                // cmd.Connection = con;
                // con.Open();

                // Console.WriteLine("Connection opened");
                // Console.ReadKey();

                // cmd.CommandText = "Sbsp_UpdatePasswordtest";
                // cmd.CommandType = CommandType.StoredProcedure;
                // cmd.Parameters.Add("@emailid", SqlDbType.VarChar, 50).Value = "myppcpal1@gmahjkil.com";
                // cmd.Parameters.Add("@newPassword", SqlDbType.Binary, 16).Value = MppUtility.EncryptPassword("pass@123");
                // int result = cmd.ExecuteNonQuery();
                // Console.WriteLine("finished updaintg the password : "+result);

                // Console.ReadKey();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception - {0}", ex.Message);
            }
        }
    }
}
