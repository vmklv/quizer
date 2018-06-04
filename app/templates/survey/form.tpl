<div class="survey col-md-12 col-lg-12">
	<form method="POST" action="" enctype="multipart/form-data">
		<!-- <div class="logo">
						<img src="img/surveys/1/logo.jpg" alt="">
					</div> -->
		<div class="title col-md-6 col-lg-6">
			<h2>{{%title-survey%}}</h2>
		</div>
		<div class="surveys col-md-12 col-lg-12">
			<h2>Вопросы</h2>
			<div class="surveys col-md-12 col-lg-12">
				{{%questions%}}
				<div class="submit col-md-2 col-lg-2 col-md-offset-5 col-lg-offset-5">
					<input type="hidden" name="form_token" value="true">
					<input type="submit" value="Отправить" class="btn btn-success col-md-12 col-lg-12">
				</div>
			</div>
	</form>
	</div>