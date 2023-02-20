<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<div class="container">
	<form action="">
		<div class="form-group">
			<label for="title">Title</label>
			<input type="text" class="form-control" placeholder="Enter title" id="title">
		</div>
		<div class="form-group">
			<label for="content">Content:</label>
			<textarea rows="5" class="form-control summernote" id="content"></textarea>
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">저장</button>
</div>
<br>
<script type="text/javascript">
	$('.summernote').summernote({
		tabsize: 2,
		height: 300
	});
</script>
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp" %>