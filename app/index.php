<?php
require_once('templater.php');
require_once('db.php');
$templater = new Templater();
$db = new DB();
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