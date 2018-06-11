<div class="wrapper">
	<div class="auth">
		<form method="POST" action="">
			<div class="login-page">
				<div class="header">
					<h1>Вход</h1>
				</div>
				<div class="col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2">
					<input type="email" name="email" class="form-control" placeholder="адрес эл. почты" maxlength="64" required>
				</div>
				<div class="col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2">
					<input type="password" name="password" class="form-control" placeholder="пароль" maxlength="64" required>
				</div>
				<div class="send-btn col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2">
					<input type="hidden" name="form_token" value="true">
					<input type="submit" class="btn btn-primary col-md-12 col-lg-12" value="Войти">
				</div>
			</div>
		</form>
	</div>
</div>