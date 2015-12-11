<%@ Page Title="英雄联盟战绩查询" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Boxxx._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        // Add initializeRequest and endRequest
        prm.add_initializeRequest(prm_InitializeRequest);
        prm.add_endRequest(prm_EndRequest);

        // Called when async postback begins
        function prm_InitializeRequest(sender, args) {
            $("<div class='wrapper'><div class='ball ball-1'></div><div class='ball ball-2'></div><div class='ball ball-3'></div></div>").appendTo(document.body);
        }

        // Called when async postback ends
        function prm_EndRequest(sender, args) {
            $('.wrapper').remove();
            Scroll();
        }
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

    <div class="panel panel-default panel-profile" align="center">
        <div class="panel-heading" style="background-image: url(Images/bg11.jpg); background-position:center; position: relative; height: 0; padding-bottom: 40%;"></div>
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
                    <asp:TextBox ID="txtPlayerId" runat="server" Text="" CssClass="form-control" placeholder="召唤师ID"></asp:TextBox>
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
                        <div class="row">
                            <div class="growl growl-static col-sm-offset-4" runat="server" id="divMsg">
                            <div class="alert alert-danger alert-dismissable m-r-md" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <asp:Label ID="lblMsg" runat="server" style="font-weight: bold;">暂无数据</asp:Label>
                            </div>
                        </div>
                        </div>
                        <div class="col-md-3" id="divLeft" runat="server">
                            <div class="panel panel-default panel-profile">
                                <div class="panel-heading" style="background-image: url(Images/bg7.jpg);"></div>
                                <div class="panel-body text-center">
                                    <asp:Repeater ID="gvPlayerProfile" runat="server" OnItemDataBound="gvPlayerProfile_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:Image ID="imgIcon" runat="server" ImageUrl='<%# Bind("icon") %>' CssClass="panel-profile-img" />
                                            <h5 class="panel-title" runat="server"></span> <%# Eval("player_id") %></h5>
                                            <p><span class="label label-success"><%# Eval("level") %></span> <span class="label label-primary"><%# Eval("fighting") %></span></p>
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
                        <div class="col-md-6" id="divMid" runat="server">
                            <ul class="media-list media-list-users list-group">
                                <asp:GridView ID="gvMatchList" runat="server" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" DataKeyNames="id" PageSize="8"
                                    AllowPaging="true" OnPageIndexChanging="gvMatchList_PageIndexChanging" OnRowDataBound="gvMatchList_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <a class="list-group-item showModal" style="cursor: pointer;">
                                                    <div class="media">
                                                        <div class="media-left media-middle">
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
                        <div class="col-md-3" id="divRight" runat="server">
                            <div>
                                <ul class="media-list media-list-users list-group">
                                    <asp:GridView ID="gvPlayedChamps" runat="server" ShowHeader="false" GridLines="None" AutoGenerateColumns="false"
                                        AllowPaging="true" OnPageIndexChanging="gvPlayedChamps_PageIndexChanging" EnableSortingAndPagingCallbacks="true" PageSize="8">
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
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">比赛详情</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h5 class="text-success">胜利方</h5>
                                        <ul class="media-list media-list-users list-group">
                                            <asp:Repeater runat="server" ID="gvMatchDetailsA">
                                                <ItemTemplate>
                                                    <a class="list-group-item" data-toggle="collapse" href='<%# "#a" + Eval("playerId") %>' id='<%# "linkA" + Eval("playerId") %>'
                                                        aria-expanded="false" aria-controls='<%# Eval("playerId") %>'>
                                                        <table class="table table-condensed borderless text-center table-mid">
                                                            <tr>
                                                                <th></th>
                                                                <th></th>
                                                                <th></th>
                                                                <th>经济</th>
                                                                <th>KDA</th>
                                                                <th>出装</th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Image class="media-object img-circle iconChamp" ID="imgChampIcon" runat="server" ImageUrl='<%# Bind("champIcon") %>' ToolTip='<%# Bind("champion_name_ch") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Image CssClass="img-circle iconItem" ID="spell1Icon" runat="server" ImageUrl='<%# Bind("firstSpellIcon") %>' />
                                                                    <asp:Image CssClass="img-circle iconItem" ID="spell2Icon" runat="server" ImageUrl='<%# Bind("secondSpellIcon") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPlayerId" runat="server" Text='<%# Bind("playerId") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hfMatchId" runat="server" Value='<%# Eval("matchId") %>' />
                                                                </td>
                                                                <td>
                                                                    <span class="label label-success"><%# Eval("gold") %></span>
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
                                                    </a>
                                                    <div class="collapse" id='<%# "a" + Eval("playerId") %>'>
                                                        <div class="well">
                                                            <div class="media">
                                                                <div class="media-body text-center">
                                                                    <p>
                                                                        <span>战局评分: </span>
                                                                        <span class="label label-success"><%# Eval("warScore") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>补刀: </span>
                                                                        <span class="label label-info"><%# Eval("lastHits") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>插眼/排眼: </span>
                                                                        <span class="label label-primary"><%# Eval("wards") %></span>
                                                                        <span class="label label-warning"><%# Eval("dewards") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>推塔/兵营: </span>
                                                                        <span class="label label-success"><%# Eval("towersDestroyed") %></span>
                                                                        <span class="label label-info"><%# Eval("barracksDestroyed") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>最大连杀/最大多杀: </span>
                                                                        <span class="label label-primary"><%# Eval("maxContKills") %></span>
                                                                        <span class="label label-warning"><%# Eval("maxMultiKills") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>最大暴击: </span>
                                                                        <span class="label label-danger"><%# Eval("maxCrit") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>总治疗: </span>
                                                                        <span class="label label-success"><%# Eval("totalHeal") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>输出伤害/承受伤害: </span>
                                                                        <span class="label label-primary"><%# Eval("totalDmg") %></span>
                                                                        <span class="label label-warning"><%# Eval("totalTank") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>对英雄总伤害: </span>
                                                                        <span class="label label-success"><%# Eval("totalHeroDmg") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>对英雄物理伤害/对英雄魔法伤害: </span>
                                                                        <span class="label label-danger"><%# Eval("totalHeroPhyDmg") %></span>
                                                                        <span class="label label-primary"><%# Eval("totalHeroMagicDmg") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>对英雄真实伤害: </span>
                                                                        <span class="label label-success"><%# Eval("totalHeroTrueDmg") %></span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6">
                                        <h5 class="text-danger">失败方</h5>
                                        <ul class="media-list media-list-users list-group">
                                            <asp:Repeater runat="server" ID="gvMatchDetailsB">
                                                <ItemTemplate>
                                                    <a class="list-group-item" data-toggle="collapse" href='<%# "#b" + Eval("playerId") %>' id='<%# "linkB" + Eval("playerId") %>'
                                                        aria-expanded="false" aria-controls='<%# Eval("playerId") %>'>
                                                        <table class="table table-condensed borderless text-center table-mid">
                                                            <tr>
                                                                <th></th>
                                                                <th></th>
                                                                <th></th>
                                                                <th>经济</th>
                                                                <th>KDA</th>
                                                                <th>出装</th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Image class="media-object img-circle iconChamp" ID="imgChampIcon" runat="server" ImageUrl='<%# Bind("champIcon") %>' ToolTip='<%# Bind("champion_name_ch") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Image CssClass="img-circle iconItem" ID="spell1Icon" runat="server" ImageUrl='<%# Bind("firstSpellIcon") %>' />
                                                                    <asp:Image CssClass="img-circle iconItem" ID="spell2Icon" runat="server" ImageUrl='<%# Bind("secondSpellIcon") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPlayerId" runat="server" Text='<%# Bind("playerId") %>'></asp:Label>
                                                                    <asp:HiddenField ID="hfMatchId" runat="server" Value='<%# Eval("matchId") %>' />
                                                                </td>
                                                                <td>
                                                                    <span class="label label-success"><%# Eval("gold") %></span>
                                                                </td>
                                                                <td>
                                                                    <span class="label label-primary"><%# Eval("KDA") %></span>
                                                                </td>
                                                                <td>
                                                                    <asp:GridView ID="gvItemsB" runat="server" AutoGenerateColumns="false" ShowHeader="false" BorderWidth="0px">
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
                                                    </a>
                                                    <div class="collapse" id='<%# "b" + Eval("playerId") %>'>
                                                        <div class="well">
                                                            <div class="media">
                                                                <div class="media-body text-center">
                                                                    <p>
                                                                        <span>战局评分: </span>
                                                                        <span class="label label-success"><%# Eval("warScore") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>补刀: </span>
                                                                        <span class="label label-info"><%# Eval("lastHits") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>插眼/排眼: </span>
                                                                        <span class="label label-primary"><%# Eval("wards") %></span>
                                                                        <span class="label label-warning"><%# Eval("dewards") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>推塔/兵营: </span>
                                                                        <span class="label label-success"><%# Eval("towersDestroyed") %></span>
                                                                        <span class="label label-info"><%# Eval("barracksDestroyed") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>最大连杀/最大多杀: </span>
                                                                        <span class="label label-primary"><%# Eval("maxContKills") %></span>
                                                                        <span class="label label-warning"><%# Eval("maxMultiKills") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>最大暴击: </span>
                                                                        <span class="label label-danger"><%# Eval("maxCrit") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>总治疗: </span>
                                                                        <span class="label label-success"><%# Eval("totalHeal") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>输出伤害/承受伤害: </span>
                                                                        <span class="label label-primary"><%# Eval("totalDmg") %></span>
                                                                        <span class="label label-warning"><%# Eval("totalTank") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>对英雄总伤害: </span>
                                                                        <span class="label label-success"><%# Eval("totalHeroDmg") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>对英雄物理伤害/对英雄魔法伤害: </span>
                                                                        <span class="label label-danger"><%# Eval("totalHeroPhyDmg") %></span>
                                                                        <span class="label label-primary"><%# Eval("totalHeroMagicDmg") %></span>
                                                                    </p>
                                                                    <p>
                                                                        <span>对英雄真实伤害: </span>
                                                                        <span class="label label-success"><%# Eval("totalHeroTrueDmg") %></span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div>
                                </div>
                        </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger-outline" data-dismiss="modal">关闭</button>
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
