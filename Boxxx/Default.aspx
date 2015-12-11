<%@ Page Title="英雄联盟战绩查询" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Boxxx._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        // Add initializeRequest and endRequest
        prm.add_initializeRequest(prm_InitializeRequest);
        prm.add_endRequest(prm_EndRequest);

        // Called when async postback begins
        function prm_InitializeRequest(sender, args) {
            $("<div class='loader'><div class='circle'></div><div class='circle'></div><div class='circle'></div></div>").appendTo(document.body);
        }

        // Called when async postback ends
        function prm_EndRequest(sender, args) {
            $('.loader').remove();
            //Scroll();
        }

        $(document).on('click', '[src*=plus]', function (e) {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999' style='text-align: center'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "Images/minus.png");
        });
        $(document).on('click', '[src*=minus]', function (e) {
            $(this).attr("src", "Images/plus.png");
            $(this).closest("tr").next().remove();
        });
        //$(function () {
        //    $('.toggle').click(function (e) {
        //        $(this).find('.icon').toggleClass('icon-chevron-thin-down icon-chevron-thin-up')
        //    });
        //});
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(getColor);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(modalClick);
        $(document).ready(function () {
            getColor();
            modalClick();
        });
        function showDetails() {
            $('#modalMatchDetail').modal('show');
        }
        function getColor(){
            $("span[id^='span']:contains('失败')").attr('class', 'label label-danger');
        }
        function modalClick() {
            $(".showModal").click(function () {
                $(this).next('input').click();
            });
        }
        function Scroll() {
            $('html,body').animate({
                scrollTop: $("#divMain").offset().top - 70
            }, 'slow');
        }
    </script>

    <div class="panel panel-default" align="center">
        <div class="panel-body">
            <div class="form-inline">
                <div class="form-group">
                    <%-- <label class="control-label">服务器</label>--%>
                    <asp:DropDownList ID="dpServer" runat="server" CssClass="custom-select form-control">
                        <asp:ListItem Value="电信一">艾欧尼亚</asp:ListItem>
                        <asp:ListItem Value="电信二">祖安</asp:ListItem>
                        <asp:ListItem Value="电信三">诺克萨斯</asp:ListItem>
                        <asp:ListItem Value="电信四">班德尔城</asp:ListItem>
                        <asp:ListItem Value="电信五">皮尔特沃夫</asp:ListItem>
                        <asp:ListItem Value="电信六">战争学院</asp:ListItem>
                        <asp:ListItem Value="电信七">巨神峰</asp:ListItem>
                        <asp:ListItem Value="电信八">雷瑟守备</asp:ListItem>
                        <asp:ListItem Value="电信九">裁决之地</asp:ListItem>
                        <asp:ListItem Value="电信十">黑色玫瑰</asp:ListItem>
                        <asp:ListItem Value="电信十一">暗影岛</asp:ListItem>
                        <asp:ListItem Value="电信十二">钢铁烈阳</asp:ListItem>
                        <asp:ListItem Value="电信十三">水晶之痕</asp:ListItem>
                        <asp:ListItem Value="电信十四">均衡教派</asp:ListItem>
                        <asp:ListItem Value="电信十五">影流</asp:ListItem>
                        <asp:ListItem Value="电信十六">守望之海</asp:ListItem>
                        <asp:ListItem Value="电信十七">征服之海</asp:ListItem>
                        <asp:ListItem Value="电信十八">卡拉曼达</asp:ListItem>
                        <asp:ListItem Value="电信十九">皮城警备</asp:ListItem>
                        <asp:ListItem Value="网通一" Selected="True">比尔吉沃特</asp:ListItem>
                        <asp:ListItem Value="网通二">德玛西亚</asp:ListItem>
                        <asp:ListItem Value="网通三">弗雷尔卓德</asp:ListItem>
                        <asp:ListItem Value="网通四">无畏先锋</asp:ListItem>
                        <asp:ListItem Value="网通五">怒瑞玛</asp:ListItem>
                        <asp:ListItem Value="网通六">扭曲丛林</asp:ListItem>
                        <asp:ListItem Value="网通七">巨龙之巢</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <%-- <label class="control-label">游戏ID</label>--%>
                    <asp:TextBox ID="txtPlayerId" runat="server" Text="我不是个善良的人" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="查询" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-pill btnSubmit" />
            </div>
        </div>
    </div>
    <div>
        <asp:UpdatePanel ID="upMain" runat="server">
            <ContentTemplate>
                <div id="divMain">
                    <asp:Panel ID="pnlMainContent" runat="server">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-profile">
                                <div class="panel-heading" style="background-image: url(Images/bg7.jpg);"></div>
                                <div class="panel-body text-center">
                                    <asp:Repeater ID="gvPlayerProfile" runat="server" OnItemDataBound="gvPlayerProfile_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:Image ID="imgIcon" runat="server" ImageUrl='<%# Bind("icon") %>' CssClass="panel-profile-img" />
                                            <h5 class="panel-title" runat="server"><%# Eval("player_id") %> <span class="badge"><%# Eval("level") %></span></h5>
                                            <h5><span class="label label-primary"><%# Eval("fighting") %></span></h5>
                                            <ul class="avatar-list m-b-md">
                                                <asp:Repeater ID="gvComChamp" runat="server">
                                                    <ItemTemplate>
                                                        <li class="avatar-list-item">
                                                            <asp:Image ID="champIcon" runat="server" ImageUrl='<%# Bind("icon") %>' ToolTip='<%# Eval("champion_name_ch") + " " + Eval("count") + "次" %>' />
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div>
                                <asp:Repeater ID="gvRankStat" runat="server" OnItemDataBound="gvRankStat_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="panel panel-default panel-profile">
                                            <div class="panel-body text-center">
                                                <asp:Image ID="imgIcon" class="panel-profile-img" runat="server" ImageUrl='<%# getRankIcon(Eval("rank").ToString()) %>' />
                                                <h5 class="panel-title">
                                                    <span class="label label-primary"><%# Eval("rank") %></span>
                                                    <span class="label label-success"><%# Eval("point") %></span>
                                                </h5>
                                                <table class="table table-condensed borderless table-mid">
                                                    <tr>
                                                        <th>场次</th>
                                                        <th>胜率</th>
                                                        <th>胜场</th>
                                                        <th>负场</th>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="label label-primary"><%# Eval("total_matches") %></span></td>
                                                        <td><span class="label label-info"><%# Eval("win_rate") %></span></td>
                                                        <td><span class="label label-success"><%# Eval("matches_winned") %></span></td>
                                                        <td><span class="label label-danger"><%# Eval("matches_lost") %></span></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <ul class="list-group">
                                    <asp:Repeater ID="gvNormalStat" runat="server">
                                        <ItemTemplate>
                                            <li class="list-group-item text-center">
                                                <h4><%# Eval("type") %></h4>
                                                <table class="table table-condensed borderless table-mid">
                                                    <tr>
                                                        <th>场次</th>
                                                        <th>胜率</th>
                                                        <th>胜场</th>
                                                        <th>负场</th>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="label label-primary"><%# Eval("total_matches") %></span></td>
                                                        <td><span class="label label-info"><%# Eval("win_rate") %></span></td>
                                                        <td><span class="label label-success"><%# Eval("matches_winned") %></span></td>
                                                        <td><span class="label label-danger"><%# Eval("matches_lost") %></span></td>
                                                    </tr>
                                                </table>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ul class="media-list media-list-users list-group">
                                <asp:GridView ID="gvMatchList" runat="server" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" DataKeyNames="id"
                                    AllowPaging="true" OnPageIndexChanging="gvMatchList_PageIndexChanging" OnRowDataBound="gvMatchList_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <a class="list-group-item showModal" style="cursor: pointer;">
                                                    <div class="media">
                                                        <div class="media-left">
                                                            <asp:Image class="media-object img-circle" ID="imgIcon" runat="server" ImageUrl='<%# Bind("icon") %>' ToolTip='<%# Bind("champion_name_ch") %>' />
                                                        </div>
                                                        <div class="media-body">
                                                            <div class="media-heading">
                                                                <small class="pull-right text-muted"><%# Eval("date") %></small>
                                                                <h5><%# Eval("mode") %></h5>
                                                            </div>
                                                            <span id='<%# "span" + Eval("id") %>' class="label label-success"><%# Eval("status") %></span>
                                                            <asp:Repeater ID="gvMatchHeader" runat="server">
                                                                <ItemTemplate>
                                                                    <span class="label label-info"><%# Eval("duration") %></span>
                                                                    <span class="label label-warning"><%# Eval("kills") %></span>
                                                                    <span class="label label-primary"><%# Eval("gold") %></span>
                                                                    <small class="pull-right text-muted"><%# Eval("endTime") %></small>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </a>
                                                <asp:Button ID="btnMatchDetail" runat="server" Text="" OnClick="btnMatchDetail_ServerClick" CssClass="hidden" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="pagination-ys" />
                                </asp:GridView>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <div>
                                <ul class="media-list media-list-users list-group">
                                    <asp:GridView ID="gvPlayedChamps" runat="server" ShowHeader="false" GridLines="None" AutoGenerateColumns="false"
                                        AllowPaging="true" OnPageIndexChanging="gvPlayedChamps_PageIndexChanging" EnableSortingAndPagingCallbacks="true">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <a class="list-group-item" data-toggle="collapse" href='<%# "#" + Eval("championName") %>' id='<%# "a" + Eval("championName") %>'
                                                        aria-expanded="false" aria-controls='<%# Eval("championName") %>'>
                                                        <div class="media">
                                                            <div class="media-left">
                                                                <asp:Image class="media-object img-circle" ID="imgIcon" runat="server" ImageUrl='<%# Bind("icon") %>' ToolTip='<%# Bind("championNameCN") %>' />
                                                            </div>
                                                            <div class="media-body">
                                                                <p>
                                                                    <strong>场次/胜率: </strong>
                                                            <span class="label label-primary"><%# Eval("matchStat") %></span>
                                                                    <span class="label label-info"><%# Eval("winRate") %></span>
                                                                </p>
                                                                <p>
                                                                    <strong>场均 KDA: </strong>
                                                            <span class="label label-warning"><%# Eval("averageKDARating") %></span>
                                                                    <span class="label label-success"><%# Eval("averageKDA") %></span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <div class="collapse" id='<%# Eval("championName") %>'>
                                                        <div class="well">
                                                            <p>MVP: <span class="label label-primary"><%# Eval("totalMVP") %></span></p>
                                                            <p>场均分钟输出: <span class="label label-info"><%# Eval("averageDamage") %></span></p>
                                                            <p>场均分钟经济: <span class="label label-warning"><%# Eval("averageEarn") %></span></p>
                                                            <p>场均十分钟补兵: <span class="label label-success"><%# Eval("averageMinionsKilled") %></span></p>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle CssClass="pagination-ys" />
                                    </asp:GridView>
                                </ul>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div id="modalMatchDetail" class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close closeb" data-dismiss="modal">×</button>
                                <h3>Modal header</h3>
                            </div>
                            <div class="modal-body">
                                <ul class="media-list media-list-users list-group">
                                    <asp:Repeater runat="server" ID="gvMatchDetailsA">
                                        <ItemTemplate>
                                            <li class="list-group-item">
                                                <table class="table table-condensed borderless">
                                                    <tr>
                                                        <th>英雄</th>
                                                        <th>召唤师</th>
                                                        <th>经济</th>
                                                        <th>KDA</th>
                                                        <th>出装</th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Image class="media-object img-circle iconChamp" ID="imgChampIcon" runat="server" ImageUrl='<%# Bind("champIcon") %>' ToolTip='<%# Bind("champion_name_ch") %>' />
                                                            <p>
                                                                <asp:Image CssClass="img-circle iconItem" ID="spell1Icon" runat="server" ImageUrl='<%# Bind("firstSpellIcon") %>' />
                                                                <asp:Image CssClass="img-circle iconItem" ID="spell2Icon" runat="server" ImageUrl='<%# Bind("secondSpellIcon") %>' />
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPlayerId" runat="server" Text='<%# Bind("playerId") %>'></asp:Label>
                                                            <asp:HiddenField ID="hfMatchId" runat="server" Value='<%# Eval("matchId") %>' />
                                                        </td>
                                                        <td>
                                                            <span class="label label-warning"><%# Eval("gold") %></span>
                                                        </td>
                                                        <td>
                                                            <span class="label label-primary"><%# Eval("KDA") %></span>
                                                        </td>
                                                        <td>
                                                            <asp:GridView ID="gvItemsA" runat="server" AutoGenerateColumns="false" ShowHeader="false" BorderWidth="0px">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="itemIcon1" runat="server" ImageUrl='<%# Bind("itemIcon1") %>' ToolTip='<%# Bind("itemDesc1") %>' />
                                                                            <asp:Image ID="itemIcon2" runat="server" ImageUrl='<%# Bind("itemIcon2") %>' ToolTip='<%# Bind("itemDesc2") %>' />
                                                                            <asp:Image ID="itemIcon3" runat="server" ImageUrl='<%# Bind("itemIcon3") %>' ToolTip='<%# Bind("itemDesc3") %>' />
                                                                            <asp:Image ID="itemIcon4" runat="server" ImageUrl='<%# Bind("itemIcon4") %>' ToolTip='<%# Bind("itemDesc4") %>' />
                                                                            <asp:Image ID="itemIcon5" runat="server" ImageUrl='<%# Bind("itemIcon5") %>' ToolTip='<%# Bind("itemDesc5") %>' />
                                                                            <asp:Image ID="itemIcon6" runat="server" ImageUrl='<%# Bind("itemIcon6") %>' ToolTip='<%# Bind("itemDesc6") %>' />
                                                                            <asp:Image ID="itemIcon7" runat="server" ImageUrl='<%# Bind("itemIcon7") %>' ToolTip='<%# Bind("itemDesc7") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="collapse">
                                                    <div class="well">
                                                        <span class="label label-info"><%# Eval("lastHits") %></span>
                                                        <span class="label label-success"><%# Eval("wards") %></span>
                                                        <span class="label label-warning"><%# Eval("dewards") %></span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                                <ul class="media-list media-list-users list-group">
                                    <asp:Repeater runat="server" ID="gvMatchDetailsB">
                                        
                                        <ItemTemplate>
                                            <li class="list-group-item">
                                                <div class="media">
                                                    <div class="media-left">
                                                        <asp:Image class="media-object img-circle iconChamp" ID="imgChampIcon" runat="server" ImageUrl='<%# Bind("champIcon") %>' ToolTip='<%# Bind("champion_name_ch") %>' />
                                                    </div>
                                                    <div class="media-body">
                                                        <strong>
                                                            <asp:Label ID="lblPlayerId" runat="server" Text='<%# Bind("playerId") %>'></asp:Label>
                                                            <asp:HiddenField ID="hfMatchId" runat="server" Value='<%# Eval("matchId") %>' />
                                                        </strong>
                                                        <div class="media-heading">
                                                            <span>KDA</span>
                                                        </div>
                                                        <span class="label label-primary"><%# Eval("KDA") %></span>
                                                        <span class="label label-warning"><%# Eval("gold") %></span>
                                                        <span class="label label-info"><%# Eval("lastHits") %></span>
                                                        <span class="label label-success"><%# Eval("wards") %></span>
                                                        <span class="label label-warning"><%# Eval("dewards") %></span>
                                                        <ul class="avatar-list">
                                                            <li class="avatar-list-item">
                                                                <asp:Image CssClass="img-circle iconItem" ID="spell1Icon" runat="server" ImageUrl='<%# Bind("firstSpellIcon") %>' />
                                                            </li>
                                                            <li class="avatar-list-item">
                                                                <asp:Image CssClass="img-circle iconItem" ID="spell2Icon" runat="server" ImageUrl='<%# Bind("secondSpellIcon") %>' />
                                                            </li>
                                                        </ul>
                                                        <asp:Repeater runat="server" ID="gvItemsB">
                                                            <ItemTemplate>
                                                                <ul class="avatar-list">
                                                                    <li class="avatar-list-item">
                                                                        <asp:Image CssClass="iconItem" ID="itemIcon1" runat="server" ImageUrl='<%# Bind("itemIcon1") %>' ToolTip='<%# Bind("itemDesc1") %>' />
                                                                    </li>
                                                                    <li class="avatar-list-item">
                                                                        <asp:Image CssClass="iconItem" ID="itemIcon2" runat="server" ImageUrl='<%# Bind("itemIcon2") %>' ToolTip='<%# Bind("itemDesc2") %>' />
                                                                    </li>
                                                                    <li class="avatar-list-item">
                                                                        <asp:Image CssClass="iconItem" ID="itemIcon3" runat="server" ImageUrl='<%# Bind("itemIcon3") %>' ToolTip='<%# Bind("itemDesc3") %>' />
                                                                    </li>
                                                                    <li class="avatar-list-item">
                                                                        <asp:Image CssClass="iconItem" ID="itemIcon4" runat="server" ImageUrl='<%# Bind("itemIcon4") %>' ToolTip='<%# Bind("itemDesc4") %>' />
                                                                    </li>
                                                                    <li class="avatar-list-item">
                                                                        <asp:Image CssClass="iconItem" ID="itemIcon5" runat="server" ImageUrl='<%# Bind("itemIcon5") %>' ToolTip='<%# Bind("itemDesc5") %>' />
                                                                    </li>
                                                                    <li class="avatar-list-item">
                                                                        <asp:Image CssClass="iconItem" ID="itemIcon6" runat="server" ImageUrl='<%# Bind("itemIcon6") %>' ToolTip='<%# Bind("itemDesc6") %>' />
                                                                    </li>
                                                                    <li class="avatar-list-item">
                                                                        <asp:Image CssClass="iconItem" ID="itemIcon7" runat="server" ImageUrl='<%# Bind("itemIcon7") %>' ToolTip='<%# Bind("itemDesc7") %>' />
                                                                    </li>
                                                                </ul>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="modal-footer">
                                <button class="btn closeb" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSubmit" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
                                        
</asp:Content>
