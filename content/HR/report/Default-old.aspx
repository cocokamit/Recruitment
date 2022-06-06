<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="content_HR_report_Default" MasterPageFile="~/content/NewMasterPage.master" %> 

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .select { margin-top:-10px;}
        .modal { position:fixed !important}
    </style>
</asp:Content>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="content">
<section class="content-header">
    <h1>Dashboard</h1>
    <ol class="breadcrumb">
    <li><asp:DropDownList ID="ddl_year" CssClass="select" runat="server" AutoPostBack="true">
        </asp:DropDownList></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-briefcase"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Open Jobs</span>
              <asp:Label ID="l_open" runat="server" CssClass="info-box-number"></asp:Label>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-ban"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Closed Jobs</span>
              <asp:Label ID="l_close" runat="server" CssClass="info-box-number"></asp:Label>
            </div>
          </div>
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-users"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Total Applicants</span>
              <asp:Label ID="l_total" runat="server" CssClass="info-box-number"></asp:Label>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-user"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Today's Applicants</span>
              <asp:Label ID="l_today" runat="server" CssClass="info-box-number"></asp:Label>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-4">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Gender</h3>
               
            </div>
            <div class="box-body chart-responsive">
              <div class="chart" id="gender" style="height: 300px; position: relative;"></div>
            </div>
                   
          </div>
        </div>

        <div class="col-md-4">
          <div class="box box-primary">
                <div class="box-header with-border">
                <h3 class="box-title">Property</h3>
            </div>
            <div class="box-body chart-responsive">
                <div class="chart" id="property" style="height: 300px; position: relative;"></div>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="box box-primary">
                <div class="box-header with-border">
                <h3 class="box-title">Sources</h3>
            </div>
            <div class="box-body chart-responsive">
                <div class="chart" id="source" style="height: 300px; position: relative;"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
          <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Monthly Head Count</h3>
            </div>
            <div class="box-body chart-responsive">
              <div class="chart" id="bar-chart" style="height: 300px;"></div>
            </div>
          </div>

        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Position</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-toggle="modal" data-target="#modal-default"><i class="fa fa-info-circle"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div id="donut-chart" style="height: 300px;"></div>
            </div>
          </div>
        </div>
         <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Region</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-toggle="modal" data-target="#modal-region"><i class="fa fa-info-circle"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div id="donut-region" style="height: 300px;"></div>
            </div>
          </div>
        </div>

        <div class="col-md-6 hide">
            <div class="box box-primary">
                <div class="box-header with-border">
                <h3 class="box-title">Position</h3>
                
            </div>
            <div class="box-body chart-responsive">
                <div class="chart" id="position" style="height: 300px; position: relative;"></div>
            </div>
       </div>
       </div>
          <div class="col-md-6 hide">
            <div class="box box-primary">
                <div class="box-header with-border">
                <h3 class="box-title">Region</h3>
            </div>
            <div class="box-body chart-responsive">
                <div class="chart" id="region" style="height: 300px; position: relative;"></div>
            </div>
            </div>
          </div>
      </div>

      <div class="modal fade in" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Position</h4>
              </div>
              <div class="modal-body">
                <asp:GridView ID="gv_position" runat="server" CssClass="table table-bordered table-hover dataTable no-margin" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="position" HeaderText="Position" HeaderStyle-HorizontalAlign="Left"  />
                        <asp:BoundField DataField="cnt" HeaderText="Count" />
                    </Columns>
                </asp:GridView>
              </div>
               
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>


        <div class="modal fade in" id="modal-region">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Region</h4>
              </div>
              <div class="modal-body">
                <asp:GridView ID="gv_location" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover dataTable no-margin">
                <Columns>
                    <asp:BoundField DataField="description" HeaderText="Region"  HeaderStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="cnt" HeaderText="Count"/>
                </Columns>
            </asp:GridView>
              </div>
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>

</section>
 
<div class="page-content hidden">
    <asp:GridView ID="gv_gender" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="description" HeaderText="Gender"  HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="cnt" HeaderText="Count" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:GridView>

    <asp:GridView ID="gv_respondent" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="month" HeaderText="Month" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="cnt" HeaderText="Count" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center"/>
        </Columns>
    </asp:GridView>

    
    <asp:GridView ID="gv_property" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="description" HeaderText="Property"  HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="cnt" HeaderText="Count" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:GridView>
    
   
</div>
</asp:Content>

<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
<script src="vendors/raphael/raphael.min.js"></script>
<script src="vendors/morris.js/morris.min.js"></script>
<link href="vendors/morris.js/morris.css" rel="stylesheet" type="text/css" />

<script>
    $(function () {
        "use strict";

        var region = new Morris.Donut({
            element: 'region',
            resize: true,
            colors: [ "#d2d6de", "#f39c12", "#00a65a", "#00c0ef", "#3c8dbc","#3c8dbc", "#f56954", "#00a65a"],
            data: [<%= region %>],
            hideHover: 'auto'
        });

        var gender = new Morris.Donut({
            element: 'gender',
            resize: true,
            colors: ["#3c8dbc", "#f56954", "#00a65a"],
            data: [<%= gender %>],
            hideHover: 'auto'
        });

        var property = new Morris.Donut({
            element: 'property',
            resize: true,
            colors: ["#f56954", "#d2d6de", "#f39c12", "#00a65a", "#00c0ef", "#3c8dbc"],
            data: [<%= property %>],
            hideHover: 'auto'
        });

        var source = new Morris.Donut({
            element: 'source',
            resize: true,
            colors: ["#f56954", "#d2d6de", "#f39c12", "#00a65a", "#00c0ef", "#3c8dbc"],
            data: [<%= source %>],
            hideHover: 'auto'
        });

         var position = new Morris.Donut({
            element: 'position',
            resize: true,
            colors: ["#f56954", "#d2d6de", "#f39c12", "#00a65a", "#00c0ef", "#3c8dbc"],
            data: [<%= position %>],
            hideHover: 'auto'
        });


        var bar = new Morris.Bar({
            element: 'bar-chart',
            xLabelMargin: 15,
            xLabelAngle: 70,
            resize: true,
            data: [<%= month %>],
            barColors: [ '#3c8dbc','#00a65a'],
            xkey: 'y',
            ykeys: ['a'],
            labels: ['month'],
            hideHover: 'auto'
        });
    });
</script>

 
<!-- FLOT CHARTS -->
<script src="vendors/Flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="vendors/Flot/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="vendors/Flot/jquery.flot.pie.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="vendors/Flot/jquery.flot.categories.js"></script>
<script>
    $(function () {
        /*
        * DONUT CHART
        * -----------
        */

        var donutData = [<%= Flotposition %>]
        $.plot('#donut-chart', donutData, {
            series: {
                pie: {
                    show: true,
                    radius: 1,
                    innerRadius: 0,
                    label: {
                        show: true,
                        radius:3 / 5,
                        formatter: labelFormatter,
                        threshold: 0.1
                    }
                }
            },
            legend: {
                show: true
            }
        })

        var donutRegion = [<%= fregion %>]
        $.plot('#donut-region', donutRegion, {
            series: {
                pie: {
                    show: true,
                    radius: 1,
                    innerRadius: 0,
                    label: {
                        show: true,
                        radius:3 / 5,
                        formatter: labelFormatter,
                        threshold: 0.1
                    }
                }
            },
            legend: {
                show: true
            }
        })
        /*
        * END DONUT CHART
        */

    })

    /*
    * Custom Label formatter
    * ----------------------
    */
    function labelFormatter(label, series) {
        return '<div style=" width:70px; font-size:10px; text-align:center; padding:2px; color: #fff; font-weight: 600;  ">'
      + label
      + '<br>'
      + Math.round(series.percent) + '%</div>'
    }
</script>
</asp:Content>