-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 08 2017 г., 07:43
-- Версия сервера: 5.7.19
-- Версия PHP: 7.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `maiancart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `mc_accounts`
--

CREATE TABLE `mc_accounts` (
  `id` int(5) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `created` date NOT NULL DEFAULT '0000-00-00',
  `email` varchar(250) NOT NULL DEFAULT '',
  `pass` varchar(40) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `verified` enum('yes','no') NOT NULL DEFAULT 'no',
  `timezone` varchar(50) NOT NULL DEFAULT '0',
  `ip` text,
  `notes` text,
  `reason` text,
  `system1` varchar(250) NOT NULL DEFAULT '',
  `system2` varchar(250) NOT NULL DEFAULT '',
  `language` varchar(100) NOT NULL DEFAULT '',
  `currency` varchar(100) NOT NULL DEFAULT '',
  `enablelog` enum('yes','no') NOT NULL DEFAULT 'yes',
  `newsletter` enum('yes','no') NOT NULL DEFAULT 'no',
  `message` text,
  `messageexp` date NOT NULL DEFAULT '0000-00-00',
  `type` enum('personal','trade') NOT NULL DEFAULT 'personal',
  `tradediscount` varchar(5) NOT NULL DEFAULT '',
  `minqty` varchar(10) NOT NULL DEFAULT '',
  `maxqty` varchar(10) NOT NULL DEFAULT '0',
  `stocklevel` varchar(10) NOT NULL DEFAULT '',
  `mincheckout` varchar(20) NOT NULL DEFAULT '0.00',
  `trackcode` varchar(100) NOT NULL DEFAULT '',
  `params` text,
  `recent` text,
  `wishtext` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_accounts_search`
--

CREATE TABLE `mc_accounts_search` (
  `id` int(11) UNSIGNED NOT NULL,
  `account` int(6) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL DEFAULT '',
  `saved` date NOT NULL DEFAULT '0000-00-00',
  `name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_accounts_wish`
--

CREATE TABLE `mc_accounts_wish` (
  `id` int(11) UNSIGNED NOT NULL,
  `account` int(6) NOT NULL DEFAULT '0',
  `product` int(8) NOT NULL DEFAULT '0',
  `saved` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_activation_history`
--

CREATE TABLE `mc_activation_history` (
  `id` int(7) UNSIGNED NOT NULL,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `products` text,
  `restoreDate` date NOT NULL DEFAULT '0000-00-00',
  `restoreTime` time NOT NULL DEFAULT '00:00:00',
  `adminUser` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_addressbook`
--

CREATE TABLE `mc_addressbook` (
  `id` int(5) NOT NULL,
  `account` int(8) NOT NULL DEFAULT '0',
  `nm` varchar(250) NOT NULL DEFAULT '',
  `em` varchar(250) NOT NULL DEFAULT '',
  `addr1` varchar(250) NOT NULL DEFAULT '',
  `addr2` varchar(250) NOT NULL DEFAULT '',
  `addr3` varchar(250) NOT NULL DEFAULT '',
  `addr4` varchar(250) NOT NULL DEFAULT '',
  `addr5` varchar(250) NOT NULL DEFAULT '',
  `addr6` varchar(250) NOT NULL DEFAULT '',
  `addr7` varchar(250) NOT NULL DEFAULT '',
  `addr8` varchar(250) NOT NULL DEFAULT '',
  `default` enum('yes','no') NOT NULL DEFAULT 'yes',
  `type` enum('bill','ship') NOT NULL DEFAULT 'bill',
  `zone` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_attachments`
--

CREATE TABLE `mc_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `statusID` int(7) NOT NULL DEFAULT '0',
  `attachFolder` varchar(100) NOT NULL DEFAULT '',
  `fileName` varchar(100) NOT NULL DEFAULT '',
  `fileType` varchar(100) NOT NULL DEFAULT '',
  `fileSize` varchar(100) NOT NULL DEFAULT '',
  `isSaved` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_attributes`
--

CREATE TABLE `mc_attributes` (
  `id` int(7) NOT NULL,
  `productID` int(10) NOT NULL DEFAULT '0',
  `attrGroup` int(10) NOT NULL DEFAULT '0',
  `attrName` varchar(100) NOT NULL DEFAULT '',
  `attrCost` varchar(50) NOT NULL DEFAULT '',
  `attrStock` int(10) NOT NULL DEFAULT '0',
  `attrWeight` varchar(50) NOT NULL DEFAULT '',
  `orderBy` int(7) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_attr_groups`
--

CREATE TABLE `mc_attr_groups` (
  `id` int(7) NOT NULL,
  `productID` int(10) NOT NULL DEFAULT '0',
  `groupName` varchar(100) NOT NULL DEFAULT '',
  `orderBy` int(7) NOT NULL DEFAULT '0',
  `allowMultiple` enum('yes','no') NOT NULL DEFAULT 'no',
  `isRequired` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_banners`
--

CREATE TABLE `mc_banners` (
  `id` int(4) UNSIGNED NOT NULL,
  `bannerFile` varchar(250) NOT NULL DEFAULT '0',
  `bannerText` varchar(250) NOT NULL DEFAULT '0',
  `bannerUrl` varchar(250) NOT NULL DEFAULT '0',
  `bannerLive` enum('yes','no') NOT NULL DEFAULT 'yes',
  `bannerOrder` int(6) NOT NULL DEFAULT '0',
  `bannerCats` text,
  `bannerHome` enum('yes','no') NOT NULL DEFAULT 'no',
  `bannerFrom` date NOT NULL DEFAULT '0000-00-00',
  `bannerTo` date NOT NULL DEFAULT '0000-00-00',
  `trade` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_blog`
--

CREATE TABLE `mc_blog` (
  `id` int(7) NOT NULL,
  `title` text,
  `message` text,
  `created` int(13) NOT NULL DEFAULT '0',
  `published` int(13) NOT NULL DEFAULT '0',
  `autodelete` int(13) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_boxes`
--

CREATE TABLE `mc_boxes` (
  `id` tinyint(1) NOT NULL,
  `ident` varchar(250) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL DEFAULT '',
  `status` enum('yes','no') NOT NULL DEFAULT 'yes',
  `tmp` varchar(250) NOT NULL DEFAULT '',
  `orderby` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_boxes`
--

INSERT INTO `mc_boxes` (`id`, `ident`, `name`, `status`, `tmp`, `orderby`) VALUES
(1, 'points', 'Price Points', 'yes', '', 1),
(2, 'popular', 'Most Popular Products', 'yes', '', 3),
(3, 'tweets', 'Latest Tweets', 'yes', '', 5),
(4, 'recent', 'Most Recently Viewed', 'yes', '', 4),
(5, 'links', 'Other Links', 'yes', '', 8),
(6, 'brands', 'Brands', 'yes', '', 2),
(7, 'rss', 'News', 'yes', '', 6),
(8, '', 'Custom Link', 'yes', 'box-example.tpl.php', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_brands`
--

CREATE TABLE `mc_brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `bCat` varchar(50) NOT NULL DEFAULT 'all',
  `enBrand` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rwslug` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_campaigns`
--

CREATE TABLE `mc_campaigns` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `cName` varchar(250) NOT NULL DEFAULT '',
  `cDiscountCode` varchar(50) NOT NULL DEFAULT '',
  `cMin` varchar(50) NOT NULL DEFAULT '0.00',
  `cUsage` int(5) NOT NULL DEFAULT '0',
  `cExpiry` date NOT NULL DEFAULT '0000-00-00',
  `cDiscount` varchar(20) NOT NULL DEFAULT '',
  `cAdded` date DEFAULT '0000-00-00',
  `cLive` enum('yes','no') NOT NULL DEFAULT 'yes',
  `categories` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_categories`
--

CREATE TABLE `mc_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `catname` varchar(250) NOT NULL,
  `titleBar` varchar(250) NOT NULL DEFAULT '',
  `comments` text,
  `catLevel` tinyint(1) NOT NULL DEFAULT '0',
  `childOf` int(6) NOT NULL DEFAULT '0',
  `metaDesc` text,
  `metaKeys` text,
  `enCat` enum('yes','no') NOT NULL DEFAULT 'yes',
  `orderBy` int(5) NOT NULL DEFAULT '0',
  `enDisqus` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeShipping` enum('yes','no') NOT NULL DEFAULT 'no',
  `imgIcon` varchar(100) NOT NULL DEFAULT '',
  `showRelated` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rwslug` varchar(250) NOT NULL DEFAULT '',
  `theme` varchar(200) NOT NULL DEFAULT '',
  `vis` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_click_history`
--

CREATE TABLE `mc_click_history` (
  `id` int(7) UNSIGNED NOT NULL,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `purchaseID` int(7) NOT NULL DEFAULT '0',
  `productID` int(7) NOT NULL DEFAULT '0',
  `clickDate` date NOT NULL DEFAULT '0000-00-00',
  `clickTime` time NOT NULL DEFAULT '00:00:00',
  `clickIP` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_comparisons`
--

CREATE TABLE `mc_comparisons` (
  `id` int(10) UNSIGNED NOT NULL,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `thisProduct` int(7) NOT NULL DEFAULT '0',
  `thatProduct` int(7) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_countries`
--

CREATE TABLE `mc_countries` (
  `id` int(4) UNSIGNED NOT NULL,
  `cName` varchar(250) NOT NULL DEFAULT '',
  `cISO` varchar(3) NOT NULL,
  `cISO_2` char(2) NOT NULL DEFAULT '',
  `iso4217` varchar(50) NOT NULL DEFAULT '0',
  `enCountry` enum('yes','no') NOT NULL DEFAULT 'no',
  `localPickup` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeship` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_countries`
--

INSERT INTO `mc_countries` (`id`, `cName`, `cISO`, `cISO_2`, `iso4217`, `enCountry`, `localPickup`, `freeship`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '004', 'no', 'no', 'no'),
(2, 'Albania', 'ALB', 'AL', '008', 'no', 'no', 'no'),
(3, 'Algeria', 'DZA', 'DZ', '012', 'no', 'no', 'no'),
(4, 'Andorra', 'AND', 'AD', '020', 'no', 'no', 'no'),
(5, 'Angola', 'AGO', 'AO', '024', 'no', 'no', 'no'),
(6, 'Antigua and Barbuda', 'ATG', 'AG', '028', 'no', 'no', 'no'),
(7, 'Argentina', 'ARG', 'AR', '032', 'no', 'no', 'no'),
(8, 'Armenia', 'ARM', 'AM', '051', 'no', 'no', 'no'),
(9, 'Australia', 'AUS', 'AU', '036', 'no', 'no', 'no'),
(10, 'Austria', 'AUT', 'AT', '040', 'no', 'no', 'no'),
(11, 'Azerbaijan', 'AZE', 'AZ', '031', 'no', 'no', 'no'),
(12, 'Bahamas', 'BHS', 'BS', '044', 'no', 'no', 'no'),
(13, 'Bahrain', 'BHR', 'BH', '048', 'no', 'no', 'no'),
(14, 'Bangladesh', 'BGD', 'BD', '050', 'no', 'no', 'no'),
(15, 'Barbados', 'BRB', 'BB', '052', 'no', 'no', 'no'),
(16, 'Belarus', 'BLR', 'BY', '112', 'no', 'no', 'no'),
(17, 'Belgium', 'BEL', 'BE', '056', 'no', 'no', 'no'),
(18, 'Belize', 'BLZ', 'BZ', '084', 'no', 'no', 'no'),
(19, 'Benin', 'BEN', 'BJ', '204', 'no', 'no', 'no'),
(20, 'Bhutan', 'BTN', 'BT', '064', 'no', 'no', 'no'),
(21, 'Bolivia', 'BOL', 'BO', '068', 'no', 'no', 'no'),
(22, 'Bosnia and Herzegovina', 'BIH', 'BA', '070', 'no', 'no', 'no'),
(23, 'Botswana', 'BWA', 'BW', '072', 'no', 'no', 'no'),
(24, 'Brazil', 'BRA', 'BR', '076', 'no', 'no', 'no'),
(25, 'Brunei', 'BRN', 'BN', '096', 'no', 'no', 'no'),
(26, 'Bulgaria', 'BGR', 'BG', '100', 'no', 'no', 'no'),
(27, 'Burkina Faso', 'BFA', 'BF', '854', 'no', 'no', 'no'),
(28, 'Burundi', 'BDI', 'BI', '108', 'no', 'no', 'no'),
(29, 'Cambodia', 'KHM', 'KH', '116', 'no', 'no', 'no'),
(30, 'Cameroon', 'CMR', 'CM', '120', 'no', 'no', 'no'),
(31, 'Canada', 'CAN', 'CA', '124', 'no', 'no', 'no'),
(32, 'Cape Verde', 'CPV', 'CV', '132', 'no', 'no', 'no'),
(33, 'Central African Republic', 'CAF', 'CF', '140', 'no', 'no', 'no'),
(34, 'Chad', 'TCD', 'TD', '148', 'no', 'no', 'no'),
(35, 'Chile', 'CHL', 'CL', '152', 'no', 'no', 'no'),
(36, 'China', 'CHN', 'CN', '156', 'no', 'no', 'no'),
(37, 'Colombia', 'COL', 'CO', '170', 'no', 'no', 'no'),
(38, 'Comoros', 'COM', 'KM', '174', 'no', 'no', 'no'),
(39, 'Congo', 'COG', 'CG', '178', 'no', 'no', 'no'),
(41, 'Costa Rica', 'CRI', 'CK', '184', 'no', 'no', 'no'),
(42, 'Cote d\'Ivoire', 'CIV', 'CR', '188', 'no', 'no', 'no'),
(43, 'Croatia', 'HRV', 'HR', '191', 'no', 'no', 'no'),
(44, 'Cuba', 'CUB', 'CU', '192', 'no', 'no', 'no'),
(45, 'Cyprus', 'CYP', 'CY', '196', 'no', 'no', 'no'),
(46, 'Czech Republic', 'CZE', 'CZ', '203', 'no', 'no', 'no'),
(47, 'Denmark', 'DNK', 'DK', '208', 'no', 'no', 'no'),
(48, 'Djibouti', 'DJI', 'DJ', '262', 'no', 'no', 'no'),
(49, 'Dominica', 'DMA', 'DM', '212', 'no', 'no', 'no'),
(50, 'Dominican Republic', 'DOM', 'DO', '214', 'no', 'no', 'no'),
(51, 'Ecuador', 'ECU', 'EC', '218', 'no', 'no', 'no'),
(52, 'Egypt', 'EGY', 'EG', '818', 'no', 'no', 'no'),
(53, 'El Salvador', 'SLV', 'SV', '222', 'no', 'no', 'no'),
(54, 'Equatorial Guinea', 'GNQ', 'GQ', '226', 'no', 'no', 'no'),
(55, 'Eritrea', 'ERI', 'ER', '232', 'no', 'no', 'no'),
(56, 'Estonia', 'EST', 'EE', '233', 'no', 'no', 'no'),
(57, 'Ethiopia', 'ETH', 'ET', '231', 'no', 'no', 'no'),
(58, 'Fiji', 'FJI', 'FJ', '242', 'no', 'no', 'no'),
(59, 'Finland', 'FIN', 'FI', '246', 'no', 'no', 'no'),
(60, 'France', 'FRA', 'FR', '250', 'no', 'no', 'no'),
(61, 'Gabon', 'GAB', 'GA', '266', 'no', 'no', 'no'),
(62, 'Gambia', 'GMB', 'GM', '270', 'no', 'no', 'no'),
(63, 'Georgia', 'GEO', 'GE', '268', 'no', 'no', 'no'),
(64, 'Germany', 'DEU', 'DE', '276', 'no', 'no', 'no'),
(65, 'Ghana', 'GHA', 'GH', '288', 'no', 'no', 'no'),
(66, 'Greece', 'GRC', 'GR', '300', 'no', 'no', 'no'),
(67, 'Grenada', 'GRD', 'GD', '308', 'no', 'no', 'no'),
(68, 'Guatemala', 'GTM', 'GT', '320', 'no', 'no', 'no'),
(69, 'Guinea', 'GIN', 'GN', '324', 'no', 'no', 'no'),
(70, 'Guinea-Bissau', 'GNB', 'GW', '624', 'no', 'no', 'no'),
(71, 'Guyana', 'GUY', 'GY', '328', 'no', 'no', 'no'),
(72, 'Haiti', 'HTI', 'HT', '332', 'no', 'no', 'no'),
(73, 'Honduras', 'HND', 'HN', '340', 'no', 'no', 'no'),
(74, 'Hungary', 'HUN', 'HU', '348', 'no', 'no', 'no'),
(75, 'Iceland', 'ISL', 'IS', '352', 'no', 'no', 'no'),
(76, 'India', 'IND', 'IN', '356', 'no', 'no', 'no'),
(77, 'Indonesia', 'IDN', 'ID', '360', 'no', 'no', 'no'),
(78, 'Iran', 'IRN', 'IR', '364', 'no', 'no', 'no'),
(79, 'Iraq', 'IRQ', 'IQ', '368', 'no', 'no', 'no'),
(80, 'Ireland', 'IRL', 'IE', '372', 'no', 'no', 'no'),
(81, 'Israel', 'ISR', 'IL', '376', 'no', 'no', 'no'),
(82, 'Italy', 'ITA', 'IT', '380', 'no', 'no', 'no'),
(83, 'Jamaica', 'JAM', 'JM', '388', 'no', 'no', 'no'),
(84, 'Japan', 'JPN', 'JP', '392', 'no', 'no', 'no'),
(85, 'Jordan', 'JOR', 'JO', '400', 'no', 'no', 'no'),
(86, 'Kazakhstan', 'KAZ', 'KZ', '398', 'no', 'no', 'no'),
(87, 'Kenya', 'KEN', 'KE', '404', 'no', 'no', 'no'),
(88, 'Kiribati', 'KIR', 'KI', '296', 'no', 'no', 'no'),
(89, 'South Korea', 'KOR', 'KR', '410', 'no', 'no', 'no'),
(90, 'North Korea', 'PRK', 'KP', '408', 'no', 'no', 'no'),
(91, 'Kuwait', 'KWT', 'KW', '414', 'no', 'no', 'no'),
(92, 'Kyrgyzstan', 'KGZ', 'KG', '417', 'no', 'no', 'no'),
(93, 'Laos', 'LAO', 'LA', '418', 'no', 'no', 'no'),
(94, 'Latvia', 'LVA', 'LV', '428', 'no', 'no', 'no'),
(95, 'Lebanon', 'LBN', 'LB', '422', 'no', 'no', 'no'),
(96, 'Lesotho', 'LSO', 'LS', '426', 'no', 'no', 'no'),
(97, 'Liberia', 'LBR', 'LR', '430', 'no', 'no', 'no'),
(98, 'Libya', 'LBY', 'LY', '434', 'no', 'no', 'no'),
(99, 'Liechtenstein', 'LIE', 'LI', '438', 'no', 'no', 'no'),
(100, 'Lithuania', 'LTU', 'LT', '440', 'no', 'no', 'no'),
(101, 'Luxembourg', 'LUX', 'LU', '442', 'no', 'no', 'no'),
(102, 'Macedonia', 'MKD', 'MK', '807', 'no', 'no', 'no'),
(103, 'Madagascar', 'MDG', 'MG', '450', 'no', 'no', 'no'),
(104, 'Malawi', 'MWI', 'MW', '454', 'no', 'no', 'no'),
(105, 'Malaysia', 'MYS', 'MY', '458', 'no', 'no', 'no'),
(106, 'Maldives', 'MDV', 'MV', '462', 'no', 'no', 'no'),
(107, 'Mali', 'MLI', 'ML', '466', 'no', 'no', 'no'),
(108, 'Malta', 'MLT', 'MT', '470', 'no', 'no', 'no'),
(109, 'Marshall Islands', 'MHL', 'MH', '584', 'no', 'no', 'no'),
(110, 'Mauritania', 'MRT', 'MR', '478', 'no', 'no', 'no'),
(111, 'Mauritius', 'MUS', 'MU', '480', 'no', 'no', 'no'),
(112, 'Mexico', 'MEX', 'MX', '484', 'no', 'no', 'no'),
(113, 'Micronesia', 'FSM', 'FM', '583', 'no', 'no', 'no'),
(114, 'Moldova', 'MDA', 'MD', '498', 'no', 'no', 'no'),
(115, 'Monaco', 'MCO', 'MC', '492', 'no', 'no', 'no'),
(116, 'Mongolia', 'MNG', 'MN', '496', 'no', 'no', 'no'),
(117, 'Montenegro', 'MNE', 'ME', '499', 'no', 'no', 'no'),
(118, 'Morocco', 'MAR', 'MA', '504', 'no', 'no', 'no'),
(119, 'Mozambique', 'MOZ', 'MZ', '508', 'no', 'no', 'no'),
(120, 'Myanmar (Burma)', 'MMR', 'MM', '104', 'no', 'no', 'no'),
(121, 'Namibia', 'NAM', 'NA', '516', 'no', 'no', 'no'),
(122, 'Nauru', 'NRU', 'NR', '520', 'no', 'no', 'no'),
(123, 'Nepal', 'NPL', 'NP', '524', 'no', 'no', 'no'),
(124, 'Netherlands', 'NLD', 'NL', '528', 'no', 'no', 'no'),
(125, 'New Zealand', 'NZL', 'NZ', '554', 'no', 'no', 'no'),
(126, 'Nicaragua', 'NIC', 'NI', '558', 'no', 'no', 'no'),
(127, 'Niger', 'NER', 'NE', '562', 'no', 'no', 'no'),
(128, 'Nigeria', 'NGA', 'NG', '566', 'no', 'no', 'no'),
(129, 'Norway', 'NOR', 'NO', '578', 'no', 'no', 'no'),
(130, 'Oman', 'OMN', 'OM', '512', 'no', 'no', 'no'),
(131, 'Pakistan', 'PAK', 'PK', '586', 'no', 'no', 'no'),
(132, 'Palau', 'PLW', 'PW', '585', 'no', 'no', 'no'),
(133, 'Panama', 'PAN', 'PA', '591', 'no', 'no', 'no'),
(134, 'Papua New Guinea', 'PNG', 'PG', '598', 'no', 'no', 'no'),
(135, 'Paraguay', 'PRY', 'PY', '600', 'no', 'no', 'no'),
(136, 'Peru', 'PER', 'PE', '604', 'no', 'no', 'no'),
(137, 'Philippines', 'PHL', 'PH', '608', 'no', 'no', 'no'),
(138, 'Poland', 'POL', 'PL', '616', 'no', 'no', 'no'),
(139, 'Portugal', 'PRT', 'PT', '620', 'no', 'no', 'no'),
(140, 'Qatar', 'QAT', 'QA', '634', 'no', 'no', 'no'),
(141, 'Romania', 'ROU', 'RO', '642', 'no', 'no', 'no'),
(142, 'Russian Federation', 'RUS', 'RU', '643', 'no', 'no', 'no'),
(143, 'Rwanda', 'RWA', 'RW', '646', 'no', 'no', 'no'),
(144, 'Saint Kitts and Nevis', 'KNA', 'KN', '659', 'no', 'no', 'no'),
(145, 'Saint Lucia', 'LCA', 'LC', '662', 'no', 'no', 'no'),
(146, 'Saint Vincent and the Grenadines', 'VCT', 'VC', '670', 'no', 'no', 'no'),
(147, 'Samoa', 'WSM', 'WS', '882', 'no', 'no', 'no'),
(148, 'San Marino', 'SMR', 'SM', '674', 'no', 'no', 'no'),
(149, 'Sao Tome and Principe', 'STP', 'ST', '678', 'no', 'no', 'no'),
(150, 'Saudi Arabia', 'SAU', 'SA', '682', 'no', 'no', 'no'),
(151, 'Senegal', 'SEN', 'SN', '686', 'no', 'no', 'no'),
(152, 'Serbia', 'SRB', 'RS', '688', 'no', 'no', 'no'),
(153, 'Seychelles', 'SYC', 'SC', '690', 'no', 'no', 'no'),
(154, 'Sierra Leone', 'SLE', 'SL', '694', 'no', 'no', 'no'),
(155, 'Singapore', 'SGP', 'SG', '702', 'no', 'no', 'no'),
(156, 'Slovakia', 'SVK', 'SK', '703', 'no', 'no', 'no'),
(157, 'Slovenia', 'SVN', 'SI', '705', 'no', 'no', 'no'),
(159, 'Somalia', 'SOM', 'SO', '706', 'no', 'no', 'no'),
(160, 'South Africa', '+27', 'ZA', '710', 'no', 'no', 'no'),
(161, 'Spain', 'ESP', 'ES', '724', 'no', 'no', 'no'),
(162, 'Sri Lanka', 'LKA', 'LK', '144', 'no', 'no', 'no'),
(163, 'Sudan', 'SDN', 'SD', '736', 'no', 'no', 'no'),
(164, 'Suriname', 'SUR', 'SR', '740', 'no', 'no', 'no'),
(165, 'Swaziland', 'SWZ', 'SZ', '748', 'no', 'no', 'no'),
(166, 'Sweden', 'SWE', 'SE', '752', 'no', 'no', 'no'),
(167, 'Switzerland', 'CHE', 'CH', '756', 'no', 'no', 'no'),
(168, 'Syrian Arab Republic', 'SYR', 'SY', '760', 'no', 'no', 'no'),
(169, 'Tajikistan', 'TJK', 'TJ', '762', 'no', 'no', 'no'),
(170, 'Tanzania', 'TZA', 'TZ', '834', 'no', 'no', 'no'),
(171, 'Thailand', 'THA', 'TH', '764', 'no', 'no', 'no'),
(172, 'Timor-Leste (East Timor)', 'TLS', 'TL', '626', 'no', 'no', 'no'),
(173, 'Togo', 'TGO', 'TG', '768', 'no', 'no', 'no'),
(174, 'Tonga', 'TON', 'TO', '776', 'no', 'no', 'no'),
(175, 'Trinidad and Tobago', 'TTO', 'TT', '780', 'no', 'no', 'no'),
(176, 'Tunisia', 'TUN', 'TN', '788', 'no', 'no', 'no'),
(177, 'Turkey', 'TUR', 'TR', '792', 'no', 'no', 'no'),
(178, 'Turkmenistan', 'TKM', 'TM', '795', 'no', 'no', 'no'),
(179, 'Tuvalu', 'TUV', 'TV', '798', 'no', 'no', 'no'),
(180, 'Uganda', 'UGA', 'UG', '800', 'no', 'no', 'no'),
(181, 'Ukraine', 'UKR', 'UA', '804', 'no', 'no', 'no'),
(182, 'United Arab Emirates', 'ARE', 'AE', '784', 'no', 'no', 'no'),
(183, 'United Kingdom', 'GBR', 'GB', '826', 'yes', 'yes', 'no'),
(184, 'United States', 'USA', 'US', '840', 'yes', 'yes', 'no'),
(185, 'Uruguay', 'URY', 'UY', '858', 'no', 'no', 'no'),
(186, 'Uzbekistan', 'UZB', 'UZ', '860', 'no', 'no', 'no'),
(187, 'Vanuatu', 'VUT', 'VU', '548', 'no', 'no', 'no'),
(188, 'Vatican City', 'VAT', 'VA', '336', 'no', 'no', 'no'),
(189, 'Venezuela', 'VEN', 'VE', '862', 'no', 'no', 'no'),
(190, 'Vietnam', 'VNM', 'VN', '704', 'no', 'no', 'no'),
(191, 'Yemen', 'YEM', 'YE', '887', 'no', 'no', 'no'),
(192, 'Zambia', 'ZMB', 'ZM', '894', 'no', 'no', 'no'),
(193, 'Zimbabwe', 'ZWE', 'ZW', '716', 'no', 'no', 'no'),
(202, 'Christmas Island', 'CXR', 'CX', '162', 'no', 'no', 'no'),
(203, 'Cocos (Keeling) Islands', 'CCK', 'CC', '166', 'no', 'no', 'no'),
(205, 'Heard Island and McDonald Islands', 'HMD', 'HM', '334', 'no', 'no', 'no'),
(206, 'Norfolk Island', 'NFK', 'NF', '574', 'no', 'no', 'no'),
(207, 'New Caledonia', 'NCL', 'NC', '540', 'no', 'no', 'no'),
(208, 'French Polynesia', 'PYF', 'PF', '258', 'no', 'no', 'no'),
(209, 'Mayotte', 'MYT', 'YT', '175', 'no', 'no', 'no'),
(210, 'Saint Barthelemy', 'GLP', 'BL', '652', 'no', 'no', 'no'),
(211, 'Saint Martin', 'GLP', 'MF', '663', 'no', 'no', 'no'),
(212, 'Saint Pierre and Miquelon', 'SPM', 'PM', '666', 'no', 'no', 'no'),
(213, 'Wallis and Futuna', 'WLF', 'WF', '876', 'no', 'no', 'no'),
(214, 'French Southern and Antarctic Lands', 'ATF', 'TF', '260', 'no', 'no', 'no'),
(216, 'Bouvet Island', 'BVT', 'BV', '074', 'no', 'no', 'no'),
(217, 'Cook Islands', 'COK', 'CD', '180', 'no', 'no', 'no'),
(218, 'Niue', 'NIU', 'NU', '570', 'no', 'no', 'no'),
(219, 'Tokelau', 'TKL', 'TK', '772', 'no', 'no', 'no'),
(220, 'Guernsey', 'GGY', 'GG', '831', 'no', 'no', 'no'),
(221, 'Isle of Man', 'IMN', 'IM', '833', 'no', 'no', 'no'),
(222, 'Jersey', 'JEY', 'JE', '832', 'no', 'no', 'no'),
(223, 'Anguilla', 'AIA', 'AI', '660', 'no', 'no', 'no'),
(224, 'Bermuda', 'BMU', 'BM', '060', 'no', 'no', 'no'),
(225, 'British Indian Ocean Territory', 'IOT', 'IO', '086', 'no', 'no', 'no'),
(227, 'British Virgin Islands', 'VGB', 'VG', '092', 'no', 'no', 'no'),
(228, 'Cayman Islands', 'CYM', 'KY', '136', 'no', 'no', 'no'),
(229, 'Falkland Islands (Islas Malvinas)', 'FLK', 'FK', '238', 'no', 'no', 'no'),
(230, 'Gibraltar', 'GIB', 'GI', '292', 'no', 'no', 'no'),
(231, 'Montserrat', 'MSR', 'MS', '500', 'no', 'no', 'no'),
(232, 'Pitcairn Islands', 'PCN', 'PN', '612', 'no', 'no', 'no'),
(233, 'Saint Helena', 'SHN', 'SH', '654', 'no', 'no', 'no'),
(234, 'South Georgia & South Sandwich Islands', 'SGS', 'GS', '239', 'no', 'no', 'no'),
(235, 'Turks and Caicos Islands', 'TCA', 'TC', '796', 'no', 'no', 'no'),
(236, 'Northern Mariana Islands', 'MNP', 'MP', '580', 'no', 'no', 'no'),
(237, 'Puerto Rico', 'PRI', 'PR', '630', 'no', 'no', 'no'),
(238, 'American Samoa', 'ASM', 'AS', '016', 'no', 'no', 'no'),
(240, 'Guam', 'GUM', 'GU', '316', 'no', 'no', 'no'),
(248, 'US Virgin Islands', 'VIR', 'VI', '850', 'no', 'no', 'no'),
(250, 'Hong Kong', 'HKG', 'HK', '344', 'no', 'no', 'no'),
(251, 'Macau', 'MAC', 'MO', '446', 'no', 'no', 'no'),
(252, 'Faroe Islands', 'FRO', 'FO', '234', 'no', 'no', 'no'),
(253, 'Greenland', 'GRL', 'GL', '304', 'no', 'no', 'no'),
(254, 'French Guiana', 'GUF', 'GF', '254', 'no', 'no', 'no'),
(255, 'Guadeloupe', 'GLP', 'GP', '312', 'no', 'no', 'no'),
(256, 'Martinique', 'MTQ', 'MQ', '474', 'no', 'no', 'no'),
(257, 'Reunion', 'REU', 'RE', '638', 'no', 'no', 'no'),
(259, 'Aruba', 'ABW', 'AW', '533', 'no', 'no', 'no'),
(260, 'Netherlands Antilles', 'ANT', 'AN', '530', 'no', 'no', 'no'),
(261, 'Svalbard and Jan Mayen', 'SJM', 'SJ', '744', 'no', 'no', 'no'),
(264, 'Australian Antarctic Territory', 'ATA', 'AQ', '010', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_coupons`
--

CREATE TABLE `mc_coupons` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `cCampaign` int(7) NOT NULL DEFAULT '0',
  `cDiscountCode` varchar(200) NOT NULL DEFAULT '',
  `cUseDate` date NOT NULL DEFAULT '0000-00-00',
  `saleID` mediumint(10) NOT NULL DEFAULT '0',
  `discountValue` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_currencies`
--

CREATE TABLE `mc_currencies` (
  `currency` char(3) NOT NULL DEFAULT '',
  `rate` varchar(20) NOT NULL DEFAULT '',
  `enableCur` enum('yes','no') DEFAULT 'no',
  `curname` varchar(30) NOT NULL,
  `currencyDisplayPref` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_currencies`
--

INSERT INTO `mc_currencies` (`currency`, `rate`, `enableCur`, `curname`, `currencyDisplayPref`) VALUES
('USD', '0', 'no', 'US Dollar', ''),
('JPY', '0', 'no', 'Japanese Yen', ''),
('CZK', '0', 'no', 'Czech Koruny', ''),
('DKK', '0', 'no', 'Danish Kroner', ''),
('GBP', '0', 'yes', 'British Pound', '&pound;{PRICE}'),
('HUF', '0', 'no', 'Hungarian Forint', ''),
('LTL', '0', 'no', 'Lithuanian Litai', ''),
('LVL', '0', 'no', 'Latvian Lati', ''),
('PLN', '0', 'no', 'Polish Zlotych', ''),
('SEK', '0', 'no', 'Swedish Kronor', ''),
('CHF', '0', 'no', 'Swiss Franc', ''),
('NOK', '0', 'no', 'Norwegian Krone', ''),
('HRK', '0', 'no', 'Croatian Kuna', ''),
('RUB', '0', 'no', 'Russian Rubles', ''),
('TRY', '0', 'no', 'Turkish New Lira', ''),
('AUD', '1.84', 'no', 'Australian Dollar', ''),
('BRL', '0', 'no', 'Brazilian Real', ''),
('CAD', '0', 'no', 'Canadian Dollar', ''),
('CNY', '0', 'no', 'Chinese Yuan Renminbi', ''),
('HKD', '11.00', 'no', 'Hong Kong Dollar', 'HKD{PRICE}'),
('IDR', '0', 'no', 'Indonesian Rupiah', ''),
('ILS', '0', 'no', 'Israeli Shekel', ''),
('INR', '0', 'no', 'Indian Rupee', ''),
('KRW', '0', 'no', 'South Korean Won', ''),
('MXN', '0', 'no', 'Mexican Peso', ''),
('MYR', '0', 'no', 'Malaysian Ringgit', ''),
('NZD', '0', 'no', 'New Zealand Dollar', ''),
('PHP', '0', 'no', 'Philippine Peso', ''),
('SGD', '0', 'no', 'Singapore Dollar', ''),
('THB', '0', 'no', 'Thai Baht', ''),
('ZAR', '0', 'no', 'South African Rand', ''),
('EUR', '1.26', 'no', 'Euro', '{PRICE}&euro;'),
('NGN', '0', 'no', 'Nigerian Naira', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_dropshippers`
--

CREATE TABLE `mc_dropshippers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `emails` text,
  `status` text,
  `method` text,
  `salestatus` varchar(100) NOT NULL DEFAULT '',
  `enable` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_entry_log`
--

CREATE TABLE `mc_entry_log` (
  `id` int(7) UNSIGNED NOT NULL,
  `userid` int(8) NOT NULL DEFAULT '0',
  `logdatetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(250) NOT NULL DEFAULT '',
  `type` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_flat`
--

CREATE TABLE `mc_flat` (
  `id` int(10) UNSIGNED NOT NULL,
  `inZone` int(8) NOT NULL DEFAULT '0',
  `rate` varchar(30) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_giftcerts`
--

CREATE TABLE `mc_giftcerts` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `value` varchar(10) NOT NULL DEFAULT '',
  `image` varchar(250) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `orderBy` int(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_giftcodes`
--

CREATE TABLE `mc_giftcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `saleID` int(10) NOT NULL DEFAULT '0',
  `purchaseID` int(11) NOT NULL DEFAULT '0',
  `giftID` int(10) NOT NULL DEFAULT '0',
  `code` varchar(200) NOT NULL DEFAULT '',
  `value` varchar(10) NOT NULL DEFAULT '',
  `redeemed` varchar(10) NOT NULL DEFAULT '',
  `from_name` varchar(100) NOT NULL DEFAULT '',
  `from_email` varchar(100) NOT NULL DEFAULT '',
  `to_name` varchar(100) NOT NULL DEFAULT '',
  `to_email` varchar(100) NOT NULL DEFAULT '',
  `message` text,
  `dateAdded` date NOT NULL DEFAULT '0000-00-00',
  `notes` text,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `active` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_methods`
--

CREATE TABLE `mc_methods` (
  `id` int(3) NOT NULL,
  `orderby` int(3) NOT NULL DEFAULT '0',
  `method` varchar(100) NOT NULL DEFAULT '',
  `display` varchar(100) NOT NULL DEFAULT '',
  `status` enum('yes','no') NOT NULL DEFAULT 'yes',
  `defmeth` enum('yes','no') NOT NULL DEFAULT 'no',
  `liveserver` varchar(250) NOT NULL DEFAULT '',
  `sandboxserver` varchar(250) NOT NULL DEFAULT '',
  `plaintext` text,
  `htmltext` text,
  `info` text,
  `redirect` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `docs` varchar(100) NOT NULL DEFAULT '',
  `webpage` varchar(100) NOT NULL DEFAULT '',
  `statuses` text,
  `viewtype` varchar(20) NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_methods`
--

INSERT INTO `mc_methods` (`id`, `orderby`, `method`, `display`, `status`, `defmeth`, `liveserver`, `sandboxserver`, `plaintext`, `htmltext`, `info`, `redirect`, `image`, `docs`, `webpage`, `statuses`, `viewtype`) VALUES
(1, 1, 'paypal', 'Paypal', 'no', 'yes', 'https://www.paypal.com/cgi-bin/webscr', 'https://www.sandbox.paypal.com/cgi-bin/webscr', '', '', '', '', 'paypal.png', 'payment-1', 'https://www.paypal.com', 'a:5:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";s:7:\"pending\";s:7:\"pending\";s:8:\"refunded\";s:6:\"refund\";}', 'all'),
(2, 2, 'twocheckout', '2Checkout', 'no', 'no', 'https://www.2checkout.com/checkout/purchase', 'https://www.2checkout.com/checkout/purchase', '', '', '', '', '2checkout.png', 'payment-2', 'https://www.2checkout.com', 'a:5:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";s:7:\"pending\";s:7:\"pending\";s:8:\"refunded\";s:6:\"refund\";}', 'all'),
(3, 3, 'skrill', 'Skrill', 'no', 'no', 'https://www.moneybookers.com/app/payment.pl', 'https://www.moneybookers.com/app/payment.pl', '', '', '', '', 'skrill.png', 'payment-5', 'https://www.skrill.com', 'a:5:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";s:7:\"pending\";s:7:\"pending\";s:8:\"refunded\";s:6:\"refund\";}', 'all'),
(4, 4, 'payza', 'Payza', 'no', 'no', 'https://secure.payza.com/checkout', 'https://sandbox.payza.com/sandbox/payprocess.aspx', '', '', '', '', 'payza.png', 'payment-4', 'https://www.payza.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:4:\"free\";s:9:\"completed\";}', 'all'),
(5, 5, 'payfast', 'Payfast', 'no', 'no', 'https://www.payfast.co.za/eng/process', 'https://sandbox.payfast.co.za/eng/process', '', '', '', '', 'payfast.png', 'payment-7', 'https://www.payfast.co.za', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(6, 6, 'cardsave', 'CardSave', 'no', 'no', 'https://mms.cardsaveonlinepayments.com/Pages/PublicPages/PaymentForm.aspx', 'https://mms.cardsaveonlinepayments.com/Pages/PublicPages/PaymentForm.aspx', '', '', '', '', 'cardsave.png', 'payment-9', 'http://www.cardsave.net', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(7, 7, 'sagepay', 'Sage Pay', 'no', 'no', 'https://live.sagepay.com/gateway/service/vspform-register.vsp', 'https://test.sagepay.com/Simulator/VSPFormGateway.asp', '', '', '', '', 'sagepay.png', 'payment-10', 'http://www.sagepay.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(8, 8, 'worldpay', 'WorldPay', 'no', 'no', 'https://secure.worldpay.com/wcc/purchase', 'https://secure-test.worldpay.com/wcc/purchase', '', '', '', '', 'worldpay.png', 'payment-12', 'http://www.worldpay.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(9, 9, 'cardstream', 'Cardstream', 'no', 'no', 'https://gateway.cardstream.com/hosted/', 'https://gateway.cardstream.com/hosted/', '', '', '', '', 'cardstream.png', 'payment-13', 'http://www.cardstream.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(10, 10, 'authnet', 'Authorize.net', 'no', 'no', 'https://secure.authorize.net/gateway/transact.dll', 'https://test.authorize.net/gateway/transact.dll', '', '', '', '', 'authnet.png', 'payment-16', 'http://www.authorize.net', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(11, 11, 'paymate', 'Paymate', 'no', 'no', 'https://www.paymate.com/PayMate/ExpressPayment', 'https://www.paymate.com.au/PayMate/TestExpressPayment', '', '', '', '', 'paymate.png', 'payment-17', 'http://www.paymate.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(12, 12, 'realex', 'Realex Payments', 'no', 'no', 'https://hpp.realexpayments.com/pay', 'https://hpp.realexpayments.com/pay', '', '', '', '', 'realex.png', 'payment-18', 'http://www.realexpayments.co.uk', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(13, 13, 'beanstream', 'Beanstream', 'no', 'no', 'https://www.beanstream.com/scripts/payment/payment.asp', 'https://www.beanstream.com/scripts/payment/payment.asp', '', '', '', '', 'beanstream.png', 'payment-19', 'https://www.beanstream.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(14, 14, 'charity', 'Charity Clear', 'no', 'no', 'https://gateway.charityclear.com/hosted/', 'https://gateway.charityclear.com/hosted/', '', '', '', '', 'charity.png', 'payment-20', 'http://www.charityclear.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(15, 15, 'icepay', 'IcePay', 'no', 'no', 'https://pay.icepay.eu/Checkout.aspx', 'https://pay.icepay.eu/Checkout.aspx', '', '', '', '', 'icepay.png', 'payment-21', 'http://www.icepay.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(16, 16, 'ccnow', 'CCNow', 'no', 'no', 'https://www.ccnow.com/cgi-local/transact.cgi', 'https://www.ccnow.com/cgi-local/transact.cgi', '', '', '', '', 'ccnow.png', 'payment-22', 'http://www.ccnow.com', 'a:5:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";s:9:\"cancelled\";s:9:\"completed\";s:8:\"refunded\";s:9:\"completed\";}', 'all'),
(17, 17, 'paytrail', 'Paytrail', 'no', 'no', 'https://payment.paytrail.com', 'https://payment.paytrail.com', '', '', '', '', 'paytrail.png', 'payment-24', 'http://www.paytrail.com/en/', 'a:5:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";s:9:\"cancelled\";s:9:\"completed\";s:8:\"refunded\";s:9:\"completed\";}', 'all'),
(18, 18, 'payvector', 'Pay Vector', 'no', 'no', 'https://mms.payvector.net/Pages/PublicPages/PaymentForm.aspx', 'https://mms.payvector.net/Pages/PublicPages/PaymentForm.aspx', '', '', '', '', 'payvector.png', 'payment-23', 'http://www.payvector.co.uk', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(19, 19, 'iris', 'Global Iris', 'no', 'no', 'https://hpp.realexpayments.com/pay', 'https://hpp.realexpayments.com/pay', '', '', '', '', 'iris.png', 'payment-25', 'http://www.globalpaymentsinc.co.uk/global-iris.html', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(20, 20, 'sectrade', 'Secure Trading', 'no', 'no', 'https://payments.securetrading.net/process/payments/details', 'https://payments.securetrading.net/process/payments/details', '', '', '', '', 'sectrade.png', 'payment-26', 'http://www.securetrading.com', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(21, 21, 'paysense', 'PaymentSense', 'no', 'no', 'https://mms.paymentsensegateway.com/Pages/PublicPages/PaymentForm.aspx', 'https://mms.paymentsensegateway.com/Pages/PublicPages/PaymentForm.aspx', '', '', '', '', 'paysense.png', 'payment-31', 'http://www.paymentsense.co.uk/', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(22, 22, 'cod', 'Cash on Delivery', 'yes', 'no', '', '', 'Our drivers name is\r\n\r\nJim Jones', 'Our drivers name is\r\n\r\nJim Jones', '', '', 'cod.png', 'payment-6', '', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(23, 23, 'bank', 'Bank Transfer', 'yes', 'no', '', '', 'Transfer to bank', 'Transfer to bank.\r\n\r\n[em] Emphasised Text [/em]\r\n\r\n[color=#FF0000] Red Text [/color]\r\n\r\n[list]\r\n [*] Bullet List Item 1 [/*]\r\n [*] Bullet List Item 2 [/*]\r\n [*] Bullet List Item 3 [/*]\r\n[/list]\r\n\r\nHi', '', '', 'bank.png', 'payment-6', '', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(24, 24, 'cheque', 'Cheque/Check', 'yes', 'no', '', '', 'Cheques payable to:\r\n\r\nMe', 'Cheques payable to:\r\n\r\nMe', '', '', 'cheque.png', 'payment-6', '', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(25, 25, 'phone', 'Phone Order', 'yes', 'no', '', '', 'Call us on:\r\n\r\n01543 458373 (ext 23)', 'Call us on:\r\n\r\n01543 458373 (ext 23)', '', '', 'phone.png', 'payment-6', '', 'a:3:{s:9:\"completed\";s:8:\"shipping\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'all'),
(26, 26, 'account', 'On Account', 'yes', 'no', '', '', '', '', '', '', 'account.png', 'payment-6', '', 'a:3:{s:9:\"completed\";s:9:\"completed\";s:8:\"download\";s:9:\"completed\";s:7:\"virtual\";s:9:\"completed\";}', 'trade');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_methods_params`
--

CREATE TABLE `mc_methods_params` (
  `id` int(3) NOT NULL,
  `method` varchar(200) NOT NULL DEFAULT '',
  `param` varchar(200) NOT NULL DEFAULT '',
  `value` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_methods_params`
--

INSERT INTO `mc_methods_params` (`id`, `method`, `param`, `value`) VALUES
(1, 'paypal', 'email', ''),
(2, 'paypal', 'pagestyle', ''),
(3, 'paypal', 'locale', ''),
(4, 'twocheckout', 'account', ''),
(5, 'twocheckout', 'secret', ''),
(6, 'payza', 'ipncode', ''),
(7, 'payza', 'email', ''),
(8, 'skrill', 'email', ''),
(9, 'skrill', 'language', 'EN'),
(10, 'skrill', 'logo', ''),
(11, 'skrill', 'secret', ''),
(12, 'payfast', 'merchant-id', ''),
(13, 'payfast', 'merchant-key', ''),
(14, 'cardsave', 'pre-share-key', ''),
(15, 'cardsave', 'merchant-id', ''),
(16, 'cardsave', 'password', ''),
(17, 'sagepay', 'vendor', ''),
(18, 'sagepay', 'encryption', 'aes'),
(19, 'sagepay', 'xor-password', ''),
(20, 'worldpay', 'install-id', ''),
(21, 'worldpay', 'callback-pw', ''),
(22, 'cardstream', 'merchant-id', ''),
(23, 'payfast', 'validation-url', 'https://www.payfast.co.za/eng/query/validate'),
(24, 'authnet', 'login-id', ''),
(25, 'authnet', 'transaction-key', ''),
(26, 'authnet', 'response-key', ''),
(27, 'paymate', 'merchant-id', ''),
(28, 'realex', 'merchant-id', ''),
(29, 'realex', 'secret-key', ''),
(30, 'beanstream', 'merchant-id', ''),
(31, 'charity', 'merchant-id', ''),
(32, 'twocheckout', 'language', 'EN'),
(33, 'payfast', 'validation-sand-url', 'https://sandbox.payfast.co.za/eng/query/validate'),
(34, 'icepay', 'merchant-id', ''),
(35, 'icepay', 'language', 'EN'),
(36, 'icepay', 'encryption-code', ''),
(37, 'beanstream', 'language', ''),
(38, 'beanstream', 'hash-value', ''),
(39, 'ccnow', 'login-id', ''),
(40, 'ccnow', 'language', 'en'),
(41, 'ccnow', 'secret-key', ''),
(42, 'ccnow', 'activation-key', ''),
(43, 'paytrail', 'merchant-id', ''),
(44, 'paytrail', 'language', ''),
(45, 'paytrail', 'auth-hash', ''),
(46, 'payvector', 'pre-share-key', ''),
(47, 'payvector', 'merchant-id', ''),
(48, 'payvector', 'password', ''),
(49, 'iris', 'secret-key', ''),
(50, 'iris', 'merchant-id', ''),
(51, 'realex', 'sub-account', ''),
(52, 'sectrade', 'site-reference', ''),
(53, 'sectrade', 'notify-password', ''),
(54, 'sectrade', 'merchant-password', ''),
(55, 'paysense', 'pre-share-key', ''),
(56, 'paysense', 'merchant-id', ''),
(57, 'paysense', 'password', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_mp3`
--

CREATE TABLE `mc_mp3` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `product_id` int(7) NOT NULL DEFAULT '0',
  `filePath` varchar(250) NOT NULL,
  `fileName` varchar(250) NOT NULL DEFAULT '',
  `fileFolder` varchar(250) NOT NULL DEFAULT '',
  `orderBy` int(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_newpages`
--

CREATE TABLE `mc_newpages` (
  `id` int(7) NOT NULL,
  `pageName` varchar(250) NOT NULL DEFAULT '',
  `pageKeys` text,
  `pageDesc` text,
  `pageText` text,
  `orderBy` int(5) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `linkPos` varchar(10) NOT NULL DEFAULT '1',
  `linkExternal` enum('yes','no') NOT NULL DEFAULT 'no',
  `customTemplate` varchar(250) NOT NULL DEFAULT '',
  `linkTarget` enum('same','new') NOT NULL DEFAULT 'new',
  `landingPage` enum('yes','no') NOT NULL DEFAULT 'no',
  `leftColumn` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rwslug` varchar(250) NOT NULL DEFAULT '',
  `trade` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_newpages`
--

INSERT INTO `mc_newpages` (`id`, `pageName`, `pageKeys`, `pageDesc`, `pageText`, `orderBy`, `enabled`, `linkPos`, `linkExternal`, `customTemplate`, `linkTarget`, `landingPage`, `leftColumn`, `rwslug`, `trade`) VALUES
(1, 'Contact Us', 'contact', 'us', 'If you would like to contact us, please use the form below', 2, 'yes', '1,2', 'no', '', 'new', 'no', 'yes', 'contact', 'no'),
(2, 'Refund Policy', 'refund..', 'policy..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 9, 'yes', '1,2', 'no', '', 'new', 'no', 'yes', 'refunds', 'no'),
(3, 'About Us', 'about..', 'us..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 1, 'yes', '1,2', 'no', 'example.tpl.php', 'new', 'no', 'yes', 'about', 'no'),
(4, 'Shipping & Returns', 'shipping..', 'returns..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 10, 'yes', '1,2', 'no', '', 'new', 'no', 'yes', 'shipping', 'no'),
(5, 'Payment Information', 'payment info..', 'payment info..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 7, 'yes', '3', 'no', '', 'new', 'no', 'yes', '', 'no'),
(6, 'Corporate Information', 'corporate info..', 'corporate info..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 5, 'yes', '3', 'no', '', 'new', 'no', 'yes', '', 'no'),
(7, 'Privacy & Security', 'privacy..', 'privacy..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 8, 'yes', '3', 'no', '', 'new', 'no', 'yes', 'privacy', 'no'),
(8, 'Careers', 'careers..', 'careers..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 4, 'yes', '3', 'no', '', 'new', 'no', 'yes', '', 'no'),
(9, 'Order Tracking', 'order tracking..', 'order tracking..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 6, 'yes', '3', 'no', '', 'new', 'no', 'yes', '', 'no'),
(10, 'Warranty/Product Care', 'warranty..', 'warranty..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 11, 'yes', '3', 'no', '', 'new', 'no', 'yes', '', 'no'),
(11, 'F.A.Q', 'faq..', 'faq..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 3, 'yes', '2', 'no', '', 'new', 'no', 'yes', 'faq', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_newsletter`
--

CREATE TABLE `mc_newsletter` (
  `id` int(10) UNSIGNED NOT NULL,
  `emailAddress` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_newstemplates`
--

CREATE TABLE `mc_newstemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `html` text,
  `plain` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_news_ticker`
--

CREATE TABLE `mc_news_ticker` (
  `id` int(7) NOT NULL,
  `newsText` text,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `orderBy` int(7) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_paystatuses`
--

CREATE TABLE `mc_paystatuses` (
  `id` int(3) NOT NULL,
  `statname` varchar(200) NOT NULL DEFAULT '',
  `pMethod` varchar(15) NOT NULL DEFAULT 'all',
  `homepage` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_pdf`
--

CREATE TABLE `mc_pdf` (
  `id` tinyint(1) NOT NULL,
  `company` text,
  `address` varchar(250) NOT NULL DEFAULT '',
  `font` varchar(50) NOT NULL DEFAULT 'helvetica',
  `dir` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  `meta` varchar(20) NOT NULL DEFAULT 'utf-8'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_pdf`
--

INSERT INTO `mc_pdf` (`id`, `company`, `address`, `font`, `dir`, `meta`) VALUES
(1, '', '', 'helvetica', 'ltr', 'utf-8');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_per`
--

CREATE TABLE `mc_per` (
  `id` int(10) UNSIGNED NOT NULL,
  `inZone` int(8) NOT NULL DEFAULT '0',
  `rate` varchar(30) NOT NULL DEFAULT '',
  `item` varchar(30) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_percent`
--

CREATE TABLE `mc_percent` (
  `id` int(10) UNSIGNED NOT NULL,
  `inZone` int(8) NOT NULL DEFAULT '0',
  `priceFrom` varchar(30) NOT NULL DEFAULT '',
  `priceTo` varchar(30) NOT NULL DEFAULT '',
  `percentage` varchar(30) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_personalisation`
--

CREATE TABLE `mc_personalisation` (
  `id` int(7) NOT NULL,
  `productID` int(10) NOT NULL DEFAULT '0',
  `persInstructions` text,
  `persOptions` text,
  `maxChars` int(5) NOT NULL DEFAULT '0',
  `persAddCost` varchar(50) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `boxType` enum('input','textarea') NOT NULL DEFAULT 'input',
  `reqField` enum('yes','no') NOT NULL DEFAULT 'no',
  `orderBy` int(7) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_pictures`
--

CREATE TABLE `mc_pictures` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `product_id` int(7) NOT NULL DEFAULT '0',
  `picture_path` varchar(250) NOT NULL DEFAULT '',
  `thumb_path` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `dimensions` varchar(12) NOT NULL DEFAULT '',
  `displayImg` enum('yes','no') NOT NULL DEFAULT 'no',
  `remoteServer` enum('yes','no') NOT NULL DEFAULT 'no',
  `remoteImg` text,
  `remoteThumb` text,
  `pictitle` text,
  `picalt` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_price_points`
--

CREATE TABLE `mc_price_points` (
  `id` int(10) UNSIGNED NOT NULL,
  `priceFrom` varchar(30) NOT NULL DEFAULT '',
  `priceTo` varchar(30) NOT NULL DEFAULT '',
  `priceText` varchar(200) NOT NULL DEFAULT '',
  `orderBy` int(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_products`
--

CREATE TABLE `mc_products` (
  `id` mediumint(10) UNSIGNED NOT NULL,
  `pName` varchar(250) NOT NULL DEFAULT '',
  `pTitle` varchar(250) NOT NULL DEFAULT '',
  `pMetaKeys` text,
  `pMetaDesc` text,
  `pTags` text,
  `pDescription` text,
  `pShortDescription` text,
  `pDownload` enum('yes','no') NOT NULL DEFAULT 'no',
  `pDownloadPath` varchar(250) NOT NULL DEFAULT '',
  `pDownloadLimit` int(7) NOT NULL DEFAULT '0',
  `pCode` varchar(250) NOT NULL DEFAULT '',
  `pStockNotify` int(7) NOT NULL DEFAULT '0',
  `pStock` int(7) NOT NULL DEFAULT '0',
  `pEnable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `pDateAdded` date NOT NULL DEFAULT '0000-00-00',
  `pVisits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pVideo` varchar(250) NOT NULL DEFAULT '',
  `pVideo2` varchar(250) NOT NULL DEFAULT '',
  `pVideo3` varchar(250) NOT NULL DEFAULT '',
  `pWeight` varchar(50) NOT NULL DEFAULT '',
  `pPrice` varchar(20) NOT NULL DEFAULT '',
  `pPurPrice` varchar(20) NOT NULL DEFAULT '0.00',
  `pInsurance` varchar(10) NOT NULL DEFAULT '0.00',
  `pOfferExpiry` date NOT NULL DEFAULT '0000-00-00',
  `pOffer` varchar(20) NOT NULL DEFAULT '',
  `pMultiBuy` int(10) NOT NULL DEFAULT '0',
  `rssBuildDate` varchar(35) NOT NULL DEFAULT '',
  `enDisqus` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeShipping` enum('yes','no') NOT NULL DEFAULT 'no',
  `pPurchase` enum('yes','no') NOT NULL DEFAULT 'yes',
  `minPurchaseQty` int(10) NOT NULL DEFAULT '0',
  `maxPurchaseQty` int(10) NOT NULL DEFAULT '0',
  `countryRestrictions` text,
  `checkoutTextDisplay` varchar(100) NOT NULL DEFAULT '',
  `pNotes` text,
  `rwslug` varchar(250) NOT NULL DEFAULT '',
  `pAvailableText` varchar(250) NOT NULL DEFAULT '',
  `pCube` int(10) NOT NULL DEFAULT '0',
  `pGuardian` int(10) NOT NULL DEFAULT '0',
  `dropshipping` int(8) NOT NULL DEFAULT '0',
  `expiry` date NOT NULL DEFAULT '0000-00-00',
  `exp_price` varchar(10) NOT NULL DEFAULT '',
  `exp_special` enum('yes','no') NOT NULL DEFAULT 'no',
  `exp_send` enum('yes','no') NOT NULL DEFAULT 'no',
  `exp_text` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_prod_brand`
--

CREATE TABLE `mc_prod_brand` (
  `id` int(4) UNSIGNED NOT NULL,
  `product` int(8) NOT NULL DEFAULT '0',
  `brand` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_prod_category`
--

CREATE TABLE `mc_prod_category` (
  `id` int(4) UNSIGNED NOT NULL,
  `product` int(8) NOT NULL DEFAULT '0',
  `category` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_prod_relation`
--

CREATE TABLE `mc_prod_relation` (
  `id` int(4) UNSIGNED NOT NULL,
  `product` int(8) NOT NULL DEFAULT '0',
  `related` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_purchases`
--

CREATE TABLE `mc_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchaseDate` date NOT NULL DEFAULT '0000-00-00',
  `purchaseTime` time NOT NULL DEFAULT '00:00:00',
  `saleID` int(11) NOT NULL DEFAULT '0',
  `productType` enum('download','physical','virtual') NOT NULL DEFAULT 'physical',
  `productID` int(7) NOT NULL DEFAULT '0',
  `giftID` int(7) NOT NULL DEFAULT '0',
  `categoryID` int(8) NOT NULL DEFAULT '0',
  `salePrice` varchar(20) NOT NULL DEFAULT '',
  `liveDownload` enum('yes','no') NOT NULL DEFAULT 'no',
  `persPrice` varchar(20) NOT NULL DEFAULT '',
  `attrPrice` varchar(20) NOT NULL DEFAULT '',
  `insPrice` varchar(10) NOT NULL DEFAULT '0.00',
  `globalDiscount` int(3) NOT NULL DEFAULT '0',
  `globalCost` varchar(20) NOT NULL DEFAULT '',
  `productQty` int(5) NOT NULL DEFAULT '0',
  `productWeight` varchar(20) NOT NULL DEFAULT '',
  `downloadAmount` int(7) NOT NULL DEFAULT '0',
  `downloadCode` char(50) NOT NULL DEFAULT '',
  `buyCode` varchar(50) NOT NULL DEFAULT '',
  `saleConfirmation` enum('yes','no') NOT NULL DEFAULT 'no',
  `deletedProductName` varchar(250) NOT NULL DEFAULT '',
  `freeShipping` enum('yes','no') NOT NULL DEFAULT 'no',
  `wishpur` int(6) NOT NULL DEFAULT '0',
  `platform` varchar(30) NOT NULL DEFAULT 'desktop'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_purch_atts`
--

CREATE TABLE `mc_purch_atts` (
  `id` int(10) UNSIGNED NOT NULL,
  `saleID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `purchaseID` int(11) NOT NULL DEFAULT '0',
  `attributeID` int(7) NOT NULL DEFAULT '0',
  `addCost` varchar(20) NOT NULL DEFAULT '',
  `attrName` varchar(100) NOT NULL DEFAULT '',
  `attrWeight` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_purch_pers`
--

CREATE TABLE `mc_purch_pers` (
  `id` int(10) UNSIGNED NOT NULL,
  `saleID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `purchaseID` int(11) NOT NULL DEFAULT '0',
  `personalisationID` int(7) NOT NULL DEFAULT '0',
  `visitorData` text,
  `addCost` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_qtyrates`
--

CREATE TABLE `mc_qtyrates` (
  `id` int(10) UNSIGNED NOT NULL,
  `inZone` int(8) NOT NULL DEFAULT '0',
  `qtyFrom` int(6) NOT NULL DEFAULT '0',
  `qtyTo` int(6) NOT NULL DEFAULT '0',
  `rate` varchar(30) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_rates`
--

CREATE TABLE `mc_rates` (
  `id` int(4) UNSIGNED NOT NULL,
  `rWeightFrom` varchar(50) NOT NULL DEFAULT '0',
  `rWeightTo` varchar(50) NOT NULL DEFAULT '0',
  `rCost` varchar(20) NOT NULL DEFAULT '',
  `rService` int(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_sales`
--

CREATE TABLE `mc_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoiceNo` varchar(100) NOT NULL DEFAULT '',
  `account` int(8) NOT NULL DEFAULT '0',
  `saleNotes` text,
  `bill_1` varchar(250) NOT NULL DEFAULT '',
  `bill_2` varchar(250) NOT NULL DEFAULT '',
  `bill_3` varchar(250) NOT NULL DEFAULT '',
  `bill_4` varchar(250) NOT NULL DEFAULT '',
  `bill_5` varchar(250) NOT NULL DEFAULT '',
  `bill_6` varchar(250) NOT NULL DEFAULT '',
  `bill_7` varchar(250) NOT NULL DEFAULT '',
  `bill_8` varchar(250) NOT NULL DEFAULT '',
  `bill_9` int(5) NOT NULL DEFAULT '0',
  `ship_1` varchar(250) NOT NULL DEFAULT '',
  `ship_2` varchar(250) NOT NULL DEFAULT '',
  `ship_3` varchar(250) NOT NULL DEFAULT '',
  `ship_4` varchar(250) NOT NULL DEFAULT '',
  `ship_5` varchar(250) NOT NULL DEFAULT '',
  `ship_6` varchar(250) NOT NULL DEFAULT '',
  `ship_7` varchar(250) NOT NULL DEFAULT '',
  `ship_8` varchar(250) NOT NULL DEFAULT '',
  `buyerAddress` text,
  `paymentStatus` varchar(20) NOT NULL DEFAULT '',
  `gatewayID` varchar(250) NOT NULL DEFAULT '',
  `taxPaid` varchar(20) NOT NULL DEFAULT '',
  `taxRate` varchar(5) NOT NULL DEFAULT '',
  `couponCode` varchar(200) NOT NULL DEFAULT '',
  `couponTotal` varchar(100) NOT NULL DEFAULT '',
  `codeType` varchar(20) NOT NULL DEFAULT '',
  `subTotal` varchar(20) NOT NULL DEFAULT '',
  `grandTotal` varchar(20) NOT NULL DEFAULT '',
  `shipTotal` varchar(20) NOT NULL DEFAULT '',
  `globalTotal` varchar(20) NOT NULL DEFAULT '0',
  `insuranceTotal` varchar(10) NOT NULL DEFAULT '0.00',
  `chargeTotal` varchar(20) NOT NULL DEFAULT '0.00',
  `globalDiscount` int(5) NOT NULL DEFAULT '0',
  `manualDiscount` varchar(20) NOT NULL DEFAULT '',
  `isPickup` enum('yes','no') NOT NULL DEFAULT 'no',
  `shipSetCountry` int(7) NOT NULL DEFAULT '0',
  `shipSetArea` int(7) NOT NULL DEFAULT '0',
  `setShipRateID` int(7) NOT NULL DEFAULT '0',
  `shipType` varchar(20) NOT NULL DEFAULT '',
  `cartWeight` varchar(20) NOT NULL DEFAULT '',
  `purchaseDate` date NOT NULL DEFAULT '0000-00-00',
  `purchaseTime` time NOT NULL DEFAULT '00:00:00',
  `buyCode` varchar(50) NOT NULL,
  `saleConfirmation` enum('yes','no') NOT NULL DEFAULT 'no',
  `paymentMethod` varchar(20) NOT NULL DEFAULT '',
  `ipAddress` text,
  `ipAccess` text,
  `restrictCount` int(7) NOT NULL DEFAULT '0',
  `orderCopyEmails` text,
  `zipLimit` int(5) NOT NULL DEFAULT '0',
  `downloadLock` enum('yes','no') NOT NULL DEFAULT 'no',
  `optInNewsletter` enum('yes','no') NOT NULL DEFAULT 'yes',
  `paypalErrorTrigger` tinyint(1) NOT NULL DEFAULT '0',
  `gateparams` text,
  `trackcode` varchar(100) NOT NULL DEFAULT '',
  `type` enum('personal','trade') NOT NULL DEFAULT 'personal',
  `wishlist` int(8) NOT NULL DEFAULT '0',
  `platform` varchar(30) NOT NULL DEFAULT 'desktop'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_search_index`
--

CREATE TABLE `mc_search_index` (
  `id` int(11) UNSIGNED NOT NULL,
  `searchCode` varchar(50) NOT NULL DEFAULT '',
  `results` text,
  `searchDate` date NOT NULL DEFAULT '0000-00-00',
  `filters` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_search_log`
--

CREATE TABLE `mc_search_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `keyword` text,
  `results` int(7) NOT NULL DEFAULT '0',
  `searchDate` date NOT NULL DEFAULT '0000-00-00',
  `ip` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_services`
--

CREATE TABLE `mc_services` (
  `id` int(4) UNSIGNED NOT NULL,
  `sName` varchar(250) NOT NULL DEFAULT '0',
  `sEstimation` varchar(250) NOT NULL DEFAULT '0',
  `sSignature` enum('yes','no') NOT NULL DEFAULT 'yes',
  `inZone` int(6) NOT NULL DEFAULT '0',
  `enableCOD` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_settings`
--

CREATE TABLE `mc_settings` (
  `id` tinyint(1) NOT NULL,
  `website` varchar(250) NOT NULL DEFAULT '',
  `theme` varchar(100) NOT NULL DEFAULT '_theme_default',
  `theme2` varchar(100) NOT NULL DEFAULT '_theme_default',
  `tradetheme` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `addEmails` text,
  `serverPath` varchar(250) NOT NULL DEFAULT '',
  `languagePref` varchar(40) NOT NULL DEFAULT 'english.php',
  `logoName` varchar(50) NOT NULL DEFAULT '',
  `baseCurrency` char(3) NOT NULL DEFAULT 'GBP',
  `currencyDisplayPref` varchar(100) NOT NULL DEFAULT '',
  `logErrors` enum('yes','no') NOT NULL DEFAULT 'no',
  `gatewayMode` enum('test','live') NOT NULL DEFAULT 'test',
  `enableSSL` enum('yes','no') NOT NULL DEFAULT 'no',
  `enablePickUp` enum('yes','no') NOT NULL DEFAULT 'no',
  `shipCountry` varchar(10) NOT NULL DEFAULT '',
  `logFolderName` varchar(50) NOT NULL DEFAULT 'logs',
  `ifolder` varchar(250) NOT NULL DEFAULT '',
  `metaKeys` text,
  `metaDesc` text,
  `enableCart` enum('yes','no') NOT NULL DEFAULT 'yes',
  `offlineDate` date NOT NULL DEFAULT '0000-00-00',
  `offlineText` text,
  `offlineIP` text,
  `en_rss` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rssScroller` enum('yes','no') NOT NULL DEFAULT 'no',
  `rssScrollerUrl` varchar(250) NOT NULL DEFAULT '',
  `rssScrollerLimit` int(3) NOT NULL DEFAULT '10',
  `en_modr` enum('yes','no') NOT NULL DEFAULT 'no',
  `cName` varchar(250) NOT NULL DEFAULT '',
  `cWebsite` varchar(250) NOT NULL DEFAULT '',
  `cTel` varchar(250) NOT NULL DEFAULT '',
  `cFax` varchar(250) NOT NULL DEFAULT '',
  `cAddress` text,
  `cOther` text,
  `cReturns` text,
  `smtp` enum('yes','no') NOT NULL DEFAULT 'no',
  `smtp_host` varchar(100) NOT NULL DEFAULT 'localhost',
  `smtp_user` varchar(100) NOT NULL DEFAULT '',
  `smtp_pass` varchar(100) NOT NULL DEFAULT '',
  `smtp_port` varchar(100) NOT NULL DEFAULT '25',
  `smtp_security` varchar(10) NOT NULL DEFAULT '',
  `smtp_from` varchar(250) NOT NULL DEFAULT '',
  `smtp_email` varchar(250) NOT NULL DEFAULT '',
  `smtp_debug` enum('yes','no') NOT NULL DEFAULT 'no',
  `homeProdValue` int(3) NOT NULL DEFAULT '0',
  `homeProdType` varchar(10) NOT NULL DEFAULT 'latest',
  `homeProdCats` text,
  `homeProdIDs` text,
  `adminFooter` text,
  `publicFooter` text,
  `prodKey` char(60) NOT NULL DEFAULT '',
  `encoderVersion` varchar(5) NOT NULL DEFAULT '',
  `activateEmails` enum('yes','no') NOT NULL DEFAULT 'no',
  `saleComparisonItems` int(6) NOT NULL DEFAULT '0',
  `productsPerPage` int(4) NOT NULL DEFAULT '35',
  `mostPopProducts` int(5) NOT NULL DEFAULT '0',
  `mostPopPref` enum('sales','hits') NOT NULL DEFAULT 'sales',
  `latestProdLimit` int(5) NOT NULL DEFAULT '0',
  `latestProdDuration` enum('days','months','years') NOT NULL DEFAULT 'days',
  `searchLowStockLimit` int(5) NOT NULL DEFAULT '1',
  `enSearchLog` enum('yes','no') NOT NULL DEFAULT 'no',
  `savedSearches` int(6) NOT NULL DEFAULT '7',
  `searchSlider` text,
  `searchTagsOnly` enum('yes','no') NOT NULL DEFAULT 'no',
  `jsDateFormat` varchar(10) NOT NULL DEFAULT 'DD-MM-YYYY',
  `jsWeekStart` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(50) NOT NULL DEFAULT 'Europe/London',
  `mysqlDateFormat` varchar(10) NOT NULL DEFAULT '',
  `systemDateFormat` varchar(30) NOT NULL DEFAULT 'j F Y',
  `rssFeedLimit` int(3) NOT NULL DEFAULT '50',
  `minInvoiceDigits` tinyint(2) NOT NULL DEFAULT '5',
  `invoiceNo` int(10) NOT NULL DEFAULT '1',
  `pendingAsComplete` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeShipThreshold` varchar(10) NOT NULL DEFAULT '',
  `enableZip` enum('yes','no') NOT NULL DEFAULT 'no',
  `zipCreationLimit` varchar(100) NOT NULL DEFAULT '0',
  `zipLimit` int(3) NOT NULL DEFAULT '0',
  `zipTimeOut` int(6) NOT NULL DEFAULT '0',
  `zipMemoryLimit` int(5) NOT NULL DEFAULT '0',
  `zipAdditionalFolder` varchar(50) NOT NULL DEFAULT 'additional-zip',
  `enEntryLog` enum('yes','no') NOT NULL DEFAULT 'no',
  `softwareVersion` varchar(10) NOT NULL DEFAULT '',
  `smartQuotes` enum('yes','no') NOT NULL DEFAULT 'yes',
  `hitCounter` enum('yes','no') NOT NULL DEFAULT 'yes',
  `menuSubCats` enum('yes','no') NOT NULL DEFAULT 'yes',
  `adminFolderName` varchar(100) NOT NULL DEFAULT 'admin',
  `twitterLatest` enum('yes','no') NOT NULL DEFAULT 'no',
  `globalDiscount` varchar(20) NOT NULL DEFAULT '0',
  `globalDiscountExpiry` date NOT NULL DEFAULT '0000-00-00',
  `enableRecentView` enum('yes','no') NOT NULL DEFAULT 'yes',
  `freeDownloadRestriction` varchar(10) NOT NULL DEFAULT '0',
  `thumbWidth` int(4) NOT NULL DEFAULT '230',
  `thumbHeight` int(4) NOT NULL DEFAULT '200',
  `thumbQuality` int(3) NOT NULL DEFAULT '99',
  `thumbQualityPNG` tinyint(1) NOT NULL DEFAULT '9',
  `aspectRatio` enum('yes','no') NOT NULL DEFAULT 'yes',
  `renamePics` enum('yes','no') NOT NULL DEFAULT 'yes',
  `tmbPrefix` varchar(100) NOT NULL DEFAULT 'tmb_',
  `imgPrefix` varchar(100) NOT NULL DEFAULT 'img_',
  `showOutofStock` enum('cat','yes','no') NOT NULL DEFAULT 'yes',
  `enableCheckout` enum('yes','no') NOT NULL DEFAULT 'yes',
  `globalDownloadPath` varchar(250) NOT NULL DEFAULT '',
  `maxProductChars` int(8) NOT NULL DEFAULT '200',
  `reduceDownloadStock` enum('yes','no') NOT NULL DEFAULT 'no',
  `enableBBCode` enum('yes','no') NOT NULL DEFAULT 'yes',
  `downloadFolder` varchar(100) NOT NULL DEFAULT '',
  `downloadRestrictIP` enum('yes','no') NOT NULL DEFAULT 'no',
  `downloadRestrictIPLog` enum('yes','no') NOT NULL DEFAULT 'no',
  `downloadRestrictIPCnt` int(7) NOT NULL DEFAULT '0',
  `downloadRestrictIPLock` int(7) NOT NULL DEFAULT '0',
  `downloadRestrictIPMail` enum('yes','no') NOT NULL DEFAULT 'no',
  `downloadRestrictIPGlobal` text,
  `parentCatHomeDisplay` enum('yes','no') NOT NULL DEFAULT 'no',
  `isbnAPI` varchar(50) NOT NULL DEFAULT '',
  `offerInsurance` enum('yes','no') NOT NULL DEFAULT 'no',
  `insuranceAmount` varchar(10) NOT NULL DEFAULT '',
  `insuranceFilter` char(3) NOT NULL DEFAULT '',
  `insuranceOptional` enum('yes','no') NOT NULL DEFAULT 'no',
  `insuranceValue` varchar(20) NOT NULL DEFAULT '',
  `insuranceInfo` text,
  `freeTextDisplay` varchar(10) NOT NULL DEFAULT '',
  `excludeFreePop` enum('yes','no') NOT NULL DEFAULT 'no',
  `priceTextDisplay` varchar(100) NOT NULL DEFAULT '',
  `en_sitemap` enum('yes','no') NOT NULL DEFAULT 'yes',
  `cubeUrl` varchar(250) NOT NULL DEFAULT '',
  `cubeAPI` varchar(250) NOT NULL DEFAULT '',
  `guardianUrl` varchar(250) NOT NULL DEFAULT '',
  `guardianAPI` varchar(250) NOT NULL DEFAULT '',
  `minCheckoutAmount` varchar(50) NOT NULL DEFAULT '',
  `showAttrStockLevel` enum('yes','no') NOT NULL DEFAULT 'no',
  `productStockThreshold` int(5) NOT NULL DEFAULT '30',
  `autoClear` int(3) NOT NULL DEFAULT '7',
  `batchMail` text,
  `freeAltRedirect` varchar(250) NOT NULL DEFAULT '',
  `menuCatCount` enum('yes','no') NOT NULL DEFAULT 'no',
  `menuBrandCount` enum('yes','no') NOT NULL DEFAULT 'no',
  `catGiftPos` varchar(10) NOT NULL DEFAULT 'end',
  `showBrands` enum('yes','no') NOT NULL DEFAULT 'yes',
  `minPassValue` int(5) NOT NULL DEFAULT '8',
  `en_wish` enum('yes','no') NOT NULL DEFAULT 'yes',
  `tweetlimit` int(5) NOT NULL DEFAULT '10',
  `forcePass` enum('yes','no') NOT NULL DEFAULT 'yes',
  `en_create` enum('yes','no') NOT NULL DEFAULT 'yes',
  `en_create_mail` enum('yes','no') NOT NULL DEFAULT 'yes',
  `pdf` enum('yes','no') NOT NULL DEFAULT 'yes',
  `en_close` enum('yes','no') NOT NULL DEFAULT 'yes',
  `cache` enum('yes','no') NOT NULL DEFAULT 'yes',
  `cachetime` varchar(10) NOT NULL DEFAULT '30',
  `tweet` enum('yes','no') NOT NULL DEFAULT 'yes',
  `presalenotify` enum('yes','no') NOT NULL DEFAULT 'no',
  `presaleemail` text,
  `layout` enum('grid','list') NOT NULL DEFAULT 'list',
  `coupontax` enum('yes','no') NOT NULL DEFAULT 'yes',
  `shipopts` text,
  `tc` enum('yes','no') NOT NULL DEFAULT 'no',
  `tctext` text,
  `tradeship` enum('yes','no') NOT NULL DEFAULT 'no',
  `salereorder` enum('yes','no') NOT NULL DEFAULT 'yes',
  `hurrystock` int(7) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_settings`
--

INSERT INTO `mc_settings` (`id`, `website`, `theme`, `theme2`, `tradetheme`, `email`, `addEmails`, `serverPath`, `languagePref`, `logoName`, `baseCurrency`, `currencyDisplayPref`, `logErrors`, `gatewayMode`, `enableSSL`, `enablePickUp`, `shipCountry`, `logFolderName`, `ifolder`, `metaKeys`, `metaDesc`, `enableCart`, `offlineDate`, `offlineText`, `offlineIP`, `en_rss`, `rssScroller`, `rssScrollerUrl`, `rssScrollerLimit`, `en_modr`, `cName`, `cWebsite`, `cTel`, `cFax`, `cAddress`, `cOther`, `cReturns`, `smtp`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_security`, `smtp_from`, `smtp_email`, `smtp_debug`, `homeProdValue`, `homeProdType`, `homeProdCats`, `homeProdIDs`, `adminFooter`, `publicFooter`, `prodKey`, `encoderVersion`, `activateEmails`, `saleComparisonItems`, `productsPerPage`, `mostPopProducts`, `mostPopPref`, `latestProdLimit`, `latestProdDuration`, `searchLowStockLimit`, `enSearchLog`, `savedSearches`, `searchSlider`, `searchTagsOnly`, `jsDateFormat`, `jsWeekStart`, `timezone`, `mysqlDateFormat`, `systemDateFormat`, `rssFeedLimit`, `minInvoiceDigits`, `invoiceNo`, `pendingAsComplete`, `freeShipThreshold`, `enableZip`, `zipCreationLimit`, `zipLimit`, `zipTimeOut`, `zipMemoryLimit`, `zipAdditionalFolder`, `enEntryLog`, `softwareVersion`, `smartQuotes`, `hitCounter`, `menuSubCats`, `adminFolderName`, `twitterLatest`, `globalDiscount`, `globalDiscountExpiry`, `enableRecentView`, `freeDownloadRestriction`, `thumbWidth`, `thumbHeight`, `thumbQuality`, `thumbQualityPNG`, `aspectRatio`, `renamePics`, `tmbPrefix`, `imgPrefix`, `showOutofStock`, `enableCheckout`, `globalDownloadPath`, `maxProductChars`, `reduceDownloadStock`, `enableBBCode`, `downloadFolder`, `downloadRestrictIP`, `downloadRestrictIPLog`, `downloadRestrictIPCnt`, `downloadRestrictIPLock`, `downloadRestrictIPMail`, `downloadRestrictIPGlobal`, `parentCatHomeDisplay`, `isbnAPI`, `offerInsurance`, `insuranceAmount`, `insuranceFilter`, `insuranceOptional`, `insuranceValue`, `insuranceInfo`, `freeTextDisplay`, `excludeFreePop`, `priceTextDisplay`, `en_sitemap`, `cubeUrl`, `cubeAPI`, `guardianUrl`, `guardianAPI`, `minCheckoutAmount`, `showAttrStockLevel`, `productStockThreshold`, `autoClear`, `batchMail`, `freeAltRedirect`, `menuCatCount`, `menuBrandCount`, `catGiftPos`, `showBrands`, `minPassValue`, `en_wish`, `tweetlimit`, `forcePass`, `en_create`, `en_create_mail`, `pdf`, `en_close`, `cache`, `cachetime`, `tweet`, `presalenotify`, `presaleemail`, `layout`, `coupontax`, `shipopts`, `tc`, `tctext`, `tradeship`, `salereorder`, `hurrystock`) VALUES
(1, 'Maian Cart', '_theme_default', '_theme_default', '', 'alexey.lazarenko@jelastic.com', '', '/var/www/webroot/ROOT/store', 'english', '', 'GBP', '&pound;{PRICE}', 'yes', 'test', 'no', 'yes', '0', 'logs', 'http://maiancart.demo.jelastic.com/store', '', '', 'yes', '0000-00-00', '', '', 'yes', 'no', '', 10, 'no', 'Maian Cart', 'http://maiancart.demo.jelastic.com/store', '01234 456789', '01345 567890', '1 Company Street\r\nSomeplace\r\nSomewhere\r\nPost Code', '', 'Return info goes here..', 'yes', '', '', '', '587', '', '', '', 'no', 10, 'latest', '', '', 'Add your own footer in your admin control panel: System > Edit Footers', 'Add your own footer in your admin control panel: System > Edit Footers', 'F3E06DBF69502DF769C1B34702F4C23F28E4CCEBB1A0A50C11087E7B8F70', '1.0', 'yes', 10, 8, 10, 'sales', 36, 'months', 5, 'yes', 7, 'a:4:{s:3:\"min\";s:1:\"0\";s:3:\"max\";s:3:\"300\";s:5:\"start\";s:1:\"5\";s:3:\"end\";s:3:\"100\";}', 'no', 'DD/MM/YYYY', 0, 'UTC', '%e %b %Y', 'F j, Y', 50, 5, 0, 'no', '0.00', 'yes', '0', 2, 0, 0, 'additional-zip', 'yes', '3.3', 'no', 'yes', 'yes', 'admin', 'no', '0', '0000-00-00', 'yes', '0', 230, 200, 96, 9, 'yes', 'yes', 'tmb_', 'img_', 'cat', 'yes', '/var/www/webroot/ROOT/store', 300, 'no', 'yes', 'product-downloads', 'no', 'yes', 0, 5, 'yes', '', 'yes', '', 'yes', '10', 'op2', 'no', '0.00', '', 'FREE', 'yes', '', 'yes', '', '', '', '', '0.00', 'no', 30, 30, NULL, '', 'no', 'no', '16', 'no', 10, 'yes', 5, 'yes', 'yes', 'yes', 'yes', 'yes', 'no', '30', 'no', 'no', '', 'list', 'yes', '', 'no', '', 'no', 'yes', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_social`
--

CREATE TABLE `mc_social` (
  `id` int(5) NOT NULL,
  `desc` varchar(50) NOT NULL DEFAULT '',
  `param` text,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_social`
--

INSERT INTO `mc_social` (`id`, `desc`, `param`, `value`) VALUES
(1, 'addthis', 'code', ''),
(2, 'disqus', 'disname', ''),
(3, 'disqus', 'discat', ''),
(4, 'pushover', 'pushuser', ''),
(5, 'pushover', 'pushtoken', ''),
(6, 'facebook', 'fbimage', ''),
(7, 'facebook', 'fbinsights', ''),
(8, 'twitter', 'conkey', ''),
(9, 'twitter', 'consecret', ''),
(10, 'twitter', 'token', ''),
(11, 'twitter', 'key', ''),
(12, 'twitter', 'username', ''),
(13, 'links', 'facebook', 'https://www.facebook.com'),
(14, 'links', 'twitter', 'https://www.twitter.com'),
(15, 'links', 'instagram', 'https://www.instagram.com'),
(16, 'links', 'youtube', 'https://www.youtube.com'),
(17, 'links', 'reddit', 'https://www.reddit.com'),
(18, 'links', 'pinterest', 'https://www.pinterest.com'),
(19, 'links', 'flickr', 'https://www.flickr.com'),
(20, 'struct', 'twitter', 'yes'),
(21, 'struct', 'fb', 'yes'),
(22, 'struct', 'google', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_statuses`
--

CREATE TABLE `mc_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `statusNotes` text,
  `dateAdded` date NOT NULL DEFAULT '0000-00-00',
  `timeAdded` time NOT NULL DEFAULT '00:00:00',
  `orderStatus` varchar(20) NOT NULL DEFAULT '',
  `adminUser` varchar(100) NOT NULL DEFAULT '',
  `visacc` enum('yes','no') NOT NULL DEFAULT 'no',
  `account` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_status_text`
--

CREATE TABLE `mc_status_text` (
  `id` int(7) NOT NULL,
  `statTitle` varchar(250) NOT NULL DEFAULT '',
  `statText` text,
  `ref` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_tare`
--

CREATE TABLE `mc_tare` (
  `id` int(4) UNSIGNED NOT NULL,
  `rWeightFrom` varchar(50) NOT NULL DEFAULT '0',
  `rWeightTo` varchar(50) NOT NULL DEFAULT '0',
  `rCost` varchar(20) NOT NULL DEFAULT '',
  `rService` int(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_themes`
--

CREATE TABLE `mc_themes` (
  `id` int(7) UNSIGNED NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT '',
  `from` date NOT NULL DEFAULT '0000-00-00',
  `to` date NOT NULL DEFAULT '0000-00-00',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_tracker`
--

CREATE TABLE `mc_tracker` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `code` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_tracker_clicks`
--

CREATE TABLE `mc_tracker_clicks` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) NOT NULL DEFAULT '',
  `clicked` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_users`
--

CREATE TABLE `mc_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `userName` varchar(100) NOT NULL DEFAULT '',
  `userPass` varchar(40) NOT NULL DEFAULT '',
  `userEmail` text,
  `userType` enum('admin','restricted') NOT NULL DEFAULT 'restricted',
  `userPriv` enum('yes','no') NOT NULL DEFAULT 'no',
  `accessPages` text,
  `enableUser` enum('yes','no') NOT NULL DEFAULT 'no',
  `lastLogin` varchar(250) NOT NULL DEFAULT '',
  `userNotify` enum('yes','no') NOT NULL DEFAULT 'yes',
  `tweet` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_zones`
--

CREATE TABLE `mc_zones` (
  `id` int(4) UNSIGNED NOT NULL,
  `zName` varchar(250) NOT NULL DEFAULT '',
  `zCountry` int(5) NOT NULL DEFAULT '0',
  `zRate` varchar(10) NOT NULL DEFAULT '',
  `zShipping` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_zone_areas`
--

CREATE TABLE `mc_zone_areas` (
  `id` int(4) UNSIGNED NOT NULL,
  `inZone` int(5) NOT NULL DEFAULT '0',
  `areaName` varchar(200) NOT NULL DEFAULT '',
  `zCountry` int(5) NOT NULL DEFAULT '0',
  `zRate` varchar(10) NOT NULL DEFAULT '',
  `zShipping` enum('yes','no') NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mc_accounts`
--
ALTER TABLE `mc_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `em_index` (`email`),
  ADD KEY `nm_index` (`name`);

--
-- Индексы таблицы `mc_accounts_search`
--
ALTER TABLE `mc_accounts_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_index` (`code`);

--
-- Индексы таблицы `mc_accounts_wish`
--
ALTER TABLE `mc_accounts_wish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_index` (`account`);

--
-- Индексы таблицы `mc_activation_history`
--
ALTER TABLE `mc_activation_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleid_index` (`saleID`);

--
-- Индексы таблицы `mc_addressbook`
--
ALTER TABLE `mc_addressbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ac_index` (`account`);

--
-- Индексы таблицы `mc_attachments`
--
ALTER TABLE `mc_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_index` (`statusID`),
  ADD KEY `sale_index` (`saleID`);

--
-- Индексы таблицы `mc_attributes`
--
ALTER TABLE `mc_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_index` (`productID`),
  ADD KEY `group_index` (`attrGroup`);

--
-- Индексы таблицы `mc_attr_groups`
--
ALTER TABLE `mc_attr_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_index` (`productID`);

--
-- Индексы таблицы `mc_banners`
--
ALTER TABLE `mc_banners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_blog`
--
ALTER TABLE `mc_blog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_boxes`
--
ALTER TABLE `mc_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_brands`
--
ALTER TABLE `mc_brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_campaigns`
--
ALTER TABLE `mc_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_index` (`cDiscountCode`);

--
-- Индексы таблицы `mc_categories`
--
ALTER TABLE `mc_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_index` (`catLevel`),
  ADD KEY `child_index` (`childOf`),
  ADD KEY `en_index` (`enCat`);

--
-- Индексы таблицы `mc_click_history`
--
ALTER TABLE `mc_click_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleid_index` (`saleID`);

--
-- Индексы таблицы `mc_comparisons`
--
ALTER TABLE `mc_comparisons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_index` (`saleID`),
  ADD KEY `this_index` (`thisProduct`),
  ADD KEY `that_index` (`thatProduct`);

--
-- Индексы таблицы `mc_countries`
--
ALTER TABLE `mc_countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_coupons`
--
ALTER TABLE `mc_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_index` (`cDiscountCode`),
  ADD KEY `sale_index` (`saleID`);

--
-- Индексы таблицы `mc_currencies`
--
ALTER TABLE `mc_currencies`
  ADD PRIMARY KEY (`currency`);

--
-- Индексы таблицы `mc_dropshippers`
--
ALTER TABLE `mc_dropshippers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_entry_log`
--
ALTER TABLE `mc_entry_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_index` (`userid`);

--
-- Индексы таблицы `mc_flat`
--
ALTER TABLE `mc_flat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_index` (`inZone`);

--
-- Индексы таблицы `mc_giftcerts`
--
ALTER TABLE `mc_giftcerts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_giftcodes`
--
ALTER TABLE `mc_giftcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_index` (`giftID`),
  ADD KEY `sale_index` (`saleID`),
  ADD KEY `code_index` (`code`),
  ADD KEY `purc_index` (`purchaseID`);

--
-- Индексы таблицы `mc_methods`
--
ALTER TABLE `mc_methods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_methods_params`
--
ALTER TABLE `mc_methods_params`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mthd_index` (`method`);

--
-- Индексы таблицы `mc_mp3`
--
ALTER TABLE `mc_mp3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_index` (`product_id`);

--
-- Индексы таблицы `mc_newpages`
--
ALTER TABLE `mc_newpages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_newsletter`
--
ALTER TABLE `mc_newsletter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_index` (`emailAddress`);

--
-- Индексы таблицы `mc_newstemplates`
--
ALTER TABLE `mc_newstemplates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_news_ticker`
--
ALTER TABLE `mc_news_ticker`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_paystatuses`
--
ALTER TABLE `mc_paystatuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mthd_index` (`pMethod`);

--
-- Индексы таблицы `mc_pdf`
--
ALTER TABLE `mc_pdf`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_per`
--
ALTER TABLE `mc_per`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_index` (`inZone`);

--
-- Индексы таблицы `mc_percent`
--
ALTER TABLE `mc_percent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_index` (`inZone`),
  ADD KEY `from_index` (`priceFrom`),
  ADD KEY `to_index` (`priceTo`),
  ADD KEY `en_index` (`enabled`);

--
-- Индексы таблицы `mc_personalisation`
--
ALTER TABLE `mc_personalisation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_index` (`productID`);

--
-- Индексы таблицы `mc_pictures`
--
ALTER TABLE `mc_pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_index` (`product_id`);

--
-- Индексы таблицы `mc_price_points`
--
ALTER TABLE `mc_price_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_index` (`priceFrom`),
  ADD KEY `to_index` (`priceTo`);

--
-- Индексы таблицы `mc_products`
--
ALTER TABLE `mc_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pDownload` (`pDownload`),
  ADD KEY `code_index` (`pCode`),
  ADD KEY `name_index` (`pName`),
  ADD KEY `stock_index` (`pStock`),
  ADD KEY `price_index` (`pPrice`),
  ADD KEY `cost_index` (`pPurPrice`),
  ADD KEY `en_index` (`pEnable`),
  ADD KEY `wght_index` (`pWeight`);

--
-- Индексы таблицы `mc_prod_brand`
--
ALTER TABLE `mc_prod_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_index` (`product`),
  ADD KEY `brd_index` (`brand`);

--
-- Индексы таблицы `mc_prod_category`
--
ALTER TABLE `mc_prod_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_index` (`product`),
  ADD KEY `cat_index` (`category`);

--
-- Индексы таблицы `mc_prod_relation`
--
ALTER TABLE `mc_prod_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_index` (`product`),
  ADD KEY `rel_index` (`related`);

--
-- Индексы таблицы `mc_purchases`
--
ALTER TABLE `mc_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleid_index` (`saleID`),
  ADD KEY `product_index` (`productID`),
  ADD KEY `cat_index` (`categoryID`),
  ADD KEY `conf_index` (`saleConfirmation`),
  ADD KEY `dcode_index` (`downloadCode`),
  ADD KEY `ld_index` (`liveDownload`);

--
-- Индексы таблицы `mc_purch_atts`
--
ALTER TABLE `mc_purch_atts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleid_index` (`saleID`),
  ADD KEY `prodid_index` (`productID`),
  ADD KEY `purid_index` (`purchaseID`),
  ADD KEY `attid_index` (`attributeID`);

--
-- Индексы таблицы `mc_purch_pers`
--
ALTER TABLE `mc_purch_pers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleid_index` (`saleID`),
  ADD KEY `prod_index` (`productID`),
  ADD KEY `purc_index` (`purchaseID`),
  ADD KEY `pers_index` (`personalisationID`);

--
-- Индексы таблицы `mc_qtyrates`
--
ALTER TABLE `mc_qtyrates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_index` (`inZone`),
  ADD KEY `from_index` (`qtyFrom`),
  ADD KEY `to_index` (`qtyTo`),
  ADD KEY `en_index` (`enabled`);

--
-- Индексы таблицы `mc_rates`
--
ALTER TABLE `mc_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_index` (`rWeightFrom`),
  ADD KEY `to_index` (`rWeightTo`);

--
-- Индексы таблицы `mc_sales`
--
ALTER TABLE `mc_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_index` (`buyCode`),
  ADD KEY `acc_index` (`account`),
  ADD KEY `conf_index` (`saleConfirmation`);

--
-- Индексы таблицы `mc_search_index`
--
ALTER TABLE `mc_search_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_index` (`searchCode`);

--
-- Индексы таблицы `mc_search_log`
--
ALTER TABLE `mc_search_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_services`
--
ALTER TABLE `mc_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_index` (`inZone`);

--
-- Индексы таблицы `mc_settings`
--
ALTER TABLE `mc_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_social`
--
ALTER TABLE `mc_social`
  ADD PRIMARY KEY (`id`),
  ADD KEY `descK` (`desc`);

--
-- Индексы таблицы `mc_statuses`
--
ALTER TABLE `mc_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleid_index` (`saleID`);

--
-- Индексы таблицы `mc_status_text`
--
ALTER TABLE `mc_status_text`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_tare`
--
ALTER TABLE `mc_tare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_index` (`rWeightFrom`),
  ADD KEY `to_index` (`rWeightTo`);

--
-- Индексы таблицы `mc_themes`
--
ALTER TABLE `mc_themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_index` (`from`),
  ADD KEY `to_index` (`to`);

--
-- Индексы таблицы `mc_tracker`
--
ALTER TABLE `mc_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Индексы таблицы `mc_tracker_clicks`
--
ALTER TABLE `mc_tracker_clicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Индексы таблицы `mc_users`
--
ALTER TABLE `mc_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mc_zones`
--
ALTER TABLE `mc_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ctry_index` (`zCountry`);

--
-- Индексы таблицы `mc_zone_areas`
--
ALTER TABLE `mc_zone_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_index` (`inZone`),
  ADD KEY `ctry_index` (`zCountry`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mc_accounts`
--
ALTER TABLE `mc_accounts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_accounts_search`
--
ALTER TABLE `mc_accounts_search`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_accounts_wish`
--
ALTER TABLE `mc_accounts_wish`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_activation_history`
--
ALTER TABLE `mc_activation_history`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_addressbook`
--
ALTER TABLE `mc_addressbook`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_attachments`
--
ALTER TABLE `mc_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_attributes`
--
ALTER TABLE `mc_attributes`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_attr_groups`
--
ALTER TABLE `mc_attr_groups`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_banners`
--
ALTER TABLE `mc_banners`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_blog`
--
ALTER TABLE `mc_blog`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_boxes`
--
ALTER TABLE `mc_boxes`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `mc_brands`
--
ALTER TABLE `mc_brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_campaigns`
--
ALTER TABLE `mc_campaigns`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_categories`
--
ALTER TABLE `mc_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_click_history`
--
ALTER TABLE `mc_click_history`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_comparisons`
--
ALTER TABLE `mc_comparisons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_countries`
--
ALTER TABLE `mc_countries`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT для таблицы `mc_coupons`
--
ALTER TABLE `mc_coupons`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_dropshippers`
--
ALTER TABLE `mc_dropshippers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_entry_log`
--
ALTER TABLE `mc_entry_log`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_flat`
--
ALTER TABLE `mc_flat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_giftcerts`
--
ALTER TABLE `mc_giftcerts`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_giftcodes`
--
ALTER TABLE `mc_giftcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_methods`
--
ALTER TABLE `mc_methods`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `mc_methods_params`
--
ALTER TABLE `mc_methods_params`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `mc_mp3`
--
ALTER TABLE `mc_mp3`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_newpages`
--
ALTER TABLE `mc_newpages`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `mc_newsletter`
--
ALTER TABLE `mc_newsletter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_newstemplates`
--
ALTER TABLE `mc_newstemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_news_ticker`
--
ALTER TABLE `mc_news_ticker`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_paystatuses`
--
ALTER TABLE `mc_paystatuses`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_pdf`
--
ALTER TABLE `mc_pdf`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mc_per`
--
ALTER TABLE `mc_per`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_percent`
--
ALTER TABLE `mc_percent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_personalisation`
--
ALTER TABLE `mc_personalisation`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_pictures`
--
ALTER TABLE `mc_pictures`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_price_points`
--
ALTER TABLE `mc_price_points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_products`
--
ALTER TABLE `mc_products`
  MODIFY `id` mediumint(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_prod_brand`
--
ALTER TABLE `mc_prod_brand`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_prod_category`
--
ALTER TABLE `mc_prod_category`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_prod_relation`
--
ALTER TABLE `mc_prod_relation`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_purchases`
--
ALTER TABLE `mc_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_purch_atts`
--
ALTER TABLE `mc_purch_atts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_purch_pers`
--
ALTER TABLE `mc_purch_pers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_qtyrates`
--
ALTER TABLE `mc_qtyrates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_rates`
--
ALTER TABLE `mc_rates`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_sales`
--
ALTER TABLE `mc_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_search_index`
--
ALTER TABLE `mc_search_index`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_search_log`
--
ALTER TABLE `mc_search_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_services`
--
ALTER TABLE `mc_services`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_settings`
--
ALTER TABLE `mc_settings`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mc_social`
--
ALTER TABLE `mc_social`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `mc_statuses`
--
ALTER TABLE `mc_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_status_text`
--
ALTER TABLE `mc_status_text`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_tare`
--
ALTER TABLE `mc_tare`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_themes`
--
ALTER TABLE `mc_themes`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_tracker`
--
ALTER TABLE `mc_tracker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_tracker_clicks`
--
ALTER TABLE `mc_tracker_clicks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_users`
--
ALTER TABLE `mc_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_zones`
--
ALTER TABLE `mc_zones`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mc_zone_areas`
--
ALTER TABLE `mc_zone_areas`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
