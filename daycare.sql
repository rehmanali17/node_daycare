-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2021 at 03:21 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daycare`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add messages', 7, 'add_messages'),
(26, 'Can change messages', 7, 'change_messages'),
(27, 'Can delete messages', 7, 'delete_messages'),
(28, 'Can view messages', 7, 'view_messages'),
(29, 'Can add plan', 8, 'add_plan'),
(30, 'Can change plan', 8, 'change_plan'),
(31, 'Can delete plan', 8, 'delete_plan'),
(32, 'Can view plan', 8, 'view_plan'),
(33, 'Can add plans bought', 9, 'add_plansbought'),
(34, 'Can change plans bought', 9, 'change_plansbought'),
(35, 'Can delete plans bought', 9, 'delete_plansbought'),
(36, 'Can view plans bought', 9, 'view_plansbought'),
(37, 'Can add users', 10, 'add_users'),
(38, 'Can change users', 10, 'change_users'),
(39, 'Can delete users', 10, 'delete_users'),
(40, 'Can view users', 10, 'view_users');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$VwntIab7dqkQdJl82Y9ElH$Ya7u8dRNJynMKc/G02ei598GFNqU7vMqNQCsPDMp5jk=', '2021-08-09 13:15:48.473709', 1, 'admin', '', '', '', 1, 1, '2021-08-09 13:15:24.369864');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-08-09 13:26:15.438797', '2', '', 3, '', 7, 1),
(2, '2021-08-09 13:26:15.459965', '1', '', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'plans', 'messages'),
(8, 'plans', 'plan'),
(9, 'plans', 'plansbought'),
(10, 'plans', 'users'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-08-09 13:14:32.429467'),
(2, 'auth', '0001_initial', '2021-08-09 13:14:33.663306'),
(3, 'admin', '0001_initial', '2021-08-09 13:14:34.032152'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-08-09 13:14:34.046846'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-09 13:14:34.060459'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-08-09 13:14:34.164616'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-08-09 13:14:34.302583'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-08-09 13:14:34.331180'),
(9, 'auth', '0004_alter_user_username_opts', '2021-08-09 13:14:34.349129'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-08-09 13:14:34.456310'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-08-09 13:14:34.462740'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-08-09 13:14:34.482801'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-08-09 13:14:34.513134'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-08-09 13:14:34.542062'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-08-09 13:14:34.568202'),
(16, 'auth', '0011_update_proxy_permissions', '2021-08-09 13:14:34.583884'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-08-09 13:14:34.611196'),
(18, 'sessions', '0001_initial', '2021-08-09 13:14:34.670804'),
(22, 'plans', '0001_initial', '2021-08-11 18:23:23.468266');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('54czqtfrs6lgzi6rmcncdw0ex0c8kfu9', 'e30:1mEqX2:GdAHbul-FFmRVDXxf7ruamSvJhddMeP6FHy4UyXT-tk', '2021-08-28 10:04:48.461059'),
('ccunpqsi8uzai30x40ukujbdg375bul0', 'eyJ1c2VyIjoicmVobWFubWFsaWsxN0BnbWFpbC5jb20ifQ:1mE6G0:7znKOf9Va4ONmjW-kjgYSN2Gvr0NgGcP6ZZtj-0-lII', '2021-08-26 08:40:08.819630'),
('e7ka2sguabrje04myspv5v08nqwuk7mb', '.eJxVjDsOwyAQRO9CHSGDMYaU7nMGtOwuwYllJH_SRLl7sOQimWo0n_cWAfYth33lJYwkrkKJy28WAZ88HwU9YL4XiWXeljHKYyLPdpW3QjwN5_YPkGHN9Z1M64kb60g5XYW2a7lNvUftO_Qu6ag6qj4paoxCq6NBANt49mx6W6EJXgHLVJaKG6adxecLIdE9gw:1mE6AV:slu_ISOqzDyCQs0SkFLJQwsr8-Lt9Rr-Em1K8aq9TAI', '2021-08-26 08:34:27.723364');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `m_email` varchar(100) NOT NULL,
  `m_phone` text NOT NULL,
  `m_address` text NOT NULL,
  `m_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `m_email`, `m_phone`, `m_address`, `m_message`) VALUES
(1, 'rehmanmalik17@gmail.com', '03476997578', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', 'Messageaaaaaaaaaaaaaaaaaaaaaa'),
(2, 'rehmanmalik17@gmail.com', '03476997578', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', 'Messageaaaaaaaaaaaaaaaaaaaaaa'),
(3, 'rehmanmalik17@gmail.com', '03476997578', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', 'Message123'),
(4, 'rehmanmalik17@gmail.com', '03476997578', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', 'Message'),
(5, 'rehmanmalik17@gmail.com', '03476997578', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', 'Message'),
(6, 'rehmanmalik17@gmail.com', '03476997578', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', 'Message'),
(7, 'rehmanmalik17@gmail.com', '03476997578', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', 'Message');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `trial` varchar(100) DEFAULT NULL,
  `time_duration` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `title`, `duration`, `trial`, `time_duration`, `price`) VALUES
(1, 'Novice plan', '1 Months', '2 days', '30 minutes', 10),
(2, 'Basic plan', '2 Months', '5 days', '30 minutes', 30),
(3, 'Standard plan', '4 Months', '7 days', '45 minutes', 70),
(4, 'Premium plan', '8 Months', '10 days', '1 hour', 120),
(5, 'All in One plan', '12 Months', '15 days', '1 hour 15 minutes', 200);

-- --------------------------------------------------------

--
-- Table structure for table `plans_bought`
--

CREATE TABLE `plans_bought` (
  `id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `u_email` varchar(100) DEFAULT NULL,
  `p_time` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plans_bought`
--

INSERT INTO `plans_bought` (`id`, `p_id`, `u_email`, `p_time`) VALUES
(5, 2, 'rehmanmalik17@gmail.com', '12:00 PM'),
(7, 1, 'rehmanmalik17@gmail.com', '14:30 PM'),
(8, 1, 'rehmanmalik17@gmail.com', '14:30 PM'),
(9, 2, 'rehmanmalik17@gmail.com', '14:30 PM'),
(10, 2, 'rehmanmalik17@gmail.com', '14:30 PM'),
(12, 1, 'rehmanmalik17@gmail.com', '18:30 PM');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_email` varchar(100) NOT NULL,
  `u_password` tinytext DEFAULT NULL,
  `u_name` tinytext DEFAULT NULL,
  `u_address` tinytext DEFAULT NULL,
  `u_phone` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_email`, `u_password`, `u_name`, `u_address`, `u_phone`) VALUES
('rehmanmalik1117@gmail.com', '03445265602e8e193e7a3382d489cc8d1b1bfc44', 'Rehman Ali', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik1327@gmail.com', '1', 'rehman_ali17', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik1711@gmail.com', '123456', 'rehman_ali17', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik1721@gmail.com', '12', 'rehman_ali17', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik17@gmail.com', '$2b$10$YGI1614VS16nW/7hqdAnlOWuKeXsrIflSGDOI.uj2oz79BK1ezxjS', 'Rehman Ali Arif', 'P.O khaas bakhrevali Tehsil Sambrial District Sialkot', '03476997578'),
('rehmanmalik17@gmail.com1', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 'Hamza', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik2117@gmail.com', '$2b$10$YGI1614VS16nW/7hqdAnlOWuKeXsrIflSGDOI.uj2oz79BK1ezxjS', 'rehman_ali17', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik2217@gmail.com', 'malik 70', 'rehman_ali17', 'malik 70', '03476997578'),
('rehmanmalik27@gmail.com', 'f713487095ef67c685773f9678202a34472047c3', 'Rehman Ali', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik3117@gmail.com', '12345', 'rehman_ali17', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik317@gmail.com', '123456', 'rehman_ali17', '123456', '03476997578'),
('rehmanmalik37@gmail.com', '12345', 'rehman_ali17', 'P.O khaas Bakhrevali Tehsil Sambrial Sialkot', '03476997578'),
('rehmanmalik417@gmail.com', 'asdfgh', 'rehman_ali17', 'asdfgh', '03476997578');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans_bought`
--
ALTER TABLE `plans_bought`
  ADD PRIMARY KEY (`id`),
  ADD KEY `u_email` (`u_email`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `plans_bought`
--
ALTER TABLE `plans_bought`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `plans_bought`
--
ALTER TABLE `plans_bought`
  ADD CONSTRAINT `plans_bought_ibfk_1` FOREIGN KEY (`u_email`) REFERENCES `users` (`u_email`),
  ADD CONSTRAINT `plans_bought_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `plan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
