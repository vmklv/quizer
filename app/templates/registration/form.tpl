<div class="registration">
	<form method="POST" action="">
		<div class="card card-reg">
			<div class="header">
				<h1>Регистрация</h1>
			</div>
			<div class="col-md-10 offset-1">
				<input type="text" name="name" class="form-control" placeholder="имя" maxlength="16" required>
			</div>
			<div class="col-md-10 offset-1">
				<input type="text" name="surname" class="form-control" placeholder="фамилия" maxlength="16" required>
			</div>
			<div class="col-md-10 offset-1">
				<input type="email" name="email" class="form-control" placeholder="адрес эл. почты" maxlength="64" required>
			</div>
			<div class="col-md-10 offset-1">
				<input type="password" name="password" class="form-control" placeholder="пароль" maxlength="64" required>
			</div>
			<div class="col-md-10 offset-1">
				<input type="password" name="repassword" class="form-control" placeholder="повторите пароль" maxlength="64" required>
			</div>
			<div class="col-md-10 offset-1 EULA">
				<span>Регистрируясь, вы соглашаетесь с нашими
					<a href="#">Условиями</a> и
					<a href="#">Политикой конфиденциальности</a>.</span>
			</div>
			<div class="send-btn col-md-10 offset-1">
				<input type="hidden" name="form_token" value="true">
				<input type="submit" class="btn btn-primary col-md-12 col-lg-12" value="Зарегистрироваться">
			</div>
		</div>
	</form>
</div>