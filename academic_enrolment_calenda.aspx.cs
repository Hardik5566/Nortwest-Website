using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class academic_enrolment_calenda : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    public void BindData()
    {
        try
        {
            // Get dataset from BAL
            DataSet ds = Bal_course.dis_intake();

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                // Convert intake_date to DateTime and sort
                List<DateTime> sortedDates = ds.Tables[0].AsEnumerable()
                    .Select(r => Convert.ToDateTime(r["intake_date"]))
                    .OrderBy(d => d)
                    .ToList();

                // Group the data by Year
                var groupedData = sortedDates
                    .GroupBy(d => d.Year)
                    .Select(g => new
                    {
                        Year = g.Key,
                        Dates = g.Select(d => d.ToString("dd MMM, yyyy")).ToList()
                    })
                    .ToList();

                // Bind Parent ListView
                list_cal.DataSource = groupedData;
                list_cal.DataBind();
            }
            DataSet ds2 = Bal_course.dis_public_holidays();
            if (ds2.Tables[0].Rows.Count > 0)
            {
                list_holiday.DataSource = ds2.Tables[0];
                list_holiday.DataBind();
            }
        }
        catch (Exception ex)
        {
            // Handle or log exception
            System.Diagnostics.Debug.WriteLine("BindData Error: " + ex.Message);
            throw;
        }
    }

    protected void list_cal_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Get Child ListView
            ListView nestedListView = (ListView)e.Item.FindControl("list_date");

            if (nestedListView != null)
            {
                // Bind dates to child ListView
                dynamic itemData = e.Item.DataItem;
                nestedListView.DataSource = itemData.Dates;
                nestedListView.DataBind();
            }
        }
    }
}
