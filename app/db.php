<?php
// session_start();
// error_reporting(-1);
header("Content-type: text/html; charset=utf-8");

class DB {
	// свойства с данными для подключения к БД
	private $host = 'localhost';
	private $user = 'root';
	private $passwd = '';
	private $dbname = 'project';
	public $db;
	private $result;

	function __construct() { // метод который срабатывает как только создаётся экземпляр (объект) текущего класса (автоматически инициализирует соединение с БД)
		$this->db = new mysqli($this->host, $this->user, $this->passwd, $this->dbname);
		$this->db->query("SET NAMES utf8");

	}

	function DQ($queryString) {
		$test = mysqli_query($this->db, $queryString) or die(mysqli_error($this->db));
		// var_dump($test);
		// exit();
		// $this->result = $this->db->query($queryString);
		return $this->result;
	}

	function DF($resultQuery) {
		return $resultQuery->fetch_assoc();
	}

	function DN($resultQuery) {
		return $resultQuery->num_rows;
	}
}