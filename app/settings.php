<?php
require_once('db.php');
require_once('templater.php'); //подключаем конфигурационный файл
$db = new DB();
$templater = new Templater();
if(isset($_POST['form_token'])) {
	$email = htmlspecialchars(strtolower($_POST['email']), ENT_QUOTES);
	$selUser = $db->DQ("SELECT * FROM `users` WHERE `email` = '".$email."'");
	$fUser = $db->DF($selUser);
	if(!empty($_POST['passwd'])) {
		$passwd = trim($_POST['passwd']);
		$repasswd = trim($_POST['repasswd']);
	} else {
		$passwd = $fUser['password'];
		$repassword = $fUser['password'];
	}
	$name = htmlspecialchars($_POST['name'], ENT_QUOTES);
	$surname = htmlspecialchars($_POST['surname'], ENT_QUOTES);
	$gender = htmlspecialchars($_POST['gender'], ENT_QUOTES);
	$birthday = htmlspecialchars($_POST['birthday'], ENT_QUOTES);
	$errors = '';
	
	if(!empty($_POST['passwd'])) {
		if($passwd != $repasswd) $errors .= 'Введённые пароли не совпадают';
	}
	if(empty($name)) $errors .= 'Вы не ввели имя';
	if(empty($surname)) $errors .= 'Вы не ввели фамилию';

	if(!empty($_FILES['avatar']['tmp_name'])) {
		$avatar = 1;
		$path_avatar = 'img/avatars/'.$_SESSION['id_user'].'/';
		@mkdir($path_avatar);
		@unlink($path_avatar.'avatar.jpg');
		move_uploaded_file($_FILES['avatar']['tmp_name'], $path_avatar.'/avatar.jpg');
	} else $avatar = $fUser['avatar'];
	if(!empty($errors)) { // если переменная с ошибками не пустая - выводим сообщения об ошибках
		echo $errors;
	} else { // иначе хэшируем пароль и записываем пользователя в БД
		if(!empty($_POST['passwd'])) {
			$passwd = md5(md5(md5($passwd)));
		}
		$saveUser = $db->DQ("UPDATE `users` SET `password` = '".$passwd."', `name` = '".$name."', `surname` = '".$surname."', `gender` = '".$gender."', `birthday` = '".$birthday."', `avatar` = '".$avatar."' WHERE `id` = '".$_SESSION['id_user']."'");
		if($saveUser == true) exit("<script>location.href='settings.php';</script>");
		else exit("<script>alert('Произошёл сбой. Повторите попытку чуть позже');location.href='settings.php';</script>");
	}
} else {
	$title = 'Настройки';
	$content = file_get_contents('templates/settings/settings.tpl');
	$selUser = $db->DQ("SELECT * FROM `users` WHERE `id` = '".$_SESSION['id_user']."'");
	$fUser = $db->DF($selUser);
	
	$content = str_replace('{{%email%}}', $fUser['email'], $content);
	$content = str_replace('{{%name%}}', $fUser['name'], $content);
	$content = str_replace('{{%surname%}}', $fUser['surname'], $content);
	$content = str_replace('{{%birthday%}}', $fUser['birthday'], $content);
	if(empty($fUser['gender'])) {
		$content = str_replace('{{%gender-male%}}', '', $content);
		$content = str_replace('{{%gender-female%}}', '', $content);

	} elseif($fUser['gender'] == 'male') {
		$content = str_replace('{{%gender-male%}}', 'selected', $content);
		$content = str_replace('{{%gender-female%}}', '', $content);
	} elseif($fUser['gender'] == 'female') {
		$content = str_replace('{{%gender-male%}}', '', $content);
		$content = str_replace('{{%gender-female%}}', 'selected', $content);
	}
	$path_avatar = 'img/avatars/'.$fUser['id'].'/avatar.jpg';
	$content = str_replace('{{%avatar%}}', $path_avatar, $content);
	echo $templater->getTemplate($title, $content);
}