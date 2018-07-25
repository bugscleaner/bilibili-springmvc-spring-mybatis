<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>屄哩屄哩-我的订单</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/dingdancss/css/wenjuan_ht.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/css/jiazaitoubu.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/css/css.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/css/center.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/city/city.css"
	type="text/css" />

<!-- <script src="<%=request.getContextPath()%>/static/User_Data_Update/"></script> -->
<script
	src="<%=request.getContextPath()%>/static/User_Data_Update/js/jquery-1.8.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/static/User_Data_Update/js/index2.js"></script>
<script
	src="<%=request.getContextPath()%>/static/User_Data_Update/js/index2.js"></script>


</head>
<body>
	<div class="top" id="wyqtb">
		<!--热门搜索-->

		<!--导航-->
		<div class="dao_hang" style="background-color: #6C89B2;">


			<!--结束-->
			<div class="dao_list">
				<a href="index.do">首页</a> <a href="javascript:return false;">视频收藏</a> <a href="javascript:return false;">周边</a>
				<a href="javascript:return false;">小黑屋</a>
			</div>
		</div>
	</div>
	<!-- 	<script>
window.onload=function(){
	$(".aside").css({display:"none"})
	$(".important").mouseenter(function(){
		$(".aside").css({display:"block"})
		}).mouseleave(function(){
			$(".aside").css({display:"none"})
			})
	}
</script> -->
	<!--当前位置-->
	<div class="now_positionm">
		<span>当前位置：</span><a href="index.do">首页></a><a
			href="user_full_information.do">个人中心</a>
	</div>
	<!--centers-->
	<div class="centers_m">
		<!--清除浮动-->
		<div class="clear_sm"></div>
		<!--left-->
		<div class="centers_ml">
			<!--头像-->
			<div class="center_header">
				<a href="user_full_information.do"><img
					src="<%=request.getContextPath()%><%=request.getSession().getAttribute("userHand")%>" /></a>
				<em>您好，<font><%=request.getSession().getAttribute("userName")%></font></em>
				<font style="color: red; font-size: 11px;">(下方可修改资料~喵)</font>
			</div>
			<!--列表go-->
			<div class="centers_listm">
				<div class="centers_listm_one">
					<img
						src="<%=request.getContextPath()%>/static/User_Data_Update/images/zshy.png" />
					<em>会员中心</em>
				</div>
				<!--一条开始-->
				<div class="centers_listm_one_in">
					<img
						src="<%=request.getContextPath()%>/static/User_Data_Update/images/shezhi.png" />
					<em>资料管理</em> <b></b>
				</div>
				<span class="gjszmdm"> <a href="information.do"
					class="center_in_self"><font>信息资料</font></a> <a href="bank_card.do"
					class="center_in_self"><font>银行卡管理</font></a> <a
					href="delivery_address.do" class="center_in_self"><font>收货地址管理</font></a>
				</span>
				<!--一条开始-->
				<div class="centers_listm_one_in">
					<img
						src="<%=request.getContextPath()%>/static/User_Data_Update/images/ddgl.png" />
					<em>订单管理</em> <b></b>
				</div>
				<span class="gjszmdm"> <a href="order.do" class="center_in_self"><font>我的订单</font></a>
					<a href="DeletOrder" class="center_in_self"><font>已删除订单</font></a> <a
					href="javascript:return false;" class="center_in_self"><font>订单投诉</font></a>
				</span>

			</div>
			<script type="text/javascript">
				$(
						function() {//第一步都得写这个
							$(".centers_listm_one_in").click(
									function() {
										$(this).next(".gjszmdm").slideToggle()
												.siblings("gjszmdm").slideUp()
									});
						})
			</script>
		</div>
		<!--一条开始-->
		<div class="public_m1">
			<div class="public_m2">用户全部所有订单</div>
			<!--提示信息-->
			<div class="tip_notem">
				<ul>
					<!-- <li>1.请牢记支付密码</li>
					<li>2.如果丢失密码，可以通过绑定的手机或邮箱找到</li> -->
				</ul>
			</div>
			<div class="public_m4">

				<c:forEach items="${orderTable}" var="orderTable">

					<!-- 判断是否是删除过的订单 -->
					<c:choose>
						<c:when test="${orderTable.orderstate=='0'}">
						
						</c:when>
						
						
						<c:otherwise>
							<!-- 订单界面 -->
							<div class=" all_660" style="margin-left: 1%">
								<div class="yd_box">
									<div class="movie_box">
										<ul class="wjdc_list">
											<div class='kzqy_czbut'>
												<c:choose>
												<c:when test="${orderTable.orderstate=='1'}">
													
													<a href='cancellationoforder.do?orderid=${orderTable.orderid}' onClick="return confirm('联系客服说明情况')" class='xy'>取消订单</a>
												</c:when>
													<c:when test="${orderTable.orderstate=='2'}">
														<a href='confirmorder.do?orderid=${orderTable.orderid}'
															onClick="return confirm('是否确认收货?')" class='sy'>确认收货</a>
													<a href='cancellationoforder.do?orderid=${orderTable.orderid}' onClick="return confirm('联系客服说明情况')" class='xy'>取消订单</a>
													<a href='#' onClick="return confirm('请打开QQ?')" class='bianji'>联系客服</a>
													</c:when>
												</c:choose>
													<c:choose>
													<c:when test="${orderTable.orderstate=='3'}">
													<a href='#' onClick="return confirm('请打开QQ?')" class='bianji'>联系客服</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${orderTable.orderstate=='4'}">
														<a href='deletorder.do?orderid=${orderTable.orderid}' onClick="return confirm('是否删除此订单?')"
															class='del'>删除</a>
															
													<a href='cancellationoforder.do?orderid=${orderTable.orderid}' onClick="return confirm('联系客服说明情况')" class='xy'>取消订单</a>
													
													</c:when>
												</c:choose>
											</div>
											<li>
												<div class="tm_btitlt">
													<i class="btwenzi">订单日期:&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														${orderTable.ordertime}</i>
												</div>
											</li>
											<li>
												订单ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${orderTable.orderid}
											</li>
											<li>
												商品名字:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${orderTable.orderigridsname}

											</li>
											<li>
												购买者:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${orderTable.orderusername}
											</li>
											<li>
												购买价:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${orderTable.orderzongrmb}
											</li>
											<li>
												收货地址:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${orderTable.orderaddr}
											</li>
											<li><b style="color: red">订单状态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<c:choose>
														<c:when test="${orderTable.orderstate=='1'}">已下单</c:when>
														<c:when test="${orderTable.orderstate=='2'}">已发货</c:when>
														<c:when test="${orderTable.orderstate=='3'}">待取消</c:when>
														<c:when test="${orderTable.orderstate=='4'}">订单完成 -(可删除)</c:when>
														<%--      <c:otherwise>
         									订单完成
         						</c:otherwise>
         			 --%>
													</c:choose> <%-- ${orderTable.orderstate} --%>
											</b></li>
										</ul>
										<div class="dx_box" data-t="0"></div>
									</div>
									<br>
						</c:otherwise>

					</c:choose>


				</c:forEach>

				<a href="user_full_information.do" class="public_m3">返回主信息</a>
			</div>
		</div>




		<script>
			$(document).ready(function(e) {

				//鼠标移上去显示按钮
				$(".movie_box").hover(function() {
					/* var	html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='sy'>确认收货</a><a href='javascript:void(0)'  class='xy'>取消订单</a><a href='javascript:void(0)'  class='bianji'>联系客服</a><a href='javascript:void(0)' class='del' >删除</a></div>"  */
					$(this).css({
						"border" : "1px solid #0099ff"
					});
					$(this).children(".wjdc_list").after(html_cz);
				}, function() {
					$(this).css({
						"border" : "1px solid #fff"
					});
					$(this).children(".kzqy_czbut").remove();
					//$(this).children(".dx_box").hide(); 
				});

			});
		</script>
</body>
</html>