<?php
session_start();
error_reporting(-1);
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
		$this->result = $this->db->query($queryString);
		return $this->result;
	}

	function DF($resultQuery) {
		return $resultQuery->fetch_assoc();
	}

	function DN($resultQuery) {
		return mysqli_num_rows($resultQuery);
	}

	function generateWord($countSymbols, $countStrings = 1) {
		$symbols = array('1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f','g','h','i','k','l','m','n','o','p','q','r','s','t','w','x','y','z');
		$currentCountStrings = 0;
		$words = '';
		$word = '';
		while($currentCountStrings < $countStrings) {
			$currentCountSymbols = 0;
			$word = '';
			while($currentCountSymbols < $countSymbols) {
				$word .= $symbols[rand(0, count($symbols) - 1)];
				$currentCountSymbols++;
			}
			$words .= '|'.$word;
			$currentCountStrings++;
		}
		$words = substr($words, 1);
		$this->result = $words;
		return $this->result;
	}
}