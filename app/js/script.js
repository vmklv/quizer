$(document).ready(function(){
	// добавление нового вопроса
	$('.new_question').click(function() {
		$('.survey-questions').append('<div class="question"><div class="name col-md-8 col-lg-8"><label>Название вопроса</label><input type="text" name="title-question[]" class="form-control" placeholder="Вопрос" required></div><div class="type-question col-md-4 col-lg-4"><label>Тип вопроса</label><select name="type-question[]" class="form-control type-question-survey" required><option value="text">Текст</option><option value="number">Число</option><option value="select">Выпадающий список</option></select></div><div class="select-answers col-md-12 col-lg-12"><input type="text" name="select-values[]" class="form-control" placeholder="Разделитель |"></div><div class="col-md-12 col-lg-12"><button type="button" class="btn btn-danger btn-md btn-delete-question"><i class="icon-trash"></i></button></div>');
	});

	// удаление вопроса
	$(document).on('click', '.btn-delete-question', function() {
		$(this).parent().parent().remove();
	});

	// добавление поля при типе select	
	$(document).on('change','.type-question-survey', function() {
		var currentObj = $(this);
		if(currentObj.val() == 'select') {
			$(currentObj).parent().parent().find('.select-answers input[type="text"]').css('visibility','visible');
		} else $(currentObj).parent().parent().find('.select-answers input[type="text"]').css('visibility','hidden');
	});

	// предпросмотр логотипа
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('.preview img').attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}

	$('.logotype').change(function(){
		readURL(this);
	});

	// оповещения
	$('.nav-notification').click(function(){
		$.post('ajax.php?type=get_notifications',{}, function(data){
			$('.notification-data').html(data);
		});
	});

	// slick slider
	$(document).on('ready', function() {
      $(".vertical-center").slick({
        dots: true,
        vertical: false,
        centerMode: true,
        slidesToShow: 1,
        slidesToScroll: 1
      });
		});
		
		$(document).on('ready', function () {
			$(".main-slider").slick({
				dots: false,
				vertical: false,
				centerMode: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				autoplay: true,
				arrows: false
			});
		});
});
