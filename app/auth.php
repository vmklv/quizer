<?php
require_once('templater.php'); //подключаем конфигурационный файл
require_once('db.php'); //подключаем конфигурационный файл
$templater = new Templater();
$db = new DB();
if(isset($_POST['form_token'])) {
	$email = htmlspecialchars($_POST["email"], ENT_QUOTES);
	$passwd = md5(md5(md5($_POST["password"])));
	$selUser = $db->DQ("SELECT * FROM `users` WHERE `email` = '".$email."' and `password` = '".$passwd."'");
	if($db->DN($selUser) != 1) {
		exit('<script>alert("Вы ввели неверный логин и/или пароль");location.href="index.php";</script>');
	} else {
		$fUser = $db->DF($selUser);
		$_SESSION['id_user'] = $fUser['id'];
		header("Location: manage.php");
	}
} else {
		$title = 'Вход';
		$content = file_get_contents('templates/auth/form.tpl');

		echo $templater->getTemplate($title, $content);
}