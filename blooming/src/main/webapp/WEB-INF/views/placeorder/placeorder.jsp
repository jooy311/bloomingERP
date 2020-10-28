<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<div class="container">
<div class="block-header">

<h2>발주관리</h2>
<hr>


<div class="card">
    <div class="card-header">
    
		<div role="tabpanel">
			<ul class="tab-nav" role="tablist" tabindex="1" style="overflow: hidden; outline: none;">
			      <li class="active"><a href="#placerorderList" aria-controls="placerorderList" role="tab" data-toggle="tab" aria-expanded="true">발주 목록</a></li>
			      <li class=""><a href="#placerorderdata" aria-controls="placerorderdata" role="tab" data-toggle="tab" aria-expanded="false">발주 확인 목록</a></li>
			      <li class=""><a href="#placerorderUpload" aria-controls="placerorderUpload" role="tab" data-toggle="tab" aria-expanded="false">발주 등록</a></li>
			</ul>
		</div>
		
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="placerorderList">
				<%--
				<div class="row">
					<div class="row">
						<div class="col-25">
							<label for="clt_name" class="label-pre">발주상품</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="발주상품으로 검색가능합니다">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-25">
							<label for="clt_phone" class="label-pre">발주날짜</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="발주날짜로 검색가능합니다">
							</div>
						</div>
					</div>
				</div>
				--%>
				
				<div class="table-responsive">
					<table id="data-table-basic" class="table table-striped" aria-busy="false">
					    <thead>
					        <tr>
					            <th data-column-id="id" data-type="numeric">발주번호</th>
					            <th data-column-id="sender">주문번호</th>
					            <th data-column-id="sender1">사원번호</th>
					            <th data-column-id="sender2">거래처번호</th>
					            <th data-column-id="sender3">발주상품</th>
					            <th data-column-id="sender4">발주수량</th>
					            <th data-column-id="sender5">발주단가</th>
					            <th data-column-id="sender6">발주날짜</th>
					            <th data-column-id="sender7">발주상태</th>
					            <th data-column-id="sender8">결제처리여부</th>
					        </tr>
					    </thead>
					    
					    <tbody>
					    
					    	<c:choose>
								<c:when test="${empty(placeorderList)}">
									<tr align="center">
										<td colspan="10">검색된 발주 정보가 없습니다.</td>				
									</tr>
								</c:when>
								
								<c:otherwise>
							    	<c:forEach var="placeorder" items="${placeorderList}">
							    		<tr>
							    			<td>${placeorder.poNo}</td>
							    			<td>${placeorder.poOrderNo}</td>
							    			<td>${placeorder.poEmpNo}</td>
							    			<td>${placeorder.poCltNo}</td>
							    			<td>${placeorder.poProduct}</td>
							    			<td>${placeorder.poCnt}</td>
							    			<td>${placeorder.poPrice}</td>
							    			<td>${placeorder.poDate}</td>
							    			<td>${placeorder.poStatus}</td>
							    			<td>${placeorder.poPermit}</td>
							    		</tr>
							    	</c:forEach>
							    </c:otherwise>
							</c:choose>
					    </tbody>
					</table>
				</div>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="placerorderdata">
			
				<div class="table-responsive">
					<table id="data-table-command" class="table table-striped table-vmiddle" aria-busy="false">
					    <thead>
					        <tr>
					            <th data-column-id="id" data-type="numeric">발주번호</th>
					            <th data-column-id="sender">주문번호</th>
					            <th data-column-id="sender1">사원번호</th>
					            <th data-column-id="sender2">거래처번호</th>
					            <th data-column-id="sender3">발주상품</th>
					            <th data-column-id="sender4">발주수량</th>
					            <th data-column-id="sender5">발주단가</th>
					            <th data-column-id="sender6">발주날짜</th>
					            <th data-column-id="sender7">발주상태</th>
					            <th data-column-id="sender8">결제처리여부</th>
					            <th data-column-id="commands" data-formatter="commands" data-sortable="false">수정</th>
					        </tr>
					    </thead>
					    
					    <tbody>
					    	<c:choose>
								<c:when test="${empty(placeorderList)}">
									<tr align="center">
										<td colspan="11">검색된 발주 정보가 없습니다.</td>				
									</tr>
								</c:when>
								
								<c:otherwise>
							    	<c:forEach var="placeorder" items="${placeorderList}">
							    		<tr>
							    			<td>${placeorder.poNo}</td>
							    			<td>${placeorder.poOrderNo}</td>
							    			<td>${placeorder.poEmpNo}</td>
							    			<td>${placeorder.poCltNo}</td>
							    			<td>${placeorder.poProduct}</td>
							    			<td>${placeorder.poCnt}</td>
							    			<td>${placeorder.poPrice}</td>
							    			<td>${placeorder.poDate}</td>
							    			<td>${placeorder.poStatus}</td>
							    			<td>${placeorder.poPermit}</td>
							    			<td>
								    			<%-- <button type="button" class="btn btn-icon command-edit" data-row-id="${placeorder.poNo}" onclick="location.href='${pageContext.request.contextPath}/placeorder/ploUpdate?poNo=${placeorder.poNo}';"><span class="md md-edit"></span></button> --%>
								    			<button type="button" class="btn btn-icon command-edit" data-row-id="0" onclick="location.href='${pageContext.request.contextPath}/placeorder/poUpdate?poNo=${placeorder.poNo}';"><span class="md md-edit"></span></button>
								    		</td>
							    		</tr>
							    	</c:forEach>
							    </c:otherwise>
							</c:choose>
					    </tbody>
					</table>
				</div>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="placerorderUpload">
				
				<div class="container1">
					<form action="placeorder" method="post">
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_phone" class="label-pre">주문번호</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="주문번호를 입력해주세요" name="poOrderNo" id="poOrderNo" required  readonly="readonly">
							</div>
						</div>
						
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalOr" id="oderModalBtn">주문검색</button>
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">사원번호</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="hidden" class="form-control input-sm" placeholder="사원번호를 입력해주세요" name="poEmpNo" id="poEmpNo" required  readonly="readonly">
								<input type="text" class="form-control input-sm" placeholder="사원번호를 입력해주세요" name="viewPoEmpNo" id="viewPoEmpNo" required  readonly="readonly">
							</div>
						</div>
						
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalEmp" id="empModalBtn">사원검색</button>
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">거래처코드</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="hidden" class="form-control input-sm" placeholder="거래처코드를 입력해주세요" name="poCltNo" id="poCltNo" required  readonly="readonly">
								<input type="text" class="form-control input-sm" placeholder="거래처코드를 입력해주세요" name="viewPoCltNo" id="viewPoCltNo" required  readonly="readonly">
							</div>
						</div>
						
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalClt" id="cltModalBtn">거래처검색</button>
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">발주상품</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="발주상품을 입력해주세요" id="poProduct" name="poProduct" required  readonly="readonly">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">발주수량</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="발주수량을 입력해주세요" id="poCnt" name="poCnt" required  readonly="readonly">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">발주단가</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="발주단가를 입력해주세요" id="poPrice" name="poPrice" required>
							</div>
						</div>
					</div>
					
					
					<!-- The Modal 주문정보 -->
					<div class="modal" id="myModalOr">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">주문 선택</h4>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
						      <table id="order-table-modal" class="table table-bordered table-hover text-center">
							      <tr>
							      	<th>주문번호</th>
							      	<th>주문상품</th>
							      	<th>주문수량</th>
							      	<th>주문날짜</th>
							      </tr>
							      
							      <c:choose>
										<c:when test="${empty(poRList)}">
											<tr align="center">
												<td colspan="4">검색된 주문 정보가 없습니다.</td>				
											</tr>
										</c:when>
										
										<c:otherwise>
									    	<c:forEach var="poRList" items="${poRList}">
									    		<tr>
									    			<td>${poRList.orderNo}</td>
									    			<td>${poRList.orderProduct}</td>
									    			<td>${poRList.orderCnt}</td>
									    			<td>${poRList.orderDate}</td>
									    		</tr>
									    	</c:forEach>
									    </c:otherwise>
									</c:choose>
							      
						      </table>
					      </div>
					
					      <!-- Modal footer -->
					      <div class="modal-footer">
					        <button type="button" class="btn btn-danger" data-dismiss="modal" id="poModalClose">Close</button>
					      </div>
					
					    </div>
					  </div>
					</div>
					
					<!-- The Modal 사원정보 -->
					<div class="modal" id="myModalEmp">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">사원 선택</h4>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					      	<table id="emp-table-modal" class="table table-bordered table-hover text-center">
							      <tr>
							      	<th>사원번호</th>
							      	<th>사원이름</th>
							      	<th>사원부서</th>
							      	<th>사원직급</th>
							      </tr>
							      
							      <c:choose>
										<c:when test="${empty(poEmpList)}">
											<tr align="center">
												<td colspan="4">검색된 사원 정보가 없습니다.</td>				
											</tr>
										</c:when>
										
										<c:otherwise>
									    	<c:forEach var="poEmpList" items="${poEmpList}">
									    		<tr>
									    			<td>${poEmpList.empNo}</td>
									    			<td>${poEmpList.empName}</td>
									    			<td>${poEmpList.empDepart}</td>
									    			<td>${poEmpList.empGrade}</td>
									    		</tr>
									    	</c:forEach>
									    </c:otherwise>
									</c:choose>
						      </table>
					      </div>
					
					      <!-- Modal footer -->
					      <div class="modal-footer">
					        <button type="button" class="btn btn-danger" data-dismiss="modal" id="empModalClose">Close</button>
					      </div>
					
					    </div>
					  </div>
					</div>
					
					<!-- The Modal 거래처정보 -->
					<div class="modal" id="myModalClt">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">거래처 선택</h4>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					      	
					      	<table id="clt-table-modal" class="table table-bordered table-hover text-center">
						    	<thead>
							      <tr>
							      	<th>거래처번호</th>
							      	<th>거래처이름</th>
							      	<th>거래처지역</th>
							      </tr>
						      	</thead>
						      <c:choose>
									<c:when test="${empty(poCltList)}">
										<tbody>
											<tr align="center">
												<td colspan="3">검색된 거래처 정보가 없습니다.</td>				
											</tr>
										</tbody>
									</c:when>
									
									<c:otherwise>
								    	<c:forEach var="poClt" items="${poCltList}">
								    		<tbody>
									    		<tr>
									    			<td>${poClt.cltNo}</td>
									    			<td>${poClt.cltName}</td>
									    			<td>${poClt.cltLocation}</td>
									    		</tr>
								    		</tbody>
								    	</c:forEach>
								    </c:otherwise>
								</c:choose>
						      </table>
					      </div>
					
					      <!-- Modal footer -->
					      <div class="modal-footer">
					        <button type="button" class="btn btn-danger" data-dismiss="modal" id="cltModalClose">Close</button>
					      </div>
					
					    </div>
					  </div>
					</div>
				
				
					<button class="btn btn-primary waves-effect waves-button waves-float" style="float : right">등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>


<script type="text/javascript">
	
	$(document).ready(function(){
		$("#data-table-basic").bootgrid();
		// $("#data-table-command").bootgrid();
		
		$("#data-table-command").bootgrid({
			formatters: {
                "commands": function(column, row) {
                    return "<button type=\"button\" class=\"btn btn-icon command-edit\" data-row-id=\"" + row.id + "\" onclick=\"location.href='${pageContext.request.contextPath}/placeorder/poUpdate?poNo=" + row.id + "';\"><span class=\"md md-edit\"></span></button>"; 
                    
                }
            }
		});
		
	
		
		$("#order-table-modal tr").click(function() {
			
			var tr = $(this);
			var td = tr.children();
			
			var oderNo = td.eq(0).text();
			var oderName = td.eq(1).text();
			var oderCnt = td.eq(2).text();
			
			// alert(oderNo);
			// 모달을 이용해서 값 전달 주문 PK
			$("#poOrderNo").val(oderNo);
			$("#poOrderNo").text(oderNo);
			$("#poOrderNo").html(oderNo);
			
			// 발주 상품
			$("#poProduct").val(oderName);
			$("#poProduct").text(oderName);
			$("#poProduct").html(oderName);
			
			// 발주 수량
			$("#poCnt").val(oderCnt);
			$("#poCnt").text(oderCnt);
			$("#poCnt").html(oderCnt);
			
			$("#poModalClose").trigger("click");
		});
		
		$("#emp-table-modal tr").click(function() {
			
			var tr = $(this);
			var td = tr.children();
			
			var empNo = td.eq(0).text();
			var empName = td.eq(1).text();
			var view = empNo + "_" + empName;
			
			// alert(empNo);
			$("#poEmpNo").val(empNo);
			$("#poEmpNo").text(empNo);
			//$("#poEmpNo").html(empNo);
			$("#viewPoEmpNo").val(view);
			
			$("#empModalClose").trigger("click");
		});
		
		$("#clt-table-modal tr").click(function() {
			
			var tr = $(this);
			var td = tr.children();
			
			var cltNo = td.eq(0).text();
			var cltName = td.eq(1).text();
			var view = cltNo + "_" + cltName;
			
			// alert(cltNo);
			$("#poCltNo").val(cltNo);
			$("#poCltNo").text(cltNo);
			$("#poCltNo").html(cltNo);
			
			$("#viewPoCltNo").val(view);
			
			$("#cltModalClose").trigger("click");
		});
	});
</script>