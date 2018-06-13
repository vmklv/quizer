<div class="wrapper usersettings col-md-12 col-lg-12">
	<h2>Настройки</h2>
	<form method="POST" action="" enctype="multipart/form-data">
		<div class="email col-md-12 col-lg-12">
			<label>Email</label>
			<input type="email" name="email" value="{{%email%}}" class="form-control" readonly>
		</div>
		<div class="col-md-12 col-lg-12">
			<div class="change-passwd">
				<div class="col-md-6 col-lg-6">
					<label>Новый пароль</label>
					<input type="password" name="passwd" class="form-control">
				</div>
				<div class="col-md-6 col-lg-6">
					<label>Повторите пароль</label>
					<input type="password" name="repasswd" class="form-control">
				</div>
			</div>
			<div class="usernames col-md-6 col-lg-6">
				<label>Имя</label>
				<input type="text" name="name" value="{{%name%}}" class="form-control">
			</div>
			<div class="col-md-6 col-lg-6">
				<label>Фамилия</label>
				<input type="text" name="surname" value="{{%surname%}}" class="form-control">
			</div>
			<div class="usergender col-md-6 col-lg-6">
				<label>Пол</label>
				<select name="gender" class="form-control">
					<option value="" disabled>Выберите пол</option>
					<option value="male" {{%gender-male%}}>Мужской</option>
					<option value="female" {{%gender-female%}}>Женский</option>
				</select>
			</div>
			<div class="userbirthday col-md-6 col-lg-6">
				<label>Дата рождения</label>
				<input type="date" name="birthday" value="{{%birthday%}}" class="form-control">
			</div>
		</div>
		<div class="col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3">
			<label>Аватар</label>
			<input type="file" name="avatar" class="form-control">
			<div class="col-md-12 col-lg-12 avatar-settings">
				<img src="{{%avatar%}}" alt="">
			</div>
		</div>
		<div class="submit col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3">
			<input type="hidden" name="form_token" value="true">
			<label>&nbsp;</label>
			<input type="submit" value="Сохранить изменения" class="btn btn-success col-md-12 col-lg-12">
		</div>
	</form>
</div>