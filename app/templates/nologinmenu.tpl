<nav class="navbar">
	<div class="container-fluid">
		<div class="nav-header">
			<a href="/">Название</a>
		</div>
		<div class="nav-right">
			<ul class="list-inline">
				<li class="nav-login">
					<a href="#" class="btn reg-btn">Регистрация</a>
				</li>
				<li class="nav-login">
					<a href="#" class="btn login-btn" data-toggle="modal" data-target="#exampleModalCenter">Вход</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Вход</h5>
				<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
				<!-- <span aria-hidden="true">&times;</span> -->
				<!-- </button> -->
			</div>
			<div class="modal-body">
				<div class="auth">
					<form method="POST" action="">
						<div class="card card-login">
							<div class="header">
								<h1>Вход</h1>
							</div>
							<div class="col-md-10 offset-1">
								<input type="email" name="email" class="form-control" placeholder="адрес эл. почты" maxlength="64" required>
							</div>
							<div class="col-md-10 offset-1">
								<input type="password" name="password" class="form-control" placeholder="пароль" maxlength="64" required>
							</div>
							<div class="send-btn col-md-10 offset-1">
								<input type="hidden" name="form_token" value="true">
								<input type="submit" class="btn btn-primary col-md-12 col-lg-12" value="Войти">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>