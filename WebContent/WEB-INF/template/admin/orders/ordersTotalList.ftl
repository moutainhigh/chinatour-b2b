[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="[@spring.url '/resources/images/favicon.png'/]">
    <title>Booking List</title>
[#include "/admin/include/head.ftl"]
</head>
<body>

<!-- Fixed navbar -->
[#include "/admin/include/navbar.ftl"]
<div id="cl-wrapper" class="fixed-menu">
[#include "/admin/include/sidebar.ftl"] 
    <div class="container-fluid" id="pcont">
        <div class="page-head">
            <h2>Booking List</h2>
            	<!--没有联谊admin:nexusholidays权限的人-->
            	[@shiro.lacksPermission name = "admin:nexusholidays"]
            		 <div class="new"><button class="btn btn-success" type="button" id="New" onclick="location.href='add.jhtml'">&nbsp;&nbsp;New &nbsp;&nbsp;</button></div>
				[/@shiro.lacksPermission]
				<!--
				[@shiro.hasPermission name = "admin:nexusholidays"]
					<button id="importCustomerButton" type="button" data-modal="customerImportForm" class="btn btn-success btn-flat md-trigger" style="display:none;">Change Agent</button>
           		[/@shiro.hasPermission]
				-->
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">Booking</a></li>
                <div style="display:none;"><a class="btn btn-success btn-flat md-trigger" type="hidden" id="alertFormButton" data-modal="form-primary">&nbsp;&nbsp;New &nbsp;&nbsp;</a></div>
            </ol>
        </div>
        <div class="cl-mcont">
            <div class="row">
                <div class="col-md-12">
                    <div class="block-flat">
						<div class="header">
							<h4 class="filter-bar"><i class="fa fa-filter"></i> Filter</h4>
							<!--模拟点击弹出框按钮-->
							<a href="javascript:void(0);" class="md-trigger" data-modal="form-primary" id="triggerId"></a>
							<div id="filter_btn" class="pull-right pull-cursor" title="Filter">
								&nbsp;&nbsp;<i id="filter" class="fa fa-caret-square-o-down fa-lg color-blue"></i>&nbsp;&nbsp;
							</div>
							<div class="options" style="margin:10px; padding:5px 0;">
								<div class="nav-panel">
									<div  class="nav-block">
										<div  class="block-head">
											<span  class="nav-title">Settlement Status</span>:
										</div>
										<div  class="block-body default-4-line">
											<div  class="params-cont"> 
												<a style="cursor:pointer;"  target="_self"  class=" param-item" > 
													<span  class="unchecked"  name="taxSpan" checked="false" onclick="change(this,0);">Unsettled</span> 
												</a>
												<a style="cursor:pointer;"  target="_self"  class=" param-item " > 
													<span  class="unchecked" name="taxSpan" checked="false" onclick="change(this,3);" >Settling</span> 
												</a> 
												<a style="cursor:pointer;"  target="_self"  class=" param-item " > 
													<span  class="unchecked" name="taxSpan" checked="false" onclick="change(this,4);" >Settled</span> 
												</a> 
												<input type="hidden" id="taxSpan"/>
											</div>
										</div>
									</div>
									<div  class="nav-block">
										<div  class="block-head">
											<span  class="nav-title">R/W</span>:
										</div>
										<div  class="block-body default-4-line">
											<div  class="params-cont"> 
												<a style="cursor:pointer;"  target="_self"  class=" param-item " > 
													<span  class="unchecked" name="wrSpan" checked="false" onclick="change(this,'Retail');" >Retail</span> 
												</a> 
												<a style="cursor:pointer;"  target="_self"  class=" param-item " > 
													<span  class="unchecked" name="wrSpan" checked="false" onclick="change(this,'WholeSale');" >WholeSale</span> 
												</a> 
												<input type="hidden" id="wrSpan"/>
											</div>
										</div>
									</div>
									<div class="nav-block">
										<div class="block-head">
											<span class="nav-title">Search:</span>
										</div>
										<div class="block-body default-2-line">
											<div class="params-cont"> 
												<input type="text" size="14" id="search_orderNumber" placeholder="booking No..." />
												<!-- <input type="text" size="14" id="search_totalPeople" placeholder="totalPeople..." /> -->
												<input type="text" size="14" id="search_company" placeholder="company..." />
												<input type="text" size="14" id="search_contactor" placeholder="contacts..." />
												<!-- <input type="text" size="14" id="search_customerSource" placeholder="customerSource..." /> -->
												<input type="text" size="14" id="search_agent" placeholder="agent..." />
											</div>
										</div>
									</div>
									<div class="nav-block">
										<div class="block-head">
											<span class="nav-title">Booking Time</span>:
										</div>
										<div class="block-body default-4-line pull-cursor">
											<div class="params-cont">
												<input type="text" id="search_beginningDate" size="14"  placeholder="Beginning Date." />
												<input type="text" id="search_endingDate" size="14"  placeholder="Ending Date." />
												&nbsp;<i id="clearDate" class="fa fa-rotate-left" title="Clear Date"></i>
											</div>
										</div>
									</div>
									<div class="nav-block">
										<div class="block-head">
											<span class="nav-title">Settlement Date</span>:
										</div>
										<div class="block-body default-4-line pull-cursor">
											<div class="params-cont">
												<input type="text" id="search_settlementDateBeg" size="14"  placeholder="Beginning Date." />
												<input type="text" id="search_settlementDateEnd" size="14"  placeholder="Ending Date." />
												&nbsp;<i id="clearDate1" class="fa fa-rotate-left" title="Clear Date"></i>
											</div>
										</div>
									</div>
								</div>
								
								<div class="nav-panel">
									<div class="btn-cont">
										<input class="submit-btn" type="submit" id="subId" value="Search">
									</div>
								</div>
							</div>
						</div>
                        <div class="content">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="datatable2">
                                    <thead>
	                                    <tr>
	                                        <th width="10%">Booking No.</th>
	                                        <th width="10%">R/W</th>
	                                        <th width="10%">Booking Time</th>
	                                        <th width="5%">Total Passenger</th>
	                                        <th width="15%">Company</th>
	                                        <th width="10%">Contacts</th>
	                                        <th width="13%">Amount Receivable</th>
	                                        <th width="5%">Settlement Status</th>
	                                        <th width="10%">Agent</th>
	                                        <th width="12%">Action</th>
	                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4><i class="fa fa-warning"></i>Warning !</h4>

                    <p>Data will be permanently deleted ?</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <a href="#" class="btn btn-danger">Yes</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="md-modal colored-header custom-width md-effect-9" id="form-primary" style="width:50%;">
    <div class="md-content">
      <div class="modal-header">
        <h3>Logo</h3>
        <button type="button" class="close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
	     <div class="modal-body form">
	      <form action="createInvoiceToPdf.jhtml" style="border-radius: 0px;" method="post">
	    		<div class="text-center">
	    			<div>
		    			<label>
							<div id="checked" class="iradio_square-blue" style="position: relative;" aria-checked="false" aria-disabled="false">
								<input class="icheck" type="radio" checked="checked" name="logo" value="resources/images/nexus-logo.png"
									style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;">
									</ins>
							</div>
							<img style="width:100px;height:40px;" src="[@spring.url '/resources/images/nexus-logo.png'/]"/> &nbsp;&nbsp;
						</label>
						<label class="radio-inline">
							<div class="iradio_square-blue" style="position: relative;" aria-checked="false" aria-disabled="false">
								<input class="icheck" type="radio" name="logo" value="resources/images/chinatour-logo.png"
									style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;">
									</ins>
							</div>
							<img style="width:50px;height:50px;" src="[@spring.url '/resources/images/chinatour-logo.png'/]"/> &nbsp;&nbsp;
						</label>
						<label class="radio-inline">
							<div class="iradio_square-blue" style="position: relative;" aria-checked="false" aria-disabled="false">
								<input class="icheck" type="radio" name="logo" value="resources/images/echinatours-logo.png"
									style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;">
									</ins>
							</div>
							<img style="width:100px;height:40px;" src="[@spring.url '/resources/images/echinatours-logo.png'/]"/> &nbsp;&nbsp;
						</label>
						
					</div>
					<br>
					<div>	
						<label class="radio-inline">
							<div class="iradio_square-blue" style="position: relative;" aria-checked="false" aria-disabled="false">
								<input class="icheck" type="radio" name="logo" value="resources/images/wenjing-logo.png"
									style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;">
									</ins>
							</div>
							<img style="width:100px;height:50px;" src="[@spring.url '/resources/images/wenjing-logo.png'/]"/> &nbsp;&nbsp;
						</label>
						<label class="radio-inline">
							<div class="iradio_square-blue" style="position: relative;" aria-checked="false" aria-disabled="false">
								<input class="icheck" type="radio" name="logo" value="resources/images/wenjing-logo-old.png"
									style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;">
									</ins>
							</div>
							<img style="width:100px;height:50px;" src="[@spring.url '/resources/images/wenjing-logo-old.png'/]"/> &nbsp;&nbsp;
						</label>
						<label class="radio-inline">
							<div class="iradio_square-blue" style="position: relative;" aria-checked="false" aria-disabled="false">
								<input class="icheck" type="radio" name="logo" value="resources/images/logo_vancouver.jpg"
									style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;">
									</ins>
							</div>
							<img style="width:100px;height:50px;" src="[@spring.url '/resources/images/logo_vancouver.jpg'/]"/> &nbsp;&nbsp;
						</label>
					</div>
					<input type="hidden" id="orderTotalId" name="totalId">
					<input type="hidden" id="menuId" name="menuId" value="302">
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-default btn-flat md-close" data-dismiss="modal">Cancel</button>
			        <button type="submit" class="btn btn-primary btn-flat md-close" data-dismiss="modal">OK</button>
		    	</div>
	    	</form>
	    	</div>
   </div>
</div>
<div class="md-modal colored-header custom-width md-effect-9" id="customerImportForm" style="width:40%;">
    <div class="md-content" >
      <div class="modal-header">
      	<h3>Change Sales</h3>
        <button type="button" class="close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
      <div class="text-center">
			<table style="padding:10px;border: 0px none" width="100%">
				<tbody>
					<tr>
						<td  style="width:140px">
							<span>
								User Name:
							</span>
						</td>
						<td>
							<select id="agentId"  class="select2">
								<option value="">Select----</option>
								[#list agentList as agent]
									<option value="${agent.id}">${agent.username}---${agent.deptName}</option>
								[/#list]
							</select>
							<input type="hidden" id="orderTotalIdChange" >
						</td>
				</tbody>
			</table>
        </div>
      <div class="modal-footer">
		   <button class="btn btn-default btn-flat md-close" data-dismiss="modal" type="button">Cancel</button>
		   <button class="btn btn-primary btn-flat md-close" type="button" onclick="changeUser()">Ok</button>
	  </div>
    </div>
</div>
<div class="md-overlay"></div>
[#include "/admin/include/foot.ftl"]
<script type="text/javascript">
    $(document).ready(function () {
        //initialize the javascript
       [@flash_message /]
        App.init();
        
        //$("#checked").attr("aria-checked","true");
        $("#datatable2").attr("width","100%");
        
        /*
         * Initialse DataTables, with no sorting on the 'details' column
         */
        var oTable = $('#datatable2').dataTable({
            "processing": true,
            "serverSide": true,
            "bFilter":false,
            "bSort":false,
            "aLengthMenu":[20,40,80,100],
            "ajax": {
                url: "[@spring.url '/admin/orders/ordersTotalList.jhtml'/]",
                type: "POST",
                "data": function ( d ) {
	                d.orderNumber = $("#search_orderNumber").val();
	                //d.wr = $("#search_wr").val();
	                d.beginningDate = $("#search_beginningDate").val();
	                d.endingDate = $("#search_endingDate").val();
	                d.company = $("#search_company").val();
	                d.contactName = $("#search_contact").val();
	                d.agent = $("#search_agent").val();
	                d.settlementDateBeg = $("#search_settlementDateBeg").val();
	                d.settlementDateEnd = $("#search_settlementDateEnd").val();
	                d.wr=$("#wrSpan").val();
	                d.tax = $("#taxSpan").val();
            	}
            },
            "columns": [
                { "data": "orderNumber" },
                { "data": "wr" },
                { "data": "bookingDate" },
                { "data": "totalPeople" ,"class": "text-right"},
                { "data": "company" },
                { "data": "contactName" },
                { "data": "sumFee","class": "text-right" },
                { "data": "tax",
					"render" : function(data, type, row) {
					  	switch(data){
					  		case 0 : return '<i title="Unsettled" class="fa fa-times"></i>';
					  		case 2 : return '<i title="Settled Not Sent 0.05Invoice" class="fa fa-check"></i>'; 
					  		case 3 : return '<i title="Settling" class="fa fa-clock-o"></i>';
					  		case 4 : return '<i title="Settled And Sent 0.05Invoice" class="fa fa-check"></i>'; 
					  		default: return ''; 
					  	}
					}
                },
                { "data": "agent" },
                { "data": "ordersTotalId" }
            ],
            "columnDefs" : [ {
				"render" : function(data, type, row) {
					var condition = '<li><a data-href="del.jhtml?id='+data+'" data-toggle="modal" data-target="#confirm-delete"><i class="fa fa-times"></i>Cancle</a></li>';
					return '<div class="btn-group"><button class="btn btn-default btn-xs" type="button" onclick="edit(\''+data+'\')"><i class="fa fa-pencil"></i>Edit</a></button><button data-toggle="dropdown" class="btn btn-xs btn-primary dropdown-toggle" type="button"><span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button><ul role="menu" class="dropdown-menu pull-right">'
					+'<li class="invoice" onclick="alertForm(this)"><input type="hidden" value='+data+'><a href="javascript:void(0);"><i class="fa fa-eye"></i>Invoice</a></li>'
					+'<li><a href="${base}/admin/payCostRecords/settlementOrdersTotal.jhtml?ordersTotalId='+row.ordersTotalId+'&userId='+row.userId+'" target="_blank"><i class="fa fa-print"></i>Print Settlement</a></li>'
					//+'<li><a href="javascript:void(0)" onclick="changeSales(\''+data+'\')"><i class="fa fa-pencil"></i>Change Sales</a></li>'
					+'<li class="divider"></li>'
					+'</ul></div>';
                 },
				"targets" : 9
		    }],
			"fnRowCallback": function( nRow, aData, iDisplayIndex ) { 
				if(aData.ordersTotalId==null){
					$('td:eq(0)', nRow).html("Total");
					$('td:eq(9)', nRow).html("");
					$(nRow).attr("class","tfoot");
				}
			},
        });
        
        $('#confirm-delete').on('show.bs.modal', function (e) {
            $(this).find('.btn-danger').attr('href', $(e.relatedTarget).data('href'));
        });
        
        $("div.options").hide();//默认隐藏 筛选 div
        
        $("#filter_btn").click(function(){
			$("div.options").slideToggle("slow");
			var _slide=$("#filter");
			if(_slide.attr('class')=="fa fa-caret-square-o-up fa-lg color-blue"){
				_slide.removeClass("fa fa-caret-square-o-up fa-lg color-blue").addClass("fa fa-caret-square-o-down fa-lg color-blue");
			}else{
				_slide.removeClass("fa fa-caret-square-o-down fa-lg color-blue").addClass("fa fa-caret-square-o-up fa-lg color-blue");
			}
		});
		
		$("#clearDate").click(function(){
			$("#search_beginningDate").val('');
 			$("#search_endingDate").val('');
		});
		
		$("#clearDate1").click(function(){
			$("#search_settlementDateBeg").val('');
 			$("#search_settlementDateEnd").val('');
		});
		
		$("#search_beginningDate").datepicker({dateFormat: 'yy-mm-dd',changeYear: true,changeMonth: true,yearRange: '2000:2050'});
		$("#search_endingDate").datepicker({dateFormat: 'yy-mm-dd',changeYear: true,changeMonth: true,yearRange: '2000:2050'});
		$("#search_settlementDateBeg").datepicker({dateFormat: 'yy-mm-dd',changeYear: true,changeMonth: true,yearRange: '2000:2050'});
		$("#search_settlementDateEnd").datepicker({dateFormat: 'yy-mm-dd',changeYear: true,changeMonth: true,yearRange: '2000:2050'});
		
		
		$("#subId").on( 'click', function () {
        	$('#datatable2').DataTable().draw();
        	//$("div.options").slideToggle("slow");
        	//$("#filter").removeClass("fa fa-angle-up").addClass("fa fa-angle-down");
    	});
    });
    
    function alertForm(object){
    	$("#alertFormButton").click();
    	totalId = $(object).find("input").val();
    	$("#orderTotalId").attr("value",totalId);
    }
    
    function edit(id){
    	window.location.href = "[@spring.url '/admin/orders/edit.jhtml?menuId=302&ordersTotalId='/]" +id;
    }
    
	var obj={
	 	colorSpan:"",
	};
	function change(span,value)
	{
		//给所以span的属性初始化
	    $('span[name="'+$(span).attr('name')+'"]').each(function(){
	             if(this.checked&&this!=span)
	          {
	                this.className="unchecked";
	                this.checked=false;
	          }               
	    });
	    //判断是否有选中   是 初始化取消加粗   否加粗
	  	if(span.checked&&span.className=="checked"){
		    span.className="unchecked";
		    span.checked=false;
		    $("#"+$(span).attr('name')+"").val("");
	  	}else{
	  		obj[$(span).attr('name')]=span.innerHTML;
		    span.className="checked";
		    span.checked=true;
		    $("#"+$(span).attr('name')+"").val(value);
	  	}
	}
	
	function changeSales(ordersTotalId){ 
		$("#importCustomerButton").click();
		$("#orderTotalIdChange").val(ordersTotalId);
	}
	
	function changeUser(){
		var userId=$("#agentId").val();
		var orderTotalId = $("#orderTotalIdChange").val();
		if(userId == '' || userId==undefined){
			alert("Please Select Sales");
			return;
		}else{
			$.post("changeUserT.jhtml",{"ordersTotalId" : orderTotalId,"userId":userId},function(result){
				
				if(result="success"){
					window.location.reload();
				}else{
					alert("Change sales failed");
				}
			});
		}
		
	}
</script>
</body>
</html>
