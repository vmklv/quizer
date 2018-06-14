<?php
require_once('templater.php');
require_once('db.php');
$templater = new Templater();
$db = new DB();
if(!isset($_GET['survey_id'])) {
	header('Location: index.php');
	exit();
} else {
	$id = (int) $_GET['survey_id'];
	$selSurvey = $db->DQ("SELECT * FROM `surveys` WHERE `id` = '".$id."' ORDER BY `id` ASC LIMIT 1");
	if($db->DN($selSurvey) != 1) {
		header('Location: index.php');
		exit();
	} else {
		$fSurvey = $db->DF($selSurvey);
		if($fSurvey['privacy'] == 1 && @$_SESSION['access'] != $fSurvey['id']) {
			if(isset($_POST['form_token'])) {
				$passwd = htmlspecialchars($_POST['passwd'], ENT_QUOTES);
				if($passwd == $fSurvey['privacy_password']) {
					$_SESSION['access'] = $fSurvey['id'];
					header("Location: survey.php?survey_id=".$_GET['survey_id']);
				} else exit("<script>alert('Неверный пароль. Попробуйте ещё раз');location.href='survey.php?survey_id=".$_GET['survey_id']."';</script>");
			} else {
				$content = file_get_contents('templates/survey/access.tpl');
			}
		} else {
			if(isset($_POST['form_token'])) {
				if(!isset($_SESSION['id_user'])) {
					$user_id = 0;
					$session = $db->generateWord(12);
				} else {
					$user_id = $_SESSION['id_user'];
					$session = '';
				}
				foreach($_POST['question'] AS $key => $value) {
					$saveData = $db->DQ("INSERT INTO `surveys_answers`(`user_id`, `question_id`, `answer`, `survey_id`,`session`) VALUES ('".$user_id."', '".$value."', '".$_POST['answer'][$key]."', '".$fSurvey['id']."','".$session."')");
				}
				// таблица с прохождением опроса
				$selAcceptedSurvey = $db->DQ("INSERT INTO `surveys_successed`(`user_id`, `survey_id`,`creator_id`) VALUES ('".$user_id."', '".$fSurvey['id']."','".$fSurvey['user_id']."')");
				exit('<script>alert("Вы успешно прошли тест");location.href="index.php";</script>');

			} else {
				// проверка проходил ли пользователь опрос (если авторизован)
				if(isset($_SESSION['id_user'])) {
					$selAcceptedSurvey = $db->DQ("SELECT * FROM `surveys_successed` WHERE `user_id` = '".$_SESSION['id_user']."' AND `survey_id` = '".$_GET['survey_id']."'");
					if($db->DN($selAcceptedSurvey) != 0) exit('<script>alert("Вы уже проходили данный опрос");location.href="survey.php";</script>');
				}
				// каркас шаблона опроса
				$form = file_get_contents('templates/survey/form.tpl');
				// достаём вопросы
				$questions = '';
				$selQuestions = $db->DQ("SELECT * FROM `surveys_questions` WHERE `survey_id` = '".$fSurvey['id']."' ORDER BY `id` ASC");
				while($fQuestions = $db->DF($selQuestions)) {
					// проверяем тип ответа в вопросе и формируем нужное поле (text, int, select)
					switch($fQuestions['type']) {
						case 'text':
						$answer = '<input type="text" name="answer[]" class="form-control">';
						$answer .= '<input type="hidden" name="question[]" value="'.$fQuestions['id'].'" class="form-control">';
						break;
						case 'number':
						$answer = '<input type="number" name="answer[]" class="form-control">';
						$answer .= '<input type="hidden" name="question[]" value="'.$fQuestions['id'].'" class="form-control">';
						break;
						case 'select':
						$answersArray = explode(',', $fQuestions['content']);
						$answer = '<select name="answer[]" class="form-control">';
						foreach($answersArray AS $value) {
							$answer .= '<option value="'.$value.'">'.$value.'</option>';
						}
						$answer .= '</select>';
						$answer .= '<input type="hidden" name="question[]" value="'.$fQuestions['id'].'" class="form-control">';
						break;
					}
					$questions .= '<div class="question"><div class="title">'.$fQuestions['title'].'</div><div class="answer">'.$answer.'</div></div>';
				}
				// заменяем заголовок (h2) и сами опросы
				$form = str_replace('{{%title-survey%}}', $fSurvey['title'], $form);
				$form = str_replace('{{%questions%}}', $questions, $form);
				$content = $form;
			}
		}
	}
}
$title = 'Главная страница';
$selSurveys = $db->DQ("SELECT * FROM `surveys` ORDER BY `id` DESC");
$surveys = '';
while($fSurveys = $db->DF($selSurveys)) {
	$surveys .= '<div class="wrapper"><div class="slide"><a href="survey.php?survey_id='.$fSurveys['id'].'"><div class="logo"><img src="img/surveys/'.$fSurveys['id'].'/logo.jpg"><div class="title">'.$fSurveys['title'].'</div></div></a></div></div>';
}
$content = str_replace('{{%surveys%}}', $surveys, $content);
echo $templater->getTemplate($title, $content); // вызываем метод templater и передаём туда заголовок и контент