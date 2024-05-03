-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 19 2024 г., 09:48
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `internet shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `consumers`
--

CREATE TABLE `consumers` (
  `id` int NOT NULL COMMENT 'id покупателя',
  `name` varchar(100) NOT NULL COMMENT 'ФИО',
  delivery_address varchar(100) NOT NULL COMMENT 'Адрес доставки',
  `email` varchar(100) DEFAULT NULL COMMENT 'электронная почта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `consumers`
--

INSERT INTO `consumers` (`id`, `name`, delivery_address, `email`) VALUES
(1, 'Плескач Марк Николаевич', 'г. Сургут, ул. Таежная д 4 к 1, кв 156 ', 'markmazic@yandex.ru'),
(2, 'Хасанов Даниил Анфалович', 'г. Сургут, ул. Ленина 8, кв 25', 'khasanov.dan@gmail.com'),
(3, 'Хохлова Ольга Витальевна', 'г. Сургут, ул. комсомольский проспект 34, кв 123', 'khohlova.olga@inbox.ru'),
(4, 'Хазиахметов Артур', 'Москва, ул. Генерала Иванова 31, п 5, кв 158', 'khazick.artur@gmail.com'),
(5, 'Кветкин Артур Александрович', 'Санкт-Петербург, ул. Алблака 52, п 2, кв 2', 'kvt.art@yandex.ru'),
(6, 'Рева Полина', 'г. Сургут, пгт Белый яр, ул. Сосновая 6, п 2, кв 111', 'reva.polina@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `order_myshop`
--

CREATE TABLE `order_myshop` (
  `id` int NOT NULL COMMENT 'id заказа',
  `id_consumers` int NOT NULL COMMENT 'id покупателя',
  `date_time_sending` datetime NOT NULL COMMENT 'дата отправки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `order_myshop`
--

INSERT INTO `order_myshop` (`id`, `id_consumers`, `date_time_sending`) VALUES
(1, 4, '2024-02-04 12:52:23'),
(2, 5, '2024-02-08 07:52:23'),
(3, 6, '2024-02-05 18:52:54'),
(4, 2, '2024-02-14 10:52:54'),
(5, 1, '2024-02-17 16:52:54'),
(6, 3, '2024-02-26 20:52:54');

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `id_consumers` int NOT NULL,
  `Date_time_pay` datetime NOT NULL,
  `price_payment` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id`, `id_consumers`, `Date_time_pay`, `price_payment`) VALUES
(1, 4, '2024-02-04 14:01:22', 15000),
(2, 5, '2024-02-06 12:01:22', 13212),
(4, 2, '2024-02-04 19:04:40', 7665),
(5, 1, '2024-02-04 15:01:22', 0),
(6, 3, '2024-02-04 15:01:22', 10500),
(7, 1, '2024-04-12 17:14:24', 6789),
(8, 1, '2024-04-13 17:14:24', 7899);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL COMMENT 'Id товара',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'наименование товара',
  `id_category` int NOT NULL COMMENT 'id_категория',
  `Weight` int DEFAULT NULL COMMENT 'вес',
  `price` int NOT NULL COMMENT 'цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `product_name`, `id_category`, `Weight`, `price`) VALUES
(1, 'АНОРАК SWOOSH', 1, NULL, 3500),
(2, 'ШТАНЫ DICKIES', 1, NULL, 4999),
(3, 'КЛЕТЧАТАЯ РУБАШКА PLUS SIZE С ДЛИННЫМ РУКАВОМ', 2, NULL, 1999),
(4, 'ПОВСЕДНЕВНЫЕ БРЮКИ КАРГО PLUS SIZE С БОКОВЫМИ КАРМАНАМИ', 2, NULL, 2999),
(5, 'ADIDAS CAMPUS 00S', 5, NULL, 6999),
(6, 'NIKE DUNK LOW PRO X STUSSY', 5, NULL, 7999),
(7, 'ПЛЮШЕВЫЕ ЗАКРЫТЫЕ ТАПОЧКИ КОШКИ', 6, NULL, 999),
(8, 'ОСЕННИЕ БОТИНКИ НА ВЫСОКОЙ ПОДОШВЕ', 6, NULL, 1599),
(9, 'СЕРЬГИ КОНГО КОЛЬЦА СЕРДЦА', 4, NULL, 299),
(10, 'ЗАКОЛКА КРАБ С КОРОВЬИМ ПРИНТОМ', 4, NULL, 199),
(11, 'ЦЕПОЧКА SWOOSH X LV', 3, NULL, 999),
(12, 'БРЕЛОК JORDAN', 3, NULL, 159);

-- --------------------------------------------------------

--
-- Структура таблицы `product_category`
--

CREATE TABLE `product_category` (
  `id` int NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `product_category`
--

INSERT INTO `product_category` (`id`, `category`) VALUES
(1, 'Мужская одежда'),
(2, 'Женская одежда'),
(3, 'Аксессуары мужские'),
(4, 'Аксессуары женские'),
(5, 'Обувь мужская'),
(6, 'Обувь женская');

-- --------------------------------------------------------

--
-- Структура таблицы `product_order`
--

CREATE TABLE `product_order` (
  `id` int NOT NULL COMMENT 'id товара заказа',
  `id_order` int NOT NULL COMMENT 'id заказа',
  `id_product` int NOT NULL COMMENT 'id товара',
  `quantity` int NOT NULL COMMENT 'количество товара',
  `price` int NOT NULL COMMENT 'цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `product_order`
--

INSERT INTO `product_order` (`id`, `id_order`, `id_product`, `quantity`, `price`) VALUES
(1, 1, 5, 1, 6999),
(2, 2, 7, 2, 7000),
(3, 3, 10, 5, 1000),
(4, 4, 8, 1, 4000),
(5, 5, 2, 1, 3000),
(6, 6, 3, 1, 3999),
(7, 2, 5, 1, 6999),
(8, 1, 12, 1, 999),
(9, 2, 2, 1, 3500),
(10, 3, 8, 1, 21482),
(11, 4, 9, 2, 700);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `consumers`
--
ALTER TABLE `consumers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_myshop`
--
ALTER TABLE `order_myshop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_consumers` (`id_consumers`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_consumers` (`id_consumers`),
  ADD KEY `sum` (`price_payment`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `product_order_ibfk_3` (`price`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `consumers`
--
ALTER TABLE `consumers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id покупателя', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `order_myshop`
--
ALTER TABLE `order_myshop`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id заказа', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id товара', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id товара заказа', AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_myshop`
--
ALTER TABLE `order_myshop`
  ADD CONSTRAINT `order_myshop_ibfk_1` FOREIGN KEY (`id_consumers`) REFERENCES `consumers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_consumers`) REFERENCES `consumers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `product_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order_myshop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
