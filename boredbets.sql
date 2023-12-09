-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 09. 22:01
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `boredbets`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `horses`
--

CREATE TABLE `horses` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Age` int(11) NOT NULL,
  `Stallion` tinyint(1) NOT NULL,
  `Jockey_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `races`
--

CREATE TABLE `races` (
  `Id` int(11) NOT NULL,
  `Race_time` datetime NOT NULL,
  `Weather` varchar(20) NOT NULL,
  `Track_Id` int(11) NOT NULL,
  `Horse_Id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Outcome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`Outcome`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tracks`
--

CREATE TABLE `tracks` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `Length` float NOT NULL,
  `Surface` varchar(20) NOT NULL,
  `Oval` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_bets`
--

CREATE TABLE `user_bets` (
  `Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Race_Id` int(11) NOT NULL,
  `Bet_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_crads`
--

CREATE TABLE `user_crads` (
  `Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `CreditCard_num` int(11) NOT NULL,
  `Cvc` int(11) NOT NULL,
  `Exp_date` varchar(15) NOT NULL,
  `Card_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_details`
--

CREATE TABLE `user_details` (
  `Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `horses`
--
ALTER TABLE `horses`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`Id`,`Track_Id`,`Horse_Id`),
  ADD KEY `Track_Id` (`Track_Id`);

--
-- A tábla indexei `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `user_bets`
--
ALTER TABLE `user_bets`
  ADD PRIMARY KEY (`Id`,`User_Id`,`Race_Id`),
  ADD KEY `User_Id` (`User_Id`),
  ADD KEY `Race_Id` (`Race_Id`);

--
-- A tábla indexei `user_crads`
--
ALTER TABLE `user_crads`
  ADD PRIMARY KEY (`Id`,`User_Id`);

--
-- A tábla indexei `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`Id`,`User_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `races`
--
ALTER TABLE `races`
  ADD CONSTRAINT `races_ibfk_1` FOREIGN KEY (`Track_Id`) REFERENCES `tracks` (`Id`);

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `user_crads` (`Id`);

--
-- Megkötések a táblához `user_bets`
--
ALTER TABLE `user_bets`
  ADD CONSTRAINT `user_bets_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`Id`),
  ADD CONSTRAINT `user_bets_ibfk_2` FOREIGN KEY (`Race_Id`) REFERENCES `races` (`Id`);

--
-- Megkötések a táblához `user_crads`
--
ALTER TABLE `user_crads`
  ADD CONSTRAINT `user_crads_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `users` (`Id`);

--
-- Megkötések a táblához `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
