<?php
require_once('db.php');
$db = new DB();
if(isset($_GET['type']) && $_GET['type'] == 'get_notifications') {
	$notifications = '<ul>';
	$selSuccessed = $db->DQ("SELECT * FROM `surveys_successed` WHERE `creator_id` = '".$_SESSION['id_user']."' ORDER BY `id` DESC LIMIT 5");
	while($fSuccesed = $db->DF($selSuccessed)) {
		if($fSuccesed['user_id'] == 0) {
			$name = 'Гость';
		} else {
			$selUser = $db->DQ("SELECT * FROM `users` WHERE `id` = '".$fSuccesed['user_id']."'");
			$fUser = $db->DF($selUser);
			$name = $fUser['surname'].' '.$fUser['name'];
		}
		// достаём пройденный опрос
		$selSurvey = $db->DQ("SELECT * FROM `surveys` WHERE `id` = '".$fSuccesed['survey_id']."'");
		$fSurvey = $db->DF($selSurvey);
		$notifications .= '<li><span class="list-noti"><span class="name-noti">'.$name.'</span> прошёл опрос: '.$fSurvey['title'].'<span></li>';
	}
	$notifications .= '</ul>';

	echo $notifications;
}