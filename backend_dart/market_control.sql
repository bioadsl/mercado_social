-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03/11/2024 às 12:47
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `market_control`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `family_composition`
--

CREATE TABLE `family_composition` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `family_member_name` varchar(255) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `social_data`
--

CREATE TABLE `social_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `housing_condition` varchar(50) DEFAULT NULL,
  `employment_status` varchar(50) DEFAULT NULL,
  `education_level` varchar(50) DEFAULT NULL,
  `special_needs` tinyint(1) DEFAULT NULL,
  `other_social_programs` text DEFAULT NULL,
  `health_condition` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `social_data`
--

INSERT INTO `social_data` (`id`, `user_id`, `income`, `housing_condition`, `employment_status`, `education_level`, `special_needs`, `other_social_programs`, `health_condition`) VALUES
(1, 1, 2000.00, 'Alugada', 'Empregado', 'Superior', 0, 'Nenhum', 'Saudável'),
(2, 2, 2000.00, 'Propria', 'Empregado', 'Superior', 0, 'Nenhum', 'Saudável');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('Masculino','Feminino','Outro') DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `id_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `full_name`, `birth_date`, `gender`, `marital_status`, `id_number`, `address`, `phone`, `email`, `password`) VALUES
(1, 'João Silva', '1990-05-15', 'Masculino', 'Solteiro', '123456789', 'Rua das Flores, 123', '9876543210', 'joao.silva@example.com', 'minhasenha'),
(2, 'fabricio', '1980-07-25', 'Masculino', 'Solteiro', '123456789', 'Qs 106', '990440515', 'fabricio@social.com', '123');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `family_composition`
--
ALTER TABLE `family_composition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `social_data`
--
ALTER TABLE `social_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `family_composition`
--
ALTER TABLE `family_composition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `social_data`
--
ALTER TABLE `social_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `family_composition`
--
ALTER TABLE `family_composition`
  ADD CONSTRAINT `family_composition_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `social_data`
--
ALTER TABLE `social_data`
  ADD CONSTRAINT `social_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
