using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class academic_enrolment_calenda : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_data();
        }
    }

    public void bind_data()
    {
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("date");

            dt.Rows.Add("17 Jan, 2022");
            dt.Rows.Add("21 Feb, 2022");
            dt.Rows.Add("18 Apr, 2022");
            dt.Rows.Add("23 May, 2022");
            dt.Rows.Add("18 Jul, 2022");
            dt.Rows.Add("22 Aug, 2022");
            dt.Rows.Add("17 Oct, 2022");
            dt.Rows.Add("21 Nov, 2022");

            dt.Rows.Add("16 Jan, 2023");
            dt.Rows.Add("20 Feb, 2023");
            dt.Rows.Add("17 Apr, 2023");
            dt.Rows.Add("22 May, 2023");
            dt.Rows.Add("17 Jul, 2023");
            dt.Rows.Add("21 Aug, 2023");
            dt.Rows.Add("16 Oct, 2023");
            dt.Rows.Add("20 Nov, 2023");

            dt.Rows.Add("15 Jan, 2024");
            dt.Rows.Add("19 Feb, 2024");
            dt.Rows.Add("15 Apr, 2024");
            dt.Rows.Add("20 May, 2024");
            dt.Rows.Add("15 Jul, 2024");
            dt.Rows.Add("19 Aug, 2024");
            dt.Rows.Add("14 Oct, 2024");
            dt.Rows.Add("18 Nov, 2024");

            dt.Rows.Add("13 Jan, 2025");
            dt.Rows.Add("17 Feb, 2025");
            dt.Rows.Add("14 Apr, 2025");
            dt.Rows.Add("19 May, 2025");
            dt.Rows.Add("14 Jul, 2025");
            dt.Rows.Add("18 Aug, 2025");
            dt.Rows.Add("13 Oct, 2025");
            dt.Rows.Add("17 Nov, 2025");

            dt.Rows.Add("12 Jan, 2026");
            dt.Rows.Add("16 Feb, 2026");
            dt.Rows.Add("13 Apr, 2026");
            dt.Rows.Add("18 May, 2026");
            dt.Rows.Add("13 Jul, 2026");
            dt.Rows.Add("17 Aug, 2026");
            dt.Rows.Add("12 Oct, 2026");
            dt.Rows.Add("16 Nov, 2026");

            dt.Rows.Add("18 Jan, 2027");
            dt.Rows.Add("22 Feb, 2027");
            dt.Rows.Add("19 Apr, 2027");
            dt.Rows.Add("24 May, 2027");
            dt.Rows.Add("19 Jul, 2027");
            dt.Rows.Add("23 Aug, 2027");
            dt.Rows.Add("18 Oct, 2027");
            dt.Rows.Add("22 Nov, 2027");



            List<DateTime> sortedDates = dt.AsEnumerable()
            .Select(row => DateTime.ParseExact(row["date"].ToString(), "dd MMM, yyyy", CultureInfo.InvariantCulture))
            .OrderBy(d => d)
            .ToList();

            // **Group the data by Year**
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
        catch (Exception)
        {
            
            throw;
        }
    }


    protected void list_cal_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            // Get Child ListView
            ListView nestedListView = (ListView)e.Item.FindControl("list_date");

            // Get Data for Nested ListView
            var itemData = (dynamic)e.Item.DataItem;
            nestedListView.DataSource = itemData.Dates;
            nestedListView.DataBind();
        }
    }
}