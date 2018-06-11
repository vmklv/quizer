<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>{{%title%}}</title>
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/slick/slick.css" rel="stylesheet">
	<link href="css/slick/slick-theme.css" rel="stylesheet">
	<link href="css/main.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/fontello.css">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<header>
		{{%nav-menu%}}
	</header>
	<div class="main">
		<div class="container">
			{{%content%}}
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="col-md-4 col-lg-4">
				<div class="links">
					<ul class="footer-menu">
						<li>
							<p>Навигация</p>
						</li>
						<li>
							<a href="/">Главная</a>
						</li>
						<li>
							<a href="http://project.com/manage.php">Мои вопросы</a>
						</li>
						<li>
							<a href="http://project.com/manage.php?type=new">Создать опрос</a>
						</li>
						<li>
							<a href="http://project.com/settings.php">Настройки</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-4 col-lg-4">

			</div>
			<div class="col-md-4 col-lg-4">
				<div class="socials">
					<a href="http://t.me/QuizerdevBot">
						<i class="icon-telegram"></i>
					</a>
					<a href="https://medium.com/@markelov">
						<i class="icon-medium"></i>
					</a>
					<a href="https://github.com/vsmarkelov">
						<i class="icon-github-circled"></i>
					</a>
					<a href="http://vk.com/">
						<i class=" icon-vkontakte"></i>
					</a>
					<a href="http://twitter.com/vsmarkelov">
						<i class="icon-twitter"></i>
					</a>
				</div>
			</div>
		</div>
	</footer>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery2.0.js"></script>
	<script src="css/slick/slick.min.js"></script>
	<script src="js/script.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
</body>

</html>