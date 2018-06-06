<nav class="navbar">
	<div class="container-fluid">
		<div class="nav-header">
			<a href="/">Quizer</a>
		</div>
		<div class="nav-right">
			{{%enter-auth%}}
		</div>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="auth">
					<form method="POST" action="auth.php">
						<div class="card card-login">
							<div class="header">
								<h1>Вход</h1>
								<div class="col-md-12">
									<input type="email" name="email" class="form-control" placeholder="адрес эл. почты" maxlength="64" required>
								</div>
								<div class="col-md-12">
									<input type="password" name="password" class="form-control" placeholder="пароль" maxlength="64" required>
								</div>
							</div>
							<div class="send-btn col-md-12">
								<input type="hidden" name="form_token" value="true">
								<input type="submit" class="btn btn-login col-md-12 col-lg-12" value="Войти">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>