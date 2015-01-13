using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Configuration;

//namespace PoultrySystem.App_Code
//{
    public class DBUtil
    {

        public static String ConnectionString
        {
            get
            {
                ConnectionStringSettings constr = WebConfigurationManager.ConnectionStrings["DefaultConnection"];
                return constr.ConnectionString;

            }

        }
    }
//}