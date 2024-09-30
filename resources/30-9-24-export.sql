-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2024 at 01:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catalogue`
--

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `animal_id` int(11) NOT NULL,
  `common_name` varchar(255) NOT NULL,
  `scientific_name` varchar(255) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `family_id` int(11) DEFAULT NULL,
  `genus_id` int(11) NOT NULL,
  `conservation_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`animal_id`, `common_name`, `scientific_name`, `class_id`, `order_id`, `family_id`, `genus_id`, `conservation_id`, `thumbnail`) VALUES
(1, 'Goldfinch', 'Carduelis carduelis', 1, 1, 4, 1, 1, 'goldfinch_thumb.jpg'),
(2, 'Robin', 'Erithacus rubecula', 1, 1, 7, 2, 1, 'robin_thumb.jpg'),
(3, 'Grey Squirrel', 'Sciurus carolinensis', 2, 3, 9, 3, 11, 'grey_squirrel_thumb.jpg'),
(4, 'Wood Mouse', 'Apodemus sylvaticus', 2, 3, 8, 4, 10, 'wood_mouse_thumb.jpg'),
(5, 'Egyptian Goose', 'Alopochen aegyptiaca', 1, 5, 12, 5, 5, 'egyptian_goose_thumb.jpg'),
(6, 'Canada Goose', 'Branta canadensis', 1, 5, 12, 6, 5, 'canada_goose_thumb.jpg'),
(7, 'House Sparrow', 'Passer domesticus', 1, 1, 2, 7, 3, 'house_sparrow_thumb.jpg'),
(8, 'Coot', 'Fulica atra', 1, 6, 14, 8, 1, 'coot_thumb.jpg'),
(9, 'Collared Dove', 'Streptopelia decaocto', 1, 7, 6, 9, 1, 'collared_dove_thumb.jpg'),
(11, 'Wood Pigeon', 'Columba palumbus', 1, 7, 6, 10, 1, 'wood_pigeon_thumb.jpg'),
(12, 'Feral Pigeon', 'Columba livia domestica', 1, 7, 6, 10, 1, 'feral-pigeon-thumb.jpg'),
(13, 'Mute Swan', 'Cygnus olor', 1, 5, 12, 11, 1, 'mute_swan_thumb.jpg'),
(14, 'Magpie', 'Pica pica', 1, 1, 1, 12, 1, 'magpie_thumb.jpg'),
(15, 'Grey Heron', 'Ardea cinerea', 1, 8, 16, 13, 1, 'grey-heron-thumb.jpg'),
(16, 'Jackdaw', 'Coloeus monedula', 1, 1, 1, 14, 1, 'jackdaw_thumb.jpg'),
(17, 'Mallard', 'Anas platyrhynchos', 1, 5, 12, 15, 5, 'mallard_thumb.jpg'),
(18, 'Blackbird', 'Turdus merula', 1, 1, 5, 16, 1, 'blackbird_thumb.jpg'),
(19, 'Brown Rat', 'Rattus norvegicus', 2, 3, 8, 17, 11, 'brown_rat_thumb.jpg'),
(20, 'Starling', 'Sturnus vulgaris', 1, 1, 3, 18, 3, 'starling_thumb.jpg'),
(21, 'Jay', 'Garrulus glandarius', 1, 1, 1, 19, 1, 'jay_thumb.jpg'),
(22, 'Blackcap', 'Sylvia atricapilla', 1, 1, 17, 22, 1, 'blackcap_thumb.jpg\r\n'),
(23, 'Blue Tit', 'Cyanistes caeruleus', 1, 1, 18, 23, 1, 'blue_tit_thumb.jpg'),
(24, 'Chiffchaff', 'Phylloscopus collybita', 1, 1, 19, 24, 1, 'chiffchaff_thumb.jpg'),
(25, 'Carrion Crow', 'Corvus corone', 1, 1, 1, 25, 1, 'carrion_crow_thumb.jpg'),
(26, 'Swift', 'Apus apus', 1, 11, 20, 26, 3, 'swift_thumb.jpg'),
(27, 'Mandarin Duck', 'Aix galericulata', 1, 5, 12, 27, 5, 'mandarin_duck_thumb.jpg'),
(28, 'Treecreeper', 'Certhia familiaris', 1, 1, 21, 28, 1, 'treecreeper_thumb.jpg'),
(29, 'Dipper', 'Cinclus cinclus', 1, 1, 22, 29, 2, 'dipper_thumb.jpg'),
(30, 'Moorhen', 'Gallinula chloropus', 1, 6, 14, 30, 5, 'moorhen_thumb.jpg'),
(31, 'Wren', 'Troglodytes troglodytes', 1, 1, 23, 31, 2, 'wren_thumb.jpg'),
(32, 'Song Thrush', 'Turdus philomelos', 1, 1, 5, 16, 2, 'song_thrush_thumb.jpg'),
(33, 'Grey Wagtail', 'Motacilla cinerea', 1, 1, 24, 32, 5, 'grey-wagtail-thumb.jpg'),
(34, 'Cormorant', 'Phalacrocorax carbo', 1, 12, 25, 33, 1, 'cormorant-thumb.jpg'),
(35, 'Dunnock', 'Prunella modularis', 1, 1, 26, 34, 2, 'dunnock-thumb.jpg'),
(36, 'Long-Tailed Tit', 'Aegithalos caudatus', 1, 1, 27, 35, 1, 'long-tailed-tit-thumb.jpg'),
(37, 'Black-Headed Gull', 'Chroicocephalus ridibundus\r\n', 1, 13, 28, 36, 2, 'black-headed-gull-thumb.jpg'),
(38, 'Sanderling', 'Calidris alba', 1, 13, 29, 37, 2, 'sanderling-thumb.jpg'),
(39, 'Turnstone', 'Arenaria interpres', 1, 13, 29, 38, 2, 'turnstone-thumb.jpg'),
(40, 'Great Black-Backed Gull', 'Larus Marinus', 1, 13, 28, 39, 2, 'great-black-backed-gull-thumb.jpg'),
(41, 'Pied Wagtail', 'Motacilla alba', 1, 1, 24, 32, 1, 'pied-wagtail-thumb.jpg'),
(42, 'Rook', 'Corvus frugilegus', 1, 1, 1, 25, 5, 'rook-thumb.jpg'),
(43, 'Gannet', 'Morus bassanus', 1, 12, 30, 40, 2, 'gannet-thumb.jpg'),
(44, 'Stock Dove', 'Columba oenas', 1, 7, 6, 10, 2, 'stock-dove-thumb.jpg'),
(45, 'Oystercatcher', 'Haematopus ostralegus', 1, 13, 31, 41, 5, 'oystercatcher-thumb.jpg'),
(46, 'Knot', 'Calidris canutus', 1, 13, 29, 37, 2, 'knot-thumb.jpg'),
(47, 'Grey Seal', 'Halichoerus grypus', 2, 14, 33, 42, 11, 'grey-seal-thumb.jpg'),
(48, 'Common Seal', 'Phoca vitulina', 2, 14, 33, 43, 11, 'common-seal-thumb.jpg'),
(49, 'Ringed Plover', 'Charadrius hiaticula', 1, 13, 34, 44, 3, 'ringed-plover-thumb.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `animal_images`
--

CREATE TABLE `animal_images` (
  `image_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Unknown') DEFAULT NULL,
  `animal_age` enum('Juvenile','Adult','Unknown') DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `date_taken` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animal_images`
--

INSERT INTO `animal_images` (`image_id`, `animal_id`, `filename`, `gender`, `animal_age`, `caption`, `date_taken`, `location_id`) VALUES
(1, 1, 'goldfinch-1.jpg', NULL, NULL, 'A goldfinch at a Nyjer seed feeder in the rain.', '2028-05-24', 1),
(2, 1, 'goldfinch-2.jpg', NULL, NULL, 'A goldfinch at a Nyjer seed feeder in the rain.', '2028-05-24', 1),
(3, 1, 'goldfinch-3.jpg', NULL, NULL, 'A goldfinch at a Nyjer seed feeder in the rain.', '2028-05-24', 1),
(4, 11, 'wood-pigeon-2.jpg', NULL, NULL, 'A wood pigeon perched on a garden tool.', '2024-04-28', 1),
(5, 11, 'wood-pigeon-1.jpg', NULL, NULL, 'A closeup profile of a wood pigeon.', '2024-06-06', 1),
(6, 20, 'starling-1.jpg', 'Unknown', 'Adult', NULL, '2024-06-27', 1),
(8, 20, 'starling-juvenile-1.jpg', 'Unknown', 'Juvenile', 'A juvenile Starling peers out from underneath shelter.', '2024-06-24', 1),
(9, 20, 'starling-juvenile-2.jpg', 'Unknown', 'Juvenile', 'A juvenile Starling peers out from underneath shelter.', '2024-06-24', 1),
(10, 1, 'goldfinch-juvenile-1.jpg', 'Unknown', 'Juvenile', 'A juvenile goldfinch perched on a cherry tree.', '2024-06-27', 1),
(11, 24, 'chiffchaff-1.jpg', 'Unknown', 'Unknown', 'A chiffchaff sits calling atop a tree.', '2024-07-09', 3),
(12, 23, 'blue-tit-1.jpg', 'Unknown', 'Unknown', 'A blue tit sitting in a tree.', '2024-06-12', 1),
(13, 23, 'blue-tit-2.jpg', 'Unknown', 'Unknown', 'A blue tit perched in a cherry tree.', '2024-06-12', 1),
(14, 3, 'grey-squirrel-1.jpg', 'Unknown', 'Unknown', 'A grey squirrel looking for food from a wooden fence.', '2024-05-22', 1),
(15, 3, 'grey-squirrel-2.jpg', 'Unknown', 'Unknown', 'A grey squirrel sat high in a tree.', '2024-06-13', 3),
(16, 9, 'collared-dove-1.jpg', 'Unknown', 'Unknown', 'A collared dove perched on the corner of a garage.', '2024-06-18', 1),
(17, 26, 'swift-1.jpg', 'Unknown', 'Unknown', 'A swift soaring high in the early morning.', '2024-06-27', 1),
(18, 22, 'blackcap-female-1.jpg', 'Female', 'Adult', 'A female blackcap sat in a tree with food.', '2024-06-27', 3),
(19, 18, 'blackbird-juvenile-1.jpg', 'Unknown', 'Juvenile', 'A young blackbird sat atop a fallen tree.', '2024-06-28', 3),
(20, 25, 'carrion-crow-1.jpg', 'Unknown', 'Unknown', 'A large carrion crow standing on grass.', '2024-08-15', 6),
(22, 7, 'house-sparrow-1.jpg', 'Unknown', 'Unknown', 'A house sparrow sat on the corner of an extension.', '2024-06-03', 1),
(23, 20, 'starling-2.jpg', 'Unknown', 'Unknown', 'A flock of Starlings sat atop a lichen covered chimney and aerial.', '2024-07-06', 1),
(24, 28, 'treecreeper-1.jpg', 'Unknown', 'Unknown', 'A treecreeper perched high in the forest.', '2024-07-05', 2),
(25, 8, 'coot-1.jpg', 'Unknown', 'Unknown', 'A Coot Sat on Havelock Dam.', '2024-07-05', 2),
(26, 8, 'coot-2.jpg', 'Unknown', 'Unknown', 'The unusual portrait of a coot.', '2024-07-05', 2),
(27, 29, 'dipper-1.jpg', 'Unknown', 'Unknown', 'A Dipper Stood on a Log in the River Rivelin.', '2024-07-05', 2),
(28, 30, 'moorhen-1.jpg', 'Unknown', 'Unknown', 'A moorhen gets too close for the 200mm lens.', '2024-07-05', 2),
(29, 27, 'mandarin-duck-female-1.jpg', 'Female', 'Adult', 'A female mandarin duck on the water at Havelock dam.', '2024-07-06', 2),
(30, 24, 'chiffchaff-2.jpg', 'Unknown', 'Unknown', 'A chiffchaff sits calling atop a tree.', '2024-06-11', 3),
(31, 22, 'blackcap-male-1.jpg', 'Unknown', 'Unknown', 'A male blackcap sat calling from a tree branch.', '2024-06-12', 3),
(32, 23, 'blue-tit-3.jpg', 'Unknown', 'Unknown', 'A blue tit sat in a dead tree.', '2024-07-09', 1),
(33, 6, 'canada-goose-1.jpg', 'Unknown', 'Adult', 'An Adult Canada Goose with Their Goslings on a Lake.', '2024-07-02', 5),
(35, 6, 'canada-goose-2.jpg', 'Unknown', 'Adult', 'An Adult Canada Goose Hisses at a Passerby.', '2024-07-02', 5),
(36, 6, 'canada-goose-3.jpg', 'Unknown', 'Adult', 'An Adult Canada Goose Sat Amongst the Lake Foliage.', '2024-07-02', 5),
(37, 9, 'collared-dove-2.jpg', 'Unknown', 'Adult', 'The Profile of a Collared Dove Stood on a Bird Bath.', '2024-06-08', 1),
(38, 8, 'coot-3.jpg', 'Unknown', 'Unknown', 'A Coot Sat in the Water at Havelock Dam.', '2024-07-07', 2),
(39, 3, 'grey-squirrel-3.jpg', 'Unknown', 'Unknown', 'A Grey Squirrel Inspects Another Grey Squirrel in a Tree.', '2024-06-20', 3),
(40, 33, 'grey-wagtail-1.jpg', 'Male', 'Adult', 'A Male Grey Wagtail Stood on a Rock in the River Rivelin after Catching Food.', '2024-07-08', 2),
(41, 33, 'grey-wagtail-2.jpg', 'Female', 'Unknown', 'A Female Grey Wagtail Stood on a Rock in the River Rivelin.', '2024-07-08', 2),
(42, 16, 'jackdaw-1.jpg', 'Unknown', 'Unknown', 'A Jackdaw Perched in Scrubland.', '2024-07-01', 2),
(43, 21, 'jay-1.jpg', 'Unknown', 'Unknown', 'A Eurasian Jay Perched on the Edge of a Shed Roof.', '2024-06-09', 1),
(44, 14, 'magpie-1.jpg', 'Unknown', 'Unknown', 'A Magpie Inspecting a Tree.', '2024-06-20', 3),
(45, 14, 'magpie-2.jpg', 'Unknown', 'Unknown', 'A Magpie Spreads their Wings to Reveal Blue Feathers.', '2024-06-03', 1),
(46, 17, 'mallard-male-1.jpg', 'Male', 'Adult', 'A mallard drake sat at the waterside with molting mating colours.', '2024-07-02', 6),
(47, 17, 'mallard-male-2.jpg', 'Male', 'Adult', 'A mallard drake in the water.', '2024-07-02', 6),
(48, 17, 'mallard-juvenile-1.jpg', 'Unknown', 'Juvenile', 'Two young mallards sifting for food at the waterside. ', '2024-07-02', 6),
(49, 2, 'robin-1.jpg', 'Unknown', 'Adult', 'An adult robin perched on a fence.', '2023-12-19', 1),
(50, 2, 'robin-juvenile-1.jpg', 'Unknown', 'Juvenile', 'A juvenile robin in a tree.', '2024-07-11', 2),
(51, 32, 'song-thrush-1.jpg', 'Unknown', 'Unknown', 'Two song thrushes in foliage near a nest.', '2024-07-07', 2),
(52, 4, 'wood-mouse-1.jpg', 'Unknown', 'Unknown', 'A wood mouse after emerging from a small trench.', '2024-04-02', 1),
(53, 4, 'wood-mouse-2.jpg', 'Unknown', 'Unknown', 'A wood mouse eating a seed.', '2024-04-02', 1),
(54, 31, 'wren-1.jpg', 'Unknown', 'Unknown', 'A wren on a rock in a dried up riverbed.', '2024-07-07', 2),
(55, 34, 'cormorant-1.jpg', 'Unknown', 'Adult', 'A cormorant perched on a tree in Havelock Dam.', '2024-07-23', 2),
(56, 25, 'carrion-crow-2.jpg', 'Unknown', 'Adult', 'A carrion crow sits in the grass.', '2024-07-23', 3),
(58, 2, 'robin-2.jpg', 'Unknown', 'Adult', 'A robin in the process of malting feathers.', '2024-07-27', 2),
(59, 36, 'long-tailed-tit-1.jpg', 'Unknown', 'Unknown', 'A long tailed tit perched in a tree above Havelock dam.', '2024-08-03', 2),
(60, 15, 'grey-heron-1.jpg', 'Unknown', 'Unknown', 'A Grey Heron sat in a tree above Havelock Dam.', '2024-08-06', 2),
(61, 15, 'grey-heron-2.jpg', 'Unknown', 'Unknown', 'A Grey Heron stretches its neck whilst perched in a tree above Havelock Dam.', '2024-08-06', 2),
(62, 15, 'grey-heron-3.jpg', 'Unknown', 'Unknown', 'A Grey Heron inspecting itself perched in a tree above Havelock Dam.', '2024-08-06', 2),
(63, 15, 'grey-heron-4.jpg', 'Unknown', 'Unknown', 'A Grey Heron rests perched in a tree above Havelock Dam.', '2024-08-06', 2),
(64, 19, 'brown-rat-1.jpg', 'Unknown', 'Unknown', 'A brown rat emerges from a bush next to the Weston Park duck pond.', '2024-06-08', 6),
(65, 38, 'sanderling-1.jpg', 'Unknown', 'Unknown', 'A Sanderling running along the shoreline in search for food from the tide.', '2024-09-10', 8),
(66, 39, 'turnstone-1.jpg', 'Unknown', 'Unknown', 'A Ruddy Turnstone stood on the harbour wall.', '2024-09-10', 7),
(67, 34, 'cormorant-2.jpg', 'Unknown', 'Unknown', 'A Cormorant streches its wing on the sand.', '2024-09-11', 7),
(68, 40, 'great-black-backed-gull-1.jpg', 'Unknown', 'Unknown', 'A Great Black-Backed Gull observing the shoreline for food.', '2024-09-11', 8),
(69, 41, 'pied-wagtail-1.jpg', 'Unknown', 'Unknown', 'A pied wagtail stood on a caravan roof.', '2024-09-13', 8),
(70, 43, 'gannet-1.jpg', 'Unknown', 'Unknown', 'Four gannets in flight high above the Flamborough cliffs.', '2024-09-12', 9),
(71, 47, 'grey-seal-1.jpg', 'Unknown', 'Unknown', 'A grey seal laying on a pebble beach.', '2024-09-12', 9),
(72, 48, 'common-seal-1.jpg', 'Unknown', 'Unknown', 'A common seal laying on a beach.', '2024-09-12', 9),
(73, 37, 'black-headed-gull-1.jpg', 'Unknown', 'Unknown', 'An Black-headed gull in a pond with Mallards', '2024-08-15', 6),
(74, 12, 'feral-pigeon-1.jpg', 'Unknown', 'Unknown', 'A feral pigeon stood by a pond.', '2024-07-27', 6),
(75, 12, 'feral-pigeon-2.jpg', 'Unknown', 'Unknown', 'A white feral pigeon stood by a pond.', '2024-07-27', 6),
(76, 49, 'ringed-plover-1.jpg', 'Unknown', 'Unknown', 'A pair of ringed plovers explore shoreline.', '2024-09-12', 8),
(77, 5, 'egyptian-goose-1.jpg', 'Unknown', 'Unknown', 'An Egyptian Goose stood in front of reeds.', '2021-04-16', 4),
(78, 42, 'rook-1.jpg', 'Unknown', 'Unknown', 'A parliament of rooks on grass.', '2024-09-12', 8);

-- --------------------------------------------------------

--
-- Table structure for table `animal_order`
--

CREATE TABLE `animal_order` (
  `order_id` int(11) NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animal_order`
--

INSERT INTO `animal_order` (`order_id`, `order_name`, `class_id`) VALUES
(1, 'Passeriformes', 1),
(3, 'Rodentia', 2),
(5, 'Anseriformes', 1),
(6, 'Gruiformes', 1),
(7, 'Columbiformes', 1),
(8, 'Pelecaniformes', 1),
(9, 'Anura', 3),
(10, 'Eulipotyphla', 2),
(11, 'Apodiformes', 1),
(12, 'Suliformes', 1),
(13, 'Charadriiformes', 1),
(14, 'Carnivora', 2);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_common_name` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_common_name`, `class_name`) VALUES
(1, 'Birds', 'Aves'),
(2, 'Mammals', 'Mammalia'),
(3, 'Amphibians', 'Amphibia'),
(4, 'Insects', 'Insecta');

-- --------------------------------------------------------

--
-- Table structure for table `conservation`
--

CREATE TABLE `conservation` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `list_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conservation`
--

INSERT INTO `conservation` (`id`, `description`, `filename`, `list_id`) VALUES
(1, 'Green', 'green-list.svg', 1),
(2, 'Amber', 'amber-list.svg', 1),
(3, 'Red', 'red-list.svg', 1),
(4, 'Former Breeder', 'former-breeder.svg', 1),
(5, 'Not Assessed', 'not-assessed.svg', 1),
(6, 'Critically Endangered', 'critical.svg', 2),
(7, 'Endangered', 'endangered.svg', 2),
(8, 'Vulnerable', 'vulnerable.svg', 2),
(9, 'Near Threatened', 'near-threatened.svg', 2),
(10, 'Least Concern', 'least-concern.svg', 2),
(11, 'Not Evaluated', 'not-evaluated.svg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `conservation_list`
--

CREATE TABLE `conservation_list` (
  `list_id` int(11) NOT NULL,
  `list_name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conservation_list`
--

INSERT INTO `conservation_list` (`list_id`, `list_name`, `full_name`) VALUES
(1, 'BoCC5 (2021)', 'British Birds Journal - Birds of Conservation Concern 5'),
(2, 'JP025 (2018)', 'Natural England - A Review of the Population and Conservation Status of British Mammals');

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `family_id` int(11) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `common_name` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `family`
--

INSERT INTO `family` (`family_id`, `family_name`, `common_name`, `order_id`) VALUES
(1, 'Corvidae', 'Crows', 1),
(2, 'Passeridae', 'Old World Sparrows', 1),
(3, 'Sturnidae', 'Starlings', 1),
(4, 'Fringillidae', 'Finches', 1),
(5, 'Turdidae', 'Thrushes', 1),
(6, 'Columbidae', 'Pigeons and Doves', 7),
(7, 'Muscicapidae', 'Old World Flycatchers', 1),
(8, 'Muridae', 'True Mice', 3),
(9, 'Sciuridae', 'Squirrels', 3),
(10, 'Ranidae', 'True Frogs', 9),
(11, 'Erinaceidae', 'Hedgehogs', 10),
(12, 'Anatidae', 'Ducks, Geese, and Swans', 5),
(14, 'Rallidae', 'Rails', 6),
(16, 'Ardeidae', 'Herons, Bitterns, and Egrets', 8),
(17, 'Sylviidae', 'Typical Warblers and Babblers', 1),
(18, 'Paridae', 'Tits', 1),
(19, 'Phylloscopidae', 'Leaf Warblers', 1),
(20, 'Apodidae', 'Swifts', 11),
(21, 'Certhiidae', 'Treecreepers', 1),
(22, 'Cinclidae', 'Dippers', 1),
(23, 'Troglodytidae', 'Wrens', 1),
(24, 'Motacillidae', 'Wagtails, Longclaws and Pipits', 1),
(25, 'Phalacrocoracidae', 'Cormorants and Shags', 12),
(26, 'Prunellidae', 'Accentor', 1),
(27, 'Aegithalidae', 'Bushtits', 1),
(28, 'Laridae', 'Gulls and Terns', 13),
(29, 'Scolopacidae', 'Sandpipers', 13),
(30, 'Sulidae', 'Gannets and Boobies', 12),
(31, 'Haematopodidae', 'Oystercatchers', 13),
(33, 'Phocidae', 'True Seals', 14),
(34, 'Charadriidae', 'Plovers and Lapwings', 13);

-- --------------------------------------------------------

--
-- Table structure for table `genus`
--

CREATE TABLE `genus` (
  `genus_id` int(11) NOT NULL,
  `genus_name` varchar(255) NOT NULL,
  `family_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genus`
--

INSERT INTO `genus` (`genus_id`, `genus_name`, `family_id`) VALUES
(1, 'Carduelis', 4),
(2, 'Erithacus', 7),
(3, 'Sciurus', 9),
(4, 'Apodemus', 8),
(5, 'Alopochen', 12),
(6, 'Branta', 12),
(7, 'Passer', 2),
(8, 'Fulica', 14),
(9, 'Streptopelia', 6),
(10, 'Columba', 6),
(11, 'Cygnus', 12),
(12, 'Pica', 1),
(13, 'Ardea', 16),
(14, 'Coloeus', 1),
(15, 'Anas', 12),
(16, 'Turdus', 5),
(17, 'Rattus', 8),
(18, 'Sturnus', 3),
(19, 'Garrulus', 1),
(20, 'Rana', 10),
(21, 'Erinaceus', 11),
(22, 'Sylvia', 17),
(23, 'Cyanistes', 18),
(24, 'Phylloscopus', 19),
(25, 'Corvus', 1),
(26, 'Apus', 20),
(27, 'Aix', 12),
(28, 'Certhia', 21),
(29, 'Cinclus', 2),
(30, 'Gallinula', 14),
(31, 'Troglodytes', 23),
(32, 'Motacilla', 24),
(33, 'Phalacrocorax', 25),
(34, 'Prunella', 26),
(35, 'Aegithalos', 27),
(36, 'Chroicocephalus', 28),
(37, 'Calidris', 29),
(38, 'Arenaria', 29),
(39, 'Larus', 28),
(40, 'Morus', 30),
(41, 'Haematopus', 31),
(42, 'Halichoerus', 33),
(43, 'Phoca', 33),
(44, 'Charadrius', 34);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `location_city` varchar(255) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `area_caption` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_name`, `location_city`, `latitude`, `longitude`, `image`, `area_caption`) VALUES
(1, 'Crookes', 'Sheffield', 53.3859, -1.50788, NULL, ' A suburb with a mix of residential areas and green spaces, supporting a variety of urban wildlife.'),
(2, 'Rivelin Valley', 'Sheffield', 53.3954, -1.51407, NULL, 'A large valley with nature trails, waterfalls, and historic mill ponds, providing habitats for aquatic and woodland species.'),
(3, 'The Bole Hills', 'Sheffield', 53.3906, -1.51072, 'bolehills.jpg', 'A district park with heathland, scrub, and woodland. Rocky outcrops and recreational grounds are scattered throughout.'),
(4, 'Wollaton Hall', 'Nottingham', 52.9455, -1.21451, NULL, NULL),
(5, 'Crookes Valley Park', 'Sheffield', 53.3831, -1.49331, NULL, 'A historic district park featuring a large lake, grassy parkland, and lined with mature trees.'),
(6, 'Weston Park', 'Sheffield', 53.3827, -1.4895, NULL, 'A Victorian-era city park with ornamental gardens and green spaces that support urban wildlife. The duck pond provides a habitat for local waterfowl.'),
(7, 'Bridlington Harbour', 'Bridlington', 54.0812, -0.187167, 'bridlington.jpg', 'A busy working harbour with sandy banks.'),
(8, 'Barmston Beach', 'Barmston', 54.0184, -0.21441, 'barmston-beach.jpg', 'A sandy beach with a pebble deposits and rock pools. Coastal erosion is eroding the sand banks used as habitats.'),
(9, 'Flamborough Head', 'Flamborough', 54.1173, -0.07767, 'flamborough-head.jpg', 'A Site of Special Scientific Interest for both geological and biological nature. The historic chalk cliff sits beneath a grassy headland, offering a habitat to a variety of seabirds.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`animal_id`),
  ADD UNIQUE KEY `common_name` (`common_name`),
  ADD KEY `family_id` (`family_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `genus_id` (`genus_id`),
  ADD KEY `conservation_id` (`conservation_id`);

--
-- Indexes for table `animal_images`
--
ALTER TABLE `animal_images`
  ADD PRIMARY KEY (`image_id`),
  ADD UNIQUE KEY `filename` (`filename`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `animal_order`
--
ALTER TABLE `animal_order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_name` (`order_name`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `unique_class_common_name` (`class_common_name`),
  ADD UNIQUE KEY `unique_class_name` (`class_name`);

--
-- Indexes for table `conservation`
--
ALTER TABLE `conservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`);

--
-- Indexes for table `conservation_list`
--
ALTER TABLE `conservation_list`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`family_id`),
  ADD UNIQUE KEY `family_name` (`family_name`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `genus`
--
ALTER TABLE `genus`
  ADD PRIMARY KEY (`genus_id`),
  ADD UNIQUE KEY `genus_name` (`genus_name`),
  ADD KEY `family_id` (`family_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD UNIQUE KEY `location_id` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `animal_images`
--
ALTER TABLE `animal_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `animal_order`
--
ALTER TABLE `animal_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `conservation`
--
ALTER TABLE `conservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `conservation_list`
--
ALTER TABLE `conservation_list`
  MODIFY `list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `family`
--
ALTER TABLE `family`
  MODIFY `family_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `genus`
--
ALTER TABLE `genus`
  MODIFY `genus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`),
  ADD CONSTRAINT `animals_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `animals_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `animal_order` (`order_id`),
  ADD CONSTRAINT `animals_ibfk_4` FOREIGN KEY (`genus_id`) REFERENCES `genus` (`genus_id`),
  ADD CONSTRAINT `animals_ibfk_5` FOREIGN KEY (`conservation_id`) REFERENCES `conservation` (`id`);

--
-- Constraints for table `animal_images`
--
ALTER TABLE `animal_images`
  ADD CONSTRAINT `animal_images_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`),
  ADD CONSTRAINT `animal_images_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `animal_order`
--
ALTER TABLE `animal_order`
  ADD CONSTRAINT `animal_order_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);

--
-- Constraints for table `conservation`
--
ALTER TABLE `conservation`
  ADD CONSTRAINT `conservation_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `conservation_list` (`list_id`);

--
-- Constraints for table `family`
--
ALTER TABLE `family`
  ADD CONSTRAINT `family_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `animal_order` (`order_id`);

--
-- Constraints for table `genus`
--
ALTER TABLE `genus`
  ADD CONSTRAINT `genus_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
