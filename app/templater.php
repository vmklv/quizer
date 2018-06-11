<?php
header("Content-type: text/html; charset=utf-8");
require_once('db.php');
class Templater {
	private $result;
	private $db;

	function __construct() {
		$this->db = new DB();
	}

	// метод шаблонизатора
	function getTemplate($title='', $content='') {
		$template = file_get_contents('template.tpl'); // подгружаем шаблон, и заменяем на полученные в методе данные ($title и $content)
		$template = str_replace('{{%title%}}', $title, $template);
		$template = str_replace('{{%content%}}', $content, $template);
		/*
			Формируем верхнее меню
		*/
		$menu = file_get_contents('templates/nologinmenu.tpl');
		$template = str_replace('{{%nav-menu%}}', $menu, $template);
		if(isset($_SESSION['id_user'])) {
			$selUser = $this->db->DQ("SELECT * FROM `users` WHERE `id` = '".$_SESSION['id_user']."'");
			$fUser = $this->db->DF($selUser);
			// $formAuth = $fUser['name'].' '.$fUser['surname'].' (<a href="quit.php">Выйти</a>)';
			// $template = str_replace('{{%enter-auth%}}', $formAuth, $template);
			$formAuth = file_get_contents('templates/menu.tpl');
			$template = str_replace('{{%enter-auth%}}', $formAuth, $template);
			if($fUser['avatar'] == 1) {
				$avatar = 'img/avatars/'.$_SESSION['id_user'].'/avatar.jpg';
			} else {
				$avatar = 'img/avatars/default.png';
			}
			$template = str_replace('{{%avatar%}}', $avatar, $template);
		} else {
			$formAuth = file_get_contents('templates/enter.tpl');
			$template = str_replace('{{%enter-auth%}}', $formAuth, $template);
		}
		return $template;
	}
}