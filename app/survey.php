<?php
require_once('templater.php');
require_once('db.php');
$templater = new Templater();
$db = new DB();
if(!isset($_GET['survey_id'])) {
	header('Location: index.php');
	exit();
} else {
	$id (int) $_GET['survey_id'];
	$selSurvey = $db->DQ("SELECT * FROM `surveys` WHERE `id` = '".$id."' ORDER BY `id` DESC LIMIT 1");
	if($db->DN($selSurvey) != 1) {
		header('Location: index.php');
		exit();
	} else {
		if(isset($_POST['form_token'])) {

		} else {
			$fSurvey = $db->DF($selSurvey);
			// каркас шаблона опроса
			$form = file_get_contents();
			// достаём вопросы
			$questions = '';
			$selQuestions = $db->DQ("SELECT * FROM `surveys_questions` WHERE `survey_id` = '".$fSurvey['id']."'");
			while($fQuestions = $this->db->DF($selQuestions)) {
				// проверяем тип ответа в вопросе и формируем нужное поле (text, int, select)
				switch($fQuestion['type']) {
					case 'text':
					$answer = '<input...';
					break;
					case 'number':
					$answer = '<input type="text" name="" class="form-control">';
					break;
					case 'select':
					$answersArray = explode('|', $fQuestions['content']);
					$answer = '<select name="answer[]" class="form-control">';
					foreach($answersArray AS $value) {
						$answer .= '<option value="">'.$value.'</option>';
					}
					$answer .= '</select>';
					break;
				}
				$questions .= '<div class="question"><div class="title">'.$fQuestion['title'].'</div><div class="answer">'.$answer.'</div></div>';
			}
			// заменяем заголовок (h2) и сами опросы
			$form = str_replace('{{%title-survey%}}', $fSurvey['title'], $form);
			$form = str_replace('{{%surveys%}}', $surveys, $form);

		}
	}
}
$title = 'Главная страница';
// $content = file_get_contents('templates/registration/form.tpl');
$content = file_get_contents('templates/main/main.tpl');
// формируем опросы в слайдер
$surveys = '';
$selSurveys = $db->DQ("SELECT * FROM `surveys` ORDER BY `id` DESC");
while($fSurveys = $db->DF($selSurveys)) {
	$surveys .= '<div class="slide"><a href="survey.php?survey_id='.$fSurveys['id'].'"><div class="logo"><img src="img/surveys/'.$fSurveys['id'].'/logo.jpg"><div class="title">'.$fSurveys['title'].'</div></div></a></div>';
}
$content = str_replace('{{%surveys%}}', $surveys, $content);
echo $templater->getTemplate($title, $content); // вызываем метод templater и передаём туда заголовок и контент