<?php
require_once('templater.php');
require_once('db.php');
$templater = new Templater();
class Manage {
	/*
		Get params:
		type - тип вызываемого метода
	*/
	private $db;
	private $user;

	function __construct() {
		$this->templater = new Templater();
		$this->db = new DB();

		if(!isset($_GET['type'])) header("Location: manage.php?type=list");

		if(!isset($_SESSION['id_user'])) {
			header("Location: index.php");
			exit();
		} else {
			// достаём текущего пользователя из базы
			$selUser = $this->db->DQ("SELECT * FROM `users` WHERE `id` = '".$_SESSION['id_user']."'");
			if($this->db->DN($selUser) != 1) {
				header("Location: index.php");
				exit();
			} else $this->user = $this->db->DF($selUser);
		}
	}

	function newSurvey() {
		if(isset($_POST['form_token'])) {
			$title = htmlspecialchars($_POST['title'], ENT_QUOTES);
			$type = htmlspecialchars($_POST['type'], ENT_QUOTES);
			$privacy = ' ';
			$privacy_password = ' ';
			$errors = '';
			if(empty($title)) $errors .= 'Вы ввели название опроса';
			if(empty($type)) $errors .= 'Вы не выбрали тип опроса';
			// проверяем заполненные поля
			// получаем id нового survey
			$selLastId = $this->db->DQ("SELECT `id` FROM `surveys` ORDER BY `id` DESC LIMIT 1");
			if($this->db->DN($selLastId) == 1){
				$fLastId = $this->db->DF($selLastId);
				$lastId = $fLastId['id'] + 1;
			} else $lastId = 1;
			@mkdir('img/surveys/'.$lastId.'/');
			move_uploaded_file($_FILES['logotype']['tmp_name'], 'img/surveys/'.$lastId.'/logo.jpg');
			// записываем в БД опрос
			$saveSurvey = $this->db->DQ("INSERT INTO `surveys`(`id`,`title`,`user_id`,`privacy`,`privacy_password`,`avatar`) VALUES('".$lastId."', '".$title."', '".$_SESSION['id_user']."', '".$privacy."', '".$privacy_password."', '1')");
			// перебираем вопросы с ответами и записываем их в БД
			foreach($_POST['title-question'] AS $key => $value) {
				$saveQuestion = $this->db->DQ("INSERT INTO `surveys_questions`(`title`,`survey_id`,`type`,`content`) VALUES('".$value."', '".$lastId."', '".$_POST['type-question'][$key]."', '".$_POST['select-values'][$key]."')");
			}
			
			$result = 'Опрос успешно добавлен! <a href="manage.php">Назад к управлению опросами</a>';
			
		} else {
			$form = file_get_contents('templates/manage/new.tpl');

			$result = $form;
		}
		return $result;
	}

	function listSurveys() { // список опросов
		$result = '<a href="manage.php?type=new">Добавить опрос</a>';
		$selSurveys = $this->db->DQ("SELECT * FROM `surveys` WHERE `user_id` = '".$_SESSION['id_user']."'");

		$result .= '<table border="0" class="table">
		<th>ID</th>
		<th>Название</th>
		<th>Количество вопросов</th>
		<th>Количество прохождений</th>
		<th>Действия</th>';
		$i = 1;
		while($fSurveys = $this->db->DF($selSurveys)) {
			// узнаём кол-во вопросов
			$selQuestions = $this->db->DQ("SELECT * FROM `surveys_questions` WHERE `survey_id` = '".$fSurveys['id']."'");
			$countQuestions = $this->db->DN($selQuestions);
			// количество прохождений
			$selSuccessed = $this->db->DQ("SELECT * FROM `surveys_successed` WHERE `survey_id` = '".$fSurveys['id']."'");
			$countSuccessed = $this->db->DN($selSuccessed);
			$result .= '<tr>
				<td>'.$i.'</td>
				<td>'.$fSurveys['title'].'</td>
				<td>'.$countQuestions.'</td>
				<td>'.$countSuccessed.'</td>
				<td>
					<a href="manage.php?type=delete&delete='.$fSurveys['id'].'" onclick="if(confirm()){return true;}else{return false;}">Удалить</a>
				</td>
			</tr>';

			$i++; // счётчик ID опроса
		}
		$result .= '</table>';
		return $result;
	}

	function deleteSurvey() {
		$id = (int) $_GET['delete'];
		$selSurvey = $this->db->DQ("SELECT * FROM `surveys` WHERE `id` = '".$id."' AND `user_id` = '".$_SESSION['id_user']."'");
		if($this->db->DN($selSurvey)) {
			$deleteSurvey = $this->db->DQ("DELETE FROM `surveys` WHERE `id` = '".$id."'");
			$deleteQuestions = $this->db->DQ("DELETE FROM `surveys_questions` WHERE `survey_id` = '".$id."'");
			$deleteSuccessed = $this->db->DQ("DELETE FROM `surveys_successed` WHERE `survey_id` = '".$id."'");
			$deleteAnswers = $this->db->DQ("DELETE FROM `surveys_answers` WHERE `survey_id` = '".$id."'");
		}
		header('Location: manage.php');
		return true;
	}
}

$objManage = new Manage();

$title = 'Управление опросами';
// условия вызова методов
if($_GET['type'] == 'list') $content = $objManage->listSurveys();
elseif($_GET['type'] == 'new') $content = $objManage->newSurvey();
elseif($_GET['type'] == 'delete') $content = $objManage->deleteSurvey();

echo $templater->getTemplate($title, $content);