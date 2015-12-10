<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Boxxx._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function showDetails() {
            jQuery.noConflict();
            $('#myModal').modal('show');
        }
        $(document).on('click', '[src*=plus]', function (e) {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999' style='text-align: center'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "Images/minus.png");
        });
        $(document).on('click', '[src*=minus]', function (e) {
            $(this).attr("src", "Images/plus.png");
            $(this).closest("tr").next().remove();
        });
        $(function () {

        });
        $(document).on('click', '.btnSubmit', function (e) {
        });
    </script>
    <div class="page-header">
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
    </div>
    <div class="container-fluid">
        <asp:UpdatePanel ID="upMain" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                <div class="panel panel-default panel-profile">
                    <div class="panel-heading" style="background-image: url(Images/bg.jpg);"></div>
                    <div class="panel-body text-center">
                        <asp:Repeater ID="gvPlayerProfile" runat="server" OnItemDataBound="gvPlayerProfile_ItemDataBound">
                            <ItemTemplate>
                                <asp:Image ID="imgIcon" runat="server" ImageUrl='<%# Bind("icon") %>' CssClass="panel-profile-img" />
                                <span class="badge" style="position: absolute; margin-top: -8px; margin-left: -10px;"><%# Eval("level") %></span>
                                <h5 class="panel-title" runat="server"><%# Eval("player_id") %></h5>
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
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-group">
                            <asp:Repeater ID="gvRankStat" runat="server" OnItemDataBound="gvRankStat_ItemDataBound">
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left" style="padding-left: 5px;">
                                                <asp:Image ID="imgIcon" runat="server" ImageUrl='<%# getRankIcon(Eval("rank").ToString()) %>' />
                                                <br />
                                                <span class="label label-primary"><%# Eval("rank") %></span>
                                                <span class="label label-success"><%# Eval("point") %></span>
                                            </div>
                                            <div class="media-body" style="padding: 10px 0px 0px 25px;">
                                                <table class="table borderless">
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
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <ul class="list-group">
                            <asp:Repeater ID="gvNormalStat" runat="server">
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <table class="table borderless">
                                            <tr>
                                                <th>模式</th>
                                                <th>场次</th>
                                                <th>胜率</th>
                                                <th>胜场</th>
                                                <th>负场</th>
                                            </tr>
                                            <tr>
                                                <td><strong><%# Eval("type") %></strong></td>
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
                    <div class="col-md-6">
                        <ul class="media-list media-list-users list-group">
                            <asp:Repeater ID="gvPlayedChamps" runat="server">
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <asp:Image class="media-object img-circle" ID="imgIcon" runat="server" ImageUrl='<%# Bind("icon") %>' />
                                            </div>
                                            <div class="media-body">
                                                <span class="label label-primary"><%# Eval("championNameCN") %></span>
                                                <span>场次</span>
                                                <span class="label label-primary"><%# Eval("matchStat") %></span>
                                                <span>胜率</span>
                                                <span class="label label-primary"><%# Eval("winRate") %></span>
                                                <span>场均战损</span>
                                                <span class="label label-primary"><%# Eval("averageKDARating") %></span>
                                                <span>场均杀死助</span>
                                                <span class="label label-primary"><%# Eval("averageKDA") %></span>
                                                <span>场均分钟输出</span>
                                                <span class="label label-primary"><%# Eval("averageDamage") %></span>
                                                <span>场均分钟经济</span>
                                                <span class="label label-primary"><%# Eval("averageEarn") %></span>
                                                <span>场均十分钟补兵</span>
                                                <span class="label label-primary"><%# Eval("averageMinionsKilled") %></span>
                                                <span>MVP次数</span>
                                                <span class="label label-primary"><%# Eval("totalMVP") %></span>
                                            </div>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <asp:GridView ID="gvMatchList" runat="server" CssClass="table table-condensed tableA" AutoGenerateColumns="false" DataKeyNames="id" Caption="最近比赛"
                    Style="border-right: transparent; border-left: transparent; border: transparent;" AllowPaging="True" PageSize="8" OnPageIndexChanging="gvMatchList_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="头像">
                            <ItemTemplate>
                                <asp:Image ID="imgIcon" runat="server" ImageUrl='<%# Bind("icon") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="champion_name_ch" HeaderText="英雄" />
                        <asp:BoundField DataField="status" HeaderText="胜/负" />
                        <asp:BoundField DataField="mode" HeaderText="模式" />
                        <asp:BoundField DataField="date" HeaderText="日期" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnMatchDetail" runat="server" Text="详细" OnClick="btnMatchDetail_Click" CssClass="btn btn-info" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdatePanel ID="upDetails" runat="server">
        <ContentTemplate>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <asp:Label ID="lblMsg2" Text="" runat="server" class="h4 modal-title"></asp:Label>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <asp:GridView ID="gvMatchHeader" runat="server" CssClass="table table-condensed tableA" AutoGenerateColumns="false"
                                    Style="border-right: transparent; border-left: transparent; border: transparent;">
                                    <Columns>
                                        <asp:BoundField DataField="mode" HeaderText="类型" />
                                        <asp:BoundField DataField="duration" HeaderText="时长" />
                                        <asp:BoundField DataField="endTime" HeaderText="结束" />
                                        <asp:BoundField DataField="kills" HeaderText="人头" />
                                        <asp:BoundField DataField="gold" HeaderText="金钱" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="container-fluid">
                                <asp:GridView ID="gvMatchDetailsA" runat="server" CssClass="table table-hover table-condensed tableA" 
                                    AutoGenerateColumns="false" DataKeyNames="matchId" OnRowDataBound="gvMatchDetailsA_RowDataBound" Caption="<span style='color:green;'>胜利</span>"
                                    Style="border-right: transparent; border-left: transparent; border: transparent;">
                                    <Columns>
                                        <asp:TemplateField HeaderText="召唤师">
                                            <ItemTemplate>
                                                <asp:Image ID="imgChampIcon" runat="server" ImageUrl='<%# Bind("champIcon") %>' ToolTip='<%# Bind("champion_name_ch") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid" style="text-align: left;">
                                                    <div class="row">
                                                        <asp:Label ID="lblPlayerId" runat="server" Text='<%# Bind("playerId") %>'></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Image ID="spell1Icon" runat="server" ImageUrl='<%# Bind("firstSpellIcon") %>' />
                                                        <asp:Image ID="spell2Icon" runat="server" ImageUrl='<%# Bind("secondSpellIcon") %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="KDA">
                                            <ItemTemplate>
                                                <asp:Label ID="lblKDA" runat="server" Text='<%# Bind("KDA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<span style='color:#FF5400;'>经济</span>/补刀">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <asp:Label ID="lblGold" runat="server" Text='<%# Bind("gold") %>' ForeColor="#ff5400"></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Label ID="lblLastHits" runat="server" Text='<%# Bind("lastHits") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<span style='color:#FF5400;'>插眼</span>/反眼">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <asp:Label ID="lblWards" runat="server" Text='<%# Bind("wards") %>' ForeColor="#ff5400"></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Label ID="lblDewards" runat="server" Text='<%# Bind("dewards") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="出装">
                                            <ItemTemplate>
                                                <div>
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
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="img" runat="server" Style="cursor: pointer" src="Images/plus.png" />
                                                <asp:Panel ID="pnlDetails" runat="server" Style="display: none">
                                                    <table class="table table-condensed tableB" style="border-right: transparent; border-left: transparent; border: transparent;">
                                                        <tr>
                                                            <td style="color: #D8A68B;">战局评分:</td>
                                                            <td colspan="3" style="color: #ff9900;">
                                                                <asp:Label ID="lblWarScore" runat="server" Text='<%# Bind("warScore") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: black;">推塔:</td>
                                                            <td>
                                                                <asp:Label ID="lblTowersDestroyed" runat="server" Text='<%# Bind("towersDestroyed") %>'></asp:Label>
                                                            </td>
                                                            <td>兵营:</td>
                                                            <td>
                                                                <asp:Label ID="lblBarracksDestroyed" runat="server" Text='<%# Bind("barracksDestroyed") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>最大连杀:</td>
                                                            <td>
                                                                <asp:Label ID="lblMaxContKills" runat="server" Text='<%# Bind("maxContKills") %>'></asp:Label>
                                                            </td>
                                                            <td>最大多杀:</td>
                                                            <td>
                                                                <asp:Label ID="lblMaxMultiKills" runat="server" Text='<%# Bind("maxMultiKills") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>最大暴击:</td>
                                                            <td>
                                                                <asp:Label ID="lblMaxCrit" runat="server" Text='<%# Bind("maxCrit") %>'></asp:Label>
                                                            </td>
                                                            <td>总治疗:</td>
                                                            <td>
                                                                <asp:Label ID="lblTotalHeal" runat="server" Text='<%# Bind("totalHeal") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>输出伤害:</td>
                                                            <td>
                                                                <asp:Label ID="lblTotalDmg" runat="server" Text='<%# Bind("totalDmg") %>'></asp:Label>
                                                            </td>
                                                            <td>承受敌害:</td>
                                                            <td>
                                                                <asp:Label ID="lblTotalTank" runat="server" Text='<%# Bind("totalTank") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄造成总伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroDmg" runat="server" Text='<%# Bind("totalHeroDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄的物理伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroPhyDmg" runat="server" Text='<%# Bind("totalHeroPhyDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄的魔法伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroMagicDmg" runat="server" Text='<%# Bind("totalHeroMagicDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄的真实伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroTrueDmg" runat="server" Text='<%# Bind("totalHeroTrueDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="container-fluid">
                                <asp:GridView ID="gvMatchDetailsB" runat="server" CssClass="table table-hover table-condensed tableA"
                                    AutoGenerateColumns="false" DataKeyNames="matchId" OnRowDataBound="gvMatchDetailsB_RowDataBound" Caption="<span style='color:red;'>失败</span>"
                                    Style="border-right: transparent; border-left: transparent; border: transparent;">
                                    <Columns>
                                        <asp:TemplateField HeaderText="召唤师">
                                            <ItemTemplate>
                                                <asp:Image ID="imgChampIcon" runat="server" ImageUrl='<%# Bind("champIcon") %>' ToolTip='<%# Bind("champion_name_ch") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid" style="text-align: left;">
                                                    <div class="row">
                                                        <asp:Label ID="lblPlayerId" runat="server" Text='<%# Bind("playerId") %>'></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Image ID="spell1Icon" runat="server" ImageUrl='<%# Bind("firstSpellIcon") %>' />
                                                        <asp:Image ID="spell2Icon" runat="server" ImageUrl='<%# Bind("secondSpellIcon") %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="KDA">
                                            <ItemTemplate>
                                                <asp:Label ID="lblKDA" runat="server" Text='<%# Bind("KDA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<span style='color:#FF5400;'>经济</span>/补刀">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <asp:Label ID="lblGold" runat="server" Text='<%# Bind("gold") %>' ForeColor="#ff5400"></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Label ID="lblLastHits" runat="server" Text='<%# Bind("lastHits") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<span style='color:#FF5400;'>插眼</span>/反眼">
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <asp:Label ID="lblWards" runat="server" Text='<%# Bind("wards") %>' ForeColor="#ff5400"></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Label ID="lblDewards" runat="server" Text='<%# Bind("dewards") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="出装">
                                            <ItemTemplate>
                                                <div>
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
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="img" runat="server" Style="cursor: pointer" src="Images/plus.png" />
                                                <asp:Panel ID="pnlDetails" runat="server" Style="display: none">
                                                    <table class="table table-condensed tableB" style="border-right: transparent; border-left: transparent; border: transparent;"">
                                                        <tr>
                                                            <td style="color: #D8A68B;">战局评分:</td>
                                                            <td colspan="3" style="color: #ff9900;">
                                                                <asp:Label ID="lblWarScore" runat="server" Text='<%# Bind("warScore") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: black;">推塔:</td>
                                                            <td>
                                                                <asp:Label ID="lblTowersDestroyed" runat="server" Text='<%# Bind("towersDestroyed") %>'></asp:Label>
                                                            </td>
                                                            <td>兵营:</td>
                                                            <td>
                                                                <asp:Label ID="lblBarracksDestroyed" runat="server" Text='<%# Bind("barracksDestroyed") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>最大连杀:</td>
                                                            <td>
                                                                <asp:Label ID="lblMaxContKills" runat="server" Text='<%# Bind("maxContKills") %>'></asp:Label>
                                                            </td>
                                                            <td>最大多杀:</td>
                                                            <td>
                                                                <asp:Label ID="lblMaxMultiKills" runat="server" Text='<%# Bind("maxMultiKills") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>最大暴击:</td>
                                                            <td>
                                                                <asp:Label ID="lblMaxCrit" runat="server" Text='<%# Bind("maxCrit") %>'></asp:Label>
                                                            </td>
                                                            <td>总治疗:</td>
                                                            <td>
                                                                <asp:Label ID="lblTotalHeal" runat="server" Text='<%# Bind("totalHeal") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>输出伤害:</td>
                                                            <td>
                                                                <asp:Label ID="lblTotalDmg" runat="server" Text='<%# Bind("totalDmg") %>'></asp:Label>
                                                            </td>
                                                            <td>承受敌害:</td>
                                                            <td>
                                                                <asp:Label ID="lblTotalTank" runat="server" Text='<%# Bind("totalTank") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄造成总伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroDmg" runat="server" Text='<%# Bind("totalHeroDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄的物理伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroPhyDmg" runat="server" Text='<%# Bind("totalHeroPhyDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄的魔法伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroMagicDmg" runat="server" Text='<%# Bind("totalHeroMagicDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>给对方英雄的真实伤害:</td>
                                                            <td colspan="3">
                                                                <asp:Label ID="lblTotalHeroTrueDmg" runat="server" Text='<%# Bind("totalHeroTrueDmg") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">
                                关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
