<%@ page 
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</head>
<style>
.card {
  width: 350px;
  padding: 10px;
  border-radius: 20px;
  background: #fff;
  border: none;
  height: 350px;
  position: relative;
}

.container {
  height: 100vh;
}

body {
  background: #eee;
}

.mobile-text {
  color: #989696b8;
  font-size: 15px;
}

.form-control {
  margin-right: 12px;
}

.form-control:focus {
  color: #495057;
  background-color: #fff;
  border-color: #ff8880;
  outline: 0;
  box-shadow: none;
}

.cursor {
  cursor: pointer;
}
</style>
<body>
	<div class="d-flex justify-content-center align-items-center container">
	<form action="${pageContext.request.contextPath }/login/signUp/account-verification">
		<div class="card py-5 px-3">
			<h5 class="m-0">Account verification</h5>
			<span class="mobile-text">Enter the code we just send on your
				mail <b class="text-danger">${email }</b>
			</span>
			<div class="d-flex flex-row mt-5">
				<input name="email" hidden="hidden" value="${email}" type="text" class="form-control">
				<input name="vrf1" type="text" class="form-control" autofocus="">
				<input name="vrf2" type="text" class="form-control">
				<input name="vrf3" type="text" class="form-control">
				<input name="vrf4" type="text" class="form-control">
				<input name="vrf5" type="text" class="form-control">
			</div>
			<div class="text-center mt-5">
				<button type="submit" class="btn btn-outline-primary">Verify</button>
			</div>
		</div>
	</form>
	</div>
</body>
</html>