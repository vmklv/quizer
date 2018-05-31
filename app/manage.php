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
			// проверяем заполненные поля

			// получаем id нового survey
			$selLastId = $this->db->DQ("SELECT `id` FROM `surveys` ORDER BY `id` DESC LIMIT 1");
			if($this->db->DN($selLastId) == 1){
				$fLastId = $this->db->DF($selLastId);
				$lastId = $fLastId['id'] + 1;
			} else $lastId = 1;
			var_dump($_SESSION['id_user']);
			// записываем в БД опрос
			$saveSurvey = $this->db->DQ("INSERT INTO `surveys`(`id`,`title`,`user_id`,`privacy`,`privacy_password`,`avatar`) VALUES('".$lastId."', '".$title."', '".$_SESSION['id_user']."', '".$privacy."', '".$privacy_password."', '1')");
			// перебираем вопросы с ответами и записываем их в БД
			foreach($_POST['title-question'] AS $key => $value) {
				$saveQuestion = $this->db->DQ("INSERT INTO `surveys_questions`(`survey_id`,`title`,`type`,`select_values`) VALUES('".$lastId."', '".$value[$key]."', '".$_POST['type-question'][$key]."', '".$_POST['select-values'][$key]."')");
			}
			// количество вопросов
			$countQuestions = count($_POST['title-question']);
			
		} else {
			$form = file_get_contents('templates/manage/new.tpl');

			$result = $form;
		}
		return $result;
	}

	function listSurveys() { // список опросов
		$result = '<a href="manage.php?type=new">Добавить опрос</a>';
		$selSurveys = $this->db->DQ("SELECT * FROM `surveys` WHERE `user_id` = '".$_SESSION['id_user']."'");

		$result .= '<table border="0" class="table">';

		$result .= '</table>';
		return $result;
	}


}

$objManage = new Manage();

$title = 'Управление опросами';
// условия вызова методов
if($_GET['type'] == 'list') $content = $objManage->listSurveys();
elseif($_GET['type'] == 'new') $content = $objManage->newSurvey();

echo $templater->templater($title, $content);