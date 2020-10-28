<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<div class="container">
<div class="block-header">

<h2>생산 관리</h2>
<hr>


<div class="card">
    <div class="card-header">
    
		<div role="tabpanel">
			<ul class="tab-nav" role="tablist" tabindex="1" style="overflow: hidden; outline: none;">
			      <li class="active"><a href="#productionList" aria-controls="productionList" role="tab" data-toggle="tab" aria-expanded="true">생산 목록</a></li>
			      <%-- <li class=""><a href="#productionUpdata" aria-controls="productionUpdata" role="tab" data-toggle="tab" aria-expanded="false">생산 확인 목록</a></li> --%>
			      <li class=""><a href="#productionUpload" aria-controls="productionUpload" role="tab" data-toggle="tab" aria-expanded="false">생산 등록</a></li>
			</ul>
		</div>
		
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="productionList">
				<%-- 
				<div class="row">
					<div class="row">
						<div class="col-25">
							<label for="clt_name" class="label-pre">생산상품</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="생산상품으로 검색가능합니다">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-25">
							<label for="clt_phone" class="label-pre">생산날짜</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="생산날짜로 검색가능합니다">
							</div>
						</div>
					</div>
				</div>
				--%>
				
				<div class="table-responsive">
					<table id="data-table-basic" class="table table-striped" aria-busy="false">
					    <thead>
					        <tr>
					            <th data-column-id="id">생산번호</th>
					            <th data-column-id="sender">발주번호</th>
					            <th data-column-id="sender1">사원번호</th>
					            <th data-column-id="sender2">출고번호</th>
					            <th data-column-id="sender3">생산상품</th>
					            <th data-column-id="sender4">생산수량</th>
					            <th data-column-id="sender6">생산날짜</th>
					            <th data-column-id="sender7">생산상태</th>
					        </tr>
					    </thead>
					    
					    <tbody>
					    
					    	<c:choose>
								<c:when test="${empty(productionList)}">
									<tr align="center">
										<td colspan="8">검색된 생산 정보가 없습니다.</td>				
									</tr>
								</c:when>
								
								<c:otherwise>
							    	<c:forEach var="poduction" items="${productionList}">
							    		<tr>
							    			<td>${poduction.pdnNo}</td>
							    			<td>${poduction.pdnPoNo}</td>
							    			<td>${poduction.pdnEmpNo}</td>
							    			<td>${poduction.pdnRelNo}</td>
							    			<td>${poduction.pdnProduct}</td>
							    			<td>${poduction.pdnCnt}</td>
							    			<td>${poduction.pdndate}</td>
							    			<td>${poduction.pdnStatus}</td>
							    		</tr>
							    	</c:forEach>
							    </c:otherwise>
							</c:choose>
					    </tbody>
					</table>
				</div>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="productionUpdata">
			
				<div class="table-responsive">
					<table id="data-table-command" class="table table-striped table-vmiddle" aria-busy="false">
					    <thead>
					        <tr>
					            <th data-column-id="id">생산번호</th>
					            <th data-column-id="sender">발주번호</th>
					            <th data-column-id="sender1">사원번호</th>
					            <th data-column-id="sender2">출고번호</th>
					            <th data-column-id="sender3">생산상품</th>
					            <th data-column-id="sender4">생산수량</th>
					            <th data-column-id="sender6">생산날짜</th>
					            <th data-column-id="sender7">생산상태</th>
					            <th data-column-id="commands" data-formatter="commands" data-sortable="false">수정</th>
					        </tr>
					    </thead>
					    
					    <tbody>
					    	<c:choose>
								<c:when test="${empty(placeorderList)}">
									<tr align="center">
										<td colspan="9">검색된 발주 정보가 없습니다.</td>				
									</tr>
								</c:when>
								
								<c:otherwise>
							    	<c:forEach var="poduction" items="${productionList}">
							    		<tr>
							    			<td>${poduction.pdnNo}</td>
							    			<td>${poduction.pdnPoNo}</td>
							    			<td>${poduction.pdnEmpNo}</td>
							    			<td>${poduction.pdnRelNo}</td>
							    			<td>${poduction.pdnProduct}</td>
							    			<td>${poduction.pdnCnt}</td>
							    			<td>${poduction.pdndate}</td>
							    			<td>${poduction.pdnStatus}</td>
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
			
			
			<div role="tabpanel" class="tab-pane" id="productionUpload">
				
				<div class="container1">
					<form action="production" method="post">
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_phone" class="label-pre">발주번호</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="발주번호를 입력해주세요" name="pdnPoNo" id="pdnPoNo" required>
								<input type="hidden" class="form-control input-sm" placeholder="" name="poNo" id="poNo" required>
								<input type="hidden" class="form-control input-sm" placeholder="" name="rcpPoNo" id="rcpPoNo" required>
							</div>
						</div>
						
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalPo" id="poModalBtn">발주검색</button>
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">사원번호</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="hidden" class="form-control input-sm" placeholder="사원번호를 입력해주세요" name="pdnEmpNo" id="pdnEmpNo" required>
								<input type="text" class="form-control input-sm" placeholder="사원번호를 입력해주세요" name="viewPoEmpNo" id="viewPoEmpNo" required>
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
							<label for="clt_admin" class="label-pre">출고코드</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="출코코드를 입력해주세요" name="pdnRelNo" id="pdnRelNo" required>
								<input type="hidden" class="form-control input-sm" placeholder="출코코드를 입력해주세요" name="relNo" id="relNo" required>
								<input type="hidden" class="form-control input-sm" placeholder="출코코드를 입력해주세요" name="viewPoCltNo" id="viewPoCltNo" required>
							</div>
						</div>
						<%-- 
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalRel" id="RelModalBtn">출고검색</button>
							</div>
						</div>
						--%>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">생산상품</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="생산상품을 입력해주세요" id="pdnProduct" name="pdnProduct" required>
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-xs-6 col-md-4" align="center">
							<label for="clt_admin" class="label-pre">생산수량</label>
						</div>
	
						<div class="col-xs-6 col-md-4">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="생산수량을 입력해주세요" id="pdnCnt" name="pdnCnt" required>
							</div>
						</div>
					</div>
				
					
					
					<!-- The Modal 발주 정보 -->
					<div class="modal" id="myModalPo">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">발주 선택</h4>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
						      <table id="order-table-modal" class="table table-bordered table-hover text-center">
							      <tr>
							      	<th>발주번호</th>
							      	<th>발주상품</th>
							      	<th>발주수량</th>
							      </tr>
							      
							      <c:choose>
										<c:when test="${empty(poList)}">
											<tr align="center">
												<td colspan="3">검색된 주문 정보가 없습니다.</td>				
											</tr>
										</c:when>
										
										<c:otherwise>
									    	<c:forEach var="poList" items="${poList}">
									    		<tr>
									    			<td>${poList.poNo}</td>
									    			<td>${poList.poProduct}</td>
									    			<td>${poList.poCnt}</td>
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
										<c:when test="${empty(prEmpList)}">
											<tr align="center">
												<td colspan="4">검색된 사원 정보가 없습니다.</td>				
											</tr>
										</c:when>
										
										<c:otherwise>
									    	<c:forEach var="prEmpList" items="${prEmpList}">
									    		<tr>
									    			<td>${prEmpList.empNo}</td>
									    			<td>${prEmpList.empName}</td>
									    			<td>${prEmpList.empDepart}</td>
									    			<td>${prEmpList.empGrade}</td>
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
					        <h4 class="modal-title">출고 선택</h4>
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
			
			var pdnPoNo = td.eq(0).text();
			var pdnProduct = td.eq(1).text();
			var pdnCnt = td.eq(2).text();
			
			// alert(oderNo);
			// 모달을 이용해서 값 전달 주문 PK
			$("#pdnPoNo").val(pdnPoNo);
			$("#pdnPoNo").text(pdnPoNo);
			
			$("#poNo").val(pdnPoNo);
			$("#poNo").text(pdnPoNo);
			
			$("#rcpPoNo").val(pdnPoNo);
			$("#rcpPoNo").text(pdnPoNo);
			
			
			// $("#poOrderNo").html(oderNo);
			
			// 발주 상품
			$("#pdnProduct").val(pdnProduct);
			$("#pdnProduct").text(pdnProduct);
			// $("#poProduct").html(oderName);
			
			// 발주 수량
			$("#pdnCnt").val(pdnCnt);
			$("#pdnCnt").text(pdnCnt);
			// $("#poCnt").html(oderCnt);
			
			// var pdnPoNo = $(this).val();
			// alert(pdnPoNo);
			
			$.ajax({
				type : "get",
				url : "relSearch/" + pdnPoNo,
				dataType : "json",
				success : function(json) {
					// alert(json.relNo);
					$("#pdnRelNo").val(json.relNo);
					$("#pdnRelNo").text(json.relNo);
					
					$("#relNo").val(json.relNo);
					$("#relNo").text(json.relNo);
				},
				error : function(xhr) {
					alert("에러코드 = " + xhr.status);
				}
			});
			
			$("#poModalClose").trigger("click");
		});
		
		$("#emp-table-modal tr").click(function() {
			
			var tr = $(this);
			var td = tr.children();
			
			var pdnEmpNo = td.eq(0).text();
			var empName = td.eq(1).text();
			var view = pdnEmpNo + "_" + empName;
			
			// alert(empNo);
			$("#pdnEmpNo").val(pdnEmpNo);
			$("#pdnEmpNo").text(pdnEmpNo);
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
	
	/*
	$("#pdnPoNo").change(function() {
		
		var pdnPoNo = $(this).val();
		// alert(pdnPoNo);
		
		$.ajax({
			type : "get",
			url : "relSearch/" + pdnPoNo,
			dataType : "json",
			success : function(json) {
				// alert(json.relNo);
				$("#pdnRelNo").val(json.relNo);
				$("#pdnRelNo").text(json.relNo);
			},
			error : function(xhr) {
				alert("에러코드 = " + xhr.status);
			}
		});
	});
	*/
</script>