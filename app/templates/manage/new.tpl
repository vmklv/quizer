<div class="new_survey col-md-12 col-lg-12">
	<form method="POST" action="" enctype="multipart/form-data">
		<div class="title col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3">
			<h1>Название вопроса</h1>
			<input type="text" name="title" class="form-control" placeholder="Название опроса" required>
		</div>
		<div class="title col-md-6 col-lg-6 col-md-offset-3">
			<label>Тип опроса</label>
			<select name="type" class="form-control" required>
				<option></option>
				<option value="public">Публичный</option>
				<option value="private">Приватный</option>
			</select>
		</div>
		<div class="private-survey-access col-md-12 col-lg-12"></div>
		<div class="logotype col-md-3 col-lg-3 col-md-offset-3 col-lg-offset-3">
			<div class="field">
				<label>Логотип</label>
				<input type="file" name="logotype" class="form-control col-md-12 col-lg-12 logotype" required>
				
			</div>
			<div class="preview col-md-12 col-lg-12">
				<img src="" alt="">
			</div>
		</div>
		<div class="logotype col-md-3 col-lg-3 ">
			<div class="field">
				<label>Фон</label>
				<input type="file" name="logotype" class="form-control col-md-12 col-lg-12 logotype" required>
			</div>
			<div class="preview col-md-12 col-lg-12">
				<img src="" alt="">
			</div>
		</div>
		<div class="surveys col-md-12 col-lg-12">
			<h2>Вопросы
				<button type="button" class="new_question btn btn-primary btn-md">+</button>
			</h2>
			<div class="first-survey col-md-12 col-lg-12">
				<div class="name col-md-4 col-lg-4">
					<input type="text" name="title-question[]" class="form-control" placeholder="Вопрос" required>
				</div>
				<div class="type-question col-md-4 col-lg-4">
					<select name="type-question[]" class="form-control type-question-survey" required>
						<option value="0" disabled>Выберите тип ответа</option>
						<option value="text">Текст</option>
						<option value="number">Число</option>
						<option value="select">Выпадающий список</option>
					</select>
				</div>
				<div class="select-answers col-md-4 col-lg-4">
					<input type="text" name="select-values[]" class="form-control" placeholder="Разделитель |">
				</div>
			</div>
			<div class="survey-questions"></div>
			<div class="submit col-md-2 col-lg-2 col-md-offset-5 col-lg-offset-5">
				<input type="hidden" name="form_token" value="true">
				<input type="submit" value="Добавить опрос" class="btn btn-success col-md-12 col-lg-12">
			</div>
		</div>
	</form>
</div>