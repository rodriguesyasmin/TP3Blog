-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 23 fév. 2024 à 21:50
-- Version du serveur : 10.4.19-MariaDB
-- Version de PHP : 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blogvoyage`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog_article`
--

CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL,
  `titre` varchar(45) NOT NULL,
  `contenu` text NOT NULL,
  `date` date NOT NULL,
  `blog_categorie_id` int(11) NOT NULL,
  `blog_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog_article`
--

INSERT INTO `blog_article` (`id`, `titre`, `contenu`, `date`, `blog_categorie_id`, `blog_user_id`) VALUES
(1, '10 Conseils Incontournables pour Voyager en E', 'Découvrez les astuces essentielles pour rendre votre voyage en Europe aussi agréable que possible, des réservations d\'hébergement aux transports.', '2024-02-20', 1, 1),
(2, 'Aventures en Plein Air', 'Explorez les magnifiques paysages européens avec des activités en plein air, des randonnées dans les Alpes aux sports nautiques en Méditerranée.', '2024-02-21', 2, 2),
(3, 'Gastronomie Européenne', 'Plongez dans la diversité culinaire de l\'Europe avec ce guide des plats emblématiques à déguster dans chaque pays.', '2024-02-22', 3, 3),
(4, 'Petit Budget : Conseils Pratiques', 'Découvrez comment économiser de l\'argent tout en explorant l\'Europe, des repas bon marché aux logements abordables.', '2024-02-23', 4, 4),
(5, 'Itinéraires Insolites', 'Partez à l\'aventure avec ces itinéraires uniques qui vous mèneront vers des destinations méconnues et étonnantes en Europe.', '2024-02-11', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `blog_categorie`
--

CREATE TABLE `blog_categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog_categorie`
--

INSERT INTO `blog_categorie` (`id`, `nom`) VALUES
(1, 'Conseils de Voyage'),
(2, 'Activités'),
(3, 'Culinaires'),
(4, 'Budget');

-- --------------------------------------------------------

--
-- Structure de la table `blog_commentaire`
--

CREATE TABLE `blog_commentaire` (
  `id` int(11) NOT NULL,
  `contenu` text NOT NULL,
  `date` date NOT NULL,
  `blog_article_id` int(11) NOT NULL,
  `blog_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog_commentaire`
--

INSERT INTO `blog_commentaire` (`id`, `contenu`, `date`, `blog_article_id`, `blog_user_id`) VALUES
(10, 'Excellent article!!', '2024-02-20', 5, 1),
(11, 'J\'ai adoré les conseils de voyage !', '2024-02-26', 1, 2),
(12, 'La gastronomie européenne est incroyable !', '2024-02-27', 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `blog_user`
--

CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mot_de_passe` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog_user`
--

INSERT INTO `blog_user` (`id`, `nom`, `email`, `mot_de_passe`) VALUES
(1, 'Yasmin Rodrigues', 'yasmin@hotmail.com', '123456'),
(2, 'Matheus Lopes', 'matheus@hotmail.com', '123456'),
(3, 'Tiago Cavalcanti', 'tiago@hotmail.com', '123456'),
(4, 'Marcos Vinicius', 'marcos@hotmail.com', '123456'),
(5, 'Peter', 'peter@hotmail.com', '123456');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blog_article`
--
ALTER TABLE `blog_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog_article_blog_categorie1_idx` (`blog_categorie_id`),
  ADD KEY `fk_blog_article_blog_user1_idx` (`blog_user_id`);

--
-- Index pour la table `blog_categorie`
--
ALTER TABLE `blog_categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blog_commentaire`
--
ALTER TABLE `blog_commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog_commentaire_blog_article1_idx` (`blog_article_id`),
  ADD KEY `fk_blog_commentaire_blog_user1_idx` (`blog_user_id`);

--
-- Index pour la table `blog_user`
--
ALTER TABLE `blog_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blog_article`
--
ALTER TABLE `blog_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `blog_categorie`
--
ALTER TABLE `blog_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `blog_commentaire`
--
ALTER TABLE `blog_commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `blog_user`
--
ALTER TABLE `blog_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blog_article`
--
ALTER TABLE `blog_article`
  ADD CONSTRAINT `fk_blog_article_blog_categorie1` FOREIGN KEY (`blog_categorie_id`) REFERENCES `blog_categorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_blog_article_blog_user1` FOREIGN KEY (`blog_user_id`) REFERENCES `blog_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `blog_commentaire`
--
ALTER TABLE `blog_commentaire`
  ADD CONSTRAINT `fk_blog_commentaire_blog_article1` FOREIGN KEY (`blog_article_id`) REFERENCES `blog_article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_blog_commentaire_blog_user1` FOREIGN KEY (`blog_user_id`) REFERENCES `blog_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
