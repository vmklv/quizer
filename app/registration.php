<?php
require_once('db.php');
require_once('templater.php'); //подключаем конфигурационный файл
$objConfigs = new DB();
$templater = new Templater();
if(isset($_POST['form_token'])) { 
	$email = htmlspecialchars(strtolower($_POST['email']), ENT_QUOTES);
	$passwd = trim($_POST['password']); // trim() - очищает от пробелов
	$repasswd = trim($_POST['repassword']);
	$name = htmlspecialchars($_POST['name'], ENT_QUOTES);
	$surname = htmlspecialchars($_POST['surname'], ENT_QUOTES);
	$errors = '';

	$selUser = $objConfigs->DQ("SELECT * FROM `users` WHERE `email` = '".$email."'");
	if($objConfigs->DN($selUser) != 0) $errors .= 'email адрес уже занят';

	if(empty($email)) $errors .= 'Вы не ввели email адрес';
	if(empty($passwd)) $errors .= 'Вы не ввели пароль';
	if($passwd != $repasswd) $errors .= 'Введённые пароли не совпадают';
	if(empty($name)) $errors .= 'Вы не ввели имя';
	if(empty($surname)) $errors .= 'Вы не ввели фамилию';

	if(!empty($errors)) { // если переменная с ошибками не пустая - выводим сообщения об ошибках
		echo $errors;
	} else { // иначе хэшируем пароль и записываем пользователя в БД
		$passwd = md5(md5(md5($passwd)));
		$saveUser = $objConfigs->DQ("INSERT INTO `users`(`email`, `password`, `name`, `surname`) VALUES('".$email."', '".$passwd."', '".$name."', '".$surname."')");
		if($saveUser == true) exit("<script>alert('Регистрация успешно завершена');location.href='index.php';</script>");
		else exit("<script>alert('Произошёл сбой. Повторите попытку чуть позже');location.href='index.php';</script>");
	}
} else {
	$title = 'Регистрация';
	$content = file_get_contents('templates/registration/form.tpl');
	
	// echo $objConfigs->templater($title, $content); // вызываем метод templater и передаём туда заголовок и контент
	echo $templater->getTemplate($title, $content);
}