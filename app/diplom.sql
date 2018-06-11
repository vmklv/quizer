-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 08 2018 г., 15:57
-- Версия сервера: 10.1.32-MariaDB
-- Версия PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `diplom`
--

-- --------------------------------------------------------

--
-- Структура таблицы `surveys`
--

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `user_id` int(16) NOT NULL,
  `privacy` int(2) NOT NULL DEFAULT '0',
  `privacy_password` varchar(32) NOT NULL,
  `avatar` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `surveys`
--

INSERT INTO `surveys` (`id`, `title`, `user_id`, `privacy`, `privacy_password`, `avatar`) VALUES
(1, 'Заказ футболки', 1, 1, ' 123', 1),
(2, 'Контактные данные', 1, 0, ' ', 1),
(3, 'Заказ работ по ремонту ПК', 1, 0, ' ', 1),
(4, 'Проверь свой IQ', 1, 0, ' ', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `surveys_answers`
--

CREATE TABLE `surveys_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(16) NOT NULL,
  `question_id` int(16) NOT NULL,
  `answer` varchar(256) NOT NULL,
  `survey_id` int(16) NOT NULL,
  `session` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `surveys_answers`
--

INSERT INTO `surveys_answers` (`id`, `user_id`, `question_id`, `answer`, `survey_id`, `session`) VALUES
(1, 1, 7, 'Иван', 2, ''),
(2, 1, 8, 'Иванов', 2, ''),
(3, 1, 9, 'invanov@ivan.ivan', 2, ''),
(4, 1, 10, '899928138182', 2, ''),
(5, 1, 11, 'Мирный', 2, ''),
(6, 0, 7, 'Пётр', 2, '6zddfbbekl1x'),
(7, 0, 8, 'Петров', 2, '6zddfbbekl1x'),
(8, 0, 9, 'petrov@petr.petr', 2, '6zddfbbekl1x'),
(9, 0, 10, '89929832488', 2, '6zddfbbekl1x'),
(10, 0, 11, 'Москва', 2, '6zddfbbekl1x'),
(11, 0, 7, 'Александр', 2, '8blbsiizrfbi'),
(12, 0, 8, 'Александров', 2, '8blbsiizrfbi'),
(13, 0, 9, 'alexandrov@alexander.alexandr', 2, '8blbsiizrfbi'),
(14, 0, 10, '81239139', 2, '8blbsiizrfbi'),
(15, 0, 11, 'Питер', 2, '8blbsiizrfbi'),
(16, 1, 2, 'Иван', 1, ''),
(17, 1, 3, 'Надпись', 1, ''),
(18, 1, 4, 'XL', 1, ''),
(19, 1, 5, 'Промо', 1, ''),
(20, 1, 6, 'Коментарий', 1, ''),
(21, 0, 2, 'Гость', 1, 'grpagx9grci7'),
(22, 0, 3, 'Гость', 1, 'grpagx9grci7'),
(23, 0, 4, 'XS', 1, 'grpagx9grci7'),
(24, 0, 5, 'Про100', 1, 'grpagx9grci7'),
(25, 0, 6, 'Комент', 1, 'grpagx9grci7'),
(26, 0, 7, 'Иван', 2, 'x844l5rikwoq'),
(27, 0, 8, 'Иванов', 2, 'x844l5rikwoq'),
(28, 0, 9, 'ivanov@gmail.com', 2, 'x844l5rikwoq'),
(29, 0, 10, '98237598273982', 2, 'x844l5rikwoq'),
(30, 0, 11, 'Mirniy', 2, 'x844l5rikwoq'),
(31, 0, 12, 'иван', 3, 'hy71gwh6sa8r'),
(32, 0, 13, 'проблема', 3, 'hy71gwh6sa8r'),
(33, 0, 14, '1983198230918', 3, 'hy71gwh6sa8r'),
(34, 0, 15, '5', 3, 'hy71gwh6sa8r'),
(35, 5, 7, 'Ivan', 2, ''),
(36, 5, 8, 'Ivanov', 2, ''),
(37, 5, 9, 'ivn@mail.com', 2, ''),
(38, 5, 10, '123123123', 2, ''),
(39, 5, 11, '1231', 2, ''),
(40, 0, 12, 'Кек', 3, 'iqcb8zrd697q'),
(41, 0, 13, 'Кек', 3, 'iqcb8zrd697q'),
(42, 0, 14, '19823918239819', 3, 'iqcb8zrd697q'),
(43, 0, 15, '6', 3, 'iqcb8zrd697q');

-- --------------------------------------------------------

--
-- Структура таблицы `surveys_questions`
--

CREATE TABLE `surveys_questions` (
  `id` int(11) NOT NULL,
  `survey_id` int(16) NOT NULL,
  `content` longtext NOT NULL,
  `type` varchar(16) NOT NULL,
  `title` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `surveys_questions`
--

INSERT INTO `surveys_questions` (`id`, `survey_id`, `content`, `type`, `title`) VALUES
(2, 1, '', 'text', 'Ваше имя'),
(3, 1, '', 'text', 'Надпись на футболке'),
(4, 1, 'XS|S|M|L|XL|XXL', 'select', 'Размер'),
(5, 1, '', 'text', 'Промокод'),
(6, 1, '', 'text', 'Коментарий'),
(7, 2, '', 'text', 'Имя'),
(8, 2, '', 'text', 'Фамилия'),
(9, 2, '', 'text', 'Адрес эл. почты'),
(10, 2, '', 'number', 'Телефон'),
(11, 2, '', 'text', 'Адрес'),
(12, 3, '', 'text', 'Ваше имя'),
(13, 3, '', 'text', 'Описание проблемы'),
(14, 3, '', 'number', 'Номер телефона'),
(15, 3, '', 'number', 'Срочность работ (от 1 до 5)'),
(17, 4, '', 'text', 'два умножить два'),
(18, 4, '', 'number', 'три умножить на три'),
(19, 4, '', 'text', 'четыре на четыре'),
(20, 4, 'Я знаю | я не знаю | 26', 'select', 'пять на пять'),
(21, 4, '', 'text', 'восемнадцать умножить на сто пятьдесят восемь'),
(22, 4, '', 'number', 'восемнадцать умножить на сто пятьдесят семь'),
(23, 4, '', 'text', 'восемнадцать умножить на сто пятьдесят шесть'),
(24, 4, '', 'number', 'восемнадцать умножить на сто пятьдесят пять'),
(25, 4, '', 'text', 'восемнадцать умножить на сто пятьдесят четыре'),
(26, 4, '', 'number', 'восемнадцать умножить на сто пятьдесят три');

-- --------------------------------------------------------

--
-- Структура таблицы `surveys_successed`
--

CREATE TABLE `surveys_successed` (
  `id` int(11) NOT NULL,
  `user_id` int(16) NOT NULL,
  `survey_id` int(16) NOT NULL,
  `creator_id` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `surveys_successed`
--

INSERT INTO `surveys_successed` (`id`, `user_id`, `survey_id`, `creator_id`) VALUES
(1, 1, 2, NULL),
(2, 0, 2, NULL),
(3, 0, 2, NULL),
(4, 1, 1, 1),
(5, 0, 1, 1),
(6, 0, 2, 1),
(7, 0, 3, 1),
(8, 5, 2, 1),
(9, 0, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(16) NOT NULL,
  `surname` varchar(16) NOT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `birthday` varchar(32) DEFAULT NULL,
  `avatar` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `surname`, `gender`, `birthday`, `avatar`) VALUES
(1, 'ivanov@gmail.com', '7363a0d0604902af7b70b271a0b96480', 'Админ', 'Админыч', 'male', '', 1),
(5, 'i@mail.com', '7363a0d0604902af7b70b271a0b96480', 'Иван', 'Иванов', NULL, NULL, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `surveys_answers`
--
ALTER TABLE `surveys_answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `surveys_questions`
--
ALTER TABLE `surveys_questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `surveys_successed`
--
ALTER TABLE `surveys_successed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `surveys_answers`
--
ALTER TABLE `surveys_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT для таблицы `surveys_questions`
--
ALTER TABLE `surveys_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `surveys_successed`
--
ALTER TABLE `surveys_successed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
