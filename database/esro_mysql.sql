-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table db_silkroad.auctions_house_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `auctions_house_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions_house_logs` ENABLE KEYS */;

-- Dumping data for table db_silkroad.auctions_house_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `auctions_house_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions_house_settings` ENABLE KEYS */;

-- Dumping data for table db_silkroad.auction_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `auction_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_items` ENABLE KEYS */;

-- Dumping data for table db_silkroad.backlinks: ~0 rows (approximately)
/*!40000 ALTER TABLE `backlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `backlinks` ENABLE KEYS */;

-- Dumping data for table db_silkroad.char_gold: ~0 rows (approximately)
/*!40000 ALTER TABLE `char_gold` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_gold` ENABLE KEYS */;

-- Dumping data for table db_silkroad.char_gold_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `char_gold_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_gold_logs` ENABLE KEYS */;

-- Dumping data for table db_silkroad.char_inventories: ~0 rows (approximately)
/*!40000 ALTER TABLE `char_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_inventories` ENABLE KEYS */;

-- Dumping data for table db_silkroad.char_inventory_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `char_inventory_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_inventory_logs` ENABLE KEYS */;

-- Dumping data for table db_silkroad.donation_methods: ~0 rows (approximately)
/*!40000 ALTER TABLE `donation_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_methods` ENABLE KEYS */;

-- Dumping data for table db_silkroad.donation_paypals: ~0 rows (approximately)
/*!40000 ALTER TABLE `donation_paypals` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_paypals` ENABLE KEYS */;

-- Dumping data for table db_silkroad.donation_stripes: ~0 rows (approximately)
/*!40000 ALTER TABLE `donation_stripes` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_stripes` ENABLE KEYS */;

-- Dumping data for table db_silkroad.downloads: ~0 rows (approximately)
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
TRUNCATE TABLE downloads;
INSERT INTO `downloads` (`id`, `name`, `link`, `image_id`, `file_size`, `created_at`, `updated_at`) VALUES
	(1, 'GOOGLE HOST', 'https://drive.google.com/file/d/1tiRsVrc3OfvSlIhVFOfCtpk1N1kjASo6/view?usp=sharing', NULL, '2GB', '2022-06-11 15:34:57', '2022-06-18 04:55:27'),
	(2, 'SRO FONT', 'https://drive.google.com/file/d/1SeX5yF1fX1QJTYla5Pj1sqcR05WeDQ14/edit', NULL, '1MB', '2022-06-18 11:25:53', '2022-06-18 11:25:53'),
	(3, 'MEGA HOST', 'https://mega.nz/file/IvhxELjY#vuye0xydkgaVlCStMIRLnv-dpA5xyGHTDuHuhJxt7Dk', NULL, '2GB', '2022-06-18 12:25:29', '2022-06-18 12:25:29');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;

-- Dumping data for table db_silkroad.hide_rankings: ~0 rows (approximately)
/*!40000 ALTER TABLE `hide_rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hide_rankings` ENABLE KEYS */;

-- Dumping data for table db_silkroad.hide_ranking_guilds: ~0 rows (approximately)
/*!40000 ALTER TABLE `hide_ranking_guilds` DISABLE KEYS */;
/*!40000 ALTER TABLE `hide_ranking_guilds` ENABLE KEYS */;

-- Dumping data for table db_silkroad.images: ~0 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping data for table db_silkroad.item_mall_item_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `item_mall_item_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_mall_item_categories` ENABLE KEYS */;

-- Dumping data for table db_silkroad.item_web_mall: ~0 rows (approximately)
/*!40000 ALTER TABLE `item_web_mall` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_web_mall` ENABLE KEYS */;

-- Dumping data for table db_silkroad.item_web_mall_admin_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `item_web_mall_admin_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_web_mall_admin_logs` ENABLE KEYS */;

-- Dumping data for table db_silkroad.item_web_mall_purchase_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `item_web_mall_purchase_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_web_mall_purchase_logs` ENABLE KEYS */;

-- Dumping data for table db_silkroad.maxi_card_epin: ~0 rows (approximately)
/*!40000 ALTER TABLE `maxi_card_epin` DISABLE KEYS */;
/*!40000 ALTER TABLE `maxi_card_epin` ENABLE KEYS */;

-- Dumping data for table db_silkroad.maxi_card_epin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `maxi_card_epin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `maxi_card_epin_log` ENABLE KEYS */;

-- Dumping data for table db_silkroad.migrations: ~52 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
TRUNCATE TABLE migrations;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2020_01_06_205609_create_permission_tables', 1),
	(4, '2020_01_12_144720_create_downloads_table', 1),
	(5, '2020_01_15_194520_create_images_table', 1),
	(6, '2020_01_18_030910_create_news_table', 1),
	(7, '2020_01_18_039511_create_news_comments_table', 1),
	(8, '2020_01_20_222053_create_users_created_counts', 1),
	(9, '2020_02_07_213326_create_ticket_categories_table', 1),
	(10, '2020_02_07_213506_create_tickets_table', 1),
	(11, '2020_02_07_213659_create_ticket_prioritys_table', 1),
	(12, '2020_02_07_214122_create_ticket_status_table', 1),
	(13, '2020_02_13_003531_create_ticket_answers_table', 1),
	(14, '2020_03_08_231039_create_hide_rankings_table', 1),
	(15, '2020_03_09_141309_create_onlineofflinelog_table', 1),
	(16, '2020_03_10_161809_create_loginhistorylog_table', 1),
	(17, '2020_04_16_174118_create_backlinks_table', 1),
	(18, '2020_04_18_160542_create_magopts_table', 1),
	(19, '2020_04_21_185814_create_site_settings_table', 1),
	(20, '2020_04_25_021512_create_chargolds_table', 1),
	(21, '2020_04_25_022353_create_chargold_logs_table', 1),
	(22, '2020_04_26_224805_create_char_inventory_table', 1),
	(23, '2020_04_26_224816_create_char_inventory_logs_table', 1),
	(24, '2020_05_27_210543_create_auction_items_table', 1),
	(25, '2020_06_06_160314_create_auctions_house_settings_table', 1),
	(26, '2020_06_09_172654_create_auctions_house_log_table', 1),
	(27, '2020_06_09_193138_create_supportersonline_table', 1),
	(28, '2020_06_14_144000_create_notifications_table', 1),
	(29, '2020_06_19_163023_create_server_gold_table', 1),
	(30, '2020_06_19_170506_create_todos_table', 1),
	(31, '2020_06_20_022306_create_server_informations_table', 1),
	(32, '2020_07_09_003243_create_vouchers_table', 1),
	(33, '2020_09_22_231202_create_donations_methods_table', 1),
	(34, '2020_09_23_011139_create_donations_paypal_table', 1),
	(35, '2020_09_23_232126_create_paypal_invoices_table', 1),
	(36, '2020_10_03_035423_create_itempoolname_table', 1),
	(37, '2020_10_10_005910_create_hide_ranking_guilds_table', 1),
	(38, '2020_10_12_010028_create_rules_table', 1),
	(39, '2020_10_18_145531_create_uniquekilllogs_table', 1),
	(40, '2020_10_18_145933_create_uniquekillogs_procedure', 1),
	(41, '2020_10_25_011139_create_donations_stripe_table', 1),
	(42, '2020_10_26_194626_create_stripe_invoices_table', 1),
	(43, '2020_10_27_134742_create_pvp_records_table', 1),
	(44, '2020_10_31_022910_create_fortress_status_table', 1),
	(45, '2020_10_31_022911_create_webcms_procedure', 1),
	(46, '2020_11_06_190830_create_pages_table', 1),
	(47, '2020_12_10_033543_create_item_mall_item_categories_table', 1),
	(48, '2020_12_10_033544_create_item_web_mall_table', 1),
	(49, '2020_12_10_075335_create_item_web_mall_purchase_logs_table', 1),
	(50, '2020_12_10_075349_create_item_web_mall_add_logs_table', 1),
	(51, '2021_04_20_080600_create_maxi_card_epin_table', 1),
	(52, '2021_04_20_081004_create_maxi_card_epin_log_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping data for table db_silkroad.model_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping data for table db_silkroad.model_has_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
TRUNCATE TABLE model_has_roles;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(3, 'App\\User', 2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping data for table db_silkroad.news: ~2 rows (approximately)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
TRUNCATE TABLE news;
INSERT INTO `news` (`id`, `title`, `slug`, `body`, `image_id`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '🌟🌟THÔNG BÁO CHÍNH THỨC MỞ SERVER VERSION 2🌟🌟', 'v2', '<div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-size: 18px; line-height: 24px; white-space: pre;"><div>🌟🌟THÔNG BÁO CHÍNH THỨC MỞ SERVER VERSION 2🌟🌟</div><br><br><div>Xin chào toàn thể anh em.</div><br><div>Đầu tiên xin chân thành cảm ơn anh em đã đồng hành cùng Eternal Silkroad đến thời điểm hiện tại.</div><div>Sau một khoảng thời gian chính thức mở server version 1,</div><div>bọn mình nhận thấy cần có nhiều điểm khắc phục và hoàn thiện hơn để nâng cao trải nghiệm của anh em.</div><div>Chính vì vậy bọn mình đã đầu tư phát triển version 2, cũng là version hoàn thiện nhất, </div><div>mượt mà nhất server muốn đưa đến toàn thể anh em.</div><br><div>Vẫn giữ nguyên tiêu chí <span style="color: #ce9178;">"Tự do - Công bằng - Đơn giản"</span>,</div><div>Cùng các GM cực nhiệt tình và nhiệt huyết, </div><div>bọn mình tinh version 2 sẽ làm thỏa mãn những anh em chơi lâu sro năm</div><div> cũng như cực dễ tiếp cận với anh em mới chơi sro.</div><br><div>⚡️Thông tin version 2:</div><br><div>🔔 &nbsp;OPEN chính thức: </div><div>🔔 &nbsp;Tối Thứ 7 ngày 18-6-2022</div><div>Trang chủ: https://eternal-sro.online/</div><div>Đăng ký: https://eternal-sro.online/register</div><div>Download: https://eternal-sro.online/downloads</div><br><div>✔️ CAP: 110</div><br><div>✔️ Race: ASIA/EU</div><br><div>✔️ EXP: x35</div><br><div>✔️ Party EXP: x40</div><br><div>✔️ PC limit: 12</div><br><div>✔️ IP limit: 24</div><br><div>✔️ Đồ cuối: SON A, SON B</div><br><br><div>⚠️ Với tiêu chí PLAY TO WIN, Eternal có những chức năng cực hấp dẫn như &nbsp;dưới:</div><div>✔️ Tự động gắn đồ vào nhân vật khi train level lên đến SUN D9.</div><div>✔️ Hoàn toàn không drop rác để đỡ mất công lọc bán.</div><div>✔️ D11 kiếm được qua việc train quái hoặc đánh boss.</div><div>✔️ ANH EM CÓ TIN ĐƯỢC KHÔNG: SON A bây giờ đã có thể mua trong shop.✅</div><div>✔️ Vũ khí SON A có thể kiếm được thông qua nhiệm vụ tại NPC ở Trường An.✅</div><div>✔️ Tặng 5 silk / 1 giờ online.</div><br><div>⚠️Cùng với hệ thống điểm E-SRO chuyên nghiệp:</div><div>✔️ Điểm E-SRO có được thông qua việc săn boss, đi job.</div><div>✔️ Khi có điểm E-SRO anh em có thể mua cuộn tăng may mắn 5%, đá may mắn, nâng cấp đồ...</div><br><div>⚠️Hệ thống Phụ Bản:</div><div>✔️ Eternal Version 2 có đến tận 4 phụ bản, </div><div>khi tham gia phụ bản anh em có cơ hội nhận được xu, </div><div>huy chương đấu trường, cuộn giấy random SON.</div><div>Và đặc biệt ⚡️ [CÓ THỂ NHẬN ĐƯỢC VŨ KHÍ SON A] ⚡️ </div><div>khi thu thập đủ những lá bài TALISMAN</div><br><br><br><div>⚠️Tỷ lệ giả kim tại version 2:</div><div>Tỷ lệ đối với Vũ khí, giáp, khiên, trang sức.</div><div>🔅1 &nbsp;➡ 99%</div><div>🔅2 &nbsp;➡ 99%</div><div>🔅3 &nbsp;➡ 99%</div><div>🔅4 &nbsp;➡ 80%</div><div>🔅5 &nbsp;➡ 60%</div><div>🔅6 &nbsp;➡ 30%</div><div>🔅7 &nbsp;➡ 12%</div><div>🔅8 &nbsp;➡ 9%</div><div>🔅9 &nbsp;➡ 7%</div><div>🔅10 &nbsp;➡ 5%</div><div>🔅11 &nbsp;➡ 2%</div><div>🔅12 &nbsp;➡ 1%</div><br><div>Tỷ lệ đối với Nasrun</div><div>🔅1 &nbsp;➡ 99%</div><div>🔅2 &nbsp;➡ 99%</div><div>🔅3 &nbsp;➡ 99%</div><div>🔅4 &nbsp;➡ 40%</div><div>🔅5 &nbsp;➡ 30%</div><div>🔅6 &nbsp;➡ 20%</div><div>🔅7 &nbsp;➡ 12%</div><div>🔅8 &nbsp;➡ 8%</div><div>🔅9 &nbsp;➡ 5%</div><div>🔅10 &nbsp;➡ 2%</div><br><br><div>⚠️Hệ thống Job:</div><div>✔️ Giai đoạn đầu mở job 3 thành Hòa Điền - Đôn Hoàng - Trường An.</div><div>✔️ Anh em đi càng xa càng nhận được nhiều thưởng và Gold </div><div>(chắc chắn có đá bất diệt, astral, gold, xu, điểm E-SRO)</div><div>✔️ Hệ thống buff job đặc trưng khi đạt đủ level: </div><div>&nbsp; &nbsp; ✏️ lv1: 3 Sức Mạnh 3 Trí Tuệ</div><div>&nbsp; &nbsp; ✏️ lv2: 3 Sức Mạnh 3 Trí Tuệ</div><div>&nbsp; &nbsp; ✏️ lv3: 3 Sức Mạnh 3 Trí Tuệ</div><div>&nbsp; &nbsp; ✏️ lv4: 4 Sức Mạnh 4 Trí Tuệ</div><div>&nbsp; &nbsp; ✏️ lv5: 5 Sức Mạnh 5 Trí Tuệ</div><div>&nbsp; &nbsp; ✏️ lv6: 6 Sức Mạnh 6 Trí Tuệ</div><div>&nbsp; &nbsp; ✏️ lv7: 7 Sức Mạnh 7 Trí Tuệ, 5% tỉ lệ đánh, 5% tỉ lệ đỡ.</div><br><br><div>⚠️Hệ thống boss:</div><div>💛 Sự quen thuộc của boss vẫn được giữ lại từ version 1.</div><div> Nhưng boss version 2 đã được tăng số lượng và drop cũng chất lượng hơn rất nhiều.</div><div>💛 Boss sẽ drop đá Bất diệt, Astral, xu, điểm E-SRO.</div><br><br><div>⚠️Thời trang - Thú nuôi:</div><div>- Chắc chắn &nbsp;bọn mình đã rút kinh nghiệm từ version 1, </div><div>tại version 2 số lượng thời trang và thú nuôi đã tăng lên rất phong phú và đa dạng,</div><div>cùng hiệu ứng siêu bắt mắt cho anh em lựa chọn.</div><div>- NASUN đã có thiên thần và 1 NASRUN custom siêu đẹp cùng skill riêng cho từng loại Nasrun.</div><br><div>⚜️Hệ thống Skill:</div><div>- Anh em luôn lo rằng ASIA sẽ bị lép vế so với EU ? Tại version 2, </div><div>hệ thống skill đã được cân bằng lại giữa các chủng tộc nhằm hạn chế sự imba của EU.</div><br><br><div>Cùng rất nhiều sự kiện, chức năng nữa đang chờ anh em khám phá.</div><div>Rất mong được đồng hành cùng anh em tại version 2 hoàn chỉnh này.</div><br><div>=================================</div><br><div>Trang chủ: https://eternal-sro.online/</div><div>Đăng ký: https://eternal-sro.online/register</div><div>Download: https://eternal-sro.online/downloads</div><div>Facebook page : https://www.facebook.com/EternalSROnline </div><div>Facebook group: https://www.facebook.com/groups/1075056413356108</div><div>Discord: https://discord.com/invite/7ZwK7NxYcT</div><div>Ủng hộ server nhận quà tri ân:  <span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;">https://eternal-sro.online/news/ung-ho</span></div><div> </div></div>', NULL, '2022-06-14 19:18:54', '2022-06-14 19:19:37', '2022-06-21 07:52:43', NULL),
	(2, '🌞ỦNG HỘ SERVER - NHẬN QUÀ TRI ÂN 🌞', 'ung-ho', '<div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-size: 18px; line-height: 24px; white-space: pre;"><div>Cảm ơn anh em đã tin tưởng và đồng hành cùng Eternal.</div><br><div>Server tuy còn non trẻ nhưng với tâm huyết cùng sự đầu tư của đội ngũ GM </div><div>chắc chắn sẽ mang đến trải nghiệm tốt nhất đến các bạn theo thời gian.</div><br><div>Với tiêu chí phi lợi nhuận, Free to Win, </div><div>server có rất nhiều cách kiếm Gold, silk, item trong game đang chờ các bạn khám phá.</div><br><div>Nếu bạn nào cảm thấy có cảm tình với server hoặc thương admin 55kg thì có thể ủng hộ bọn mình qua kênh sau nhé:</div><div>Chuyển khoản ngân hàng:</div><div>Ngân hàng TP bank (Tien Phong bank)</div><div>- TK: 0090 3295 001</div><div>- Tên người nhận: NGUYEN TIEN HOANG</div><div>Nội dung: <span style="color: #ce9178;">"tên nhân vật"</span> ung ho Eternal</div><div>Ví dụ: 1EXP ung ho Eternal</div><br><div>Sau khi ủng hộ các bạn vui lòng inbox cho admin để nhận quà tri ân như sau:</div><div>100K ủng hộ = 3000 silk</div><div>200K ủng hộ = 7000 silk</div><div>500K ủng hộ &nbsp;= 20000 silk</div><br><div>Các kênh liên lạc với GM:</div><div>-Facebook page : https://www.facebook.com/EternalSROnline</div><div>-Discord: https://discord.com/invite/7ZwK7NxYcT</div><br><div>Cảm ơn các bạn rất nhiều.</div></div>', NULL, '2022-06-15 18:30:08', '2022-06-15 18:32:20', '2022-06-15 18:32:20', NULL),
	(3, '🌈Hệ thống điểm E-SRO (E-SRO Point) Trong game.🌈', 'guide-e-point', '<p>Xin chào anh em.</p><p>Giới thiệu đến anh em hệ thống điểm E-SRO tại version 2 của Eternal.</p><p>Khi có điểm E-SRO anh em có thể mua đá may mắn, cuộn tăng may mắn lên 5%&nbsp;</p><p>và cũng là điểm cần thiết dùng để mua nhiều item khác.</p><p><br></p><p>Anh em có thể mua những item từ ETERNAL Npc và NPC bán đồ SON A tại Trường An.</p><p><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/285260792_399054895577694_3396455342811053134_n.png?_nc_cat=105&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=Z-PQKqoyf9MAX_jDBYO&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVLy8v6Qunq8sL-Z0FddE3CHZEREpI8FQtExNkM5vPSxYA&amp;oe=62D1FDA9" style="width: 50%;"><br></p><p><br></p><p>Và điểm E-SRO để mua item sẽ được ghi như dưới:</p><p>&nbsp;<img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/286484056_766705451440753_4507493884593876075_n.png?_nc_cat=102&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=el6aawBOQoQAX_d8Iai&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVLpF9n0S1cVyXBFGCHSoxpoa_xvK0VFNcRM3U-7-9uA9w&amp;oe=62D2F570" style="width: 50%;"></p><p><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/283335881_398611125557327_3050541321878004284_n.png?_nc_cat=105&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=NzFlagQ0-IYAX8xpevb&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVKUkv8e3XlRRt5PsgVJ1hsJv-2GsIeTmujMqh-H1K1WSw&amp;oe=62D36251" style="width: 50%;"><br></p><p><br></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔆</span>Cách kiếm điểm E-SRO trong game:</p><p>- Thông qua cách săn boss, đi job hoặc giả kim.</p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🉐</span>Điểm E-SRO từ boss:</p><p>Hổ nữ:&nbsp; 3 - 5 điểm E-SRO</p><p>Ô Lỗ Tề:&nbsp; 3 - 5 điểm E-SRO</p><p>Chó 3 đầu:&nbsp; 3 - 5 điểm E-SRO</p><p>Thuyền Trưởng IVY:&nbsp; 5<span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;">&nbsp;- 8 điểm E-SRO</span></p><p>Băng chúa Nhi:&nbsp; 8<span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;">&nbsp;- 10 điểm E-SRO</span></p><p><span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;">Yakan: 10 - 12 điểm</span>&nbsp;E-SRO</p><p><span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;">Shaitan:&nbsp; 15 - 17&nbsp;</span><span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;">điểm</span>&nbsp;E-SRO</p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🉐</span>Điểm từ JOB:</p><p>Sau mỗi chuyến job thành công anh em trong party job sẽ có 30 điểm E-SRO</p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🉐</span>Giả kim:</p><p><google-sheets-html-origin style="font-size: medium;"></google-sheets-html-origin></p><table xmlns="http://www.w3.org/1999/xhtml" cellspacing="0" cellpadding="0" dir="ltr" border="1" style="table-layout: fixed; font-size: 10pt; font-family: Arial; width: 0px; border-collapse: collapse; border: none;"><colgroup><col width="100"><col width="130"></colgroup><tbody><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;Giả kim&quot;}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">Giả kim</td><td style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom;">Điểm E-SRO</td></tr><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;+7&quot;,&quot;6&quot;:1}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">+7</td><td data-sheets-value="{&quot;1&quot;:3,&quot;3&quot;:5}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">5</td></tr><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;+8&quot;,&quot;6&quot;:1}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">+8</td><td data-sheets-value="{&quot;1&quot;:3,&quot;3&quot;:8}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">8</td></tr><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;+9&quot;,&quot;6&quot;:1}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">+9</td><td data-sheets-value="{&quot;1&quot;:3,&quot;3&quot;:10}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">10</td></tr><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;+10&quot;,&quot;6&quot;:1}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">+10</td><td data-sheets-value="{&quot;1&quot;:3,&quot;3&quot;:20}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">20</td></tr><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;+11&quot;,&quot;6&quot;:1}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">+11</td><td data-sheets-value="{&quot;1&quot;:3,&quot;3&quot;:30}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">30</td></tr><tr style="height: 21px;"><td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;+12&quot;,&quot;6&quot;:1}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">+12</td><td data-sheets-value="{&quot;1&quot;:3,&quot;3&quot;:40}" style="border: 1px solid rgb(204, 204, 204); overflow: hidden; padding: 2px 3px; vertical-align: bottom; text-align: right;">40</td></tr></tbody></table><p><span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;"><br></span></p><p><br></p><p><br></p><p><br></p>', NULL, '2022-06-18 04:57:48', '2022-06-18 05:27:01', '2022-06-18 05:27:01', NULL),
	(4, '💥CỰC HOT💥HƯỚNG DẪN LẤY VŨ KHÍ SON A TẠI ETERNAL🎇', 'get-son-a', '<p><span style="color: rgb(255, 255, 255);">Xin chào anh em.</span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🧪</span>Liệu người cũ có sợ bị cách biệt quá lớn khi server&nbsp;đã có những lão làng ?</span></p><p><span style="color: rgb(255, 255, 255);">Chắc chắn là không,&nbsp;</span></p><p><span style="color: rgb(255, 255, 255);">Bởi hệ thống quest&nbsp;đặc trưng chỉ có tại&nbsp;Eternal sẽ giúp anh em chắc chắn có vũ khi SON A&nbsp;<span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔫</span></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">⚙️</span>Điều kiện&nbsp;để làm nhiệm vụ lấy vũ khí:</span></p><p><span style="color: rgb(255, 255, 255);">- Đạt level 110</span></p><p><span style="color: rgb(255, 255, 255);">- Đi cùng Party</span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">💉</span>BẮT&nbsp;ĐẦU</span></p><p><span style="color: rgb(255, 255, 255);">Anh em qua gặp Quest NPC tại trường an và nhận nhiệm vụ&nbsp;đầu tiên như trong hình:</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/289007759_551247099826322_4442623232104728872_n.png?_nc_cat=106&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=zt8WcAA8QTMAX-WSWHS&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVJKMZapuxXlqnM5vjqhkIclSAyOxS2hmbIsPBoECylgpA&amp;oe=62D89485" style="width: 441px;"></span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/284830478_774815276855209_5082104437760671073_n.png?_nc_cat=104&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=5F90-M2vkn8AX_QUohD&amp;tn=UO8UX3LBABWC99B-&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVLsqeReDuwYY3OUMrkQygSbg3ZCaMKtUdH38ismA6iTmA&amp;oe=62D79660" style="width: 965px;"></span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔮</span>Để làm&nbsp;được nhiệm vụ này anh em cần mua lỗ hổng thời gian Cấp bậc khó tại Scrolls NPC</span></p><p><span style="color: rgb(255, 255, 255);">Lỗ hổng có tên: Dimension Hole (Hall&nbsp;Of&nbsp;Worship-Grade 3)</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/287012273_576890743783416_6593369887346047021_n.png?_nc_cat=109&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=sTt0PwCZv9MAX8cnc99&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVLX33G8eDZUHqBtJhCvQp71rO0LknwRYY_vPi7TECsxrw&amp;oe=62D8C1DD" style="width: 224px;"></span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔓</span><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔓</span><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔓</span><span style="font-size: 1rem;">Anh em nhớ người mở l</span>ỗ hổng bắt buộc phải là chủ Party, vì chủ party mới có quyền triệu hồi thành viên vào nhé.&nbsp;<span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔓</span><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔓</span><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔓</span></span></p><p><span style="font-size: 1rem; color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">📜</span><span style="font-size: 1rem;">Sau khi c</span>ả party vào trong lỗ&nbsp;<span style="font-size: 1rem;">hổng kh</span>ông gian rồi anh em tiêu diệt toàn bộ quái vật tại khu vực "Suối nước" như trong hình.</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/287931473_448003143331339_7460107029875669378_n.png?_nc_cat=109&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=2I1WG_qcjjcAX8pWuGk&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVJlJCQEc6rvH_gPNl4vVfi-pifUCBi21kHh8GMjfPFuNg&amp;oe=62DA0AFC" style="width: 749px;"></span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">📜</span><span style="font-size: 1rem;">Sau khi ti</span>êu diệt hết&nbsp;đám quái&nbsp;đó cánh cổng&nbsp;đến khu vực tiếp theo sẽ mở ra. </span></p><p><span style="color: rgb(255, 255, 255);">Và tiếp tục tiêu diệt toàn bộ quái trên&nbsp;đường&nbsp;đi.</span></p><p><span style="color: rgb(255, 255, 255);">Cho&nbsp;đến khi anh em gặp con boss&nbsp;đầu tiên "BABILION"</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/289075726_1366968703711120_4941965515541689866_n.png?_nc_cat=105&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=DWW-I5BJeCEAX-vYjlS&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVKRZg0-MhHNhFTUnR4oJCAo2OkEU28JTZehXwU5A1DUEQ&amp;oe=62D8948E" style="width: 736px;"></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">📜</span>Tương tự như vậy với&nbsp;đường&nbsp;đối diện.</span></p><p><span style="color: rgb(255, 255, 255);">Anh em sẽ gặp boss "THIEF BOSS KALIA"</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/282330513_764021134727766_2407337094228577156_n.png?_nc_cat=109&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=u_qdCKqtMK4AX-eAJts&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVITBnEQihlFt5JC7vfGkYc5TW1FTSPAZgOARPND_tHSkQ&amp;oe=62D80746" style="width: 698px;"><br></span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">📜</span>Và cuối cùng là trùm "JUPITER"</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fpnh22-1.fna.fbcdn.net/v/t1.15752-9/285214582_766270304368832_5961167381118349117_n.png?_nc_cat=110&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=IKSYXQgoinUAX8azKsy&amp;_nc_ht=scontent.fpnh22-1.fna&amp;oh=03_AVJkYyzNgABbPK3jaPXevIyoJbZkJBv3Y0vrWhexovdRiQ&amp;oe=62D78120" style="width: 743px;"></span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);">Tiêu diệt xong JUPITER là hoàn thành chuyến&nbsp;đi nhé anh em.</span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🎊</span>Phần thưởng:</span></p><p><span style="color: rgb(255, 255, 255);">Khi tiêu diệt 3 boss trên, sẽ random rơi ra một trong những lá bài TALISMAN như sau:</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/285077197_335005805473188_3547736015574814523_n.png?_nc_cat=106&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=NioLxaPVjNkAX_bSRTN&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVIcwyDT6WpuT9ws1azN245uKie7SR1H38-oxhPhE-4ruw&amp;oe=62D8C6BE" style="width: 210px;"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/286890747_5214884035291579_4361074693774231075_n.png?_nc_cat=104&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=H2ccQGQ6duoAX-UtEcK&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVKSjpV268BYCCXdx7tIDd77DMKWdfWeEwPUrTErBEGFNA&amp;oe=62D8C969" style="width: 206px;"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/284688415_1444976449299805_2528490893271959701_n.png?_nc_cat=101&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=RdjV_LYcg_AAX-wv9eY&amp;tn=UO8UX3LBABWC99B-&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVIeKcRoU0BjLMlGcNQ0qz4AtjV2zXPDPOZ6k_S-QMf4Wg&amp;oe=62D91D45" style="width: 202px;"></span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/288436557_701392380938561_3867905238849431158_n.png?_nc_cat=107&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=W-6BDrpQT1QAX_htKg9&amp;tn=UO8UX3LBABWC99B-&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVIDKVz4M5Kdqowi56dIyQRgQ8FWw8mwh7UZw9x88RKB5g&amp;oe=62D80AE4" style="width: 205px;"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/287513823_391991042901437_532057327228772435_n.png?_nc_cat=103&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=8kiTdZA16BYAX_3fIzr&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVI7ePLLsijIYzTSXoMANvRvRXY_e1hE40TaRCtzmAVA_A&amp;oe=62DA60DB" style="width: 205px;"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/289035970_347858630661043_4217773274237833634_n.png?_nc_cat=102&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=T62W_6VKLFoAX9hi6mo&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVK5DfvkgNZaE7zG4HYxjJUpZ9NB_eQjokNv7vXxfI2bXQ&amp;oe=62D73AB0" style="width: 204px;"></span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/288429141_1793173481014910_3087823339643427088_n.png?_nc_cat=109&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=ZBfWHqMurRAAX8FP3lb&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVLOPhsW8V51rdMVub4eiitvQKPmVEVC-sXCn-1itYb-qQ&amp;oe=62DA6B36" style="width: 203px;"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/282709177_604839610765627_6852766750067774778_n.png?_nc_cat=102&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=cHy4YRoJr-UAX9APipL&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVL7v9GhDy5XXPi47duJYRkql8onOigqeoLJZyKFc7IFWg&amp;oe=62D8FF14" style="width: 205px;"></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">⚠️&nbsp;</span><font face="Segoe UI Emoji"><span style="font-size: 49px;">Để có&nbsp;được vũ khí SON A&nbsp;</span></font></span></p><p><font face="Segoe UI Emoji"><span style="font-size: 49px; color: rgb(255, 255, 255);">Anh em cần có&nbsp;đủ 8 lá bài tương&nbsp;ứng với 8 loại như trên.</span></font></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/285649538_1106372086615768_8577431583532188101_n.png?_nc_cat=106&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=Ksh5eOqFVxcAX9pSNs0&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVLxhUd7S4rvYgDgaTLX74YmN4cvR2iKhZ92e3nJropHmA&amp;oe=62D97F29" style="width: 177px;"><font face="Segoe UI Emoji"><span style="font-size: 49px;"><br></span></font></span></p><p><span style="color: rgb(255, 255, 255);"><font face="Segoe UI Emoji"><span style="font-size: 49px;"><br></span></font><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">🔆</span>Sau khi thu thập&nbsp;đủ 8 loại lá bài anh em click chuột phải vào từng lá,</span></p><p><span style="color: rgb(255, 255, 255);">khi&nbsp;đó bộ sưu tập lá bùa sẽ hiện ra như hình dưới.</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/287771960_581342946911900_6782415327898657374_n.png?_nc_cat=102&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=J3VoyCy1gCMAX_hJx8D&amp;_nc_oc=AQn1MBR1lpIepl2aYUyJIJxd3zeUvZyHoCaa3f-x9zODRRw90CNTWcN0VljGrktjog5emxKezGALCE2ETZDpx6-F&amp;_nc_ht=scontent.fhan14-1.fna&amp;oh=03_AVKaf8DYZX9WYaDvkFZRTcO9BGvNbOM4e5eI-CYZ57NhAQ&amp;oe=62D98199" style="width: 861px;"></span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">✅</span>Sau&nbsp;đó quay lại Quest NPC&nbsp;để trả nhiệm vụ.</span></p><p><span style="color: rgb(255, 255, 255);">Và anh em sẽ nhận&nbsp;được 1 món vũ khí SON A tùy theo nhân vật là&nbsp;ASIA hay EU nhé.</span></p><p><span style="color: rgb(255, 255, 255);"><img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/287468228_725842561983823_6999159129500507002_n.png?_nc_cat=108&amp;ccb=1-7&amp;_nc_sid=ae9488&amp;_nc_ohc=42m-3G-UYcEAX_9qr1Y&amp;_nc_ht=scontent.fhan14-2.fna&amp;oh=03_AVLBYyAuKYh_ps7hP-65mQ6n7lpiqXebQqn0S2CKaMKAFQ&amp;oe=62D9B62D" style="width: 625px;"><br></span></p><p><span style="color: rgb(255, 255, 255);"><br></span></p><p><span style="color: rgb(255, 255, 255);"><span style="font-family: &quot;Segoe UI Emoji&quot;; font-size: 49px;">⚠️L</span><font face="Segoe UI Emoji" style=""><span style="font-size: 49px;">ƯU&nbsp;Ý:</span></font></span></p><p><font face="Segoe UI Emoji"><span style="font-size: 49px; color: rgb(255, 255, 255);">1: Thu thập&nbsp;đủ 8 lá rồi mới mở nhé anh em.</span></font></p><p><font face="Segoe UI Emoji"><span style="font-size: 49px; color: rgb(255, 255, 255);">2: Phần thưởng ngoài những lá bùa ra còn có "Huy Chương&nbsp;Đấu Trường" cực giá trị&nbsp;để sau này&nbsp;đổi trang sức SON A.</span></font><br></p>', NULL, '2022-06-22 16:48:45', '2022-06-22 17:25:15', '2022-06-22 17:32:08', NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Dumping data for table db_silkroad.news_comments: ~0 rows (approximately)
/*!40000 ALTER TABLE `news_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_comments` ENABLE KEYS */;

-- Dumping data for table db_silkroad.notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Dumping data for table db_silkroad.pages: ~0 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping data for table db_silkroad.pages_content: ~0 rows (approximately)
/*!40000 ALTER TABLE `pages_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_content` ENABLE KEYS */;

-- Dumping data for table db_silkroad.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping data for table db_silkroad.paypal_invoices: ~0 rows (approximately)
/*!40000 ALTER TABLE `paypal_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_invoices` ENABLE KEYS */;

-- Dumping data for table db_silkroad.permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping data for table db_silkroad.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
TRUNCATE TABLE roles;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'supporter', 'web', '2022-06-10 11:57:44', '2022-06-10 11:57:44'),
	(2, 'moderator', 'web', '2022-06-10 11:57:44', '2022-06-10 11:57:44'),
	(3, 'administrator', 'web', '2022-06-10 11:57:44', '2022-06-10 11:57:44');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping data for table db_silkroad.role_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping data for table db_silkroad.rules: ~0 rows (approximately)
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;

-- Dumping data for table db_silkroad.server_gold: ~0 rows (approximately)
/*!40000 ALTER TABLE `server_gold` DISABLE KEYS */;
TRUNCATE TABLE server_gold;
INSERT INTO `server_gold` (`id`, `gold`, `created_at`, `updated_at`) VALUES
	(1, 0, '2022-06-11 15:33:37', '2022-06-11 15:33:37');
/*!40000 ALTER TABLE `server_gold` ENABLE KEYS */;

-- Dumping data for table db_silkroad.server_information: ~0 rows (approximately)
/*!40000 ALTER TABLE `server_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_information` ENABLE KEYS */;

-- Dumping data for table db_silkroad.site_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
TRUNCATE TABLE site_settings;
INSERT INTO `site_settings` (`id`, `settings`) VALUES
	(1, '{"sro_silk_name":"Silk","sro_silk_gift_name":"E-SRO Point","discord_id":"956177818637697084","facebook_url":"https:\\/\\/www.facebook.com\\/EternalSROnline","youtube_url":"","contact_email":"","registration_close":false,"jangan_fortress":false,"bandit_fortress":false,"hotan_fortress":false,"constantinople_fortress":false,"char_ranking":true,"guild_ranking":true,"job_ranking":true,"trader_ranking":true,"hunter_ranking":true,"thief_ranking":true,"unique_ranking":true,"free_pvp_ranking":true,"job_pvp_ranking":true,"sro_content_id":"22","sro_max_server":"1000","sro_cap":"110","sro_exp":"40","sro_exp_gold":"5","sro_exp_drop":"4","sro_exp_job":"1","sro_exp_party":"40","sro_ip_limit":"18","sro_hwid_limit":"9","signature":"","hide_gamemaster_char":false,"voteforsilk":false}');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;

-- Dumping data for table db_silkroad.stripe_invoices: ~0 rows (approximately)
/*!40000 ALTER TABLE `stripe_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_invoices` ENABLE KEYS */;

-- Dumping data for table db_silkroad.supporters_online: ~0 rows (approximately)
/*!40000 ALTER TABLE `supporters_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `supporters_online` ENABLE KEYS */;

-- Dumping data for table db_silkroad.tickets: ~0 rows (approximately)
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

-- Dumping data for table db_silkroad.ticket_answers: ~0 rows (approximately)
/*!40000 ALTER TABLE `ticket_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_answers` ENABLE KEYS */;

-- Dumping data for table db_silkroad.ticket_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `ticket_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_categories` ENABLE KEYS */;

-- Dumping data for table db_silkroad.ticket_prioritys: ~0 rows (approximately)
/*!40000 ALTER TABLE `ticket_prioritys` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_prioritys` ENABLE KEYS */;

-- Dumping data for table db_silkroad.ticket_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;

-- Dumping data for table db_silkroad.todos: ~0 rows (approximately)
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;

-- Dumping data for table db_silkroad.users: ~544 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
TRUNCATE TABLE users;
INSERT INTO `users` (`id`, `name`, `silkroad_id`, `jid`, `email`, `email_verified_at`, `password`, `show_map`, `reflink`, `referrer_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'test', 'test', 2, 'test@mail.com', NULL, '$2y$10$w2tw5apU49HGdx2m8vjtouUP3.S0b89AQH4Svxeec7Tqy3ufjWkXe', 1, 'f0a77d16-5a17-40d1-8e79-cfab2fcaed27', NULL, NULL, '2022-09-27 17:46:42', '2022-09-27 17:46:42'),
	(2, 'test2', 'test2', 3, 'test2@mail.com', NULL, '$2y$10$95./uSZRToZyNlvXt16XduuwxevPTimFH2iv13fCNeCutbfrb3y0G', 1, 'f3328cef-e03c-4f7e-a083-6872e4d9a925', NULL, NULL, '2022-09-27 18:30:30', '2022-09-27 18:30:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table db_silkroad.users_created_counts: ~0 rows (approximately)
/*!40000 ALTER TABLE `users_created_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_created_counts` ENABLE KEYS */;

-- Dumping data for table db_silkroad.user_vouchers: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vouchers` ENABLE KEYS */;

-- Dumping data for table db_silkroad.vouchers: ~0 rows (approximately)
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
