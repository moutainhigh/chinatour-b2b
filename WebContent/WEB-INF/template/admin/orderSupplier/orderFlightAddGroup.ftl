[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="[@spring.url '/resources/images/favicon.png'/]">

    <title>${message("admin.main.title")}</title>
[#include "/admin/include/head.ftl"]
</head>
<body>

<!-- Fixed navbar -->
[#include "/admin/include/navbar.ftl"]
<div id="cl-wrapper" class="fixed-menu">
[#include "/admin/include/sidebar.ftl"]

<div class="container-fluid" id="pcont">
	<div class="page-head">
		<h2>Billing(GROUP)</h2>
		<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li><a href="#">Tour</a></li>
		</ol>
	</div>
		<div class="cl-mcont">
	<div class="row">
		<div class="col-md-12">
			<div class="block-flat">
				<form action="saveGroup.jhtml" name="form1" id="form1" method="post"  onsubmit="return submitCheck();">
					<div class="header">
						<h3>${tour.tourCode}Flight Bill Audit</h3>
						<a class="btn pull-right " href="javascript:history.go(-1)" title="Back"><i class="fa fa-reply" ></i></a>
					</div>
					<div class="form-group">
						Airline：<input type="name" class="inputWidth80" name="supplierName"  style="width:150px;"/>
						Operator Fee：<input type="name" class="inputWidth80" name="supplierCost" id="hotelCost" />
						Amount：<input type="name" class="inputWidth80" name="supplierPrice" id="tourSumFee" />
						Booking No.：<input type="name" class="inputWidth80" name="numbering" id="oddNuberId" />
						Remark(Leg)：<input type="name" class="inputWidth80" name="remark"/>
						<input name="tourCode" type="hidden" id="tourCode" value="${tour.tourCode}"/>
						<input name="tourId"  type="hidden" id="tourId" value="${tour.tourId}" />
					</div>
					<div class="content">
						<table class="table table-bordered dataTable no-footer">
							<thead>
								<tr>
									<th>﻿Booking No.</th>
									<th class="text-center">No.</th>
									<th class="text-center">LastName</th>
									<th class="text-center">FirstName</th>
									<!-- <th class="text-center">MiddleName</th> -->
									<th class="text-center">Agent</th>
									<th width="10%" class="text-center">Amount</th>
									<th class="text-center">Count <input id="check-all" checked="checked" type="checkbox" name="checkall" /></th>
								</tr>
							</thead>
							<tbody class="">
							[#list customerList as customer]
								<tr id="trCss_${customer.state}_${customer_index}" class="tr_${customer.isDel}">
									<td style="width:5%;">${customer.orderNo}</td>
									<td class="text-center">${customer.customerCode}</td>
									<td class="text-center">${customer.lastName}</td>
									<td class="text-center">${customer.firstName}</td>
									<!-- <td class="text-center">${customer.middleName}</td> -->
									<td class="text-center">${customer.agent}</td>
									<td class="text-right"><input type="text" class="form-control" name="flightPriceInfoList[${customer_index}].flyReceivable" id="save_${customer_index}" value="0"/></td>
									<td class="text-center">
										<div class="item">
											<div>
												<input type="checkbox"[#if (customer.state==5)||(customer.state==6)||(customer.isDel==1)][#else] checked="checked"[/#if] class="icheck" id="planning_update_${customer_index}" name="${customer_index}" />
											</div>
										</div>
										<input type="hidden" value="[#if (customer.state!=5)||(customer.state!=6)]0[#else]1[/#if]" name="flightPriceInfoList[${customer_index}].isCalculate" id="planning_IsCalculate_${customer_index}"/>
										<input type="hidden" value="${customer.userId}" name="flightPriceInfoList[${customer_index}].userId" />
										<input type="hidden" value="${customer.customerId}" name="flightPriceInfoList[${customer_index}].customerId" />
										<input type="hidden" value="[#if (customer.state!=5)||(customer.state!=6)]0[#else]1[/#if]" name="flightPriceInfoList[${customer_index}].isDel">
										<input type="hidden" value="${customer.orderId}" name="flightPriceInfoList[${customer_index}].orderId" />
										<input type="hidden" value="${customer.customerCode}" name="flightPriceInfoList[${customer_index}].customerNo" />
									</td>
								</tr>
							[/#list]
							</tbody>
						</table>
					</div>
					<div class="spacer2 text-center">
						<button type="submit" class="btn btn-primary btn-flat ">Submit</button>
						<button type="button" onclick="javascript:history.go(-1)" class="btn btn-default">Cancel</button>
					</div>
				</from>
			</div>
			
		</div>
	</div>
</div>

[#include "/admin/include/foot.ftl"]
<script src="[@spring.url '/resources/js/basic/sumSupplierPrice.js'/]"></script>
</body>
</html>
