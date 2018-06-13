<div class="wrapper new_survey col-md-12 col-lg-12">
	<form method="POST" action="" enctype="multipart/form-data">
		<div class="title col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2">
			<h1>Название опроса</h1>
			<input type="text" name="title" class="form-control" placeholder="Название опроса" required>
		</div>
		<div class="privacy-settings col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2">
			<label>Тип опроса</label>
			<select id="privacy" name="type" class="form-control privacy-survey" required>
				<option selected value="public">Публичный</option>
				<option value="private">Приватный</option>
			</select>
		</div>
		<div class="privacy-password col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2">
			<input type="text" name="privacy-password" class="form-control" placeholder="Пароль для доступа">
		</div>
		<div class="logotype col-md-4 col-lg-4 col-md-offset-2 col-lg-offset-2">
			<div class="field">
				<label>Логотип</label>
				<input type="file" name="logotype" class="form-control col-md-12 col-lg-12 logotype" required>
			</div>
			<div class="preview col-md-12 col-lg-12">
				<img src="" alt="">
			</div>
		</div>
		<div class="bg-survey col-md-4 col-lg-4">
			<div class="field">
				<label>Фон</label>
				<input type="file" name="bg-survey" class="form-control col-md-12 col-lg-12 bg-survey" required>
			</div>
			<div class="preview col-md-12 col-lg-12">
				<img src="" alt="">
			</div>
		</div>
		<div class="surveys col-md-8 col-lg-8 col-md-offset-2 col-lg-offset-2">
			<h2>Вопросы</h2>
			<button type="button" class="new_question btn btn-primary btn-md">Добавить вопрос</button>
			<div class="first-survey">
				<div class="name">
					<label>Название вопроса</label>
					<input type="text" name="title-question[]" class="form-control" placeholder="Название вопроса" required>
				</div>
				<div class="type-question">
					<label>Тип вопроса</label>
					<select name="type-question[]" class="form-control type-question-survey" required>
						<option value="0" disabled>Выберите тип ответа</option>
						<option value="text">Текст</option>
						<option value="number">Число</option>
						<option value="select">Выпадающий список</option>
					</select>
				</div>
				<div class="select-answers">
					<input type="text" name="select-values[]" class="form-control" placeholder="Разделитель |">
				</div>
			</div>
			<div class="survey-questions"></div>
			<div class="submit col-md-12 col-lg-12">
				<input type="hidden" name="form_token" value="true">
				<input type="submit" value="Отправить" class="saveSuurvey btn btn-success">
			</div>
		</div>
	</form>
</div>