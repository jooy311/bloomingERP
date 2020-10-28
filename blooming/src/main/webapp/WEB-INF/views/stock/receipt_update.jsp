<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<div class="container">
<div class="block-header">

<h2>입고 정보 변경</h2>
<hr>

<div class="card">
    <div class="card-header">
    
		<div class="tab-content">
				
			<div class="container1">
				<form action="repUpdate" method="post">
				
				<input type="hidden" name="rcpNo" value="${rcpUp.rcpNo}">
				<input type="hidden" name="relNo" value="${relUp.relNo}">
				<input type="hidden" name="stockNo" value="${stockUp.stockNo}">
				
				<div class="row">
					<div class="col-25">
						<label for="clt_name" class="label-pre">상품명</label>
					</div>

					<div class="col-75">
						<div class="fg-line form-group">
							<input type="text" class="form-control input-sm" name="rcpProduct" value="${rcpUp.rcpProduct}" required readonly="readonly">
						</div>
					</div>
				</div>
			
				<div class="row">
				
					<div class="col-25">
						<label for="clt_phone" class="label-pre">입고일짜</label>
					</div>

					<div class="col-75">
						<div class="fg-line form-group">
							<input type="text" class="form-control input-sm" name="cltPhone" value="${rcpUp.rcpDate}" required readonly="readonly">
						</div>
					</div>
				</div>
			
				<div class="row">
				
					<div class="col-25">
						<label for="clt_admin" class="label-pre">입고갯수</label>
					</div>

					<div class="col-75">
						<div class="fg-line form-group">
							<input type="text" class="form-control input-sm" name="rcpCnt" id="rcpCnt" value="${rcpUp.rcpCnt}">
							<input type="hidden" class="form-control input-sm" name="relCnt" id="relCnt" value="${relUp.relCnt}">
							<input type="hidden" class="form-control input-sm" name="stockCnt" id="stockCnt" value="${stockUp.stockCnt}">
						</div>
					</div>
				</div>
			
				<div class="row">
				
					<div class="col-25">
						<label for="clt_location" class="label-pre">입고단가</label>
					</div>

					<div class="col-75">
						<div class="fg-line form-group">
							<input type="text" class="form-control input-sm" name="rcpPrice" id="rcpPrice" value="${rcpUp.rcpPrice}">
							<input type="hidden" class="form-control input-sm" name="relPrice" id="relPrice" value="${relUp.relPrice}">
							<input type="hidden" class="form-control input-sm" name="stockPrice" id="stockPrice" value="${stockUp.stockPrice}">
							<input type="hidden" class="form-control input-sm" name="stockSalePrice" id="stockSalePrice" value="${stockUp.stockSalePrice}">
						</div>
					</div>
				</div>
				
				<div class="row">
				
					<div class="col-25">
						<label for="clt_status" class="label-pre">비고</label>
					</div>

					<div class="col-75">
						<div class="fg-line form-group">
							<input type="text" class="form-control input-sm" name="rcpMemo" value="${rcpUp.rcpMemo}">
						</div>
					</div>
				</div>
			
				<button type="submit" class="btn btn-primary waves-effect waves-button waves-float" style="float : right">수정</button>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</div>


<script type="text/javascript">
	
	$("#rcpCnt").change(function() {
		
		var cnt = $(this).val();
		
		
		$("#relCnt").val(cnt);
		$("#relCnt").text(cnt);
		
		$("#stockCnt").val(cnt);
		$("#stockCnt").text(cnt);
	});
	
	
	$("#rcpPrice").change(function() {
		
		var price = $(this).val();
		
		
		$("#relPrice").val(price);
		$("#relPrice").text(price);
		
		$("#stockPrice").val(price);
		$("#stockPrice").text(price);
		
		
		$("#stockSalePrice").val(price * 1.2);
		$("#stockSalePrice").text(price * 1.2);
	});

</script>