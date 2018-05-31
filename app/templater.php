<?php
session_start();
header("Content-type: text/html; charset=utf-8");

class Templater {
	private $result;

	// метод шаблонизатора
	function templater($title='', $content='') {
		$template = file_get_contents('template.tpl'); // подгружаем шаблон, и заменяем на полученные в методе данные ($title и $content)
		$template = str_replace('{{%title%}}', $title, $template);
		$template = str_replace('{{%content%}}', $content, $template);
		/*
			Формируем верхнее меню
		*/
		$menu = file_get_contents('templates/menu.tpl');
		$template = str_replace('{{%nav-menu%}}', $menu, $template);
		// if(!isset($_SESSION['id_user'])) {
		// 	$menu = file_get_contents('templates/menu.tpl');
		// 	$template = str_replace('{{%nav-menu%}}', $menu, $template);
		// } else {
		// 	$menu = file_get_contents('templates/menu-no-login.tpl');
		// 	$template = str_replace('{{%nav-menu%}}', $menu, $template);
		// 	}
		/*
			Определяем авторизован ли пользователь. Если не авторизован выводим:
				кнопку регистрации и кнопку авторизации
			Иначе
				Кнопку настройки пользователя, оповещения и управления опросами
		*/
		return $template;
	}
}