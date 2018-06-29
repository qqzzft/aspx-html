<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmFormSuppliesInfoLY.aspx.cs"
  Inherits="DirFolder_frmFormSuppliesInfoLY" %>

<%@ Register Src="../UserContorl/UserContorl1.ascx" TagName="UC1" TagPrefix="uc1" %>
<%@ Register Src="../UserContorl/UserContorl2.ascx" TagName="UC2" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>坚实的开了房间是老款的积分</title>
  <link href="../css/style.css" rel="stylesheet" type="text/css" />
  <script src="../Include/DatePicker/WdatePicker.js" type="text/javascript"></script>
  <script src="../Include/Common.js" type="text/javascript"></script>
  <script src="../Dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
  <script src="../Dialog/iframeTools.source.js" type="text/javascript"></script>
</head>
<body>
  <style>
  .input_btn2 {
    background: url("../Images/bg_button2.jpg");
    padding-left: 2px;
    padding-right: 2px;
    padding-top: 3px;
    padding-bottom: 0px;
    font-size: 1.1em;
    height: 26px;
    width: 99px;
    color: #174B73;
    cursor: pointer;
    border: 0;
    font-weight: bold;
    font-family: "宋体"
  }
  </style>
  <script>
    function test(id) {
      var p = document.getEnvironmentbyId('id');
      if (p != null) p.innerxml = 'text';
    }
  </script>
  <form id="form1" runat="server">
    <div>
      <table width="1100" border="0" align="center">
        <tr>
          <td align="center" class="FormTitle">
            <asp:Label ID="lblTitle" runat="server" /></td>
        </tr>
        <tr>
          <td>
            <table cellspacing="2" width="100%" border="0">
              <tr style="height: 25px;">
                <td width="25%">
                  <b>当前处理状态: &nbsp;<asp:Label ID="aspStatus" runat="server"></asp:Label></b></td>
                <td width="25%">
                  <b>当前处理人: &nbsp;<asp:Label ID="aspUserName" runat="server"></asp:Label></b></td>
                <td align="right" width="25%">
                  <b>日期: &nbsp;<asp:Label ID="aspDate" runat="server"></asp:Label></b></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <table class="dgTbl" cellspacing="0" cellpadding="1" rules="all" border="1" width="100%" align="center">
              <tr>
                <td class="rpF" width="15%">
                  <span style="color: red">*</span>标&nbsp; 题</td>
                <td align="left" colspan="3">
                  <asp:TextBox ID="aspTitle" runat="server" MaxLength="200" CssClass="input_text" Width="98%">办公用品申领表</asp:TextBox></td>
              </tr>

              <tr>
                <td class="rpF" width="15%">部门
                </td>
                <td align="left" width="35%">
                  <asp:Label ID="aspNiGaoDeptName" runat="server" MaxLength="50" Width="50%"></asp:Label></td>
                <td class="rpF" width="15%">&nbsp;申请人
                </td>
                <td align="left" width="35%">
                  <asp:Label ID="aspNiGaoUserName" runat="server" MaxLength="50" Width="50%"></asp:Label></td>
              </tr>
              <tr align="center" width="100%">
                <td colspan="4">
                  <asp:Button runat="server" ID="btnShow" Text="显示已有用品" CssClass="input_btn2" OnClick="btnShow_Click" />
                  <asp:Button runat="server" ID="btnHide" Text="隐藏已有用品" CssClass="input_btn2" OnClick="btnHide_Click" Visible="false" />
                  <%if((Convert.ToInt32(this.CurID)==2||Convert.ToInt32(this.CurID)==4||Convert.ToInt32(this.CurID)==5||Convert.ToInt32(this.CurID)==6||Convert.ToInt32(this.CurID)==7||Convert.ToInt32(this.CurID)==8||Convert.ToInt32(this.CurID)==9)&& this.PageEditType==2){%>
                &nbsp;&nbsp;<input id="ibtnHenJi" onclick="SelectHenJi()" type="button" value="审核痕迹" class="input_btn" />
                  <%}%>
                </td>
              </tr>
              <tr id="History" runat="server" visible="false">
                <td colspan="4" align="center">
                  <div style="height: 180px; overflow-y: auto; overflow-x: hidden">
                    <table class="dgTbl" cellspacing="0" cellpadding="1" rules="all" border="1" width="100%">
                      <asp:Repeater ID="rpList1" runat="server">
                        <HeaderTemplate>
                          <tr>
                            <td colspan="10" style="height:23px" align="center"><h4>已有非消耗用品</h4></td>
                          </tr>
                          <tr class="rpH">
                            <td width="10%" align="center">用品名称</td>
                            <td width="12%" align="center">品牌型号</td>
                            <td width= "5%" align="center">数量</td>
                            <td width= "5%" align="center">单位</td>
                            <td width="10%" align="center">申领人</td>
                            <td width="10%" align="center">使用人</td>
                            <td width="10%" align="center">方式</td>
                            <td width= "8%" align="center">取得时间</td>
                            <td width="22%" align="center">备注</td>
                            <td width= "6%" align="center">使用状况</td>
                            <td style="width:2%; border:none; background:none; background-color:none"></td>
                          </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                          <tr class="rpI">
                            <td align= "left" >&nbsp;<%#Eval("FIXEDName")%></td>
                            <td align= "left" >&nbsp;<%#Eval("GuiGe")%></td>
                            <td align="center"><%#Eval("SNumber")%></td>
                            <td align="center"><%#Eval("ACUNITCODE")%></td>
                            <td align="center">【<%#Eval("DeptName")%>】<%#Eval("username")%></td>
                            <td align="center"><%#Eval("ShiYongR")%></td>
                            <td align="center"><%#Eval("getway")%></td>
                            <td align="center"><%#Eval("GetDate1","{0: yyyy-MM-dd}").Replace('/','-')%></td>
                            <td align= "left" >&nbsp;<%#Eval("remark")%></td>
                            <td align="center"><%#GetShiYongZK(Eval("islock").ToString())%></td>
                            <td style="width:2%; border:none; background:none"></td>
                          </tr>
                        </ItemTemplate>
                      </asp:Repeater>
                    </table>
                    <table class="dgTbl" cellspacing="0" cellpadding="1" rules="all" border="1" width="100%">
                      <asp:Repeater ID="rpList2" runat="server">
                        <HeaderTemplate>
                          <tr>
                            <td colspan="10" style="height:23px" align="center"><h4>用品申请记录</h4></td>
                          </tr>
                          <tr class="trheader">
                            <td width="10%" align="center">用品名称</td>
                            <td width="12%" align="center">品牌型号</td>
                            <td width= "5%" align="center">数量</td>
                            <td style="width:2%; border:none; background:none; background-color:none"></td>
                          </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                          <tr class="rpI">
                            <td align= "left" >&nbsp;<%#DataBinder.Eval(Container.DataItem, "SuppliesName")%></td>
                            <td align= "left" >&nbsp;<%#DataBinder.Eval(Container.DataItem, "GuiGe")%></td>
                            <td align="center"><%#DataBinder.Eval(Container.DataItem, "SNumber")%></td>
                            <td align="center"><%#DataBinder.Eval(Container.DataItem, "ACUNITCODE")%></td>
                            <td align="center"><%#Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ISCONSUMABLE"))==1?"是":"否" %></td>
                            <td align="center"><%#DataBinder.Eval(Container.DataItem, "shDeptName")%></td>
                            <td align="center"><%#DataBinder.Eval(Container.DataItem, "shusername")%></td>
                            <td align="center"><%#DataBinder.Eval(Container.DataItem, "ShiYongR")%></td>
                            <td align="center"><%#Eval("lydate","{0: yyyy-MM-dd}").Replace('/','-')%></td>
                            <td align= "left" >&nbsp;<%#DataBinder.Eval(Container.DataItem, "remark")%></td>
                            <td style="width:2%; border:none; background:none"></td>
                          </tr>
                        </ItemTemplate>
                      </asp:Repeater>
                    </table>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="4">
                  <table class="dgTbl" cellspacing="0" cellpadding="1" rules="all" border="1" width="100%" align="center">
                    <tr>
                      <td style="height: 35px" align="center" colspan="6">
                        <h4>快圣诞节福利卡进来</h4>
                      </td>
                    </tr>
                  </table>
                  <div style="width: 100%">
                    <div style="text-align: center;">
                      <asp:PlaceHolder ID="phAddDetail" runat="server" Visible="false">
                        <input id="ibtnAdd" onclick="SelectLY()" type="button" value="添加" class="input_btn" />
                      </asp:PlaceHolder>
                    </div>
                  </div>
                  <div style="margin-left: auto; overflow: auto; width: 100%; margin-right: auto; max-height: 300px">
                    <table class="dgTbl" cellspacing="0" cellpadding="1" rules="all" width="100%" align="center"
                      border="1">
                      <tr class="rpH">
                        <td width="3%">序号</td>
                        <td width="10%">用品名称</td>
                        <td width="10%">品牌型号</td>
                        <%if(Convert.ToInt32(this.CurID)>=2||Convert.ToInt32(this.CurID)==0){%>
                        <td width="8%">审核数量</td>
                        <%}%>

                        if<%if((Convert.ToInt32(this.CurID)==5||Convert.ToInt32(this.CurID)==6||Convert.ToInt32(this.CurID)==7||Convert.ToInt32(this.CurID)==8||Convert.ToInt32(this.CurID)==9||Convert.ToInt32(this.CurID)==99)&& this.PageEditType==2){%>
                        <td width="8%">库存</td>
                        <%}%>
                        <%=User.Name%>
                        <td width="11%">使用人</td>
                        <td width="28%">备注说明</td>
                        <%if(this.CurID=="99"&& this.PageEditType==2){ %>
                        <td width="8%">资产编号</td>
                        <td>添加资<br />
                          产编号</td>
                        <%}%>
                        <%if(this.CurID=="1"&& (this.PageEditType==1||this.PageEditType==2)){ %>
                        <td width="10%"></td>
                        <%} %>
                        <%if((Convert.ToInt32(this.CurID)==2||Convert.ToInt32(this.CurID)==4||Convert.ToInt32(this.CurID)==5||Convert.ToInt32(this.CurID)==6||Convert.ToInt32(this.CurID)==7||Convert.ToInt32(this.CurID)==8||Convert.ToInt32(this.CurID)==9)&& this.PageEditType==2){%>
                        <td width="10%">审核</td>
                        <%}%>
                      </tr>

                      <asp:Repeater ID="rpList" runat="server" OnItemCommand="rpList_ItemCommand">
                        <ItemTemplate>
                          <tr class="rpI">
                            <td><%=++Index %></td>
                            <%if (this.CurID == "1" && (this.PageEditType == 1 || this.PageEditType == 2))
                              { %>
                            <td>
                              <a href="#" onclick="AddEdit('<%# DataBinder.Eval(Container.DataItem,"ID")%>')" style="cursor: pointer;"><%# DataBinder.Eval(Container.DataItem,"SUPPLIESNAME")%>&nbsp;</a>
                            </td>
                            <%}
                            else
                            { %>
                            <td><%# DataBinder.Eval(Container.DataItem,"SUPPLIESNAME")%>&nbsp;</td>
                            <%} %>
                            <%abc.def%>
                            <td><%# DataBinder.Eval(Container.DataItem,"GuiGe")%>&nbsp;</td>
                            <td><%# DataBinder.Eval(Container.DataItem,"SNUMBER")%>&nbsp;</td>
                            <td><%# DataBinder.Eval(Container.DataItem,"ACUNITCODE")%>&nbsp;</td>
                            <%if (Convert.ToInt32(this.CurID) >= 2 || Convert.ToInt32(this.CurID) == 0)
                              {%>
                            <td><%# GetShengHe(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"SHNUMBER")),Convert.ToInt32(DataBinder.Eval(Container.DataItem,"SHNUMBER")))%>&nbsp;</td>
                            <%}%>

                            <%if ((Convert.ToInt32(this.CurID) == 5 || Convert.ToInt32(this.CurID) == 6 || Convert.ToInt32(this.CurID) == 7 || Convert.ToInt32(this.CurID) == 8 || Convert.ToInt32(this.CurID) == 9 || Convert.ToInt32(this.CurID) == 99) && this.PageEditType == 2)
                              {%>
                            <td><%# GetKuCun(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SHNUMBER") == DBNull.Value ? 0 : DataBinder.Eval(Container.DataItem, "SHNUMBER")), Convert.ToInt32(DataBinder.Eval(Container.DataItem, "SUPPLIESNUMBER") == DBNull.Value ? 0 : DataBinder.Eval(Container.DataItem,"SUPPLIESNUMBER")))%>&nbsp;</td>
                            <%}%>

                            <td><%# GetShiYongRUrl(DataBinder.Eval(Container.DataItem,"ShiYongR").ToString())%>&nbsp;</td>

                            <td align="left">&nbsp;<%# DataBinder.Eval(Container.DataItem,"Remark")%></td>
                            <%if (this.CurID == "99" && this.PageEditType == 2)
                            { %>
                            <td><%# DataBinder.Eval(Container.DataItem,"kpno")%>&nbsp;</td>
                            <%}%>
                            <%if (this.CurID == "1" && (this.PageEditType == 1 || this.PageEditType == 2))
                              { %>
                            <td>
                              <asp:LinkButton ID="lbtnDel" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID")%>' CommandName="del">删除</asp:LinkButton>
                            </td>
                            <%} %>
                            <%if ((Convert.ToInt32(this.CurID) == 2 || Convert.ToInt32(this.CurID) == 4 || Convert.ToInt32(this.CurID) == 5 || Convert.ToInt32(this.CurID) == 6 || Convert.ToInt32(this.CurID) == 7 || Convert.ToInt32(this.CurID) == 8 || Convert.ToInt32(this.CurID) == 9) && this.PageEditType == 2)
                              {%>
                            <td align="left">
                              <a href="#" onclick="AuditEdit('<%# DataBinder.Eval(Container.DataItem,"ID")%>')" style="cursor: pointer;">编辑&nbsp;</a>
                            </td>
                            <%}%>

                            <%if (this.CurID == "99" && this.PageEditType == 2)
                            { %>
                            <td><a href="#" onclick="AddEditKpNo('<%# DataBinder.Eval(Container.DataItem,"ID")%>')" style="cursor: pointer;">添加&nbsp;</a></td>
                            <% }%>
                          </tr>
                        </ItemTemplate>
                      </asp:Repeater>
                      <tr>
                        <td colspan="14" style="line-height: 25px">&nbsp;&nbsp;&nbsp;&nbsp;温馨提示：当申请胜多负少的时，只有申请数手动阀手动法的时，才会分配是打发斯蒂芬名下。
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
              </tr>
              <tr style="display: none">
                <td class="rpF">&nbsp;备注说明
                </td>
                <td id="Td7" align="left" colspan="3" runat="server">
                  <asp:TextBox ID="aspRemark" runat="server" MaxLength="200" CssClass="input_text" Width="98%"></asp:TextBox></td>
              </tr>
              <tr runat="server" id="trVerify">
                <td class="rpF"><span style="color: red">*</span>发放核对</td>
                <td align="left" colspan="3">
                  <asp:TextBox ID="aspVerify" runat="server" MaxLength="200" CssClass="input_text" Width="98%"></asp:TextBox></td>
              </tr>
              <tr>
                <td colspan="6">
                  <uc1:UC1 ID="aspUC1Info" runat="server" />
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align="center" style="height: 40px; vertical-align: middle;" colspan="6">
            <asp:Button runat="server" ID="btnPrintCustom" Text="打印页面" CssClass="input_btn" />
            <asp:Button runat="server" ID="btnEnd" Text="归  档" CssClass="input_btn" OnClick="btnEnd_Click" />
            <asp:Button runat="server" ID="btnGetBack" Text="收  回" CssClass="input_btn" OnClick="btnGetBack_Click" Visible="false" />
            <asp:Button runat="server" ID="btnExit" Text="退  出" CssClass="input_btn" />
          </td>
        </tr>
      </table>
    </div>

    <!--圣诞节开发记录速度快解放-->
    <div style="display: none">
      <!--数据库两地分居埃里克的-->
      <asp:Label runat="server" ID="aspUnitID" />
      <%--是看得见放辣椒水电费；就--%>
      <asp:Label runat="server" ID="aspFlowID" />
      <uc1:UC2 ID="UC21" runat="server" />
      <asp:TextBox ID="txtIndex" runat="server"></asp:TextBox>
      <asp:Button ID="btnRefresh" runat="server" Text="" OnClick="btnRefresh_Click"></asp:Button>
    </div>
  </form>
  <script type="text/javascript">
    function SelectLY() {
      var url = '../DirFolder/frmPage6.aspx?FlowID=<%=this.FlowID%>';
      art.dialog.open(url, {
        id: 'SelectLY',
        title: '选择用品',
        width: '80%',
        height: '100%',
        lock: true,
        esc: false,
        close: function () {
          document.getElementById('<%= btnRefresh.ClientID %>').click();
        }
      }, false);
    }

    function AddEdit(value) {
      var url = '../DirFolder/frmPage5.aspx?FlowID=<%=this.FlowID%>&ID=' + value + '&type=edit';
      art.dialog.open(url, {
        id: 'AddEdit',
        title: '阿斯蒂芬斯蒂芬',
        width: '80%',
        height: '100%',
        lock: true,
        esc: false,
        close: function () {
          document.getElementById('<%= btnRefresh.ClientID %>').click();
        }
      }, false);
    }

    function AlreadySupplies(value) {
      var url = '../DirFolder/frmPage4.aspx?&ID=' + value;
      art.dialog.open(url, {
        id: 'AlreadySupplies',
        title: '阿斯顿发大水发',
        width: '80%',
        height: '100%',
        lock: true,
        esc: false,
        close: function () {
        }
      }, false);
    }

    function SelectHenJi(value) {
      var url = '../DirFolder/frmPage3.aspx?flowid=<%=this.FlowID %>'
      art.dialog.open(url, {
        id: 'SelectHenJi',
        title: '阿斯顿发送到',
        width: '800px',
        height: '500px',
        lock: true,
        esc: false,
        close: function () {
          document.getElementById('<%= btnRefresh.ClientID %>').click();
        }
      }, false);
    }

    function AuditEdit(value) {
      var url = '../DirFolder/frmPage2.aspx?flowid=<%=this.FlowID %>&ID=' + value;
      art.dialog.open(url, {
        id: 'AuditEdit',
        title: '阿士大夫撒旦',
        width: '80%',
        height: '100%',
        lock: true,
        esc: false,
        close: function () {
          document.getElementById('<%= btnRefresh.ClientID %>').click();
        }
      }, false);
    }
    //frmPage1.aspx
    function AddEditKpNo(value) {
      var url = '../DirFolder/frmPage1.aspx?&ID=' + value;
      art.dialog.open(url, {
        id: 'AddReflesh',
        title: '水电水电费费',
        width: '100%',
        height: '100%',
        lock: true,
        esc: false,
        close: function () {
          document.getElementById('<%= btnRefresh.ClientID %>').click();
        }
      }, false);
    }
  </script>
</body>
</html>
