-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 30 2018 г., 15:15
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `project`
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

-- --------------------------------------------------------

--
-- Структура таблицы `surveys_answers`
--

CREATE TABLE `surveys_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(16) NOT NULL,
  `question_id` int(16) NOT NULL,
  `answer` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `surveys_questions`
--

CREATE TABLE `surveys_questions` (
  `id` int(11) NOT NULL,
  `survey_id` int(16) NOT NULL,
  `title` varchar(256) NOT NULL,
  `type` varchar(16) NOT NULL,
  `select_values` varchar(512) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(16) NOT NULL,
  `surname` varchar(16) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `avatar` int(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `surname`, `gender`, `birthday`, `avatar`) VALUES
(1, '1@1.ru', '7363a0d0604902af7b70b271a0b96480', 'Ivan', 'Ivanov', NULL, NULL, 0),
(2, '2@2.ru', '7363a0d0604902af7b70b271a0b96480', 'Ivan', '', NULL, NULL, 0),
(3, '1231@1231.ru', '7363a0d0604902af7b70b271a0b96480', '112123', '', NULL, NULL, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `surveys_answers`
--
ALTER TABLE `surveys_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `surveys_questions`
--
ALTER TABLE `surveys_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
