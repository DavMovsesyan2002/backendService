-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 02 2022 г., 18:17
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `deliveryservice`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fast_delivery`
--

CREATE TABLE `fast_delivery` (
  `id` int(11) NOT NULL,
  `targetKladr` varchar(40) NOT NULL,
  `km` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fast_delivery`
--

INSERT INTO `fast_delivery` (`id`, `targetKladr`, `km`) VALUES
(1, 'Voronezh', 526),
(2, 'Sochi', 1622),
(3, 'Erevan', 2238),
(4, 'Krasnodar', 1327);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `fast_delivery`
--
ALTER TABLE `fast_delivery`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `fast_delivery`
--
ALTER TABLE `fast_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
