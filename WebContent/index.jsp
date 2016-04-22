<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%String jspath = request.getContextPath();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<Meta http-equiv="Content-Type" Content="text/html; Charset=UTF-8">
<title>12306登录</title>
<style type="text/css">
.clearfix:after {
	clear: both;
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
}

.lay-sear-yp {
	height: 40px;
	margin-top: 10px;
}

.lay-sear {
	background: none repeat scroll 0 0 #EEF1F8;
	border: 1px solid #298CCE;
	border-radius: 3px;
	font-size: 14px;
	height: 40px;
	margin: 10px 0 10px;
	padding: 7px 0;
	position: relative;
}

.clearfix {
	display: block;
}

.inp-txt {
	background: none repeat scroll 0 0 #FFFFFF;
	border: 1px solid #CFCDC7;
	color: #999999;
	height: 35px;
	line-height: 18px;
	padding: 5px 0 5px 5px;
	width: 193px;
}

.btn122s {
	width: 122px;
	background-position: 0 0;
	color: #FFFFFF;
	height: 30px;
	line-height: 30px;
	background: url("./images/bg_btn.png") repeat-x scroll 0 0
		rgba(0, 0, 0, 0);
	border-radius: 4px;
	color: #333333;
	display: inline-block;
	text-align: center;
	text-decoration: none;
	color: white;
}

.t-list {
	border: 1px solid #298cce;
}

.mt10 {
	margin-top: 10px;
}

table {
	table-layout: fixed;
	word-wrap: break-word;
	margin-top: 0;
	background: url(./images/bg_tlisthd.png) top repeat-x;
	border-collapse: collapse;
	border-spacing: 0;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

.t-list th {
	height: 52px;
	background: url(./images/line_tlisth.png) right center no-repeat;
	color: #fff;
	overflow: hidden;
}

.t-list td {
	border-right: 1px solid #b0cedd;
	border-top: 1px solid #b0cedd;
	color: #999;
	height: 36px;
	padding: 2px 0;
	text-align: center;
}

div.dhx_modal_cover {
	border: currentColor;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	_height: 0;
	_overflow: hidden;
	position: fixed;
	filter: alpha(opacity = 50);
	opacity: .5;
	z-index: 19999;
	cursor: default;
	zoom: 1;
	background-color: rgba(0, 0, 0, 0.09);
}

.sear-sel-bd {
	border: 1px solid #3391d0;
	height: 44px;
	overflow: hidden;
	position: relative;
	padding: 3px 0;
}
.div-inline{ 
display:inline
} 
.div-font{
font-size : 0.8em;
color : #F79209;
margin-left: 10px;
}
</style>

<script language="javascript" src="<%=jspath%>/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script language="javascript" src="<%=jspath%>/js/station_name.js" type="text/javascript"></script>
<script language="javascript" src="<%=jspath%>/js/favorite_name.js" type="text/javascript"></script>
<script language="javascript" src="<%=jspath%>/js/city_name.js" type="text/javascript"></script>


<script type="text/javascript" src="./js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="./js/station_name.js"></script>
<link type="text/css" href="./js/station.css" rel="stylesheet" >
<script type="text/javascript" src="./js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function getdate() {
		var now = new Date()
		y = now.getFullYear()
		m = now.getMonth() + 1
		d = now.getDate()
		m = m < 10 ? "0" + m : m
		d = d < 10 ? "0" + d : d
		return y + "-" + m + "-" + d
	}
	function enddate() {
		var endDate = new Date();
		endDate.setDate(endDate.getDate() + 19);
		y = endDate.getFullYear()
		m = endDate.getMonth() + 1
		d = endDate.getDate()
		m = m < 10 ? "0" + m : m
		d = d < 10 ? "0" + d : d
		return y + "-" + m + "-" + d
	}
	$(document).ready(
			function() {
				$('#train_start_date').click(function() {
					WdatePicker({
						doubleCalendar : true,
						dateFmt : 'yyyy-MM-dd',
						minDate : getdate(),
						maxDate : enddate()
					});
				});
				$('#train_start_date').val(getdate());
				var listTableWidth = $('#listTable').width();
				$('#floatTable').width(listTableWidth);
				$(window).resize(function() { //窗口改变大小事件
					var listTableWidth = $('#listTable').width();
					$('#floatTable').width(listTableWidth);
				});
				$(window).scroll(
						function() { //鼠标滚轮事件
							var listTableWidth = $('#listTable').width();
							$('#floatTable').width(listTableWidth);
							var scrollPos;
							if (window.pageYOffset) {
								scrollPos = window.pageYOffset;
							} else if (document.compatMode
									&& document.compatMode != 'BackCompat') {
								scrollPos = document.documentElement.scrollTop;
							} else if (document.body) {
								scrollPos = document.body.scrollTop;
							}
							if (scrollPos > 155) {
								$('#floatTable').css('display', 'block');
							} else {
								$('#floatTable').css('display', 'none');
							}
						});
			})
	function searchTrain(type) {
		var fromStationText = $('#fromStationText').val(); //出发地
		var toStationText = $('#toStationText').val(); //目的地
		var train_start_date = $('#train_start_date').val(); //出发日
		if (fromStationText == '') {
			alert("出发地不能为空!");
			$('#fromStationText').focus();
			return;
		}
		if (toStationText == '') {
			alert('目的地不能为空!');
			$('#toStationText').focus();
			return;
		}
		if (train_start_date == '') {
			alert('出发日不能为空!');
			$('#train_start_date').focus();
			return;
		}
		if (station_names.indexOf(fromStationText) < 0) {
			alert("请 输入正确的出发地!");
			$('#fromStationText').focus();
			$('#fromStationText').select();
			return;
		}
		if (station_names.indexOf(toStationText) < 0) {
			alert("请输入正确的目的地!");
			$('#toStationText').focus();
			$('#toStationText').select();
			return;
		}
		fromStationText = station_names.substring(station_names.indexOf("|"
				+ fromStationText + "|")
				+ fromStationText.length + 2, station_names.length);
		fromStationText = fromStationText.substring(0, fromStationText
				.indexOf('|'));
		toStationText = station_names.substring(station_names.indexOf("|"
				+ toStationText + "|")
				+ toStationText.length + 2, station_names.length);
		toStationText = toStationText.substring(0, toStationText.indexOf('|'));
		$
				.ajax({
					type : 'post',
					url : './searchTrain.do?from_station=' + fromStationText
							+ '&to_station=' + toStationText
							+ '&queryDate=' + train_start_date
							+ "&purpose_codes=" + type,
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
					dataType : 'json',
					onbeforeunload : $('.dhx_modal_cover').css('display',
							'block'),
					success : function(json) {
						$('.dhx_modal_cover').css('display', 'none');
						var tbody = document.getElementById('tbody');
						var tbodyLength = tbody.rows.length;
						for (var i = 0; i < tbodyLength; i++) {
							tbody.deleteRow(0);
						}
						if (json == null) {
							alert("网络连接异常,请稍后重试!");
							return;
						}
						var message = json.data.message;
						if (message != undefined) {
							alert(message);
							return;
						} else {
							var count = json.data.datas.length;
							document.getElementById('title_div').innerHTML = $(
									'#fromStationText').val()
									+ " ->"
									+ $('#toStationText').val()
									+ "("
									+ json.data.searchDate
									+ ")共计"
									+ count
									+ "个车次";
							for (var i = count - 1; i > -1; i--) {
								var newRow = tbody.insertRow();
								newRow.id = "tr_" + i;
								document.getElementById("tr_" + i).onmouseover = function() {
									this.style.backgroundColor = "#eef1f8";
								};
								document.getElementById("tr_" + i).onmouseout = function() {
									this.style.backgroundColor = "";
								};
								var cell0 = newRow.insertCell(0); //车次
								cell0.innerHTML = "<a style='font-size: 16px;color: #333;text-decoration: underline;font-weight: 700;' >"
										+ json.data.datas[i].station_train_code
										+ "</a>";
								var cell1 = newRow.insertCell(1); //出发站
								cell1.innerHTML = json.data.datas[i].start_station_name;
								var cell2 = newRow.insertCell(2); //到达站
								cell2.innerHTML = json.data.datas[i].end_station_name;
								var cell3 = newRow.insertCell(3); //出发时间
								cell3.innerHTML = json.data.datas[i].start_time;
								var cell4 = newRow.insertCell(4); //到达时间
								cell4.innerHTML = json.data.datas[i].arrive_time;
								var cell5 = newRow.insertCell(5);
								cell5.innerHTML = "-";
								var cell6 = newRow.insertCell(6); //商务座
								cell6.innerHTML = json.data.datas[i].swz_num;
								var cell7 = newRow.insertCell(7); //特等座
								cell7.innerHTML = json.data.datas[i].tz_num;
								var cell8 = newRow.insertCell(8); //一等座
								cell8.innerHTML = json.data.datas[i].zy_num;
								var cell9 = newRow.insertCell(9); //二等座
								cell9.innerHTML = json.data.datas[i].ze_num;
								var cell10 = newRow.insertCell(10); //高级软卧
								cell10.innerHTML = json.data.datas[i].gr_num;
								var cell11 = newRow.insertCell(11); //软卧
								cell11.innerHTML = json.data.datas[i].rw_num;
								var cell12 = newRow.insertCell(12); //硬卧
								cell12.innerHTML = json.data.datas[i].yw_num;
								var cell13 = newRow.insertCell(13); //软座
								cell13.innerHTML = json.data.datas[i].rz_num;
								var cell14 = newRow.insertCell(14); //硬座
								cell14.innerHTML = json.data.datas[i].yz_num;
								var cell15 = newRow.insertCell(15); //无座
								cell15.innerHTML = json.data.datas[i].wz_num;
								var cell16 = newRow.insertCell(16); //其它
								cell16.innerHTML = json.data.datas[i].qt_num;
								var cell17 = newRow.insertCell(17); //其它
								cell17.innerHTML = "-";
							}
						}
					}
				})
	}
</script>
</head>
<body >
	<div>
		<div class="div-inline">
			<div class="div-inline" style="width: 30%" >
				<a href="http://www.12306.cn/"><img alt=""
					src="./images/12306_logo.png"> </a>
				</div>
				<div class="div-inline div-font" style="width: 70%">
					
					<span class="div-inline" style="color: #666666"><span>意见反馈:<a
							class="cursor colorA" href="mailto:12306yjfk@rails.com.cn">12306yjfk@rails.com.cn</a>
							您好，请
					</span> <a id="login_user" href="/otn/login/init" class="colorA"
						style="margin-left: -0.5px;" >登录</a> | <a id="regist_out"
						href="/otn/regist/init">注册</a> </span>
				</div>
				<div class="div-inline div-font">
						<a href="/otn/appDownload/init" target="true">手机版</a>
					</div>
					<div class="div-inline div-font">
						<a href="/otn/index/initMy12306" class="menu-bd" id="js-my">我的12306<b></b>
						</a>
						<div class="div-inline div-font" style="display: none; ">
							<b></b>
							<ul>
								<li><a href="/otn/queryOrder/initNoComplete">未完成订单</a></li>
								<li><a href="/otn/queryOrder/init">已完成订单(改/退)</a></li>
								<li class="line"></li>
								<li><a href="/otn/insurance/init">我的保险</a></li>
								<li class="line"></li>
								<li><a href="/otn/modifyUser/initQueryUserInfo">查看个人信息</a>
								</li>
								<li><a href="/otn/userSecurity/init">账户安全</a></li>
								<li class="line"></li>
								<li><a href="/otn/passengers/init">常用联系人</a></li>
								<li class="line"></li>
								<li><a href="/otn/icentre/qxyyInfo">重点旅客预约</a></li>
								<li><a href="/otn/icentre/lostInfo">遗失物品查找</a></li>
								<li><a href="/otn/icentre/serviceQuery">服务查询</a></li>
								<li class="line"></li>
								<li><a href="/otn/advice/complaintInfo">投诉</a></li>
								<li><a href="/otn/advice/adviceInfo">建议</a></li>
							</ul>
						</div>
			</div>
		</div>
	</div>
	<div class="lay-sear lay-sear-yp clearfix" style="text-align: center;">
		<span>*</span>出发地：<input name="fromStation" id="fromStation" type="hidden" />
		<input name="fromStationText" maxlength="15" value="简码/汉字" id="fromStationText" style="width:100px;" class="input_20txt_gray" type="text" />
		<span>*</span>目的地：<input name="toStation" id="toStation" type="hidden" />
		<input name="toStationText" maxlength="15" value="简码/汉字" id="toStationText" style="width:100px;" class="input_20txt_gray" type="text" />
		 出发日： <input type="text" value="2016-4-11"
			class="input_20txt_gray" id="train_start_date" maxlength="15">&nbsp;&nbsp;
		<a shape="rect" class="btn122s" href="javascript:void(0);"
			onclick="searchTrain('ADULT')"><font color="#ffffff">查询</font></a>&nbsp;&nbsp; <a shape="rect"
			class="btn122s" href="javascript:void(0);"
			onclick="searchTrain('0X00')"><font color="#ffffff">查询学生票</font></a>
	</div>
	<div class="sear-sel-bd" id="sear-sel-bd" style="height: 44px;">
		<!--展开式高度设置为272px，合拢时为72px,一行行高为34，可计算下-->
		<div
			style=" width: 100px; height: 18px; line-height: 18px; padding: 2px 0; float: left; text-align: right; font-weight: 700; font-size: 0.9em">车次类型：</div>
		<input type="checkbox" class="div-font"/>GC-高铁/城际 <input type="checkbox" />D-动车 <input
			type="checkbox" />Z-直达 <input type="checkbox" />T-特快 <input
			type="checkbox" />K-快速 <input type="checkbox" />其他 车次：<input
			type="text" style="width: 100px;" />
	</div>
	<div style="width: 100%" id="title_div"></div>
	<div id="floatTable" class="t-list"
		style="top: 0px; position: fixed; display: none;">
		<table width="100%">
			<thead>
				<tr style="text-align: center ; font-size: 0.8em">
					<th>车次</th>
					<th>出发站<br>到达站</th>
					<th>出发时间<br>到达时间</th>
					<th>历时</th>
					<th>商务座</th>
					<th>特等座</th>
					<th>一等座</th>
					<th>二等座</th>
					<th>高级软卧</th>
					<th>软卧</th>
					<th>硬卧</th>
					<th>软座</th>
					<th>硬座</th>
					<th>无座</th>
					<th>其它</th>
					<th>备注</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="t-list  mt10">
		<table width="100%" id="listTable">
			<thead>
				<tr style="text-align: center;font-size: 0.8em">
					<th>车次</th>
					<th>出发站<br>到达站</th>
					<th>出发时间<br>到达时间</th>
					<th>历时</th>
					<th>商务座</th>
					<th>特等座</th>
					<th>一等座</th>
					<th>二等座</th>
					<th>高级软卧</th>
					<th>软卧</th>
					<th>硬卧</th>
					<th>软座</th>
					<th>硬座</th>
					<th>无座</th>
					<th>其它</th>
					<th>备注</th>
				</tr>
			</thead>
			<tbody id="tbody" style="text-align: center;"></tbody>
		</table>
	</div>
	<!-- 遮罩 -->
	<div class="dhx_modal_cover" style="display: none; text-align: center margin-top: 20dp;">
		<img alt="" src="./images/loading.gif" style="margin-top: 240px;">
	</div>
</body>
</table>
</html>
