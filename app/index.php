<?php
require_once('templater.php');
require_once('db.php');
$templater = new Templater();
$db = new DB();

$title = 'Главная страница';
// $content = file_get_contents('templates/registration/form.tpl');
$content = file_get_contents('templates/main/main.tpl');

echo $templater->templater($title, $content); // вызываем метод templater и передаём туда заголовок и контент