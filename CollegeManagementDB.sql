-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sys
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `ID` bigint NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Kind` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (5,'b09c600fddc573f117449b3723f23d64',1),(6,'b09c600fddc573f117449b3723f23d64',1),(7,'b09c600fddc573f117449b3723f23d64',1),(100,'7239ea2b5dc943f61f3c0a0276c20974',3),(102,'814989b983fd853fb374e1676a06ade4',3),(10000,'bdd5af62d46f0222f61908a1cff92f16',2),(10001,'bdd5af62d46f0222f61908a1cff92f16',2),(10002,'e10adc3949ba59abbe56e057f20f883e',2),(10003,'e10adc3949ba59abbe56e057f20f883e',2),(10004,'e10adc3949ba59abbe56e057f20f883e',2),(10005,'e10adc3949ba59abbe56e057f20f883e',2),(10006,'e10adc3949ba59abbe56e057f20f883e',2),(10007,'e10adc3949ba59abbe56e057f20f883e',2),(10008,'e10adc3949ba59abbe56e057f20f883e',2),(10009,'e10adc3949ba59abbe56e057f20f883e',2),(10010,'e10adc3949ba59abbe56e057f20f883e',2),(10011,'e10adc3949ba59abbe56e057f20f883e',2),(10012,'e10adc3949ba59abbe56e057f20f883e',2);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Head` longtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5,'admin2','adm',NULL),(6,'admin3','adm',NULL),(7,'admin4','adm',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `admin_AFTER_INSERT` AFTER INSERT ON `admin` FOR EACH ROW BEGIN
	insert into account (ID,Password,Kind) values (new.ID,md5(new.Password),1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `admin_AFTER_UPDATE` AFTER UPDATE ON `admin` FOR EACH ROW BEGIN
	update account set account.Password=md5(new.Password) where account.ID=new.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `admin_BEFORE_DELETE` BEFORE DELETE ON `admin` FOR EACH ROW BEGIN
	delete from account where account.ID=old.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) NOT NULL,
  `Text` longtext NOT NULL,
  `Author` varchar(45) NOT NULL,
  `Time` datetime NOT NULL,
  `AuthorID` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,'后黄前时代北宇治吹奏部中枢政局初探','本文原先是在《为什么历史选择了久石奏》一贴中的回复，近日由于誓言的终章剧场版上线 B 站，该贴又被顶了起来，因此我对之前的回复进行了一些增改，独立成文。\n众所周知，黄前久美子部长在三年级带领北宇治吹奏部勇夺全国金，一鸣惊人，堪称北宇治吹奏部历史上最伟大的部长之一。那么当她毕业之后，所遗留下的巨大权力真空应当如何进行弥补？围绕着后黄前时代的最高权力争夺其实早已在暗中有了铺垫，本文即是结合武田文本与京吹动画进行的一次初步探索。\n\n后黄前时代吹奏部部长的几大热门候选人分别是来自南中的前部长北山泰露，剑崎梨梨花和久石奏，以下试分别单独分析之。\n首先排除出局的是北山同学。不管是在武田的文本中，还是在《誓言的终章》和《利兹与青鸟》动画中，黄主席毕业时二年级的两个核心人物，毫无疑问就是剑崎和久石，同时考虑到吹奏部女性治部的传统，北山根本就没机会染指吹奏部最高权力。\n据说黄主席的某位亲密战友曾亲自对北山同学进行劝说，大意如下：“上一个想夺权的南中吹奏部长一年级自己退部了，回来以后只能在长笛组当个副组长。北山同学，你是新生，老一辈的债不应该你们年轻人来背，路怎么走，你要自己考虑清楚。某些人当部长，南中作为传统强校，最后落的什么结果；黄前部长带领大家，北宇治取得何等进步？人民的眼睛是雪亮的，谁的路线对，谁的路线不对，相信你自己心里也明确的答案。你能在南中当部长，相信能力是有的。如果你能把自己的能力用在正确的地方，吹奏部的群众肯定会看在眼里，记在心里。现在吹奏部实行集体领导，不搞一言堂，到时你当了声部长，你的意见大家肯定会尊重。但你如果不认真学习体会黄前部长科学治部的理念，北山同学，殷鉴不远啊！” 北山同学自此退出角逐。\n\n剩下两位中我们先看剑崎梨梨花。\n从背景上，剑崎有铠冢背书，但铠冢出世的心态实在不像能为后辈铺路架桥的人，而且尽管铠冢与南中出身的领导人皆有密不可分的关系，但无论是吉川还是中川都不可能与田中学姐及黄主席留下的影响力相提并论，从这点上铠冢的背景算不得突出优势。\n说完了背景再说个人，剑崎在不攻略铠冢誓不罢休这一点上表现出了立场鲜明、坚韧不拔的领袖气质，而且群众基础显然突出，连维度外的 staff 们都纷纷成了粉丝。这一点是她的加分项。\n还有最重要的一点是由原文支撑的。首先是在《波澜的第二乐章后篇》中指定黄前为部长的段落：\n\n“既然我性格麻烦为什么还要我当部长？”（黄）\n“你说什么傻话呢，我接过部长职务起就想好让你当下任了。”\n优子用平淡口吻说出一件了不得的事\n“不然你以为我为什么要你开 “黄前万事屋”，就是为你积攒威信。”\n“还以为单纯把麻烦事都抛给我。”（黄）\n“我才不会做那种没意义的蠢事呢。总之为了能团结这么多人，威信是不能少的，再加上实力有一定水平至少能进 A 的，最后是有可靠的朋友。当初明日香前辈就是想了这些才点我的。”\n其次是《决议的最终乐章前篇》中一段不经意的对话：\n最后一个来的是久石奏。\n“小奏是哪个班啊？学姐原来对我的个人情报就这么好奇？” 奏故作惊讶道。\n“并没有，我也没什么可好奇的。”\n“既然学姐说到这份上那我就告诉你好了。我在二年一班。和梨梨花一个班哦。”\n“说起梨梨花，这学期我和她一起负责指导新人部员诶。不知道我能不能做得好。” 叶月心虚道。\n“指导一年级部员的工作，我记得去年是加部学姐和黄前学姐负责的吧？”\n“没错没错。还是三年级和二年级各一人。今年是我和梨梨花。啊，怎么办呢。要是有非常厉害的一年级要和我 PK 怎么办呢！”\n“你担心的都是些什么有的没的？”\n“虽然只是说笑，但是万一真的有吹奏得非常好的一年级入部，比如像丽奈那样的，我可没自信教人家。”\n“也不知道今年低音组会有什么样的新生进来呢。” 一旁听着的奏掩嘴笑道。\n“要是比较乖的话那就最好。就怕来了搞事！”\n“说的正是，久美子学姐的胃可禁不住再折腾了呢。”\n“你也不想想是谁害的！”\n看到这里相信大家对于部长的人选已经心中有数了。\n\n再看久石奏。\n从背景上，久石背后的黄主席打通了之前两届所有核心权力所有者的关系，在自己这一届更是无人能挡，黄主席有可能是北宇治历史上握权最牢固的领袖，前无古人后可能也无来者，由她来钦点久石 “似有田中学姐之风”，我想其中含义不言而喻。不过也要从另一方面进行考虑，首先黄主席得来的一切是个人奋斗与历史行程完美的统一，北宇治吹奏部在她的手上夺得了全国金，因此她已经没有什么遗憾了；其次黄主席本人虽然位高权重，但她的权力欲望并没有田中一样旺盛，她铺路的心思也未必会多到哪里去，“你们怎么办，只有天知道”；其三，权力过于牢固是一把双刃剑，如果黄主席下一届部长还是低音部内部授受，别的部会怎么想？这吹奏部会不会成为低音部的私人王国？这可能会成为一个很有魄力的决策（汉弗莱爵士语气）。\n再看个人方面，久石眉宇间那种看似驯服，实际傲骨铮铮的气质是作为北宇治优秀领导人所需要的。但是久石在二年级时未能通过正式选手选拔，恰恰这一年是最为关键的黄主席治部勇夺全国金的一年，与这一年的比赛无缘确实是伤害非常大的一件事，总不能厚着脸皮贪天之功吧。考虑到中川的先例，进入核心领导层当然可以，但如果作为最高领导恐不甚适宜。\n再考虑到历史进程的因素，在黄主席带领北宇治走向巅峰之后，下一继位者只需要修生养息，继承和发扬黄主席治部思想就足够了。因此，最合适黄主席心腹久石奏的职位是主管实务的副部长，确保吹奏部按黄主席的路线稳步行进。\n\n既然部长副部长大位已定，接下来还剩下最后一个重要问题，高坂丽奈的领队职位由谁继承。\n如果我们认真研究黄主席的先行者田中学姐的治部思想，我们会发现，其构建下一代领导集体的思路就是先确立一个核心，再围绕这个核心搭班子。吉川前部长很好的继承和发扬了这种思想。黄主席通过一年的” 万事屋” 工作，赢得了新生阶层的认可，是唯一一个能团结大多数吹奏部员的人选，是部长的不二之选。但黄主席又是性情中人，有时会过于看重感情忽视理智，那就搭配曾经不交部费的塚本秀一当副部长。但部长副部长本身还有可能因为个人问题出乱子，那就再搭配一个领队高坂，作为新一代领导集体的稳压器，可以说是非常有政治智慧的决策了，让人叹服。\n事实上，领队（drum major）这一职位并非新设却胜似新设，可以说是旧瓶装新酒也不为过。领队原先是一种荣誉性的兼职，指的是在 sunfes 时走在队伍最前方挥舞指挥棒的人，前副部长明日香和前部长吉川优子都曾经兼任过这一职位。如果我们对比三年间的中枢政局，就可以清楚的看出，领队顶替的是曾经在中世古香织手上显赫一时的会计一职。这是由于在吉川时期担任会计的伞木希美为情所困，连本职工作之一的收取部费都无法及时完成（这里点名批评曾经因为给手游氪金而不交部费的同学），反而还要麻烦原就已经很忙的部长副部长，导致无法如三香时期一样为部长副部长分忧。事实上，在武田的文本中就有如下描述：“领队以往是兼职，今年是特别新设的为了减轻部长副部长压力的职位。今后将以部长、副部长、领队为最高层运营吹奏部”（《波澜的第二乐章后篇》）“丽奈担任的领队一职，一般指的是进行乐队的指挥。但是在北宇治吹奏部，则兼任指导部员和指挥基础合奏”（《决议的最终乐章前篇》）。实行这一制度后，会计彻底沦为一般事务性职务，我们甚至不关心久三年时期担任会计职务的是谁。\n通过梳理我们可以看出，由高坂丽奈当领队绝对是久三年时期伟大的制度创新，它为那些技艺高超又无心人事（政治），同时还是部长铁杆的成员提供了一个美妙的出路，同时还能扩张部长派系的权力，增大部长派系的人望和对全社团的影响，而且有了部长、副部长和领队三人之后，还能顺理成章的淡化声部长联席会议这种集体领导制而转向一个部长一个核心的体制。这一重大创新对于黄主席成功领导北宇治功不可没，应当坚决继承。高坂领队的小号部学妹小日向梦，出身自北中 —— 那里曾经走出过黄前久美子、高坂丽奈、佐佐木梓等优秀的吹奏乐前辈，她拥有高超的演奏能力、无心政治、同时又与权力核心层剑崎梨梨花与久石奏都关系良好，继承领队之位应当毫无疑问。\n\n综上所述，后黄前时代北宇治吹奏部的核心权力人员应当是部长剑崎梨梨花，副部长久石奏，领队小日向梦。\n\n最后全文转发《吹奏日报》的一则长篇社论，以此收尾。\n不忘初心，凝聚力量，为实现吹奏部新时代的伟大复兴而继续奋斗！\n（本报特约评论员）\n过去的一年中，北宇治吹奏部在黄前久美子部长的带领下，毫无疑问是成功的一年，是辉煌的一年，是胜利的一年。这次胜利，不但是我们吹奏部的胜利，更是黄前久美子部长科学治部思想的胜利。从先行者田中明日香学姐带领吹奏部走上伟大复兴的征程以来，吹奏部的各位体验过成功的喜悦，也体验过失败的苦涩。现在黄前久美子部长带领吹奏部走到了现在这个位置，实际上又一次站在了历史的转折点上。是昙花一现，还是从胜利走向下一个胜利，第四年部长的选择，关系到吹奏部，乃至整个北宇治，整个关西的吹奏事业发展。\n过去一年的历史证明，贯彻黄前久美子部长科学治部思想越深入，北宇治吹奏部取得的成果就越丰硕；而一个社团，一个部门的思维高度，又取决与领导者的思想水平。中国有句古语，叫 “纲举目张”。拿起纲，目才能张，纲就是主题。吹奏部水平不一的演奏水平和人民群众日益增长的对高水平演奏的需求，是北宇治吹奏部面对的主要矛盾，这就是纲。紧紧抓住这个纲，发展的大方向就掌握牢了，各项工作就有统属了。这一点，不光领导者要明确，各声部组长要明确，还要让吹奏部所有部员都要明确。\n黄前久美子部长在之前的讲话中指出，吹奏部的演奏水平要提高，吹奏部的团结稳定要维护。中间的矛盾如何调和，路线如何制定，是需要全社团共同学习研究的问题。因此，各声部组长要带头学习《黄前久美子部长谈治部》这份纲领性文件，吃透文件的精神，着重领会黄前久美子部长建设强大吹奏部的战略决策。同时还要亲自宣讲文件的精神和战略，用文件精神来武装大家的头脑，统一全社团的思想认识。\n过去一年，吹奏部上下全面贯彻落实黄前久美子部长科学治部思想，紧密团结在以黄前久美子部长为核心的社团中央周围，无条件的服从社团中央对吹奏部的集中统意领导。一路走来，县大赛、关西大赛、全国大赛，北宇治吹奏部的成功，证明了社团中央的绝对领导，是有效保证能干事、干好事、干成事的根本政治制度。\n展望新一年的目标任务，一项要求务必牢记：全国大赛出场，要切实提高新入部员的演奏水平。在英明领袖剑崎部长的领导下，我们踏上了新的征途，我们正在做继往开来的伟大工作。我们肩上的责任很重，我们面前还有不少困难。我们有信心，有勇气，挑起重担，战胜一切困难。让我们高举黄前久美子部长的伟大旗帜，贯彻黄前久美子部长制定的发展路线，凡是黄前久美子部长做出的决策，我们都坚决维护；凡是黄前久美子部长的指示，我们都始终不渝地遵循。一切行动听从以剑崎部长为首的社团中央指示，凝聚新时代的奋斗伟力，为吹奏部不懈奋斗、与吹奏部一起奋斗，为实现吹奏部新时代的伟大复兴而继续奋斗！','admin0','2020-02-27 00:00:00',NULL),(2,'北宇治高中吹奏乐部止步关西大赛，如何问责？','北宇治高中吹奏乐部的在黄前久美子入校的第二年，竟然只拿到了关西大赛废金，未能冲进全国大赛，这是北宇治吹奏乐部伟大复兴之路上的重大挫折，对赛前以全国金奖为目标的吹奏乐部也是一个沉重的打击，那么应该如何问责？\n\n\n1、让我们看看接下来会发生什么\n\n\n       通常来说，大型团队比赛的队伍成绩不好，直接的问责对象应该是主教练。对应到北宇治吹奏乐部，无疑就是指导老师泷升的责任。并且在京吹系列小说作者武田绫乃的设定中，吹奏乐部中起到决定性作用的就是指导老师，久一年的北宇治自身是个例子，久二年把北宇治挤出全国大赛的超级黑马龙圣高中也一样：祖上从来没阔过的龙圣（北宇治起码还算有历史底蕴）来了一位明静工科的前任指导月永源一郎，这位大佬就直接把龙圣从府赛杂鱼带飞到全国金奖。\n\n\n        当然不能说不如月永源一郎就应该问责，否则除了齐达内全世界的足球主教练都是渣了，但久一年的泷升还能率队进军全国，又没突然改姓远坂，怎么久二年就掉链子了呢？他真的有什么失误吗？\n\n\n       先用排除法，泷升能在久一年把北宇治从府赛鱼塘带进全国大赛的殿堂，可见至少最基本的指导吹奏的水准应该是没什么问题。\n\n\n       其次是队内气氛方面，可能出了一点小问题。回头看，久一年初到北宇治的泷升，表面上是接盘了一个烂摊子，实际是抄底了白马股：当初北宇治主要问题在人心涣散，实力和底蕴犹存，又刚巧遇到丽奈、小绿这样的超级巨星抱团加盟，最需要的就是凝聚军心；而初来乍到的泷升上任三把火刚好对症，确立进军全国的目标、重整全部的士气，但就算这样，声部会议一开始也对泷升的严格管理有着各种异议，后来他又因为经验问题在处理小号solo之争的时候犯下错误，丽奈和香织的冲突差点让大好局面毁于一旦，幸好后者深明大义主动让步，才没让吹奏部的复兴之路中断。\n\n\n       但久二年的情况有了微妙的变化，很多潜力新人是冲着前一年的好成绩加入了吹奏部，他们并没有充分的经历去理解和接受吹奏部严格的日常训练和残酷的正赛选拔，不懂人心的泷升却没有吸取前一年的教训，完全没有注意到新来的一年级中隐藏了多少问题。\n\n\n       幸运的是，“搞事”的新生们和前一年一样没有造成实际的严重后果，小绿靠高超的拉琴技术攻略了总是不高兴的月永求（这位是前面说的那位龙圣新指导月永源一郎的孙子），负责一年级事务的黄前久美子拆掉了没头脑的铃木美玲和脑门上刻着“我就是来搞事的”久石奏两颗大炸弹，当然还有因伤退役以经理身份专注为一年级新生做心理辅导的加部友惠，她们的共同努力让吹奏乐部起码能在表面上维持平稳。\n 另一方面，久二年吹奏乐部的气氛问题优子在小说中也提过：“缺少执念”——久一年部内的种种大事件，无论Sunfes事件、丽奈与香织的小号solo之争还是明日香退部相关事件，都是所有人认可冲击全国大赛这个目标之下的分歧；而久二年，尽管吉田优子一开始就将“全国大赛金奖”六个大字作为最终目标写在黑板上，但这一年发生的各种事件更多都还是人际关系问题，一年级新人还在努力融入吹奏乐部的集体，因为选拔赛或各种乱七八糟的小事闹矛盾；三年级的伞霙在干什么参考山田尚子监督的动画电影《莉兹与青鸟》，焦点也在人与人之间的关系或者自我认知，缺少了久一年那种从三年级到一年级都众志成城冲击全国大赛的气氛。但显然这些都不属于泷升一个指导老师能掌控的范围。\n\n       \n\n       如果要说最需要泷升负责的，可能在于选曲。久二年北宇治的自由选曲是《莉兹与青鸟》——对比一下龙圣高中的《白磁之月的辉宫夜》，是现实2013年千叶县立幕张综合高中拿下全国金奖的选曲，这光环和buff开局就赢一半；而《莉兹与青鸟》纯粹就是泷升自己不知道从哪里翻出来的原创曲目。\n\n\n       好吧，其实《莉兹和青鸟》也不是不能打，泷升为北宇治选取这首曲目的用意很明显，就是想充分发挥超级巨星铠冢霙在双簧管上的优势：吹奏大赛版本的《莉兹和青鸟》总长接近9分钟的编曲，分为四个乐章，时长分别约为1分40秒、1分30秒、3分10秒和2分30秒，其中第三乐章《爱的决断》无疑是最重要的部分，而这3分多钟时间都是在让铠冢霙的双簧管尽情发挥。但也要注意这曲子不叫青鸟，叫莉兹与青鸟，莉兹的放手和青鸟的飞翔同样重要。泷升此前详细讲解过《爱的决断》一章需要的是莉兹和青鸟之间情感的传递，需要长笛与双簧管之间的呼应。虽然伞木希美已经在一定程度上放下了心结，与霙的情感交流没有了障碍，但音乐才能的差距终究无法弥补。\n\n\n       石原立也监督在《誓言的终章》最后关西大赛的演出上充分理解了这个点。在第三乐章《爱的决断》中，除了一开始给了霙和希美各自一个拿起乐器开始演奏的特写镜头，接下来就没有任何希美的正面吹奏镜头了，而是竭尽全力地用各种镜头语言去突出霙的双簧管。双簧管独奏时，各个角度的特写，甚至还有标志性的“石原立也转圈圈”；长笛独奏时，镜头就变成了全景，或者就远远从背后给希美打个镜头。镜头语言一个buff一个debuff的区别对待用意再明显不过。\n  对比前一年的自由选曲《新月之舞》：丽奈的小号、霙的双簧管、明日香的悠风号轮番solo，充分发挥了北宇治几个强点的优势；所以《莉兹与青鸟》是否是最适合这一年北宇治的选曲或者说有没有更好的编曲方式，是值得商榷的。\n\n\n       但说到底，选曲这事能赖泷升吗，其实就是武田绫乃本人想借着这首曲子和背后的童话讲伞木希美和铠塚霙的故事才强行塞给了泷升这支曲，曲目是武田杜撰的，童话也是她编的，莉兹就是自己没法飞翔、只能打开笼子放飞青鸟，那还能怎么办嘛？\n\n \n\n       综上所述，泷升老师不是月永源一郎那样的神，但也不应为北宇治的失利负太多的责任；就像巴萨的主教练巴尔韦德先生那样（甚至核心战术都是把球交给梅西/铠冢霙），我们应该多一些耐心，看看接下来会发生什么。\n\n\n\n2、没打进全国大赛的时候，我会感觉到是队友不给力\n\n\n       在关西大赛结束后，《每日北宇治报》在网站上发起一则民调，主题为“未能打进全国谁背锅”？有1万5千名北宇治吹迷参与了选票，大多数人都将矛头直指指导老师泷升。吹奏乐部内王牌也是头号泷粉的高坂丽奈显然对这样的舆论非常不满意，经常情绪激动地在网上和泷黑们争吵。近日丽奈在某社交网站怒怼网友却忘了换小号，估计是她吵得太热火朝天，以至于忘记了自己的身份，她用第三人称说：“北宇治这个团队实力不太行，只有高坂丽奈和铠冢霙学姐、小绿、久美子，丽奈和剩下这些阿猫阿狗是拿不到全国金奖的。”\n\n\n       北宇治名宿田中明日香在接受记者采访时也表达了和高小姐类似的看法：“泷升老师也有理由说的，我去年带的是什么队，你现在这批人是什么人啊，你叫我带。北宇治现在什么水平，就这么几个人，你伞木希美什么的都在吹solo，她能solo吗？solo不了！没这个能力知道吗？再下去关西大赛废金都拿不了了，关西输完输府赛，府赛都拿不了金，接下来没比赛输了。”在记者说出北宇治是备战下一年吹奏大赛最早的队伍之一时，明日香几乎还没等记者把话说完，就做双手作揖状、十分无奈表示：“哎哟，谢天谢地了，谢天谢地，你像这样的比赛本身就没有打好基础，你能跟我保证明年的关键比赛能赢啊！务实一点，我劝你们，我们把自己的技术、吹奏的这个理念先搞懂，现在关西就拿个废金，你倒告诉我怎么解释，脸都不要了。”\n\n\n       尽管高小姐和田女士都可能因为个人原因有偏袒恩师之嫌，但这些为泷升老师的解释并非毫无道理，泷老师因为年轻有这样那样的不足，但北宇治止步关西的主要原因确实还是整体实力不济。\n\n\n       下面具体分析一下北宇治在久二年参加吹奏大赛的正式阵容。\n   先说明一下表格内容：用久二年时北宇治校服领巾的蓝、红、绿三色分别代表三年级、二年级和一年级的成员，某些名字后面带括号“落选”的是久一年时未能入选正赛的选手。\n\n       简单地从颜色占比上，就能清楚地看到久二年A组成员（正赛成员）结构新老失衡，青黄不接的现象过于明显：总共55人的正赛成员里，三年级竟然只有14人，二年级20人，一年级居然是最多的21人——对比久一年，53人的A组成员里三年级有27人，超过了一半。\n\n\n       而且久二年A组的三年级14人除了因为伤病退役的加部友惠其他全体入选，包括了森田忍、中川夏纪这样之前连续两年未能入选正赛的成员，泷野纯一连部费都拖欠，伞木希美刚刚回归，除了低音部之外其他的声部长甚至都是唯一可以选择的人选，所以这届的三年级不仅人数少，水平可能也有些堪忧。\n\n\n       事实上下面从各个声部的A组成员变化具体分析。\n\n\n       单簧管：大换血，离开了8个原高三的、补了6个高一的新生和1个新入选的二年级，总人数比上届少1人。\n\n松崎洋子在前一年也是初学者，这届还要转低音单簧管，感觉不太行；高野久惠前一年是B组的；高智久惠理也是换了乐器，继承姬友的高音单簧管，就当是有加成没变弱。那么其他新生能顶毕业的三年级吗？新来的南中部长北山泰瑠实力不错，也是钦定未来的单簧管首席（顺便看看这男女比例），但前任首席鸟冢弘音种种细节（比如能在Sunfes事件的首席会议中第一个跳出来反对泷升）暗示实力也是四天王之下排得上号的，比新来的泰瑠肯定更强，所以整体来看，单簧管是变弱了。\n\n\n        笛子：离开了4个原高三的，补了1个新生和1个新入选的二年级，虽然伞木希美回归，还是比上届少一人。\n   二年级的中野蕾实是久一年的B组，另外一个是一年级才开始学长笛的高桥沙里，又在久二年转职短笛，跟上届杂贺赖子比应该是差了不少。伞木希美就算是天王之下的顶尖实力，也无法弥补整个声部实力的下降。\n\n\n       双簧/巴松：吹巴松的两个原三年级都换成了新生，人数持平。\n    即使铠冢霙在青鸟变身之后实力百尺竿头更进一步，但吹巴松的两个三年级都换成了新生，实力不知道下降了多少，但是颜值肯定下滑了不少，毕竟少的是喜多村来南…这个声部整体实力最多也就持平久一年。\n\n\n       萨克斯：离开了4个原高三的，补了4个新生和1个新入选的三年级，人数比久一年多1人。\n\n     鲇川京子和远藤正两位新生取代了前任部长小笠原晴香的上低音萨克斯，别看晴香在明日香面前唯唯诺诺，部务管理上大多数时候也只是****的工具人，但吹奏水平是很高的，车站演出时候的萨克斯solo震惊全场，连旁听的黄主席前女友、立华高中吹奏部的超级巨星佐佐木梓都赞叹不已。上低音萨克斯就当二换一持平。\n\n       中音萨克斯的三年级森田忍是从连续两年的B组升上来，实力应该有欠缺，中音变弱；次中音萨克斯有新任声部长平尾澄子和秀一基友泷川近夫的稳定进步，算略微提升。整体看萨克斯的实力算持平。\n\n\n       低音部：受益于田中王国的保护，低音部是唯一在两年之前的吹奏部内乱中完整保存了实力的声部，因此也是在久二年实力增强最明显的声部，总人数多了3人。\n\n  虽然四天王之一的明日香退役，但无论是大号夫妇和久美子夏纪的成长，还是新加入的几位生力军（月永求出身名门，铃木美玲刚来就能带着加藤叶月吹大号，久石奏对夏纪优势巨大，这三位搞事归搞事，实力都是很不错的），足以让低音部实力更进一步。\n\n\n       小号：离开了两个原高三的，补了1个新生和1个新入选的二年级，人数持平。\n   新生小日向梦号称北宇治未来的希望，但毕竟才一年级，性格方面也有一定缺陷，和三年级的香织比还是有差距；吉泽秋子作为去年的B组也很难比肩原来的三年级；吉川优子部长被部务压得快要累死了应该没有多少精力提升吹奏水准（三香那一届的部务是三香一起负责分担，优子这一届部务工作主要都她一个人抗）；泷野纯一欠费人员请先补齐部费；即使考虑到丽奈的进步，小号组最多也就和前一年持平。这里说一下中世古香织的实力，她可不仅是人格魅力拉满的温柔女神，虽然久一年小号solo之争输给了丽奈，但输给四天王并不丢人，实际上《新月之舞》里的那一段小号solo并不是一个普通的业余高中生团队的首席小号手能够稳定solo出来的难度，而香织在solo的时候至少可以做到没有失误、所有音都吹对了，这就已经算是业余中的顶尖水平了。\n\n\n       长号：离开两个原高三的，补了1个新入选的二年级，总人数少了1人。\n\n\n       毕业的野口和他女友一个首席一个次席，补充的福井仅是久一年的B组，即使考虑到秀一等人的这一年的进步，整体也有削弱。\n\n\n       圆号：离开了两个原高三的，补了1个新生和1个新入选的二年级，人数持平。\n\n\n       新生早苗和久一年B组的瞳拉拉比不上原三年级，考虑岸部海松和森本美千代一年的进步，整体算持平。\n\n\n       打击乐：离开了两个原高三的，补了3个新生，人数多了1人。\n\n\n       二年级的釜屋燕落选说明新来的三个一年级都实力不俗：前田兄弟是从小练习的鼓手，东浦心子在初中也是打击乐担当，节奏感十分出众，在久二年直接接手了声部长大野美代子的定音鼓，后者选择去弹奏自己一直非常憧憬的竖琴（话说竖琴为什么也算打击乐？）；再加上颜值担当堺万纱子和金钹法王井上顺菜的进步，总之，打击乐整体实力应该是增强不少的。\n\n\n       综上，从九大声部看，低音部和打击乐实力增强，乐观估计小号、萨克斯、圆号、双簧/巴松能持平，单簧管、笛子和长号三个声部都有变弱，整体来看应该不会比久一年更强，大概率是更弱的。相信泷升老师也是看到阵容整体的单薄，才试图在选曲和编曲上尽可能地发挥和突出铠冢霙的个人实力，希望超级球星能carry全队。\n\n\n       其实这个情况在两年前就已经可以预见。吹奏部内“大家随便玩玩开心就好正式比赛论资排辈出场”和“大家应该努力练习正赛要挑选吹得更好的成员”两种价值观的激烈冲突，让当年初来北宇治怀抱满腔热情的伞木希美被三年级学姐打击排挤之后愤而退部，因其作为前南中部长的号召力和自带的人格魅力光环，一大批成员也纷纷跟着退部，所以导致两年之后本应扛大梁的高三反而成为了久二年最单薄的环节。\n3、强者运强？\n\n\n\n       有位著名的电竞明星说过，输了比赛连呼吸都是错的，但单纯用前一年进入全国大赛/今年止步关西的结果来判定北宇治的失败，其实是比较片面的。毕竟关西大赛只有三个全国大赛的名额，全国铜奖和关西废金的差距并不大，可能也就是关西第四和第三的差距，而且考虑到龙圣的异军突起，久二年的明静工科和龙圣最终都是全国金奖，关西赛区竞争就更激烈了。\n\n\n       戏说不是胡说，虽然北宇治吹奏乐部的故事是虚构的，但武田绫乃在描述其他吹奏强校的时候还是很大程度参考了现实情况。现实中关西大赛的三个全国大赛出场名额这些年都被大阪四大强校垄断，分别是：大阪府立淀川工科高中、大阪桐荫高中、明净学院高中和近畿大学附属高中，其中淀川工科更是拿了全国金奖30多次的超级霸主。\n\n\n       对应到小说和动画中的关西三强，明静工科=淀川工科+明净学院，大阪东照=大阪桐荫，秀塔大附=近畿大附，因为现实中关西的3个全国名额实际已经完全被大阪的四强独占，四强中如果有一个失误那么名额必然是剩下三校的，所以武田为了不过于颠覆现实，只能先把现实中的大阪四强缩成三强。\n\n\n       久一年北宇治进军全国，翻车的是秀塔；久二年秀塔雪耻，而异军突起的龙圣取代了大阪东照的位置。考虑到秀塔和东照都是成熟强校实力会相对稳定，而根据前面的分析，北宇治在泷升到来的头两年内整体实力也是一个档次的，也就是说，这两年的北宇治和秀塔、大阪东照的硬实力是在伯仲之间，甚至北宇治还是偏弱势的那一方，如果临场发挥好一些、甚至运气好一点得到了一两位评委的青睐，可能就进全国了。\n\n\n       事实上久一年的北宇治能打进全国就有很大的运气成分：当时秀塔在关西大会前，单簧管的独奏者因车祸骨折而无法参赛，临时换上的替补在独奏时又出现失误，其实类似的事差点就在北宇治发生了，试想一下明日香要真的因为家庭原因被迫退部，北宇治还能冲进全国吗？明日香用模考成绩说服了她那脑子有问题的母亲，再加上丽奈和霙在独奏时无可挑剔地发挥，才让北宇治抓住了秀塔送出的机会。\n\n\n       久二年的关西大赛，按武田绫乃的说法，北宇治的发挥也算是完美了，但幸运之神不会只眷顾一人，哪怕是主角的团队；作为全国强校的秀塔和东照不会总是失误，何况这次还有了异军突起的龙圣。\n\n\n\n4、吹奏乐部的时臣、世界和本泽马\n\n\n       通过前面三部分的论述，相信各位已经对本文标题问题都有了明确的答案，因为所有出问题的点本质上都指向了一个人——伞木希美。\n\n\n       首先部内气氛的问题。\n       前面说到久二年的吹奏乐部缺乏“一定要拿下全国金奖”的执念，三年级的问题主要就体现在伞木希美身上。在北宇治经历一连串的打击后，高中三年级的希美同时面临个人进路的选择、和铠冢霙纠结的关系、对自我价值的认同和否定等一系列复杂的问题，已经无法将主要心思放在带领北宇治更进一步上了，甚至手握吹奏乐部财政大权的时候却连部费都懒得去收——已经不是国中失败时伤心欲绝还想着一定要高中夺金的那个阿伞了。\n\n\n\n\n       希美是这样，只有一个希美的铠冢霙的世界里本来就没有其他人；夏纪算是合格的副部长，但更多精力可能是在提升自己的吹奏水平和看管优子；三年级最核心的南中四人组唯有吉川优子这个部长才会去将更多精力放在吹奏乐部的集体事务。而优子和夏纪恰好是吹奏水平不太高的那两位，小日向梦的小号已经可以压制优子，而久石奏对夏纪是更直接的鄙视。三年级本来人就少，现在这样就更无法将人心拧成一根绳了。\n\n\n       接着是选曲的问题。\n\n       先特别说明一下，武田绫乃的原作小说和京阿尼制作的动画中是有一些微妙的区别的。在原作小说的设定中，故事开始前两年（伞木希美作为南中部长那一届），市立南中学校使用的是《达芙妮与克罗埃》第二组曲作为参加吹奏乐大赛的自选曲，结果他们只在京都府大会上拿到了银奖。对应久一年，秀塔大学附属高校吹奏乐部也是使用这首乐曲作为参加吹奏乐大赛的自选曲，结果前面说过了，单簧管的独奏者因车祸骨折而无法参赛，临时换上的低年级学生在独奏时出现失误，只拿了关西废金——显然，武田绫乃就是对这支曲目有意见，谁选谁完蛋。\n\n\n       而在动画中，根据bd中的staff副音轨，山田尚子将南中失败那场的自选曲目改成了《鞑靼人舞曲》，因为“霙的双簧管，希美的长笛，这是能让她们显眼的曲子。在这层面上做出了选择。”\n\n\n       《鞑靼人舞曲》是俄罗斯歌剧《伊戈尔王》中第二幕的配乐。这部歌剧主要讲述了伊戈尔抵御鞑靼人对俄罗斯侵略的故事。故事中伊戈尔和他的儿子因为后方不稳而战败被鞑靼人俘虏，鞑靼人的首领康恰克王欣赏伊戈尔的勇气和魄力，试图招降他但是遭到伊戈尔的断然拒绝，之后伊戈尔趁着鞑靼人酒会后的松懈逃离，回国重振旗鼓。\n\n\n       所以《鞑靼人舞曲》包含了两层意思，战败和重振旗鼓后的胜利——战败正对应了此时的南中，而重振旗鼓后的胜利对应的是久一年的明静工科（关西大赛就在北宇治前一位出场），他们的自由选曲也是《鞑靼人舞曲》（而在小说中武田给明静这一年设定的自由选曲是《大阪民谣幻想曲》，淀川的传统曲目）；这一年王牌指导月永源一郎已经离开了明静，所有人都以为明静实力受损，结果他们的《鞑靼人舞曲》最终还是拿下了全国金奖，维持了全国霸主的地位。\n\n（众所周知，武田绫乃懂个P的京吹，真正的京吹还得看山田尚子，所以原作和动画出现冲突的地方一律按动画内容解读。）\n\n\n       《鞑靼人舞曲》中，最重要的就是长笛和双簧管，所以说希美和霙配合这首曲目也没问题。至于南中为什么输，对比一下明静工科就知道了，人家顶级豪门都能靠这个拿下全国金奖，南中整体什么实力也能吹？\n\n       \n\n       这其实和《莉兹和青鸟》的选曲问题几乎如出一辙——为了突出霙的双簧管和希美的长笛，并非整体的最佳选择。其中铠冢霙的超然实力自然值得为她专门制定一套战术，无论怎样众星捧月都不过分；但是伞木希美虽然也是优秀的水平，在以冲击全国金奖的目标下，给她如此大的战术倾斜，就不太合适了。\n\n\n       然后是最重要的自身阵容问题。\n\n       如果北宇治吹奏乐部本身就只有介于关西废金到全国铜奖之间的实力，那么再怎么挣扎也是无力的——而久二年北宇治如此薄弱的阵容无疑也是要归咎于伞木希美的，正是因为她在两年前不愿忍受和屈服，带着一大批同级生退部，才有了久二年的窘迫局面。甚至当年本来对于这些事都冷眼旁观的明日香主动开口挽留，但心比天高的希美仍然选择了决绝地转身离去。当然那时候没人能想到下一年泷升的到来就改变了一切，不知道现在的希美会不会后悔当初的选择。\n\n\n\n       最后再说一下运气的问题。\n\n       北宇治作为主角组所在的学校，肯定不会是运气差的，黄前本人就是有大气运的天选之人，甚至可以说历史进程的重要程度远超过她本人的奋斗——这样的久美子在北宇治三年间成绩最差的那一届就格外刺眼：其实简单地用分离变量法就可以得到结论，那谁不在的时候最大竞争对手甚至会有狗血的车祸debuff，而那谁在的时候不仅所有对手满状态发挥甚至还多了一匹超神的黑马。\n\n\n       前面说幸运之神不会只眷顾一人，但是厄运之神会一直盯着一个人，被盯上的就是伞木希美。\n\n\n       南中在伞希美之前一直是传统豪强，进军关西问题不大，在她之后接班的北山泰瑠也带南中拿下了府金，唯独本人作为部长的一届翻车了；伞木希美加入北宇治就遇到了一帮混蛋前辈，绝望退部之后北宇治却有了翻天覆地的变化：混蛋前辈们都走了，而泷升和北宇治史上最强的一届新生来了，他们终于站在了全国大赛的舞台上，然而这一切都和她没什么关系；归部之后的伞木希美又在三年级“合理”地止步关西，而她毕业之后的北宇治吹奏乐部即将迎来最辉煌的时代。这个经历堪比欧冠赛场上的伊布了。\n\n\n       综上所述，北宇治吹奏乐部止步关西大赛的几个主要原因，或多或少都和伞木希美有关系：部内缺乏冲击全国的执念有她的责任，选曲和编曲的问题和她脱不开关系，现有部员实力严重不足主要是她造成的，北宇治在久二年运气不好大概率也是她的问题。\n\n\n       到这里肯定有伞木希美的粉丝不高兴了，怎么又在迫害伞哥哥啊？但有句刚句，不是我在迫害，客观分析事实如此，武田绫乃她就是这么写的，要迫害也是武田本人在迫害。\n\n\n       甚至这些经历本身都是小事，更大的迫害体现在武田对伞木希美这个角色的设定上：武田塞给伞木希美一大堆光鲜亮丽风流潇洒的表面设定，然而她自己内心最在意的东西武田全部没给——在南中和北宇治的失败，在音乐上的才能，“自己所珍视的东西，被一个并不如自己那样重视它的后来者轻易拿走了”。\n\n\n       更过分的是，武田绫乃本人塑造希美，很大程度就是为了映射明日香和久美子这两位人生赢家的工具，小说中甚至连莉兹和青鸟之间的矛盾都是由久美子主动插手解决的，最终结果虽然也解放了铠冢霙，却是一个对希美更加残忍的BE；幸好山田监督敏锐地发现了希美才是那个最凄惨的人，改编电影完全以莉兹和青鸟自身的角度重塑了整个故事，让希美自己看清了心结，并试图接受和解开它，留下了一个起码是有可能往GE方向发展的NE。\n\n\n       所以再次强调，武田绫乃懂个P的京吹，真正的京吹还得看山田尚子。（突然发现原作者虐一个女性角色虐得太过分，动画电影的监督作为角色厨看不下去于是大幅改了原作剧情重塑形象，这事莫名的熟悉啊……）\n\n\n\n5、北宇治走在正确的道路上\n\n\n       分完锅之后（其实也不叫分，都是阿伞一个人的），可以告别过去展望未来了，不过在此之前，必须先吹一波吉川优子。\n\n\n       当初明日香指定优子为下任部长的时候，实在是无奈的选择，因为最合适的人选伞木希美在退部风波之后不可能再成为部长了，而其他任何人都压不住优子（想想久一年她为香织出头正面硬刚丽奈和泷老师的场景），与其让她搞事，不如直接让她上了；同时将唯一能让优子听话的夏纪安排为副部长，让连续两年的B组成员成为副部长也是很有争议的。\n\n\n       但优子这位部长是出乎意料的优秀，做到了一个部长几乎能做到的一切。压缩各声部权力的情况下面对更多的部务工作几乎是一己之力揽下（再次批评划水的会计），在看到部内氛围缺乏的同时也又是最坚定的将北宇治的目标瞄准为全国金奖的三年级成员。\n\n\n       可能有人觉得优子讲目标定得太高是好高骛远，最后关西废金的成绩也有损其声望。实际上明日香和优子非常清楚希美当年退部造成的深远影响，北宇治很难在这一年有成绩上的进一步突破，最大的希望和最好的冲击全国金奖的机会都是接下来的一年（小说中优子向久美子解释后者成为部长是在优子当上部长之后就确定下来的事情，所以才会派久美子去做新生工作，让她各种忙里忙外各种拆炸弹，积累声望攒资历）。但“取乎其上，得乎其中；取乎其中，得乎其下”——作为这一届北宇治吹奏乐部的领导者，在各方面条件最困难的时期，知其不可为而为之，哪怕希望渺茫也要激励大家冲击全国金奖的心态才是最可贵的——无所谓还是不甘心地收获关西废金显然对接下来一年吹奏乐部的心态有重大影响，优子为北宇治在最关键的时刻提住了这口气，这件事也唯有优子这样被所有部员认同信服同时又是一根筋性格的人才能做到。\n\n\n       剧场版动画《誓言的终章》限于篇幅，没有将优子的相关事件一一展示，但最后的这组个镜头足以点睛。\n\n       赛后优子是哭得最厉害的，不过部长能哭的地方只有厕所，或者副部长夏纪的怀里。\n\n\n       转场之后，在吹奏部众人茫然低落的时候，刚刚擦干眼泪的部长又元气满满站出来鼓励大家，发表了一通积极昂扬的优子式演讲驱散失败的阴霾。\n\n\n      优子说得对，北宇治的未来会变得更好。\n\n\n       一年级的新人们都已经被前辈们的眼泪和优子的演讲唤醒了，连久石奏这样的小恶魔都继承了吹奏部传统的“不甘心”（虽然下一年她自己…），所有人心念一致，全国大赛金奖的目标就不再遥不可及。\n\n\n       这届“史上最弱”三年级毕业之后，新的三年级是泷升老师指导了三年的阵容，黄前久美子部长将带领北宇治“史上最强”的阵容，冲击全国金奖。\n\n\n       前面用丽奈玩了一个烂梗，不过现在她确实明白了要拿全国金奖不能只靠几个人，必须要一个强大的集体——她确实也不满意现在队友的实力，所以选择了一条最艰难的道路——成为吹奏乐部的领队，用魔鬼训练带领大家一起进步。\n\n\n       吃面欠费强吻失败反被锤但仍然是好男孩的秀一，除了用润物细无声的情报网影响着整个吹奏部，也像夏纪对优子那样，佛之副部长默默成为那个成功女人背后的男人。\n\n\n       就如同绿茵场上的某红色魔鬼，输几场球不要紧，一次没打进全国也没关系，重要的是要走在正确的道路上。\n\n       最后就用前任工具人部长小笠原晴香的口号作为结束：北宇治，FIGHT！\n','admin0','2020-01-27 00:00:00',NULL),(3,'title3','test3','admin0','2020-01-01 00:00:00',NULL),(4,'title4','test4','admin','2021-04-23 00:00:00',NULL),(5,'title5','test5','admin','2021-04-10 00:00:00',NULL),(6,'title6','test6','admin','2021-03-10 00:00:00',NULL),(7,'title7','try','admin','2021-04-25 21:55:16',NULL),(8,'title8','last try','admin','2021-04-25 22:08:35',NULL),(9,'image insert try','just a image![77164989_p1_master1200.jpg](1)','admin','2021-04-26 17:11:28',NULL),(10,'fabugonggao','test','姚宇','2021-05-12 22:20:33',NULL),(11,'发布公告','发布公告','姚宇','2021-05-12 22:21:22',NULL);
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `host_summary`
--

DROP TABLE IF EXISTS `host_summary`;
/*!50001 DROP VIEW IF EXISTS `host_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary` AS SELECT 
 1 AS `host`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_users`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_file_io`
--

DROP TABLE IF EXISTS `host_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_file_io` AS SELECT 
 1 AS `host`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `host_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_file_io_type` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_stages`
--

DROP TABLE IF EXISTS `host_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_stages` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `host_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_statement_latency` AS SELECT 
 1 AS `host`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_statement_type`
--

DROP TABLE IF EXISTS `host_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_statement_type` AS SELECT 
 1 AS `host`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_buffer_stats_by_schema`
--

DROP TABLE IF EXISTS `innodb_buffer_stats_by_schema`;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_buffer_stats_by_schema` AS SELECT 
 1 AS `object_schema`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_buffer_stats_by_table`
--

DROP TABLE IF EXISTS `innodb_buffer_stats_by_table`;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_buffer_stats_by_table` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_lock_waits`
--

DROP TABLE IF EXISTS `innodb_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_lock_waits` AS SELECT 
 1 AS `wait_started`,
 1 AS `wait_age`,
 1 AS `wait_age_secs`,
 1 AS `locked_table`,
 1 AS `locked_table_schema`,
 1 AS `locked_table_name`,
 1 AS `locked_table_partition`,
 1 AS `locked_table_subpartition`,
 1 AS `locked_index`,
 1 AS `locked_type`,
 1 AS `waiting_trx_id`,
 1 AS `waiting_trx_started`,
 1 AS `waiting_trx_age`,
 1 AS `waiting_trx_rows_locked`,
 1 AS `waiting_trx_rows_modified`,
 1 AS `waiting_pid`,
 1 AS `waiting_query`,
 1 AS `waiting_lock_id`,
 1 AS `waiting_lock_mode`,
 1 AS `blocking_trx_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_query`,
 1 AS `blocking_lock_id`,
 1 AS `blocking_lock_mode`,
 1 AS `blocking_trx_started`,
 1 AS `blocking_trx_age`,
 1 AS `blocking_trx_rows_locked`,
 1 AS `blocking_trx_rows_modified`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_by_thread_by_latency`
--

DROP TABLE IF EXISTS `io_by_thread_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_by_thread_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `thread_id`,
 1 AS `processlist_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_file_by_bytes`
--

DROP TABLE IF EXISTS `io_global_by_file_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_file_by_bytes` AS SELECT 
 1 AS `file`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_write`,
 1 AS `total`,
 1 AS `write_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_file_by_latency`
--

DROP TABLE IF EXISTS `io_global_by_file_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_file_by_latency` AS SELECT 
 1 AS `file`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `count_read`,
 1 AS `read_latency`,
 1 AS `count_write`,
 1 AS `write_latency`,
 1 AS `count_misc`,
 1 AS `misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_wait_by_bytes`
--

DROP TABLE IF EXISTS `io_global_by_wait_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_wait_by_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`,
 1 AS `total_requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_wait_by_latency`
--

DROP TABLE IF EXISTS `io_global_by_wait_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_wait_by_latency` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `read_latency`,
 1 AS `write_latency`,
 1 AS `misc_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `latest_file_io`
--

DROP TABLE IF EXISTS `latest_file_io`;
/*!50001 DROP VIEW IF EXISTS `latest_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `latest_file_io` AS SELECT 
 1 AS `thread`,
 1 AS `file`,
 1 AS `latency`,
 1 AS `operation`,
 1 AS `requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_host_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_host_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_host_by_current_bytes` AS SELECT 
 1 AS `host`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_thread_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_thread_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_thread_by_current_bytes` AS SELECT 
 1 AS `thread_id`,
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_user_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_user_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_user_by_current_bytes` AS SELECT 
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_global_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_global_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_global_by_current_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `current_count`,
 1 AS `current_alloc`,
 1 AS `current_avg_alloc`,
 1 AS `high_count`,
 1 AS `high_alloc`,
 1 AS `high_avg_alloc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_global_total`
--

DROP TABLE IF EXISTS `memory_global_total`;
/*!50001 DROP VIEW IF EXISTS `memory_global_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_global_total` AS SELECT 
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Message` longtext NOT NULL,
  `OriginID` bigint NOT NULL,
  `TargetID` bigint NOT NULL,
  `Time` datetime NOT NULL,
  `Readed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!50001 DROP VIEW IF EXISTS `metrics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `metrics` AS SELECT 
 1 AS `Variable_name`,
 1 AS `Variable_value`,
 1 AS `Type`,
 1 AS `Enabled`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `new_table_for_test`
--

DROP TABLE IF EXISTS `new_table_for_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table_for_test` (
  `idnew_table_for_test` int NOT NULL,
  `new_table_for_testcol` mediumtext,
  PRIMARY KEY (`idnew_table_for_test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table_for_test`
--

LOCK TABLES `new_table_for_test` WRITE;
/*!40000 ALTER TABLE `new_table_for_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table_for_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `processlist`
--

DROP TABLE IF EXISTS `processlist`;
/*!50001 DROP VIEW IF EXISTS `processlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `processlist` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ps_check_lost_instrumentation`
--

DROP TABLE IF EXISTS `ps_check_lost_instrumentation`;
/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ps_check_lost_instrumentation` AS SELECT 
 1 AS `variable_name`,
 1 AS `variable_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `punish_reward`
--

DROP TABLE IF EXISTS `punish_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `punish_reward` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '奖惩信息处理流水号',
  `StuID` bigint NOT NULL,
  `AdminID` bigint NOT NULL COMMENT '处理人信息',
  `RewardorPunish` tinyint NOT NULL COMMENT '奖励还是惩处',
  `DetailedInfo` varchar(120) NOT NULL COMMENT '具体奖惩',
  `Reason` varchar(45) NOT NULL COMMENT '奖惩原因',
  `CertificateImage` longtext,
  `Finished` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='奖惩信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punish_reward`
--

LOCK TABLES `punish_reward` WRITE;
/*!40000 ALTER TABLE `punish_reward` DISABLE KEYS */;
INSERT INTO `punish_reward` VALUES (11,10000,5,1,'1','1',NULL,1),(12,10000,100,1,'1','1',NULL,1),(14,10000,100,0,'','111111323233','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',1),(15,10000,100,0,'','111111111111111111','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',2),(16,10000,100,0,'1111111111111111','111111111111111111','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',0),(17,10000,100,0,'ddddddddddddddd','dddddddddddddddddd','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',0),(18,10000,100,0,'ddddddddddddddd','dddddddddddddddddd','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',0),(19,10000,100,0,'ddddddddddddddd','dddddddddddddddddd','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',0);
/*!40000 ALTER TABLE `punish_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reimbursement`
--

DROP TABLE IF EXISTS `reimbursement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reimbursement` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `OriginID` bigint NOT NULL,
  `Image1` longtext NOT NULL,
  `Image2` longtext,
  `Image3` longtext,
  `TargetID` bigint NOT NULL,
  `Finished` tinyint NOT NULL,
  `Message` varchar(45) DEFAULT NULL,
  `SIID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reimbursement`
--

LOCK TABLES `reimbursement` WRITE;
/*!40000 ALTER TABLE `reimbursement` DISABLE KEYS */;
/*!40000 ALTER TABLE `reimbursement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `schema_auto_increment_columns`
--

DROP TABLE IF EXISTS `schema_auto_increment_columns`;
/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_auto_increment_columns` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `column_name`,
 1 AS `data_type`,
 1 AS `column_type`,
 1 AS `is_signed`,
 1 AS `is_unsigned`,
 1 AS `max_value`,
 1 AS `auto_increment`,
 1 AS `auto_increment_ratio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_index_statistics`
--

DROP TABLE IF EXISTS `schema_index_statistics`;
/*!50001 DROP VIEW IF EXISTS `schema_index_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_index_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `rows_selected`,
 1 AS `select_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_object_overview`
--

DROP TABLE IF EXISTS `schema_object_overview`;
/*!50001 DROP VIEW IF EXISTS `schema_object_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_object_overview` AS SELECT 
 1 AS `db`,
 1 AS `object_type`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_redundant_indexes`
--

DROP TABLE IF EXISTS `schema_redundant_indexes`;
/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_redundant_indexes` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `redundant_index_name`,
 1 AS `redundant_index_columns`,
 1 AS `redundant_index_non_unique`,
 1 AS `dominant_index_name`,
 1 AS `dominant_index_columns`,
 1 AS `dominant_index_non_unique`,
 1 AS `subpart_exists`,
 1 AS `sql_drop_index`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_lock_waits`
--

DROP TABLE IF EXISTS `schema_table_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_lock_waits` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `waiting_thread_id`,
 1 AS `waiting_pid`,
 1 AS `waiting_account`,
 1 AS `waiting_lock_type`,
 1 AS `waiting_lock_duration`,
 1 AS `waiting_query`,
 1 AS `waiting_query_secs`,
 1 AS `waiting_query_rows_affected`,
 1 AS `waiting_query_rows_examined`,
 1 AS `blocking_thread_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_account`,
 1 AS `blocking_lock_type`,
 1 AS `blocking_lock_duration`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_statistics`
--

DROP TABLE IF EXISTS `schema_table_statistics`;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `total_latency`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_statistics_with_buffer`
--

DROP TABLE IF EXISTS `schema_table_statistics_with_buffer`;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_statistics_with_buffer` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`,
 1 AS `innodb_buffer_allocated`,
 1 AS `innodb_buffer_data`,
 1 AS `innodb_buffer_free`,
 1 AS `innodb_buffer_pages`,
 1 AS `innodb_buffer_pages_hashed`,
 1 AS `innodb_buffer_pages_old`,
 1 AS `innodb_buffer_rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_tables_with_full_table_scans`
--

DROP TABLE IF EXISTS `schema_tables_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_tables_with_full_table_scans` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `rows_full_scanned`,
 1 AS `latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_unused_indexes`
--

DROP TABLE IF EXISTS `schema_unused_indexes`;
/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_unused_indexes` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `index_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `session`
--

DROP TABLE IF EXISTS `session`;
/*!50001 DROP VIEW IF EXISTS `session`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `session_ssl_status`
--

DROP TABLE IF EXISTS `session_ssl_status`;
/*!50001 DROP VIEW IF EXISTS `session_ssl_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session_ssl_status` AS SELECT 
 1 AS `thread_id`,
 1 AS `ssl_version`,
 1 AS `ssl_cipher`,
 1 AS `ssl_sessions_reused`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statement_analysis`
--

DROP TABLE IF EXISTS `statement_analysis`;
/*!50001 DROP VIEW IF EXISTS `statement_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statement_analysis` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `rows_affected`,
 1 AS `rows_affected_avg`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `rows_sorted`,
 1 AS `sort_merge_passes`,
 1 AS `digest`,
 1 AS `first_seen`,
 1 AS `last_seen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_errors_or_warnings`
--

DROP TABLE IF EXISTS `statements_with_errors_or_warnings`;
/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_errors_or_warnings` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `errors`,
 1 AS `error_pct`,
 1 AS `warnings`,
 1 AS `warning_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_full_table_scans`
--

DROP TABLE IF EXISTS `statements_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_full_table_scans` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `no_index_used_count`,
 1 AS `no_good_index_used_count`,
 1 AS `no_index_used_pct`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_runtimes_in_95th_percentile`
--

DROP TABLE IF EXISTS `statements_with_runtimes_in_95th_percentile`;
/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_runtimes_in_95th_percentile` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_sorting`
--

DROP TABLE IF EXISTS `statements_with_sorting`;
/*!50001 DROP VIEW IF EXISTS `statements_with_sorting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_sorting` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `sort_merge_passes`,
 1 AS `avg_sort_merges`,
 1 AS `sorts_using_scans`,
 1 AS `sort_using_range`,
 1 AS `rows_sorted`,
 1 AS `avg_rows_sorted`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_temp_tables`
--

DROP TABLE IF EXISTS `statements_with_temp_tables`;
/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_temp_tables` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `memory_tmp_tables`,
 1 AS `disk_tmp_tables`,
 1 AS `avg_tmp_tables_per_query`,
 1 AS `tmp_tables_to_disk_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '学号',
  `Password` varchar(45) NOT NULL DEFAULT '123456',
  `Name` varchar(45) NOT NULL DEFAULT 'student',
  `Birth` date DEFAULT NULL,
  `Sex` tinyint NOT NULL DEFAULT '0',
  `Address` varchar(45) NOT NULL DEFAULT '南京',
  `PhoneNumber` bigint NOT NULL DEFAULT '188888888',
  `Grade` int NOT NULL DEFAULT '1',
  `Major` varchar(45) NOT NULL DEFAULT '软件工程',
  `Position` varchar(45) DEFAULT NULL,
  `SIID` bigint DEFAULT NULL COMMENT '社保号',
  `AdmissionTime` int NOT NULL DEFAULT '2017' COMMENT '入学年份',
  `GraduationTime` int NOT NULL DEFAULT '2021' COMMENT '毕业年份',
  `Head` mediumtext,
  `Registered` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `SIID_UNIQUE` (`SIID`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (10000,'stu','大力','2000-03-04',1,'shenzheng',187777777,2018,'计算机科学与技术','dddd',1111111111111111200,2017,2022,'/9j/4AAQSkZJRgABAQEBLAEsAAD/4RWeRXhpZgAATU0AKgAAAAgABgALAAIAAAAmAAAIYgESAAMAAAABAAEAAAExAAIAAAAmAAAIiAEyAAIAAAAUAAAIrodpAAQAAAABAAAIwuocAAcAAAgMAAAAVgAAEUYc6gAAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFdpbmRvd3MgUGhvdG8gRWRpdG9yIDEwLjAuMTAwMTEuMTYzODQAV2luZG93cyBQaG90byBFZGl0b3IgMTAuMC4xMDAxMS4xNjM4NAAyMDIxOjA0OjIxIDE1OjU2OjQwAAAGkAMAAgAAABQAABEckAQAAgAAABQAABEwkpEAAgAAAAMwNwAAkpIAAgAAAAMwNwAAoAEAAwAAAAEAAQAA6hwABwAACAwAAAkQAAAAABzqAAAACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAyMDowNjowNCAxNjoxMDowNwAyMDIwOjA2OjA0IDE2OjEwOjA3AAAAAAYBAwADAAAAAQAGAAABGgAFAAAAAQAAEZQBGwAFAAAAAQAAEZwBKAADAAAAAQACAAACAQAEAAAAAQAAEaQCAgAEAAAAAQAAA/IAAAAAAAAAYAAAAAEAAABgAAAAAf/Y/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZEhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJCQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy/8AAEQgAKAAoAwEhAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A9Zk1N5VkZWwFJAOeOKz5bu6YK0bDAznDVwOTZ2qKRZh1O4gwJs9vmb0rW07U4r9pEU/PH1/z+X51cJPYicVui/RWhiebX8j2ttGomb5zn7x2k9efSrFncS+R9SM55wOprB7HStzRjea9lAUoFR1Jc9F75/8AQR+I9ataHbJp+sz2Yc5MaynPZj1H8jVRRE30OmorUxPKbdPtWqQK5YRM4Vtp6L/h79q3GjhtpblXJhVGwFY5J759en8sVi9joW5fg8O2upQ6fPeGWSONvOFq4Bi3FiQSuOWwQMnOAOMZOd21sILW5uJUU+ZcSb3b14GB9AAK1T0sYPdsvUUxHJxeF4LHWiUy1o6lo0bko3ce45GP/rc0Nb04HU51jzuby9uTng5z/I1m9zWLOytcC0gAGAI1x+QqVclyT0Ax+dUiGSUVRJn3F1EbqIBvubgxweOn/wBeoL2zSe/huOGXymXI5Hf+pH51LiyozXQkaCWOKJYLh0IkUddw2khjnOeiggY/wxoQhhCm/lyoLH1PemkK4+imI//Z/+Ex6Gh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSfvu78nIGlkPSdXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQnPz4NCjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iPjxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+PHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9InV1aWQ6ZmFmNWJkZDUtYmEzZC0xMWRhLWFkMzEtZDMzZDc1MTgyZjFiIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iPjx4bXA6Q3JlYXRvclRvb2w+V2luZG93cyBQaG90byBFZGl0b3IgMTAuMC4xMDAxMS4xNjM4NDwveG1wOkNyZWF0b3JUb29sPjx4bXA6Q3JlYXRlRGF0ZT4yMDIwLTA2LTA0VDE2OjEwOjA3LjA2NzwveG1wOkNyZWF0ZURhdGU+PC9yZGY6RGVzY3JpcHRpb24+PC9yZGY6UkRGPjwveDp4bXBtZXRhPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPD94cGFja2V0IGVuZD0ndyc/Pv/bAEMAAgEBAgEBAgICAgICAgIDBQMDAwMDBgQEAwUHBgcHBwYHBwgJCwkICAoIBwcKDQoKCwwMDAwHCQ4PDQwOCwwMDP/bAEMBAgICAwMDBgMDBgwIBwgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDP/AABEIACgAKAMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1j1j45XOuWepTwzLGtrJIiyGX5QFOMj5do/DsBXAeIfiJ4kvoreexnXy4i3m+XMTuIAIPQfL8xJ47fWvE/i1rd54F8Iafbrqlyv212kB89/s87DDFWLArG2SpzgezclT0Hw58XagPDjFeWmZFYMQ+xFO9weAcgtt3HqDnpg1+ezc2uZs+6pRpp8sUe5eHPjjrfhNo11XzlVgpM05G1kIx8pHQlhjt69xn1b4NfHLT/AIsXGoWlu3+laYdsgBznpn8RlT9HFfPek6rqnxM1mOKFrOG3sbqB5bpxiO22tvDEtx8uIF6g5kUcbxnqP2V/BVr8Hfj3rnhVbp2km0+21RtxK+VPKpLxANnqoViCSeSeMAnowsqiavsceOjSaaSXMj6Y6iiiivWPFPyn8G6d/wAJ/wDGPQ4byW4j0q4vEtrowvhYYGYryMfdJOAwG5MngEGvb73SdJ8D6x4kgupZNDtdPufKjt5pvNmkLBZTISxZjtQjgk52BRwV3dvoX7CGj/C39oCRrVnu/CeoQSXGm2txiR7G4G0PCxOd8ahlKMRu5KsSUDPwv7UfwaST4va5DYtIt1eHTzAJGLs0cnmGbLE5Y/Kxyc7scnIzXk1o68jPcw9ZN8y7Hf8AhX9jTw78btB8A6z4pk1TUNP0qb+208NXkUc2i+e08sscksDLia4EMkMW+UyeUkIEYjZnL+6+AvhFo/gTxbr2p2sM32/xRfNeXU5CssuFQJEQR8qokShRjjbww3BRp+AEWHwPoaxoqxLp9uECjgDyl6e1a1gskuoyMyqqQL5YIOdxbaxzwMYAX1zu68V30ZOyj2PIqW5nLqy/RRRW5kef+LvHmmXPjTS4452ZbM3EVxJ5T7YmJjA5xyDtbkccehFYXxO+G1n4t+Jmja7thuof7NntTJGQ67QJGVsjqRK8QX/faiipxOFgnfvYyweMqTun0ujRvvC2paPo+lw6Lrt/Yst/bxnLi4ja2kkS4mZhNuUbIEljXbgKCW5JXZ3/AIchmh0Gz+0tuu2hRrhyMF5So3H888dAMAAAAUUURilsa8ze5doooqgP/9k=',1),(10001,'stu','student','2021-05-09',0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,1),(10002,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10003,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10004,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10005,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10006,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10007,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10008,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10009,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10010,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10011,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0),(10012,'123456','student',NULL,0,'南京',188888888,1,'软件工程',NULL,NULL,2017,2021,NULL,0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_AFTER_INSERT` AFTER INSERT ON `student` FOR EACH ROW BEGIN
 insert into account (ID,Password,Kind) values (new.ID,md5(new.Password),2);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_AFTER_UPDATE` AFTER UPDATE ON `student` FOR EACH ROW BEGIN
update account set account.Password=md5(new.Password) where account.ID=new.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_BEFORE_DELETE` BEFORE DELETE ON `student` FOR EACH ROW BEGIN
	delete from account where account.ID=old.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `variable` varchar(128) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES ('diagnostics.allow_i_s_tables','OFF','2021-02-25 02:08:21',NULL),('diagnostics.include_raw','OFF','2021-02-25 02:08:21',NULL),('ps_thread_trx_info.max_length','65535','2021-02-25 02:08:21',NULL),('statement_performance_analyzer.limit','100','2021-02-25 02:08:21',NULL),('statement_performance_analyzer.view',NULL,'2021-02-25 02:08:21',NULL),('statement_truncate_len','64','2021-02-25 02:08:21',NULL);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mysql.sys`@`localhost`*/ /*!50003 TRIGGER `sys_config_insert_set_user` BEFORE INSERT ON `sys_config` FOR EACH ROW BEGIN
    IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN
        SET NEW.set_by = USER();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mysql.sys`@`localhost`*/ /*!50003 TRIGGER `sys_config_update_set_user` BEFORE UPDATE ON `sys_config` FOR EACH ROW BEGIN
    IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN
        SET NEW.set_by = USER();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) NOT NULL DEFAULT 'teacher',
  `Name` varchar(45) NOT NULL DEFAULT 'teacher',
  `Sex` tinyint(1) NOT NULL DEFAULT '0',
  `Position` varchar(45) NOT NULL DEFAULT '讲师',
  `PhoneNum` bigint NOT NULL DEFAULT '188888888',
  `Email` varchar(45) NOT NULL DEFAULT '1111111@qq.com',
  `College` varchar(45) NOT NULL DEFAULT '计算机与软件学院',
  `Head` varchar(16000) DEFAULT NULL COMMENT '16000字节',
  `Registered` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (100,'tea','tyty',0,'讲师',100000,'11111111@qq.com','计算机与软件学院',NULL,1),(102,'police','police',1,'保卫处',199999999,'1111111@qq.com','计算机与软件学院',NULL,1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `teacher_AFTER_INSERT` AFTER INSERT ON `teacher` FOR EACH ROW BEGIN
	insert into account (ID,Password,Kind) values (new.ID,md5(new.Password),3);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `teacher_AFTER_UPDATE` AFTER UPDATE ON `teacher` FOR EACH ROW BEGIN
update account set account.Password=md5(new.Password) where account.ID=new.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `teacher_BEFORE_DELETE` BEFORE DELETE ON `teacher` FOR EACH ROW BEGIN
	delete from account where account.ID=old.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `user_summary`
--

DROP TABLE IF EXISTS `user_summary`;
/*!50001 DROP VIEW IF EXISTS `user_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary` AS SELECT 
 1 AS `user`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_hosts`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_file_io`
--

DROP TABLE IF EXISTS `user_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_file_io` AS SELECT 
 1 AS `user`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `user_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_file_io_type` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_stages`
--

DROP TABLE IF EXISTS `user_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_stages` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `user_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_statement_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_statement_type`
--

DROP TABLE IF EXISTS `user_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_statement_type` AS SELECT 
 1 AS `user`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `version`
--

DROP TABLE IF EXISTS `version`;
/*!50001 DROP VIEW IF EXISTS `version`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `version` AS SELECT 
 1 AS `sys_version`,
 1 AS `mysql_version`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wait_classes_global_by_avg_latency`
--

DROP TABLE IF EXISTS `wait_classes_global_by_avg_latency`;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wait_classes_global_by_avg_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wait_classes_global_by_latency`
--

DROP TABLE IF EXISTS `wait_classes_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wait_classes_global_by_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_by_host_by_latency`
--

DROP TABLE IF EXISTS `waits_by_host_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_by_host_by_latency` AS SELECT 
 1 AS `host`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_by_user_by_latency`
--

DROP TABLE IF EXISTS `waits_by_user_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_by_user_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_global_by_latency`
--

DROP TABLE IF EXISTS `waits_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_global_by_latency` AS SELECT 
 1 AS `events`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `work_order`
--

DROP TABLE IF EXISTS `work_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_order` (
  `ID` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `TargetID` bigint NOT NULL COMMENT '显示要显示管理员或教师具体姓名',
  `OriginID` bigint NOT NULL,
  `Message` longtext NOT NULL COMMENT '工单内容',
  `Kind` int NOT NULL DEFAULT '0' COMMENT '工单种类',
  `Finished` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_order`
--

LOCK TABLES `work_order` WRITE;
/*!40000 ALTER TABLE `work_order` DISABLE KEYS */;
INSERT INTO `work_order` VALUES (00000000000000000001,4,10000,'10000:null/n',0,1),(00000000000000000002,4,10000,'10000:null/n',1,1),(00000000000000000003,4,10000,'help me plz',1,0),(00000000000000000004,4,10000,'help me plz',1,0),(00000000000000000005,6,10000,'111',1,0),(00000000000000000006,100,10000,'help me plz',2,0),(00000000000000000007,6,10000,'help me  plz\n',5,0),(00000000000000000008,6,10000,'just a little test',1,0),(00000000000000000009,5,10000,'       localStorage.setItem(\'global\',\'0\');10000:在干嘛呢小兄弟\n------------------------------------------------------------------------------------------------\n10000:咋整啊\n------------------------------------------------------------------------------------------------\n10000:真的吗\n------------------------------------------------------------------------------------------------\n10000:好像不对\n------------------------------------------------------------------------------------------------\n10000:xianzaine?\n------------------------------------------------------------------------------------------------\n10000:zhe id bu dui\n------------------------------------------------------------------------------------------------\n10000:woshishi\n------------------------------------------------------------------------------------------------\n5:zheciyiding\n------------------------------------------------------------------------------------------------\n10000:zhen de ma?\n------------------------------------------------------------------------------------------------\n',1,1),(00000000000000000010,7,10000,'       localStorage.setItem(\'global\',\'0\');',1,1),(00000000000000000011,7,10000,'ddddddddddddddd',1,0),(00000000000000000012,100,10000,'help me plz',2,0),(00000000000000000013,100,10000,'help me plz',2,0),(00000000000000000014,100,10000,'help me plz',2,0),(00000000000000000015,100,10000,'help me plz',2,0),(00000000000000000016,101,10000,'this.$parent[\"StuMain\"].homepage();\n                            this.$refs[\"StuMain\"].homepage();',3,0),(00000000000000000017,101,10000,'this.$parent[\"StuMain\"].homepage();\n                            this.$refs[\"StuMain\"].homepage();',3,0),(00000000000000000018,100,10000,'ddddddddddddd',2,0),(00000000000000000019,100,10000,'ddddddddddddd',2,0),(00000000000000000020,100,10000,'ddddddddddddd',2,0),(00000000000000000021,100,10000,'this.$router.go(0);',2,0),(00000000000000000022,101,10000,'ddddddddddddddddddddd',3,0),(00000000000000000023,101,10000,'dddddddddddddddddddddd',3,0),(00000000000000000024,4,10000,'ddddddddddddddddd',4,0),(00000000000000000025,4,10000,'ddddddddddddddddd',4,0),(00000000000000000026,100,10000,'dddddddddddd',2,0),(00000000000000000027,100,10000,'\n\n\ntest for enter',2,0),(00000000000000000028,5,10000,'test for enter\n\n\n\n\nenter\n\nend5:haoxiang hai you dian wen ti\n------------------------------------------------------------------------------------------------\n5:chabuduodele\n------------------------------------------------------------------------------------------------\n',1,2),(00000000000000000029,101,10000,'test for message',3,0),(00000000000000000030,101,10000,'10000:test for message\n',3,0),(00000000000000000031,101,10000,'10000:test\nfor \nmessage\n',3,1),(00000000000000000032,101,10000,'10000:test\ntest\ntest\n------------------------------------------------\n10000:help！！！！！\n------------------------------------------------------------------------------------------------\n',3,0);
/*!40000 ALTER TABLE `work_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `x$host_summary`
--

DROP TABLE IF EXISTS `x$host_summary`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary` AS SELECT 
 1 AS `host`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_users`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_file_io`
--

DROP TABLE IF EXISTS `x$host_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_file_io` AS SELECT 
 1 AS `host`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `x$host_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_file_io_type` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_stages`
--

DROP TABLE IF EXISTS `x$host_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_stages` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `x$host_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_statement_latency` AS SELECT 
 1 AS `host`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_statement_type`
--

DROP TABLE IF EXISTS `x$host_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_statement_type` AS SELECT 
 1 AS `host`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_buffer_stats_by_schema`
--

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_schema`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_buffer_stats_by_schema` AS SELECT 
 1 AS `object_schema`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_buffer_stats_by_table`
--

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_table`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_buffer_stats_by_table` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_lock_waits`
--

DROP TABLE IF EXISTS `x$innodb_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_lock_waits` AS SELECT 
 1 AS `wait_started`,
 1 AS `wait_age`,
 1 AS `wait_age_secs`,
 1 AS `locked_table`,
 1 AS `locked_table_schema`,
 1 AS `locked_table_name`,
 1 AS `locked_table_partition`,
 1 AS `locked_table_subpartition`,
 1 AS `locked_index`,
 1 AS `locked_type`,
 1 AS `waiting_trx_id`,
 1 AS `waiting_trx_started`,
 1 AS `waiting_trx_age`,
 1 AS `waiting_trx_rows_locked`,
 1 AS `waiting_trx_rows_modified`,
 1 AS `waiting_pid`,
 1 AS `waiting_query`,
 1 AS `waiting_lock_id`,
 1 AS `waiting_lock_mode`,
 1 AS `blocking_trx_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_query`,
 1 AS `blocking_lock_id`,
 1 AS `blocking_lock_mode`,
 1 AS `blocking_trx_started`,
 1 AS `blocking_trx_age`,
 1 AS `blocking_trx_rows_locked`,
 1 AS `blocking_trx_rows_modified`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_by_thread_by_latency`
--

DROP TABLE IF EXISTS `x$io_by_thread_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_by_thread_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `thread_id`,
 1 AS `processlist_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_file_by_bytes`
--

DROP TABLE IF EXISTS `x$io_global_by_file_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_file_by_bytes` AS SELECT 
 1 AS `file`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_write`,
 1 AS `total`,
 1 AS `write_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_file_by_latency`
--

DROP TABLE IF EXISTS `x$io_global_by_file_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_file_by_latency` AS SELECT 
 1 AS `file`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `count_read`,
 1 AS `read_latency`,
 1 AS `count_write`,
 1 AS `write_latency`,
 1 AS `count_misc`,
 1 AS `misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_wait_by_bytes`
--

DROP TABLE IF EXISTS `x$io_global_by_wait_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_wait_by_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`,
 1 AS `total_requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_wait_by_latency`
--

DROP TABLE IF EXISTS `x$io_global_by_wait_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_wait_by_latency` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `read_latency`,
 1 AS `write_latency`,
 1 AS `misc_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$latest_file_io`
--

DROP TABLE IF EXISTS `x$latest_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$latest_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$latest_file_io` AS SELECT 
 1 AS `thread`,
 1 AS `file`,
 1 AS `latency`,
 1 AS `operation`,
 1 AS `requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_host_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_host_by_current_bytes` AS SELECT 
 1 AS `host`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_thread_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_thread_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_thread_by_current_bytes` AS SELECT 
 1 AS `thread_id`,
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_user_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_user_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_user_by_current_bytes` AS SELECT 
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_global_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_global_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_global_by_current_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `current_count`,
 1 AS `current_alloc`,
 1 AS `current_avg_alloc`,
 1 AS `high_count`,
 1 AS `high_alloc`,
 1 AS `high_avg_alloc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_global_total`
--

DROP TABLE IF EXISTS `x$memory_global_total`;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_global_total` AS SELECT 
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$processlist`
--

DROP TABLE IF EXISTS `x$processlist`;
/*!50001 DROP VIEW IF EXISTS `x$processlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$processlist` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_digest_95th_percentile_by_avg_us`
--

DROP TABLE IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_digest_95th_percentile_by_avg_us` AS SELECT 
 1 AS `avg_us`,
 1 AS `percentile`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_digest_avg_latency_distribution`
--

DROP TABLE IF EXISTS `x$ps_digest_avg_latency_distribution`;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_digest_avg_latency_distribution` AS SELECT 
 1 AS `cnt`,
 1 AS `avg_us`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_schema_table_statistics_io`
--

DROP TABLE IF EXISTS `x$ps_schema_table_statistics_io`;
/*!50001 DROP VIEW IF EXISTS `x$ps_schema_table_statistics_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_schema_table_statistics_io` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `count_read`,
 1 AS `sum_number_of_bytes_read`,
 1 AS `sum_timer_read`,
 1 AS `count_write`,
 1 AS `sum_number_of_bytes_write`,
 1 AS `sum_timer_write`,
 1 AS `count_misc`,
 1 AS `sum_timer_misc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_flattened_keys`
--

DROP TABLE IF EXISTS `x$schema_flattened_keys`;
/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_flattened_keys` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `non_unique`,
 1 AS `subpart_exists`,
 1 AS `index_columns`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_index_statistics`
--

DROP TABLE IF EXISTS `x$schema_index_statistics`;
/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_index_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `rows_selected`,
 1 AS `select_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_lock_waits`
--

DROP TABLE IF EXISTS `x$schema_table_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_lock_waits` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `waiting_thread_id`,
 1 AS `waiting_pid`,
 1 AS `waiting_account`,
 1 AS `waiting_lock_type`,
 1 AS `waiting_lock_duration`,
 1 AS `waiting_query`,
 1 AS `waiting_query_secs`,
 1 AS `waiting_query_rows_affected`,
 1 AS `waiting_query_rows_examined`,
 1 AS `blocking_thread_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_account`,
 1 AS `blocking_lock_type`,
 1 AS `blocking_lock_duration`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_statistics`
--

DROP TABLE IF EXISTS `x$schema_table_statistics`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `total_latency`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_statistics_with_buffer`
--

DROP TABLE IF EXISTS `x$schema_table_statistics_with_buffer`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_statistics_with_buffer` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`,
 1 AS `innodb_buffer_allocated`,
 1 AS `innodb_buffer_data`,
 1 AS `innodb_buffer_free`,
 1 AS `innodb_buffer_pages`,
 1 AS `innodb_buffer_pages_hashed`,
 1 AS `innodb_buffer_pages_old`,
 1 AS `innodb_buffer_rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_tables_with_full_table_scans`
--

DROP TABLE IF EXISTS `x$schema_tables_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_tables_with_full_table_scans` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `rows_full_scanned`,
 1 AS `latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$session`
--

DROP TABLE IF EXISTS `x$session`;
/*!50001 DROP VIEW IF EXISTS `x$session`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$session` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statement_analysis`
--

DROP TABLE IF EXISTS `x$statement_analysis`;
/*!50001 DROP VIEW IF EXISTS `x$statement_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statement_analysis` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `rows_affected`,
 1 AS `rows_affected_avg`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `rows_sorted`,
 1 AS `sort_merge_passes`,
 1 AS `digest`,
 1 AS `first_seen`,
 1 AS `last_seen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_errors_or_warnings`
--

DROP TABLE IF EXISTS `x$statements_with_errors_or_warnings`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_errors_or_warnings` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `errors`,
 1 AS `error_pct`,
 1 AS `warnings`,
 1 AS `warning_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_full_table_scans`
--

DROP TABLE IF EXISTS `x$statements_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_full_table_scans` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `no_index_used_count`,
 1 AS `no_good_index_used_count`,
 1 AS `no_index_used_pct`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_runtimes_in_95th_percentile`
--

DROP TABLE IF EXISTS `x$statements_with_runtimes_in_95th_percentile`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_runtimes_in_95th_percentile` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_sorting`
--

DROP TABLE IF EXISTS `x$statements_with_sorting`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_sorting` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `sort_merge_passes`,
 1 AS `avg_sort_merges`,
 1 AS `sorts_using_scans`,
 1 AS `sort_using_range`,
 1 AS `rows_sorted`,
 1 AS `avg_rows_sorted`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_temp_tables`
--

DROP TABLE IF EXISTS `x$statements_with_temp_tables`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_temp_tables` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `memory_tmp_tables`,
 1 AS `disk_tmp_tables`,
 1 AS `avg_tmp_tables_per_query`,
 1 AS `tmp_tables_to_disk_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary`
--

DROP TABLE IF EXISTS `x$user_summary`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary` AS SELECT 
 1 AS `user`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_hosts`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_file_io`
--

DROP TABLE IF EXISTS `x$user_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_file_io` AS SELECT 
 1 AS `user`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `x$user_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_file_io_type` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_stages`
--

DROP TABLE IF EXISTS `x$user_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_stages` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `x$user_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_statement_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_statement_type`
--

DROP TABLE IF EXISTS `x$user_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_statement_type` AS SELECT 
 1 AS `user`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$wait_classes_global_by_avg_latency`
--

DROP TABLE IF EXISTS `x$wait_classes_global_by_avg_latency`;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$wait_classes_global_by_avg_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$wait_classes_global_by_latency`
--

DROP TABLE IF EXISTS `x$wait_classes_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$wait_classes_global_by_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_by_host_by_latency`
--

DROP TABLE IF EXISTS `x$waits_by_host_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_by_host_by_latency` AS SELECT 
 1 AS `host`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_by_user_by_latency`
--

DROP TABLE IF EXISTS `x$waits_by_user_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_by_user_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_global_by_latency`
--

DROP TABLE IF EXISTS `x$waits_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_global_by_latency` AS SELECT 
 1 AS `events`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sys'
--

--
-- Dumping routines for database 'sys'
--
/*!50003 DROP FUNCTION IF EXISTS `extract_schema_from_file_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `extract_schema_from_file_name`(
        path VARCHAR(512)
    ) RETURNS varchar(64) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw file path, and attempts to extract the schema name from it.\n\nUseful for when interacting with Performance Schema data \nconcerning IO statistics, for example.\n\nCurrently relies on the fact that a table data file will be within a \nspecified database directory (will not work with partitions or tables\nthat specify an individual DATA_DIRECTORY).\n\nParameters\n-----------\n\npath (VARCHAR(512)):\n  The full file path to a data file to extract the schema name from.\n\nReturns\n-----------\n\nVARCHAR(64)\n\nExample\n-----------\n\nmysql> SELECT sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'');\n+----------------------------------------------------------------------------+\n| sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'') |\n+----------------------------------------------------------------------------+\n| employees                                                                  |\n+----------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN LEFT(SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(path, '\\', '/'), '/', -2), '/', 1), 64);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `extract_table_from_file_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `extract_table_from_file_name`(
        path VARCHAR(512)
    ) RETURNS varchar(64) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw file path, and extracts the table name from it.\n\nUseful for when interacting with Performance Schema data \nconcerning IO statistics, for example.\n\nParameters\n-----------\n\npath (VARCHAR(512)):\n  The full file path to a data file to extract the table name from.\n\nReturns\n-----------\n\nVARCHAR(64)\n\nExample\n-----------\n\nmysql> SELECT sys.extract_table_from_file_name(''/var/lib/mysql/employees/employee.ibd'');\n+---------------------------------------------------------------------------+\n| sys.extract_table_from_file_name(''/var/lib/mysql/employees/employee.ibd'') |\n+---------------------------------------------------------------------------+\n| employee                                                                  |\n+---------------------------------------------------------------------------+\n1 row in set (0.02 sec)\n'
BEGIN
    RETURN LEFT(SUBSTRING_INDEX(REPLACE(SUBSTRING_INDEX(REPLACE(path, '\\', '/'), '/', -1), '@0024', '$'), '.', 1), 64);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_bytes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_bytes`(
        -- We feed in and return TEXT here, as aggregates of
        -- bytes can return numbers larger than BIGINT UNSIGNED
        bytes TEXT
    ) RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw bytes value, and converts it to a human readable format.\n\nParameters\n-----------\n\nbytes (TEXT):\n  A raw bytes value.\n\nReturns\n-----------\n\nTEXT\n\nExample\n-----------\n\nmysql> SELECT sys.format_bytes(2348723492723746) AS size;\n+----------+\n| size     |\n+----------+\n| 2.09 PiB |\n+----------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.format_bytes(2348723492723) AS size;\n+----------+\n| size     |\n+----------+\n| 2.14 TiB |\n+----------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.format_bytes(23487234) AS size;\n+-----------+\n| size      |\n+-----------+\n| 22.40 MiB |\n+-----------+\n1 row in set (0.00 sec)\n'
BEGIN
  IF (bytes IS NULL) THEN
    RETURN NULL;
  ELSE
    RETURN format_bytes(bytes);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_path` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_path`(
        in_path VARCHAR(512)
    ) RETURNS varchar(512) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw path value, and strips out the datadir or tmpdir\nreplacing with @@datadir and @@tmpdir respectively.\n\nAlso normalizes the paths across operating systems, so backslashes\non Windows are converted to forward slashes\n\nParameters\n-----------\n\npath (VARCHAR(512)):\n  The raw file path value to format.\n\nReturns\n-----------\n\nVARCHAR(512) CHARSET UTF8MB4\n\nExample\n-----------\n\nmysql> select @@datadir;\n+-----------------------------------------------+\n| @@datadir                                     |\n+-----------------------------------------------+\n| /Users/mark/sandboxes/SmallTree/AMaster/data/ |\n+-----------------------------------------------+\n1 row in set (0.06 sec)\n\nmysql> select format_path(''/Users/mark/sandboxes/SmallTree/AMaster/data/mysql/proc.MYD'') AS path;\n+--------------------------+\n| path                     |\n+--------------------------+\n| @@datadir/mysql/proc.MYD |\n+--------------------------+\n1 row in set (0.03 sec)\n'
BEGIN
  DECLARE v_path VARCHAR(512);
  DECLARE v_undo_dir VARCHAR(1024);
  DECLARE path_separator CHAR(1) DEFAULT '/';
  IF @@global.version_compile_os LIKE 'win%' THEN
    SET path_separator = '\\';
  END IF;
  -- OSX hides /private/ in variables, but Performance Schema does not
  IF in_path LIKE '/private/%' THEN
    SET v_path = REPLACE(in_path, '/private', '');
  ELSE
    SET v_path = in_path;
  END IF;
  -- @@global.innodb_undo_directory is only set when separate undo logs are used
  SET v_undo_dir = IFNULL((SELECT VARIABLE_VALUE FROM performance_schema.global_variables WHERE VARIABLE_NAME = 'innodb_undo_directory'), '');
  IF v_path IS NULL THEN
    RETURN NULL;
  ELSEIF v_path LIKE CONCAT(@@global.datadir, IF(SUBSTRING(@@global.datadir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.datadir, CONCAT('@@datadir', IF(SUBSTRING(@@global.datadir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.tmpdir, IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.tmpdir, CONCAT('@@tmpdir', IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.slave_load_tmpdir, IF(SUBSTRING(@@global.slave_load_tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.slave_load_tmpdir, CONCAT('@@slave_load_tmpdir', IF(SUBSTRING(@@global.slave_load_tmpdir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.innodb_data_home_dir, IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.innodb_data_home_dir, CONCAT('@@innodb_data_home_dir', IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.innodb_log_group_home_dir, IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.innodb_log_group_home_dir, CONCAT('@@innodb_log_group_home_dir', IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(v_undo_dir, IF(SUBSTRING(v_undo_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, v_undo_dir, CONCAT('@@innodb_undo_directory', IF(SUBSTRING(v_undo_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.basedir, IF(SUBSTRING(@@global.basedir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.basedir, CONCAT('@@basedir', IF(SUBSTRING(@@global.basedir, -1) = path_separator, path_separator, '')));
  END IF;
  RETURN v_path;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_statement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_statement`(
        statement LONGTEXT
    ) RETURNS longtext CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nFormats a normalized statement, truncating it if it is > 64 characters long by default.\n\nTo configure the length to truncate the statement to by default, update the `statement_truncate_len`\nvariable with `sys_config` table to a different value. Alternatively, to change it just for just \nyour particular session, use `SET @sys.statement_truncate_len := <some new value>`.\n\nUseful for printing statement related data from Performance Schema from \nthe command line.\n\nParameters\n-----------\n\nstatement (LONGTEXT): \n  The statement to format.\n\nReturns\n-----------\n\nLONGTEXT\n\nExample\n-----------\n\nmysql> SELECT sys.format_statement(digest_text)\n    ->   FROM performance_schema.events_statements_summary_by_digest\n    ->  ORDER by sum_timer_wait DESC limit 5;\n+-------------------------------------------------------------------+\n| sys.format_statement(digest_text)                                 |\n+-------------------------------------------------------------------+\n| CREATE SQL SECURITY INVOKER VI ... KE ? AND `variable_value` > ?  |\n| CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `esc` . ... |\n| CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `sys` . ... |\n| CREATE SQL SECURITY INVOKER VI ...  , `compressed_size` ) ) DESC  |\n| CREATE SQL SECURITY INVOKER VI ... LIKE ? ORDER BY `timer_start`  |\n+-------------------------------------------------------------------+\n5 rows in set (0.00 sec)\n'
BEGIN
  -- Check if we have the configured length, if not, init it
  IF @sys.statement_truncate_len IS NULL THEN
      SET @sys.statement_truncate_len = sys_get_config('statement_truncate_len', 64);
  END IF;
  IF CHAR_LENGTH(statement) > @sys.statement_truncate_len THEN
      RETURN REPLACE(CONCAT(LEFT(statement, (@sys.statement_truncate_len/2)-2), ' ... ', RIGHT(statement, (@sys.statement_truncate_len/2)-2)), '\n', ' ');
  ELSE 
      RETURN REPLACE(statement, '\n', ' ');
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_time`(
-- We feed in and return TEXT here, as aggregates of
-- picoseconds can return numbers larger than BIGINT UNSIGNED
        picoseconds TEXT
    ) RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw picoseconds value, and converts it to a human readable form.\n\nPicoseconds are the precision that all latency values are printed in\nwithin Performance Schema, however are not user friendly when wanting\nto scan output from the command line.\n\nParameters\n-----------\n\npicoseconds (TEXT):\n  The raw picoseconds value to convert.\n\nReturns\n-----------\n\nTEXT CHARSET UTF8MB4\n\nExample\n-----------\n\nmysql> select format_time(342342342342345);\n+------------------------------+\n| format_time(342342342342345) |\n+------------------------------+\n| 00:05:42                     |\n+------------------------------+\n1 row in set (0.00 sec)\n\nmysql> select format_time(342342342);\n+------------------------+\n| format_time(342342342) |\n+------------------------+\n| 342.34 us              |\n+------------------------+\n1 row in set (0.00 sec)\n\nmysql> select format_time(34234);\n+--------------------+\n| format_time(34234) |\n+--------------------+\n| 34.23 ns           |\n+--------------------+\n1 row in set (0.00 sec)\n'
BEGIN
  IF picoseconds IS NULL THEN RETURN NULL;
  ELSEIF picoseconds >= 604800000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 604800000000000000, 2), ' w');
  ELSEIF picoseconds >= 86400000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 86400000000000000, 2), ' d');
  ELSEIF picoseconds >= 3600000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 3600000000000000, 2), ' h');
  ELSEIF picoseconds >= 60000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 60000000000000, 2), ' m');
  ELSEIF picoseconds >= 1000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000000000, 2), ' s');
  ELSEIF picoseconds >= 1000000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000000, 2), ' ms');
  ELSEIF picoseconds >= 1000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000, 2), ' us');
  ELSEIF picoseconds >= 1000 THEN RETURN CONCAT(ROUND(picoseconds / 1000, 2), ' ns');
  ELSE RETURN CONCAT(picoseconds, ' ps');
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `list_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `list_add`(
        in_list TEXT,
        in_add_value TEXT
    ) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a list, and a value to add to the list, and returns the resulting list.\n\nUseful for altering certain session variables, like sql_mode or optimizer_switch for instance.\n\nParameters\n-----------\n\nin_list (TEXT):\n  The comma separated list to add a value to\n\nin_add_value (TEXT):\n  The value to add to the input list\n\nReturns\n-----------\n\nTEXT\n\nExample\n--------\n\nmysql> select @@sql_mode;\n+-----------------------------------------------------------------------------------+\n| @@sql_mode                                                                        |\n+-----------------------------------------------------------------------------------+\n| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+-----------------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> set sql_mode = sys.list_add(@@sql_mode, ''ANSI_QUOTES'');\nQuery OK, 0 rows affected (0.06 sec)\n\nmysql> select @@sql_mode;\n+-----------------------------------------------------------------------------------------------+\n| @@sql_mode                                                                                    |\n+-----------------------------------------------------------------------------------------------+\n| ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+-----------------------------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\n'
BEGIN
    IF (in_add_value IS NULL) THEN
        SIGNAL SQLSTATE '02200'
           SET MESSAGE_TEXT = 'Function sys.list_add: in_add_value input variable should not be NULL',
               MYSQL_ERRNO = 1138;
    END IF;
    IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN
        -- return the new value as a single value list
        RETURN in_add_value;
    END IF;
    RETURN (SELECT CONCAT(TRIM(BOTH ',' FROM TRIM(in_list)), ',', in_add_value));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `list_drop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `list_drop`(
        in_list TEXT,
        in_drop_value TEXT
    ) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a list, and a value to attempt to remove from the list, and returns the resulting list.\n\nUseful for altering certain session variables, like sql_mode or optimizer_switch for instance.\n\nParameters\n-----------\n\nin_list (TEXT):\n  The comma separated list to drop a value from\n\nin_drop_value (TEXT):\n  The value to drop from the input list\n\nReturns\n-----------\n\nTEXT\n\nExample\n--------\n\nmysql> select @@sql_mode;\n+-----------------------------------------------------------------------------------------------+\n| @@sql_mode                                                                                    |\n+-----------------------------------------------------------------------------------------------+\n| ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+-----------------------------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> set sql_mode = sys.list_drop(@@sql_mode, ''ONLY_FULL_GROUP_BY'');\nQuery OK, 0 rows affected (0.03 sec)\n\nmysql> select @@sql_mode;\n+----------------------------------------------------------------------------+\n| @@sql_mode                                                                 |\n+----------------------------------------------------------------------------+\n| ANSI_QUOTES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+----------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\n'
BEGIN
    IF (in_drop_value IS NULL) THEN
        SIGNAL SQLSTATE '02200'
           SET MESSAGE_TEXT = 'Function sys.list_drop: in_drop_value input variable should not be NULL',
               MYSQL_ERRNO = 1138;
    END IF;
    IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN
        -- return the list as it was passed in
        RETURN in_list;
    END IF;
    -- ensure that leading / trailing commas are remove, support values with either spaces or not between commas
    RETURN (SELECT TRIM(BOTH ',' FROM REPLACE(REPLACE(CONCAT(',', in_list), CONCAT(',', in_drop_value), ''), CONCAT(', ', in_drop_value), '')));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_account_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_account_enabled`(
        in_host VARCHAR(255), 
        in_user VARCHAR(32)
    ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDetermines whether instrumentation of an account is enabled \nwithin Performance Schema.\n\nParameters\n-----------\n\nin_host VARCHAR(255): \n  The hostname of the account to check.\nin_user VARCHAR(32):\n  The username of the account to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'', ''PARTIAL'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_account_enabled(''localhost'', ''root'');\n+------------------------------------------------+\n| sys.ps_is_account_enabled(''localhost'', ''root'') |\n+------------------------------------------------+\n| YES                                            |\n+------------------------------------------------+\n1 row in set (0.01 sec)\n'
BEGIN
    RETURN IF(EXISTS(SELECT 1
                       FROM performance_schema.setup_actors
                      WHERE (`HOST` = '%' OR in_host LIKE `HOST`)
                        AND (`USER` = '%' OR `USER` = in_user)
                        AND (`ENABLED` = 'YES')
                    ),
              'YES', 'NO'
           );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_consumer_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_consumer_enabled`(
        in_consumer varchar(64)
   ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDetermines whether a consumer is enabled (taking the consumer hierarchy into consideration)\nwithin the Performance Schema.\n\nAn exception with errno 3047 is thrown if an unknown consumer name is passed to the function.\nA consumer name of NULL returns NULL.\n\nParameters\n-----------\n\nin_consumer VARCHAR(64): \n  The name of the consumer to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_consumer_enabled(''events_stages_history'');\n+-----------------------------------------------------+\n| sys.ps_is_consumer_enabled(''events_stages_history'') |\n+-----------------------------------------------------+\n| NO                                                  |\n+-----------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_is_enabled ENUM('YES', 'NO') DEFAULT NULL;
    DECLARE v_error_msg VARCHAR(128);
    -- Return NULL for a NULL argument.
    IF (in_consumer IS NULL) THEN
        RETURN NULL;
    END IF;
    SET v_is_enabled = (
        SELECT (CASE
                   WHEN c.NAME = 'global_instrumentation' THEN c.ENABLED
                   WHEN c.NAME = 'thread_instrumentation' THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   WHEN c.NAME LIKE '%\_digest'           THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   WHEN c.NAME LIKE '%\_current'          THEN IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   ELSE IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES'
                           AND ( SELECT cc.ENABLED FROM performance_schema.setup_consumers cc WHERE NAME = CONCAT(SUBSTRING_INDEX(c.NAME, '_', 2), '_current')
                               ) = 'YES', 'YES', 'NO')
                END) AS IsEnabled
          FROM performance_schema.setup_consumers c
               INNER JOIN performance_schema.setup_consumers cg
               INNER JOIN performance_schema.setup_consumers ct
         WHERE cg.NAME       = 'global_instrumentation'
               AND ct.NAME   = 'thread_instrumentation'
               AND c.NAME    = in_consumer
        );
    IF (v_is_enabled IS NOT NULL) THEN
        RETURN v_is_enabled;
    ELSE
        -- A value of NULL here means it is an unknown consumer name that was passed as an argument.
        -- Only an input value of NULL is allowed to return a NULL result value, to throw a signal instead.
        SET v_error_msg = CONCAT('Invalid argument error: ', in_consumer, ' in function sys.ps_is_consumer_enabled.');
        SIGNAL SQLSTATE 'HY000'
           SET MESSAGE_TEXT = v_error_msg,
               MYSQL_ERRNO  = 3047;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_instrument_default_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_instrument_default_enabled`(
        in_instrument VARCHAR(128)
    ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns whether an instrument is enabled by default in this version of MySQL.\n\nParameters\n-----------\n\nin_instrument VARCHAR(128): \n  The instrument to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_instrument_default_enabled(''statement/sql/select'');\n+--------------------------------------------------------------+\n| sys.ps_is_instrument_default_enabled(''statement/sql/select'') |\n+--------------------------------------------------------------+\n| YES                                                          |\n+--------------------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_enabled ENUM('YES', 'NO');
    IF (in_instrument LIKE 'stage/%') THEN
    BEGIN
      /* Stages are enabled by default if the progress property is set. */
      SET v_enabled = (SELECT
                        IF(find_in_set("progress", PROPERTIES) != 0, 'YES', 'NO')
                        FROM performance_schema.setup_instruments
                        WHERE NAME = in_instrument);
      SET v_enabled = IFNULL(v_enabled, 'NO');
    END;
    ELSE
      SET v_enabled = IF(in_instrument LIKE 'wait/synch/%'
                         OR in_instrument LIKE 'wait/io/socket/%'
                        ,
                         'NO',
                         'YES'
                      );
    END IF;
    RETURN v_enabled;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_instrument_default_timed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_instrument_default_timed`(
        in_instrument VARCHAR(128)
    ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns whether an instrument is timed by default in this version of MySQL.\n\nParameters\n-----------\n\nin_instrument VARCHAR(128): \n  The instrument to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_instrument_default_timed(''statement/sql/select'');\n+------------------------------------------------------------+\n| sys.ps_is_instrument_default_timed(''statement/sql/select'') |\n+------------------------------------------------------------+\n| YES                                                        |\n+------------------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_timed ENUM('YES', 'NO');
    IF (in_instrument LIKE 'stage/%') THEN
    BEGIN
      -- Stages are timed by default if the progress property is set.
      SET v_timed = (SELECT
                      IF(find_in_set("progress", PROPERTIES) != 0, 'YES', 'NO')
                      FROM performance_schema.setup_instruments
                      WHERE NAME = in_instrument);
      SET v_timed = IFNULL(v_timed, 'NO');
    END;
    ELSE
      -- Mutex, rwlock, prlock, sxlock, cond are not timed by default
      -- Memory instruments are never timed.
      SET v_timed = IF(in_instrument LIKE 'wait/synch/%'
                       OR in_instrument LIKE 'memory/%'
                      ,
                       'NO',
                       'YES'
                    );
    END IF;
    RETURN v_timed;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_thread_instrumented` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_thread_instrumented`(
        in_connection_id BIGINT UNSIGNED
    ) RETURNS enum('YES','NO','UNKNOWN') CHARSET utf8mb4
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nChecks whether the provided connection id is instrumented within Performance Schema.\n\nParameters\n-----------\n\nin_connection_id (BIGINT UNSIGNED):\n  The id of the connection to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'', ''UNKNOWN'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_thread_instrumented(CONNECTION_ID());\n+------------------------------------------------+\n| sys.ps_is_thread_instrumented(CONNECTION_ID()) |\n+------------------------------------------------+\n| YES                                            |\n+------------------------------------------------+\n'
BEGIN
    DECLARE v_enabled ENUM('YES', 'NO', 'UNKNOWN');
    IF (in_connection_id IS NULL) THEN
        RETURN NULL;
    END IF;
    SELECT INSTRUMENTED INTO v_enabled
      FROM performance_schema.threads 
     WHERE PROCESSLIST_ID = in_connection_id;
    IF (v_enabled IS NULL) THEN
        RETURN 'UNKNOWN';
    ELSE
        RETURN v_enabled;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_account`(
        in_thread_id BIGINT UNSIGNED
    ) RETURNS text CHARSET utf8mb4
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturn the user@host account for the given Performance Schema thread id.\n\nParameters\n-----------\n\nin_thread_id (BIGINT UNSIGNED):\n  The id of the thread to return the account for.\n\nExample\n-----------\n\nmysql> select thread_id, processlist_user, processlist_host from performance_schema.threads where type = ''foreground'';\n+-----------+------------------+------------------+\n| thread_id | processlist_user | processlist_host |\n+-----------+------------------+------------------+\n|        23 | NULL             | NULL             |\n|        30 | root             | localhost        |\n|        31 | msandbox         | localhost        |\n|        32 | msandbox         | localhost        |\n+-----------+------------------+------------------+\n4 rows in set (0.00 sec)\n\nmysql> select sys.ps_thread_account(31);\n+---------------------------+\n| sys.ps_thread_account(31) |\n+---------------------------+\n| msandbox@localhost        |\n+---------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN (SELECT IF(
                      type = 'FOREGROUND',
                      CONCAT(processlist_user, '@', processlist_host),
                      type
                     ) AS account
              FROM `performance_schema`.`threads`
             WHERE thread_id = in_thread_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_id`(
        in_connection_id BIGINT UNSIGNED
    ) RETURNS bigint unsigned
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturn the Performance Schema THREAD_ID for the specified connection ID.\n\nParameters\n-----------\n\nin_connection_id (BIGINT UNSIGNED):\n  The id of the connection to return the thread id for. If NULL, the current\n  connection thread id is returned.\n\nExample\n-----------\n\nmysql> SELECT sys.ps_thread_id(79);\n+----------------------+\n| sys.ps_thread_id(79) |\n+----------------------+\n|                   98 |\n+----------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.ps_thread_id(CONNECTION_ID());\n+-----------------------------------+\n| sys.ps_thread_id(CONNECTION_ID()) |\n+-----------------------------------+\n|                                98 |\n+-----------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
  IF (in_connection_id IS NULL) THEN
    RETURN ps_current_thread_id();
  ELSE
    RETURN ps_thread_id(in_connection_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_stack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_stack`(
        thd_id BIGINT UNSIGNED,
        debug BOOLEAN
    ) RETURNS longtext CHARSET latin1
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nOutputs a JSON formatted stack of all statements, stages and events\nwithin Performance Schema for the specified thread.\n\nParameters\n-----------\n\nthd_id (BIGINT UNSIGNED):\n  The id of the thread to trace. This should match the thread_id\n  column from the performance_schema.threads table.\nin_verbose (BOOLEAN):\n  Include file:lineno information in the events.\n\nExample\n-----------\n\n(line separation added for output)\n\nmysql> SELECT sys.ps_thread_stack(37, FALSE) AS thread_stack\\G\n*************************** 1. row ***************************\nthread_stack: {"rankdir": "LR","nodesep": "0.10","stack_created": "2014-02-19 13:39:03",\n"mysql_version": "5.7.3-m13","mysql_user": "root@localhost","events": \n[{"nesting_event_id": "0", "event_id": "10", "timer_wait": 256.35, "event_info": \n"sql/select", "wait_info": "select @@version_comment limit 1\\nerrors: 0\\nwarnings: 0\\nlock time:\n...\n'
BEGIN
    DECLARE json_objects LONGTEXT;
    -- Do not track the current thread, it will kill the stack
    UPDATE performance_schema.threads
       SET instrumented = 'NO'
     WHERE processlist_id = CONNECTION_ID();
    SET SESSION group_concat_max_len=@@global.max_allowed_packet;
    -- Select the entire stack of events
    SELECT GROUP_CONCAT(CONCAT( '{'
              , CONCAT_WS( ', '
              , CONCAT('"nesting_event_id": "', IF(nesting_event_id IS NULL, '0', nesting_event_id), '"')
              , CONCAT('"event_id": "', event_id, '"')
              -- Convert from picoseconds to microseconds
              , CONCAT( '"timer_wait": ', ROUND(timer_wait/1000000, 2))  
              , CONCAT( '"event_info": "'
                  , CASE
                        WHEN event_name NOT LIKE 'wait/io%' THEN REPLACE(SUBSTRING_INDEX(event_name, '/', -2), '\\', '\\\\')
                        WHEN event_name NOT LIKE 'wait/io/file%' OR event_name NOT LIKE 'wait/io/socket%' THEN REPLACE(SUBSTRING_INDEX(event_name, '/', -4), '\\', '\\\\')
                        ELSE event_name
                    END
                  , '"'
              )
              -- Always dump the extra wait information gathered for statements
              , CONCAT( '"wait_info": "', IFNULL(wait_info, ''), '"')
              -- If debug is enabled, add the file:lineno information for waits
              , CONCAT( '"source": "', IF(true AND event_name LIKE 'wait%', IFNULL(wait_info, ''), ''), '"')
              -- Depending on the type of event, name it appropriately
              , CASE 
                     WHEN event_name LIKE 'wait/io/file%'      THEN '"event_type": "io/file"'
                     WHEN event_name LIKE 'wait/io/table%'     THEN '"event_type": "io/table"'
                     WHEN event_name LIKE 'wait/io/socket%'    THEN '"event_type": "io/socket"'
                     WHEN event_name LIKE 'wait/synch/mutex%'  THEN '"event_type": "synch/mutex"'
                     WHEN event_name LIKE 'wait/synch/cond%'   THEN '"event_type": "synch/cond"'
                     WHEN event_name LIKE 'wait/synch/rwlock%' THEN '"event_type": "synch/rwlock"'
                     WHEN event_name LIKE 'wait/lock%'         THEN '"event_type": "lock"'
                     WHEN event_name LIKE 'statement/%'        THEN '"event_type": "stmt"'
                     WHEN event_name LIKE 'stage/%'            THEN '"event_type": "stage"'
                     WHEN event_name LIKE '%idle%'             THEN '"event_type": "idle"'
                     ELSE '' 
                END                   
            )
            , '}'
          )
          ORDER BY event_id ASC SEPARATOR ',') event
    INTO json_objects
    FROM (
          -- Select all statements, with the extra tracing information available
          (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, 
                  CONCAT(sql_text, '\\n',
                         'errors: ', errors, '\\n',
                         'warnings: ', warnings, '\\n',
                         'lock time: ', ROUND(lock_time/1000000, 2),'us\\n',
                         'rows affected: ', rows_affected, '\\n',
                         'rows sent: ', rows_sent, '\\n',
                         'rows examined: ', rows_examined, '\\n',
                         'tmp tables: ', created_tmp_tables, '\\n',
                         'tmp disk tables: ', created_tmp_disk_tables, '\\n',
                         'select scan: ', select_scan, '\\n',
                         'select full join: ', select_full_join, '\\n',
                         'select full range join: ', select_full_range_join, '\\n',
                         'select range: ', select_range, '\\n',
                         'select range check: ', select_range_check, '\\n', 
                         'sort merge passes: ', sort_merge_passes, '\\n',
                         'sort rows: ', sort_rows, '\\n',
                         'sort range: ', sort_range, '\\n',
                         'sort scan: ', sort_scan, '\\n',
                         'no index used: ', IF(no_index_used, 'TRUE', 'FALSE'), '\\n',
                         'no good index used: ', IF(no_good_index_used, 'TRUE', 'FALSE'), '\\n'
                         ) AS wait_info
             FROM performance_schema.events_statements_history_long WHERE thread_id = thd_id)
          UNION 
          -- Select all stages
          (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, null AS wait_info
             FROM performance_schema.events_stages_history_long WHERE thread_id = thd_id) 
          UNION
          -- Select all events, adding information appropriate to the event
          (SELECT thread_id, event_id, 
                  CONCAT(event_name , 
                         IF(event_name NOT LIKE 'wait/synch/mutex%', IFNULL(CONCAT(' - ', operation), ''), ''), 
                         IF(number_of_bytes IS NOT NULL, CONCAT(' ', number_of_bytes, ' bytes'), ''),
                         IF(event_name LIKE 'wait/io/file%', '\\n', ''),
                         IF(object_schema IS NOT NULL, CONCAT('\\nObject: ', object_schema, '.'), ''), 
                         IF(object_name IS NOT NULL, 
                            IF (event_name LIKE 'wait/io/socket%',
                                -- Print the socket if used, else the IP:port as reported
                                CONCAT(IF (object_name LIKE ':0%', @@socket, object_name)),
                                object_name),
                            ''),
                         IF(index_name IS NOT NULL, CONCAT(' Index: ', index_name), ''),'\\n'
                         ) AS event_name,
                  timer_wait, timer_start, nesting_event_id, source AS wait_info
             FROM performance_schema.events_waits_history_long WHERE thread_id = thd_id)) events 
    ORDER BY event_id;
    RETURN CONCAT('{', 
                  CONCAT_WS(',', 
                            '"rankdir": "LR"',
                            '"nodesep": "0.10"',
                            CONCAT('"stack_created": "', NOW(), '"'),
                            CONCAT('"mysql_version": "', VERSION(), '"'),
                            CONCAT('"mysql_user": "', CURRENT_USER(), '"'),
                            CONCAT('"events": [', IFNULL(json_objects,''), ']')
                           ),
                  '}');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_trx_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_trx_info`(
        in_thread_id BIGINT UNSIGNED
    ) RETURNS longtext CHARSET utf8mb4
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns a JSON object with info on the given threads current transaction, \nand the statements it has already executed, derived from the\nperformance_schema.events_transactions_current and\nperformance_schema.events_statements_history tables (so the consumers \nfor these also have to be enabled within Performance Schema to get full\ndata in the object).\n\nWhen the output exceeds the default truncation length (65535), a JSON error\nobject is returned, such as:\n\n{ "error": "Trx info truncated: Row 6 was cut by GROUP_CONCAT()" }\n\nSimilar error objects are returned for other warnings/and exceptions raised\nwhen calling the function.\n\nThe max length of the output of this function can be controlled with the\nps_thread_trx_info.max_length variable set via sys_config, or the\n@sys.ps_thread_trx_info.max_length user variable, as appropriate.\n\nParameters\n-----------\n\nin_thread_id (BIGINT UNSIGNED):\n  The id of the thread to return the transaction info for.\n\nExample\n-----------\n\nSELECT sys.ps_thread_trx_info(48)\\G\n*************************** 1. row ***************************\nsys.ps_thread_trx_info(48): [\n  {\n    "time": "790.70 us",\n    "state": "COMMITTED",\n    "mode": "READ WRITE",\n    "autocommitted": "NO",\n    "gtid": "AUTOMATIC",\n    "isolation": "REPEATABLE READ",\n    "statements_executed": [\n      {\n        "sql_text": "INSERT INTO info VALUES (1, ''foo'')",\n        "time": "471.02 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 1,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      },\n      {\n        "sql_text": "COMMIT",\n        "time": "254.42 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 0,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      }\n    ]\n  },\n  {\n    "time": "426.20 us",\n    "state": "COMMITTED",\n    "mode": "READ WRITE",\n    "autocommitted": "NO",\n    "gtid": "AUTOMATIC",\n    "isolation": "REPEATABLE READ",\n    "statements_executed": [\n      {\n        "sql_text": "INSERT INTO info VALUES (2, ''bar'')",\n        "time": "107.33 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 1,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      },\n      {\n        "sql_text": "COMMIT",\n        "time": "213.23 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 0,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      }\n    ]\n  }\n]\n1 row in set (0.03 sec)\n'
BEGIN
    DECLARE v_output LONGTEXT DEFAULT '{}';
    DECLARE v_msg_text TEXT DEFAULT '';
    DECLARE v_signal_msg TEXT DEFAULT '';
    DECLARE v_mysql_errno INT;
    DECLARE v_max_output_len BIGINT;
    -- Capture warnings/errors such as group_concat truncation
    -- and report as JSON error objects
    DECLARE EXIT HANDLER FOR SQLWARNING, SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_msg_text = MESSAGE_TEXT,
            v_mysql_errno = MYSQL_ERRNO;
        IF v_mysql_errno = 1260 THEN
            SET v_signal_msg = CONCAT('{ "error": "Trx info truncated: ', v_msg_text, '" }');
        ELSE
            SET v_signal_msg = CONCAT('{ "error": "', v_msg_text, '" }');
        END IF;
        RETURN v_signal_msg;
    END;
    -- Set configuration options
    IF (@sys.ps_thread_trx_info.max_length IS NULL) THEN
        SET @sys.ps_thread_trx_info.max_length = sys.sys_get_config('ps_thread_trx_info.max_length', 65535);
    END IF;
    IF (@sys.ps_thread_trx_info.max_length != @@session.group_concat_max_len) THEN
        SET @old_group_concat_max_len = @@session.group_concat_max_len;
        -- Convert to int value for the SET, and give some surrounding space
        SET v_max_output_len = (@sys.ps_thread_trx_info.max_length - 5);
        SET SESSION group_concat_max_len = v_max_output_len;
    END IF;
    SET v_output = (
        SELECT CONCAT('[', IFNULL(GROUP_CONCAT(trx_info ORDER BY event_id), ''), '\n]') AS trx_info
          FROM (SELECT trxi.thread_id, 
                       trxi.event_id,
                       GROUP_CONCAT(
                         IFNULL(
                           CONCAT('\n  {\n',
                                  '    "time": "', IFNULL(format_pico_time(trxi.timer_wait), ''), '",\n',
                                  '    "state": "', IFNULL(trxi.state, ''), '",\n',
                                  '    "mode": "', IFNULL(trxi.access_mode, ''), '",\n',
                                  '    "autocommitted": "', IFNULL(trxi.autocommit, ''), '",\n',
                                  '    "gtid": "', IFNULL(trxi.gtid, ''), '",\n',
                                  '    "isolation": "', IFNULL(trxi.isolation_level, ''), '",\n',
                                  '    "statements_executed": [', IFNULL(s.stmts, ''), IF(s.stmts IS NULL, ' ]\n', '\n    ]\n'),
                                  '  }'
                           ), 
                           '') 
                         ORDER BY event_id) AS trx_info
                  FROM (
                        (SELECT thread_id, event_id, timer_wait, state,access_mode, autocommit, gtid, isolation_level
                           FROM performance_schema.events_transactions_current
                          WHERE thread_id = in_thread_id
                            AND end_event_id IS NULL)
                        UNION
                        (SELECT thread_id, event_id, timer_wait, state,access_mode, autocommit, gtid, isolation_level
                           FROM performance_schema.events_transactions_history
                          WHERE thread_id = in_thread_id)
                       ) AS trxi
                  LEFT JOIN (SELECT thread_id,
                                    nesting_event_id,
                                    GROUP_CONCAT(
                                      IFNULL(
                                        CONCAT('\n      {\n',
                                               '        "sql_text": "', IFNULL(sys.format_statement(REPLACE(sql_text, '\\', '\\\\')), ''), '",\n',
                                               '        "time": "', IFNULL(format_pico_time(timer_wait), ''), '",\n',
                                               '        "schema": "', IFNULL(current_schema, ''), '",\n',
                                               '        "rows_examined": ', IFNULL(rows_examined, ''), ',\n',
                                               '        "rows_affected": ', IFNULL(rows_affected, ''), ',\n',
                                               '        "rows_sent": ', IFNULL(rows_sent, ''), ',\n',
                                               '        "tmp_tables": ', IFNULL(created_tmp_tables, ''), ',\n',
                                               '        "tmp_disk_tables": ', IFNULL(created_tmp_disk_tables, ''), ',\n',
                                               '        "sort_rows": ', IFNULL(sort_rows, ''), ',\n',
                                               '        "sort_merge_passes": ', IFNULL(sort_merge_passes, ''), '\n',
                                               '      }'), '') ORDER BY event_id) AS stmts
                               FROM performance_schema.events_statements_history
                              WHERE sql_text IS NOT NULL
                                AND thread_id = in_thread_id
                              GROUP BY thread_id, nesting_event_id
                            ) AS s 
                    ON trxi.thread_id = s.thread_id 
                   AND trxi.event_id = s.nesting_event_id
                 WHERE trxi.thread_id = in_thread_id
                 GROUP BY trxi.thread_id, trxi.event_id
                ) trxs
          GROUP BY thread_id
    );
    IF (@old_group_concat_max_len IS NOT NULL) THEN
        SET SESSION group_concat_max_len = @old_group_concat_max_len;
    END IF;
    RETURN v_output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `quote_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `quote_identifier`(in_identifier TEXT) RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes an unquoted identifier (schema name, table name, etc.) and\nreturns the identifier quoted with backticks.\n\nParameters\n-----------\n\nin_identifier (TEXT):\n  The identifier to quote.\n\nReturns\n-----------\n\nTEXT CHARSET UTF8MB4\n\nExample\n-----------\n\nmysql> SELECT sys.quote_identifier(''my_identifier'') AS Identifier;\n+-----------------+\n| Identifier      |\n+-----------------+\n| `my_identifier` |\n+-----------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.quote_identifier(''my`idenfier'') AS Identifier;\n+----------------+\n| Identifier     |\n+----------------+\n| `my``idenfier` |\n+----------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN CONCAT('`', REPLACE(in_identifier, '`', '``'), '`');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sys_get_config` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `sys_get_config`(
        in_variable_name VARCHAR(128),
        in_default_value VARCHAR(128)
    ) RETURNS varchar(128) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the value for the requested variable using the following logic:\n\n   1. If the option exists in sys.sys_config return the value from there.\n   2. Else fall back on the provided default value.\n\nNotes for using sys_get_config():\n\n   * If the default value argument to sys_get_config() is NULL and case 2. is reached, NULL is returned.\n     It is then expected that the caller is able to handle NULL for the given configuration option.\n   * The convention is to name the user variables @sys.<name of variable>. It is <name of variable> that\n     is stored in the sys_config table and is what is expected as the argument to sys_get_config().\n   * If you want to check whether the configuration option has already been set and if not assign with\n     the return value of sys_get_config() you can use IFNULL(...) (see example below). However this should\n     not be done inside a loop (e.g. for each row in a result set) as for repeated calls where assignment\n     is only needed in the first iteration using IFNULL(...) is expected to be significantly slower than\n     using an IF (...) THEN ... END IF; block (see example below).\n\nParameters\n-----------\n\nin_variable_name (VARCHAR(128)):\n  The name of the config option to return the value for.\n\nin_default_value (VARCHAR(128)):\n  The default value to return if the variable does not exist in sys.sys_config.\n\nReturns\n-----------\n\nVARCHAR(128)\n\nExample\n-----------\n\n-- Get the configuration value from sys.sys_config falling back on 128 if the option is not present in the table.\nmysql> SELECT sys.sys_get_config(''statement_truncate_len'', 128) AS Value;\n+-------+\n| Value |\n+-------+\n| 64    |\n+-------+\n1 row in set (0.00 sec)\n\n-- Check whether the option is already set, if not assign - IFNULL(...) one liner example.\nmysql> SET @sys.statement_truncate_len = IFNULL(@sys.statement_truncate_len, sys.sys_get_config(''statement_truncate_len'', 64));\nQuery OK, 0 rows affected (0.00 sec)\n\n-- Check whether the option is already set, if not assign - IF ... THEN ... END IF example.\nIF (@sys.statement_truncate_len IS NULL) THEN\n    SET @sys.statement_truncate_len = sys.sys_get_config(''statement_truncate_len'', 64);\nEND IF;\n'
BEGIN
    DECLARE v_value VARCHAR(128) DEFAULT NULL;
    -- Check if we have the variable in the sys.sys_config table
    SET v_value = (SELECT value FROM sys.sys_config WHERE variable = in_variable_name);
    -- Protection against the variable not existing in sys_config
    IF (v_value IS NULL) THEN
        SET v_value = in_default_value;
    END IF;
    RETURN v_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `version_major` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_major`() RETURNS tinyint unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the major version of MySQL Server.\n\nReturns\n-----------\n\nTINYINT UNSIGNED\n\nExample\n-----------\n\nmysql> SELECT VERSION(), sys.version_major();\n+--------------------------------------+---------------------+\n| VERSION()                            | sys.version_major() |\n+--------------------------------------+---------------------+\n| 5.7.9-enterprise-commercial-advanced | 5                   |\n+--------------------------------------+---------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `version_minor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_minor`() RETURNS tinyint unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the minor (release series) version of MySQL Server.\n\nReturns\n-----------\n\nTINYINT UNSIGNED\n\nExample\n-----------\n\nmysql> SELECT VERSION(), sys.server_minor();\n+--------------------------------------+---------------------+\n| VERSION()                            | sys.version_minor() |\n+--------------------------------------+---------------------+\n| 5.7.9-enterprise-commercial-advanced | 7                   |\n+--------------------------------------+---------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', 2), '.', -1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `version_patch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_patch`() RETURNS tinyint unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the patch release version of MySQL Server.\n\nReturns\n-----------\n\nTINYINT UNSIGNED\n\nExample\n-----------\n\nmysql> SELECT VERSION(), sys.version_patch();\n+--------------------------------------+---------------------+\n| VERSION()                            | sys.version_patch() |\n+--------------------------------------+---------------------+\n| 5.7.9-enterprise-commercial-advanced | 9                   |\n+--------------------------------------+---------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', -1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_synonym_db` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `create_synonym_db`(
        IN in_db_name VARCHAR(64), 
        IN in_synonym VARCHAR(64)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a source database name and synonym name, and then creates the \nsynonym database with views that point to all of the tables within\nthe source database.\n\nUseful for creating a "ps" synonym for "performance_schema",\nor "is" instead of "information_schema", for example.\n\nParameters\n-----------\n\nin_db_name (VARCHAR(64)):\n  The database name that you would like to create a synonym for.\nin_synonym (VARCHAR(64)):\n  The database synonym name.\n\nExample\n-----------\n\nmysql> SHOW DATABASES;\n+--------------------+\n| Database           |\n+--------------------+\n| information_schema |\n| mysql              |\n| performance_schema |\n| sys                |\n| test               |\n+--------------------+\n5 rows in set (0.00 sec)\n\nmysql> CALL sys.create_synonym_db(''performance_schema'', ''ps'');\n+---------------------------------------+\n| summary                               |\n+---------------------------------------+\n| Created 74 views in the `ps` database |\n+---------------------------------------+\n1 row in set (8.57 sec)\n\nQuery OK, 0 rows affected (8.57 sec)\n\nmysql> SHOW DATABASES;\n+--------------------+\n| Database           |\n+--------------------+\n| information_schema |\n| mysql              |\n| performance_schema |\n| ps                 |\n| sys                |\n| test               |\n+--------------------+\n6 rows in set (0.00 sec)\n\nmysql> SHOW FULL TABLES FROM ps;\n+------------------------------------------------------+------------+\n| Tables_in_ps                                         | Table_type |\n+------------------------------------------------------+------------+\n| accounts                                             | VIEW       |\n| cond_instances                                       | VIEW       |\n| events_stages_current                                | VIEW       |\n| events_stages_history                                | VIEW       |\n...\n'
BEGIN
    DECLARE v_done bool DEFAULT FALSE;
    DECLARE v_db_name_check VARCHAR(64);
    DECLARE v_db_err_msg TEXT;
    DECLARE v_table VARCHAR(64);
    DECLARE v_views_created INT DEFAULT 0;
    DECLARE db_doesnt_exist CONDITION FOR SQLSTATE '42000';
    DECLARE db_name_exists CONDITION FOR SQLSTATE 'HY000';
    DECLARE c_table_names CURSOR FOR 
        SELECT TABLE_NAME 
          FROM INFORMATION_SCHEMA.TABLES 
         WHERE TABLE_SCHEMA = in_db_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    -- Check if the source database exists
    SELECT SCHEMA_NAME INTO v_db_name_check
      FROM INFORMATION_SCHEMA.SCHEMATA
     WHERE SCHEMA_NAME = in_db_name;
    IF v_db_name_check IS NULL THEN
        SET v_db_err_msg = CONCAT('Unknown database ', in_db_name);
        SIGNAL SQLSTATE 'HY000'
            SET MESSAGE_TEXT = v_db_err_msg;
    END IF;
    -- Check if a database of the synonym name already exists
    SELECT SCHEMA_NAME INTO v_db_name_check
      FROM INFORMATION_SCHEMA.SCHEMATA
     WHERE SCHEMA_NAME = in_synonym;
    IF v_db_name_check = in_synonym THEN
        SET v_db_err_msg = CONCAT('Can\'t create database ', in_synonym, '; database exists');
        SIGNAL SQLSTATE 'HY000'
            SET MESSAGE_TEXT = v_db_err_msg;
    END IF;
    -- All good, create the database and views
    SET @create_db_stmt := CONCAT('CREATE DATABASE ', sys.quote_identifier(in_synonym));
    PREPARE create_db_stmt FROM @create_db_stmt;
    EXECUTE create_db_stmt;
    DEALLOCATE PREPARE create_db_stmt;
    SET v_done = FALSE;
    OPEN c_table_names;
    c_table_names: LOOP
        FETCH c_table_names INTO v_table;
        IF v_done THEN
            LEAVE c_table_names;
        END IF;
        SET @create_view_stmt = CONCAT(
            'CREATE SQL SECURITY INVOKER VIEW ',
            sys.quote_identifier(in_synonym),
            '.',
            sys.quote_identifier(v_table),
            ' AS SELECT * FROM ',
            sys.quote_identifier(in_db_name),
            '.',
            sys.quote_identifier(v_table)
        );
        PREPARE create_view_stmt FROM @create_view_stmt;
        EXECUTE create_view_stmt;
        DEALLOCATE PREPARE create_view_stmt;
        SET v_views_created = v_views_created + 1;
    END LOOP;
    CLOSE c_table_names;
    SELECT CONCAT(
        'Created ', v_views_created, ' view',
        IF(v_views_created != 1, 's', ''), ' in the ',
        sys.quote_identifier(in_synonym), ' database'
    ) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diagnostics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `diagnostics`(
        IN in_max_runtime int unsigned, IN in_interval int unsigned,
        IN in_auto_config enum ('current', 'medium', 'full')
    )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nCreate a report of the current status of the server for diagnostics purposes. Data collected includes (some items depends on versions and settings):\n\n   * The GLOBAL VARIABLES\n   * Several sys schema views including metrics or equivalent (depending on version and settings)\n   * Queries in the 95th percentile\n   * Several ndbinfo views for MySQL Cluster\n   * Replication (both master and slave) information.\n\nSome of the sys schema views are calculated as initial (optional), overall, delta:\n\n   * The initial view is the content of the view at the start of this procedure.\n     This output will be the same as the the start values used for the delta view.\n     The initial view is included if @sys.diagnostics.include_raw = ''ON''.\n   * The overall view is the content of the view at the end of this procedure.\n     This output is the same as the end values used for the delta view.\n     The overall view is always included.\n   * The delta view is the difference from the beginning to the end. Note that for min and max values\n     they are simply the min or max value from the end view respectively, so does not necessarily reflect\n     the minimum/maximum value in the monitored period.\n     Note: except for the metrics views the delta is only calculation between the first and last outputs.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_max_runtime (INT UNSIGNED):\n  The maximum time to keep collecting data.\n  Use NULL to get the default which is 60 seconds, otherwise enter a value greater than 0.\nin_interval (INT UNSIGNED):\n  How long to sleep between data collections.\n  Use NULL to get the default which is 30 seconds, otherwise enter a value greater than 0.\nin_auto_config (ENUM(''current'', ''medium'', ''full''))\n  Automatically enable Performance Schema instruments and consumers.\n  NOTE: The more that are enabled, the more impact on the performance.\n  Supported values are:\n     * current - use the current settings.\n     * medium - enable some settings. This requires the SUPER privilege.\n     * full - enables all settings. This will have a big impact on the\n              performance - be careful using this option. This requires\n              the SUPER privilege.\n  If another setting the ''current'' is chosen, the current settings\n  are restored at the end of the procedure.\n\n\nConfiguration Options\n----------------------\n\nsys.diagnostics.allow_i_s_tables\n  Specifies whether it is allowed to do table scan queries on information_schema.TABLES. This can be expensive if there\n  are many tables. Set to ''ON'' to allow, ''OFF'' to not allow.\n  Default is ''OFF''.\n\nsys.diagnostics.include_raw\n  Set to ''ON'' to include the raw data (e.g. the original output of "SELECT * FROM sys.metrics").\n  Use this to get the initial values of the various views.\n  Default is ''OFF''.\n\nsys.statement_truncate_len\n  How much of queries in the process list output to include.\n  Default is 64.\n\nsys.debug\n  Whether to provide debugging output.\n  Default is ''OFF''. Set to ''ON'' to include.\n\n\nExample\n--------\n\nTo create a report and append it to the file diag.out:\n\nmysql> TEE diag.out;\nmysql> CALL sys.diagnostics(120, 30, ''current'');\n...\nmysql> NOTEE;\n'
BEGIN
    DECLARE v_start, v_runtime, v_iter_start, v_sleep DECIMAL(20,2) DEFAULT 0.0;
    DECLARE v_has_innodb, v_has_ndb, v_has_ps, v_has_replication, v_has_ps_replication VARCHAR(8) CHARSET utf8mb4 DEFAULT 'NO';
    DECLARE v_this_thread_enabled  ENUM('YES', 'NO');
    DECLARE v_table_name, v_banner VARCHAR(64) CHARSET utf8mb4;
    DECLARE v_sql_status_summary_select, v_sql_status_summary_delta, v_sql_status_summary_from, v_no_delta_names TEXT;
    DECLARE v_output_time, v_output_time_prev DECIMAL(20,3) UNSIGNED;
    DECLARE v_output_count, v_count, v_old_group_concat_max_len INT UNSIGNED DEFAULT 0;
    -- The width of each of the status outputs in the summery
    DECLARE v_status_summary_width TINYINT UNSIGNED DEFAULT 50;
    DECLARE v_done BOOLEAN DEFAULT FALSE;
    -- Do not include the following ndbinfo views:
    --    'blocks'                    Static
    --    'config_params'             Static
    --    'dict_obj_types'            Static
    --    'disk_write_speed_base'     Can generate lots of output - only include aggregate views here
    --    'memory_per_fragment'       Can generate lots of output
    --    'memoryusage'               Handled separately
    --    'operations_per_fragment'   Can generate lots of output
    --    'threadblocks'              Only needed once
    DECLARE c_ndbinfo CURSOR FOR
        SELECT TABLE_NAME
          FROM information_schema.TABLES
         WHERE TABLE_SCHEMA = 'ndbinfo'
               AND TABLE_NAME NOT IN (
                  'blocks',
                  'config_params',
                  'dict_obj_types',
                  'disk_write_speed_base',
                  'memory_per_fragment',
                  'memoryusage',
                  'operations_per_fragment',
                  'threadblocks'
               );
    DECLARE c_sysviews_w_delta CURSOR FOR
        SELECT table_name
          FROM tmp_sys_views_delta
         ORDER BY table_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    -- Do not track the current thread - no reason to clutter the output
    SELECT INSTRUMENTED INTO v_this_thread_enabled FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    END IF;
    -- Check options are sane
    IF (in_max_runtime < in_interval) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_max_runtime must be greater than or equal to in_interval';
    END IF;
    IF (in_max_runtime = 0) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_max_runtime must be greater than 0';
    END IF;
    IF (in_interval = 0) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_interval must be greater than 0';
    END IF;
    -- Set configuration options
    IF (@sys.diagnostics.allow_i_s_tables IS NULL) THEN
        SET @sys.diagnostics.allow_i_s_tables = sys.sys_get_config('diagnostics.allow_i_s_tables', 'OFF');
    END IF;
    IF (@sys.diagnostics.include_raw IS NULL) THEN
        SET @sys.diagnostics.include_raw      = sys.sys_get_config('diagnostics.include_raw'     , 'OFF');
    END IF;
    IF (@sys.debug IS NULL) THEN
        SET @sys.debug                        = sys.sys_get_config('debug'                       , 'OFF');
    END IF;
    IF (@sys.statement_truncate_len IS NULL) THEN
        SET @sys.statement_truncate_len       = sys.sys_get_config('statement_truncate_len'      , '64' );
    END IF;
    -- Temporary table are used - disable sql_log_bin if necessary to prevent them replicating
    SET @log_bin := @@sql_log_bin;
    IF (@log_bin = 1) THEN
        SET sql_log_bin = 0;
    END IF;
    -- Some metrics variables doesn't make sense in delta and rate calculations even if they are numeric
    -- as they really are more like settings or "current" status.
    SET v_no_delta_names = CONCAT('s%{COUNT}.Variable_name NOT IN (',
        '''innodb_buffer_pool_pages_total'', ',
        '''innodb_page_size'', ',
        '''last_query_cost'', ',
        '''last_query_partial_plans'', ',
        '''qcache_total_blocks'', ',
        '''slave_last_heartbeat'', ',
        '''ssl_ctx_verify_depth'', ',
        '''ssl_ctx_verify_mode'', ',
        '''ssl_session_cache_size'', ',
        '''ssl_verify_depth'', ',
        '''ssl_verify_mode'', ',
        '''ssl_version'', ',
        '''buffer_flush_lsn_avg_rate'', ',
        '''buffer_flush_pct_for_dirty'', ',
        '''buffer_flush_pct_for_lsn'', ',
        '''buffer_pool_pages_total'', ',
        '''lock_row_lock_time_avg'', ',
        '''lock_row_lock_time_max'', ',
        '''innodb_page_size''',
    ')');
    IF (in_auto_config <> 'current') THEN
        IF (@sys.debug = 'ON') THEN
            SELECT CONCAT('Updating Performance Schema configuration to ', in_auto_config) AS 'Debug';
        END IF;
        CALL sys.ps_setup_save(0);
        IF (in_auto_config = 'medium') THEN
            -- Enable all consumers except %history and %history_long
            UPDATE performance_schema.setup_consumers
                SET ENABLED = 'YES'
            WHERE NAME NOT LIKE '%\_history%';
            -- Enable all instruments except wait/synch/%
            UPDATE performance_schema.setup_instruments
                SET ENABLED = 'YES',
                    TIMED   = 'YES'
            WHERE NAME NOT LIKE 'wait/synch/%';
        ELSEIF (in_auto_config = 'full') THEN
            UPDATE performance_schema.setup_consumers
                SET ENABLED = 'YES';
            UPDATE performance_schema.setup_instruments
                SET ENABLED = 'YES',
                    TIMED   = 'YES';
        END IF;
        -- Enable all threads except this one
        UPDATE performance_schema.threads
           SET INSTRUMENTED = 'YES'
         WHERE PROCESSLIST_ID <> CONNECTION_ID();
    END IF;
    SET v_start        = UNIX_TIMESTAMP(NOW(2)),
        in_interval    = IFNULL(in_interval, 30),
        in_max_runtime = IFNULL(in_max_runtime, 60);
    -- Get a quick ref with hostname, server UUID, and the time for the report.
    SET v_banner = REPEAT(
                      '-',
                      LEAST(
                         GREATEST(
                            36,
                            CHAR_LENGTH(VERSION()),
                            CHAR_LENGTH(@@global.version_comment),
                            CHAR_LENGTH(@@global.version_compile_os),
                            CHAR_LENGTH(@@global.version_compile_machine),
                            CHAR_LENGTH(@@global.socket),
                            CHAR_LENGTH(@@global.datadir)
                         ),
                         64
                      )
                   );
    SELECT 'Hostname' AS 'Name', @@global.hostname AS 'Value'
    UNION ALL
    SELECT 'Port' AS 'Name', @@global.port AS 'Value'
    UNION ALL
    SELECT 'Socket' AS 'Name', @@global.socket AS 'Value'
    UNION ALL
    SELECT 'Datadir' AS 'Name', @@global.datadir AS 'Value'
    UNION ALL
    SELECT 'Server UUID' AS 'Name', @@global.server_uuid AS 'Value'
    UNION ALL
    SELECT REPEAT('-', 23) AS 'Name', v_banner AS 'Value'
    UNION ALL
    SELECT 'MySQL Version' AS 'Name', VERSION() AS 'Value'
    UNION ALL
    SELECT 'Sys Schema Version' AS 'Name', (SELECT sys_version FROM sys.version) AS 'Value'
    UNION ALL
    SELECT 'Version Comment' AS 'Name', @@global.version_comment AS 'Value'
    UNION ALL
    SELECT 'Version Compile OS' AS 'Name', @@global.version_compile_os AS 'Value'
    UNION ALL
    SELECT 'Version Compile Machine' AS 'Name', @@global.version_compile_machine AS 'Value'
    UNION ALL
    SELECT REPEAT('-', 23) AS 'Name', v_banner AS 'Value'
    UNION ALL
    SELECT 'UTC Time' AS 'Name', UTC_TIMESTAMP() AS 'Value'
    UNION ALL
    SELECT 'Local Time' AS 'Name', NOW() AS 'Value'
    UNION ALL
    SELECT 'Time Zone' AS 'Name', @@global.time_zone AS 'Value'
    UNION ALL
    SELECT 'System Time Zone' AS 'Name', @@global.system_time_zone AS 'Value'
    UNION ALL
    SELECT 'Time Zone Offset' AS 'Name', TIMEDIFF(NOW(), UTC_TIMESTAMP()) AS 'Value';
    -- Are the InnoDB, NDBCluster, and Performance Schema storage engines present?
    SET v_has_innodb         = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'InnoDB'), 'NO'),
        v_has_ndb            = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'NDBCluster'), 'NO'),
        v_has_ps             = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'PERFORMANCE_SCHEMA'), 'NO'),
        v_has_ps_replication = v_has_ps,
        v_has_replication    = IF(v_has_ps_replication = 'YES', IF((SELECT COUNT(*) FROM performance_schema.replication_connection_status) > 0, 'YES', 'NO'),
                                  IF(@@master_info_repository = 'TABLE', IF((SELECT COUNT(*) FROM mysql.slave_master_info) > 0, 'YES', 'NO'),
                                     IF(@@relay_log_info_repository = 'TABLE', IF((SELECT COUNT(*) FROM mysql.slave_relay_log_info) > 0, 'YES', 'NO'),
                                        'MAYBE')));
    IF (@sys.debug = 'ON') THEN
       SELECT v_has_innodb AS 'Has_InnoDB', v_has_ndb AS 'Has_NDBCluster',
              v_has_ps AS 'Has_Performance_Schema',
              v_has_ps_replication 'AS Has_P_S_Replication', v_has_replication AS 'Has_Replication';
    END IF;
    IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN
        -- Need to use prepared statement as just having the query as a plain command
        -- will generate an error if the InnoDB storage engine is not present
        SET @sys.diagnostics.sql = 'SHOW ENGINE InnoDB STATUS';
        PREPARE stmt_innodb_status FROM @sys.diagnostics.sql;
    END IF;
    IF (v_has_ps = 'YES') THEN
        -- Need to use prepared statement as just having the query as a plain command
        -- will generate an error if the InnoDB storage engine is not present
        SET @sys.diagnostics.sql = 'SHOW ENGINE PERFORMANCE_SCHEMA STATUS';
        PREPARE stmt_ps_status FROM @sys.diagnostics.sql;
    END IF;
    IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
        -- Need to use prepared statement as just having the query as a plain command
        -- will generate an error if the NDBCluster storage engine is not present
        SET @sys.diagnostics.sql = 'SHOW ENGINE NDBCLUSTER STATUS';
        PREPARE stmt_ndbcluster_status FROM @sys.diagnostics.sql;
    END IF;
    SET @sys.diagnostics.sql_gen_query_template = 'SELECT CONCAT(
           ''SELECT '',
           GROUP_CONCAT(
               CASE WHEN (SUBSTRING(TABLE_NAME, 3), COLUMN_NAME) IN (
                                (''io_global_by_file_by_bytes'', ''total''),
                                (''io_global_by_wait_by_bytes'', ''total_requested'')
                         )
                         THEN CONCAT(''format_bytes('', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME LIKE ''%latency''
                         THEN CONCAT(''format_pico_time('', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, -7) = ''_memory'' OR SUBSTRING(COLUMN_NAME, -17) = ''_memory_allocated''
                         OR ((SUBSTRING(COLUMN_NAME, -5) = ''_read'' OR SUBSTRING(COLUMN_NAME, -8) = ''_written'' OR SUBSTRING(COLUMN_NAME, -6) = ''_write'') AND SUBSTRING(COLUMN_NAME, 1, 6) <> ''COUNT_'')
                         THEN CONCAT(''format_bytes('', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    ELSE COLUMN_NAME
               END
               ORDER BY ORDINAL_POSITION
               SEPARATOR '',\n       ''
           ),
           ''\n  FROM tmp_'', SUBSTRING(TABLE_NAME FROM 3), ''_%{OUTPUT}''
       ) AS Query INTO @sys.diagnostics.sql_select
  FROM information_schema.COLUMNS
 WHERE TABLE_SCHEMA = ''sys'' AND TABLE_NAME = ?
 GROUP BY TABLE_NAME';
    SET @sys.diagnostics.sql_gen_query_delta = 'SELECT CONCAT(
           ''SELECT '',
           GROUP_CONCAT(
               CASE WHEN FIND_IN_SET(COLUMN_NAME COLLATE utf8_general_ci, diag.pk)
                         THEN COLUMN_NAME
                    WHEN diag.TABLE_NAME = ''io_global_by_file_by_bytes'' AND COLUMN_NAME COLLATE utf8_general_ci = ''write_pct''
                         THEN CONCAT(''IFNULL(ROUND(100-(((e.total_read-IFNULL(s.total_read, 0))'',
                                     ''/NULLIF(((e.total_read-IFNULL(s.total_read, 0))+(e.total_written-IFNULL(s.total_written, 0))), 0))*100), 2), 0.00) AS '',
                                     COLUMN_NAME)
                    WHEN (diag.TABLE_NAME, COLUMN_NAME) IN (
                                (''io_global_by_file_by_bytes'', ''total''),
                                (''io_global_by_wait_by_bytes'', ''total_requested'')
                         )
                         THEN CONCAT(''format_bytes(e.'', COLUMN_NAME, ''-IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, 1, 4) IN (''max_'', ''min_'') AND SUBSTRING(COLUMN_NAME, -8) = ''_latency''
                         THEN CONCAT(''format_pico_time(e.'', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME COLLATE utf8_general_ci = ''avg_latency''
                         THEN CONCAT(''format_pico_time((e.total_latency - IFNULL(s.total_latency, 0))'',
                                     ''/NULLIF(e.total - IFNULL(s.total, 0), 0)) AS '', COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, -12) = ''_avg_latency''
                         THEN CONCAT(''format_pico_time((e.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''_latency - IFNULL(s.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''_latency, 0))'',
                                     ''/NULLIF(e.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''s - IFNULL(s.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''s, 0), 0)) AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME LIKE ''%latency''
                         THEN CONCAT(''format_pico_time(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME IN (''avg_read'', ''avg_write'', ''avg_written'')
                         THEN CONCAT(''format_bytes(IFNULL((e.total_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''written''), ''-IFNULL(s.total_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''written''), '', 0))'',
                                     ''/NULLIF(e.count_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''write''), ''-IFNULL(s.count_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''write''), '', 0), 0), 0)) AS '',
                                     COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, -7) = ''_memory'' OR SUBSTRING(COLUMN_NAME, -17) = ''_memory_allocated''
                         OR ((SUBSTRING(COLUMN_NAME, -5) = ''_read'' OR SUBSTRING(COLUMN_NAME, -8) = ''_written'' OR SUBSTRING(COLUMN_NAME, -6) = ''_write'') AND SUBSTRING(COLUMN_NAME, 1, 6) <> ''COUNT_'')
                         THEN CONCAT(''format_bytes(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
                    ELSE CONCAT(''(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
               END
               ORDER BY ORDINAL_POSITION
               SEPARATOR '',\n       ''
           ),
           ''\n  FROM tmp_'', diag.TABLE_NAME, ''_end e
       LEFT OUTER JOIN tmp_'', diag.TABLE_NAME, ''_start s USING ('', diag.pk, '')''
       ) AS Query INTO @sys.diagnostics.sql_select
  FROM tmp_sys_views_delta diag
       INNER JOIN information_schema.COLUMNS c ON c.TABLE_NAME COLLATE utf8_general_ci = CONCAT(''x$'', diag.TABLE_NAME)
 WHERE c.TABLE_SCHEMA = ''sys'' AND diag.TABLE_NAME = ?
 GROUP BY diag.TABLE_NAME';
    IF (v_has_ps = 'YES') THEN
        -- Create temporary table with the ORDER BY clauses. Will be required both for the initial (if included) and end queries
        DROP TEMPORARY TABLE IF EXISTS tmp_sys_views_delta;
        CREATE TEMPORARY TABLE tmp_sys_views_delta (
            TABLE_NAME varchar(64) NOT NULL,
            order_by text COMMENT 'ORDER BY clause for the initial and overall views',
            order_by_delta text COMMENT 'ORDER BY clause for the delta views',
            where_delta text COMMENT 'WHERE clause to use for delta views to only include rows with a "count" > 0',
            limit_rows int unsigned COMMENT 'The maximum number of rows to include for the view',
            pk varchar(128) COMMENT 'Used with the FIND_IN_SET() function so use comma separated list without whitespace',
            PRIMARY KEY (TABLE_NAME)
        );
        -- %{OUTPUT} will be replace by the suffix used for the output.
        IF (@sys.debug = 'ON') THEN
            SELECT 'Populating tmp_sys_views_delta' AS 'Debug';
        END IF;
        INSERT INTO tmp_sys_views_delta
        VALUES ('host_summary'                       , '%{TABLE}.statement_latency DESC',
                                                       '(e.statement_latency-IFNULL(s.statement_latency, 0)) DESC',
                                                       '(e.statements - IFNULL(s.statements, 0)) > 0', NULL, 'host'),
               ('host_summary_by_file_io'            , '%{TABLE}.io_latency DESC',
                                                       '(e.io_latency-IFNULL(s.io_latency, 0)) DESC',
                                                       '(e.ios - IFNULL(s.ios, 0)) > 0', NULL, 'host'),
               ('host_summary_by_file_io_type'       , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event_name'),
               ('host_summary_by_stages'             , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event_name'),
               ('host_summary_by_statement_latency'  , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host'),
               ('host_summary_by_statement_type'     , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,statement'),
               ('io_by_thread_by_latency'            , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,thread_id,processlist_id'),
               ('io_global_by_file_by_bytes'         , '%{TABLE}.total DESC',
                                                       '(e.total-IFNULL(s.total, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', 100, 'file'),
               ('io_global_by_file_by_latency'       , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', 100, 'file'),
               ('io_global_by_wait_by_bytes'         , '%{TABLE}.total_requested DESC',
                                                       '(e.total_requested-IFNULL(s.total_requested, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_name'),
               ('io_global_by_wait_by_latency'       , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_name'),
               ('schema_index_statistics'            , '(%{TABLE}.select_latency+%{TABLE}.insert_latency+%{TABLE}.update_latency+%{TABLE}.delete_latency) DESC',
                                                       '((e.select_latency+e.insert_latency+e.update_latency+e.delete_latency)-IFNULL(s.select_latency+s.insert_latency+s.update_latency+s.delete_latency, 0)) DESC',
                                                       '((e.rows_selected+e.insert_latency+e.rows_updated+e.rows_deleted)-IFNULL(s.rows_selected+s.rows_inserted+s.rows_updated+s.rows_deleted, 0)) > 0',
                                                       100, 'table_schema,table_name,index_name'),
               ('schema_table_statistics'            , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) > 0', 100, 'table_schema,table_name'),
               ('schema_tables_with_full_table_scans', '%{TABLE}.rows_full_scanned DESC',
                                                       '(e.rows_full_scanned-IFNULL(s.rows_full_scanned, 0)) DESC',
                                                       '(e.rows_full_scanned-IFNULL(s.rows_full_scanned, 0)) > 0', 100, 'object_schema,object_name'),
               ('user_summary'                       , '%{TABLE}.statement_latency DESC',
                                                       '(e.statement_latency-IFNULL(s.statement_latency, 0)) DESC',
                                                       '(e.statements - IFNULL(s.statements, 0)) > 0', NULL, 'user'),
               ('user_summary_by_file_io'            , '%{TABLE}.io_latency DESC',
                                                       '(e.io_latency-IFNULL(s.io_latency, 0)) DESC',
                                                       '(e.ios - IFNULL(s.ios, 0)) > 0', NULL, 'user'),
               ('user_summary_by_file_io_type'       , '%{TABLE}.user, %{TABLE}.latency DESC',
                                                       'e.user, (e.latency-IFNULL(s.latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event_name'),
               ('user_summary_by_stages'             , '%{TABLE}.user, %{TABLE}.total_latency DESC',
                                                       'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event_name'),
               ('user_summary_by_statement_latency'  , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user'),
               ('user_summary_by_statement_type'     , '%{TABLE}.user, %{TABLE}.total_latency DESC',
                                                       'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,statement'),
               ('wait_classes_global_by_avg_latency' , 'IFNULL(%{TABLE}.total_latency / NULLIF(%{TABLE}.total, 0), 0) DESC',
                                                       'IFNULL((e.total_latency-IFNULL(s.total_latency, 0)) / NULLIF((e.total - IFNULL(s.total, 0)), 0), 0) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_class'),
               ('wait_classes_global_by_latency'     , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_class'),
               ('waits_by_host_by_latency'           , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event'),
               ('waits_by_user_by_latency'           , '%{TABLE}.user, %{TABLE}.total_latency DESC',
                                                       'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event'),
               ('waits_global_by_latency'            , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'events')
        ;
    END IF;
    SELECT '

=======================

     Configuration

=======================

' AS '';
    -- Get the configuration.
    SELECT 'GLOBAL VARIABLES' AS 'The following output is:';
    SELECT LOWER(VARIABLE_NAME) AS Variable_name, VARIABLE_VALUE AS Variable_value FROM performance_schema.global_variables ORDER BY VARIABLE_NAME;
    IF (v_has_ps = 'YES') THEN
        -- Overview of the Performance Schema dynamic settings used for this report.
        SELECT 'Performance Schema Setup - Actors' AS 'The following output is:';
        SELECT * FROM performance_schema.setup_actors;
        SELECT 'Performance Schema Setup - Consumers' AS 'The following output is:';
        SELECT NAME AS Consumer, ENABLED, sys.ps_is_consumer_enabled(NAME) AS COLLECTS
          FROM performance_schema.setup_consumers;
        SELECT 'Performance Schema Setup - Instruments' AS 'The following output is:';
        SELECT SUBSTRING_INDEX(NAME, '/', 2) AS 'InstrumentClass',
               ROUND(100*SUM(IF(ENABLED = 'YES', 1, 0))/COUNT(*), 2) AS 'EnabledPct',
               ROUND(100*SUM(IF(TIMED = 'YES', 1, 0))/COUNT(*), 2) AS 'TimedPct'
          FROM performance_schema.setup_instruments
         GROUP BY SUBSTRING_INDEX(NAME, '/', 2)
         ORDER BY SUBSTRING_INDEX(NAME, '/', 2);
        SELECT 'Performance Schema Setup - Objects' AS 'The following output is:';
        SELECT * FROM performance_schema.setup_objects;
        SELECT 'Performance Schema Setup - Threads' AS 'The following output is:';
        SELECT `TYPE` AS ThreadType, COUNT(*) AS 'Total', ROUND(100*SUM(IF(INSTRUMENTED = 'YES', 1, 0))/COUNT(*), 2) AS 'InstrumentedPct'
          FROM performance_schema.threads
        GROUP BY TYPE;
    END IF;
    IF (v_has_replication = 'NO') THEN
        SELECT 'No Replication Configured' AS 'Replication Status';
    ELSE
        -- No guarantee that replication is actually configured, but we can't really know
        SELECT CONCAT('Replication Configured: ', v_has_replication, ' - Performance Schema Replication Tables: ', v_has_ps_replication) AS 'Replication Status';
        IF (v_has_ps_replication = 'YES') THEN
            SELECT 'Replication - Connection Configuration' AS 'The following output is:';
            SELECT * FROM performance_schema.replication_connection_configuration ORDER BY CHANNEL_NAME;
        END IF;
        IF (v_has_ps_replication = 'YES') THEN
            SELECT 'Replication - Applier Configuration' AS 'The following output is:';
            SELECT * FROM performance_schema.replication_applier_configuration ORDER BY CHANNEL_NAME;
        END IF;
        IF (@@master_info_repository = 'TABLE') THEN
            SELECT 'Replication - Master Info Repository Configuration' AS 'The following output is:';
            -- Can't just do SELECT *  as the password may be present in plain text
            -- Don't include binary log file and position as that will be determined in each iteration as well
            SELECT Channel_name, Host, User_name, Port, Connect_retry,
                   Enabled_ssl, Ssl_ca, Ssl_capath, Ssl_cert, Ssl_cipher, Ssl_key, Ssl_verify_server_cert,
                   Heartbeat, Bind, Ignored_server_ids, Uuid, Retry_count, Ssl_crl, Ssl_crlpath,
                   Tls_version, Enabled_auto_position
              FROM mysql.slave_master_info ORDER BY Channel_name;
        END IF;
        IF (@@relay_log_info_repository = 'TABLE') THEN
            SELECT 'Replication - Relay Log Repository Configuration' AS 'The following output is:';
            SELECT Channel_name, Sql_delay, Number_of_workers, Id
              FROM mysql.slave_relay_log_info ORDER BY Channel_name;
        END IF;
    END IF;
    IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
       SELECT 'Cluster Thread Blocks' AS 'The following output is:';
       SELECT * FROM ndbinfo.threadblocks;
    END IF;
    -- For a number of sys views as well as events_statements_summary_by_digest,
    -- just get the start data and then at the end output the overall and delta values
    IF (v_has_ps = 'YES') THEN
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            SELECT '

========================

     Initial Status

========================

' AS '';
        END IF;
        DROP TEMPORARY TABLE IF EXISTS tmp_digests_start;
        CALL sys.statement_performance_analyzer('create_tmp', 'tmp_digests_start', NULL);
        CALL sys.statement_performance_analyzer('snapshot', NULL, NULL);
        CALL sys.statement_performance_analyzer('save', 'tmp_digests_start', NULL);
        -- Loop over the sys views where deltas should be calculated.
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            SET @sys.diagnostics.sql = REPLACE(@sys.diagnostics.sql_gen_query_template, '%{OUTPUT}', 'start');
            IF (@sys.debug = 'ON') THEN
                SELECT 'The following query will be used to generate the query for each sys view' AS 'Debug';
                SELECT @sys.diagnostics.sql AS 'Debug';
            END IF;
            PREPARE stmt_gen_query FROM @sys.diagnostics.sql;
        END IF;
        SET v_done = FALSE;
        OPEN c_sysviews_w_delta;
        c_sysviews_w_delta_loop: LOOP
            FETCH c_sysviews_w_delta INTO v_table_name;
            IF v_done THEN
                LEAVE c_sysviews_w_delta_loop;
            END IF;
            IF (@sys.debug = 'ON') THEN
                SELECT CONCAT('The following queries are for storing the initial content of ', v_table_name) AS 'Debug';
            END IF;
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS `tmp_', v_table_name, '_start`'));
            CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE `tmp_', v_table_name, '_start` SELECT * FROM `sys`.`x$', v_table_name, '`'));
            IF (@sys.diagnostics.include_raw = 'ON') THEN
                SET @sys.diagnostics.table_name = CONCAT('x$', v_table_name);
                EXECUTE stmt_gen_query USING @sys.diagnostics.table_name;
                -- If necessary add ORDER BY and LIMIT
                SELECT CONCAT(@sys.diagnostics.sql_select,
                              IF(order_by IS NOT NULL, CONCAT('\n ORDER BY ', REPLACE(order_by, '%{TABLE}', CONCAT('tmp_', v_table_name, '_start'))), ''),
                              IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '')
                       )
                  INTO @sys.diagnostics.sql_select
                  FROM tmp_sys_views_delta
                 WHERE TABLE_NAME COLLATE utf8mb4_0900_as_ci = v_table_name;
                SELECT CONCAT('Initial ', v_table_name) AS 'The following output is:';
                CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select);
            END IF;
        END LOOP;
        CLOSE c_sysviews_w_delta;
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            DEALLOCATE PREPARE stmt_gen_query;
        END IF;
    END IF;
    -- If in_include_status_summary is TRUE then a temporary table is required to store the data
    SET v_sql_status_summary_select = 'SELECT Variable_name',
        v_sql_status_summary_delta  = '',
        v_sql_status_summary_from   = '';
    -- Start the loop
    REPEAT
        SET v_output_count = v_output_count + 1;
        IF (v_output_count > 1) THEN
            -- Don't sleep on the first execution
            SET v_sleep = in_interval-(UNIX_TIMESTAMP(NOW(2))-v_iter_start);
            SELECT NOW() AS 'Time', CONCAT('Going to sleep for ', v_sleep, ' seconds. Please do not interrupt') AS 'The following output is:';
            DO SLEEP(in_interval);
        END IF;
        SET v_iter_start = UNIX_TIMESTAMP(NOW(2));
        SELECT NOW(), CONCAT('Iteration Number ', IFNULL(v_output_count, 'NULL')) AS 'The following output is:';
        -- Even in 5.7 there is no way to get all the info from SHOW MASTER|SLAVE STATUS using the Performance Schema or
        -- other tables, so include them even though they are no longer optimal solutions and if present get the additional
        -- information from the other tables available.
        IF (@@log_bin = 1) THEN
            SELECT 'SHOW MASTER STATUS' AS 'The following output is:';
            SHOW MASTER STATUS;
        END IF;
        IF (v_has_replication <> 'NO') THEN
            SELECT 'SHOW SLAVE STATUS' AS 'The following output is:';
            SHOW SLAVE STATUS;
            IF (v_has_ps_replication = 'YES') THEN
                SELECT 'Replication Connection Status' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_connection_status;
                SELECT 'Replication Applier Status' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_applier_status ORDER BY CHANNEL_NAME;
                SELECT 'Replication Applier Status - Coordinator' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_applier_status_by_coordinator ORDER BY CHANNEL_NAME;
                SELECT 'Replication Applier Status - Worker' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_applier_status_by_worker ORDER BY CHANNEL_NAME, WORKER_ID;
            END IF;
            IF (@@master_info_repository = 'TABLE') THEN
                SELECT 'Replication - Master Log Status' AS 'The following output is:';
                SELECT Master_log_name, Master_log_pos FROM mysql.slave_master_info;
            END IF;
            IF (@@relay_log_info_repository = 'TABLE') THEN
                SELECT 'Replication - Relay Log Status' AS 'The following output is:';
                SELECT sys.format_path(Relay_log_name) AS Relay_log_name, Relay_log_pos, Master_log_name, Master_log_pos FROM mysql.slave_relay_log_info;
                SELECT 'Replication - Worker Status' AS 'The following output is:';
                SELECT Id, sys.format_path(Relay_log_name) AS Relay_log_name, Relay_log_pos, Master_log_name, Master_log_pos,
                       sys.format_path(Checkpoint_relay_log_name) AS Checkpoint_relay_log_name, Checkpoint_relay_log_pos,
                       Checkpoint_master_log_name, Checkpoint_master_log_pos, Checkpoint_seqno, Checkpoint_group_size,
                       HEX(Checkpoint_group_bitmap) AS Checkpoint_group_bitmap, Channel_name
                  FROM mysql.slave_worker_info
              ORDER BY Channel_name, Id;
            END IF;
        END IF;
        -- We need one table per output as a temporary table cannot be opened twice in the same query, and we need to
        -- join the outputs in the summary at the end.
        SET v_table_name = CONCAT('tmp_metrics_', v_output_count);
        CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS ', v_table_name));
        -- Currently information_schema.GLOBAL_STATUS has VARIABLE_VALUE as varchar(1024)
        CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE ', v_table_name, ' (
  Variable_name VARCHAR(193) NOT NULL,
  Variable_value VARCHAR(1024),
  Type VARCHAR(225) NOT NULL,
  Enabled ENUM(''YES'', ''NO'', ''PARTIAL'') NOT NULL,
  PRIMARY KEY (Type, Variable_name)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4'));
        SET @sys.diagnostics.sql = CONCAT(
            'INSERT INTO ', v_table_name,
            ' SELECT Variable_name, REPLACE(Variable_value, ''\n'', ''\\\\n'') AS Variable_value, Type, Enabled FROM sys.metrics'
        );
        CALL sys.execute_prepared_stmt(@sys.diagnostics.sql);
        -- Prepare the query to retrieve the summary
        CALL sys.execute_prepared_stmt(
            CONCAT('(SELECT Variable_value INTO @sys.diagnostics.output_time FROM ', v_table_name, ' WHERE Type = ''System Time'' AND Variable_name = ''UNIX_TIMESTAMP()'')')
        );
        SET v_output_time = @sys.diagnostics.output_time;
        -- Limit each value to v_status_summary_width chars (when v_has_ndb = TRUE the values can be very wide - refer to the output here for the full values)
        -- v_sql_status_summary_select, v_sql_status_summary_delta, v_sql_status_summary_from
        SET v_sql_status_summary_select = CONCAT(v_sql_status_summary_select, ',
       CONCAT(
           LEFT(s', v_output_count, '.Variable_value, ', v_status_summary_width, '),
           IF(', REPLACE(v_no_delta_names, '%{COUNT}', v_output_count), ' AND s', v_output_count, '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'', CONCAT('' ('', ROUND(s', v_output_count, '.Variable_value/', v_output_time, ', 2), ''/sec)''), '''')
       ) AS ''Output ', v_output_count, ''''),
            v_sql_status_summary_from   = CONCAT(v_sql_status_summary_from, '
',
                                                    IF(v_output_count = 1, '  FROM ', '       INNER JOIN '),
                                                    v_table_name, ' s', v_output_count,
                                                    IF (v_output_count = 1, '', ' USING (Type, Variable_name)'));
        IF (v_output_count > 1) THEN
            SET v_sql_status_summary_delta  = CONCAT(v_sql_status_summary_delta, ',
       IF(', REPLACE(v_no_delta_names, '%{COUNT}', v_output_count), ' AND s', (v_output_count-1), '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'' AND s', v_output_count, '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'',
          CONCAT(IF(s', (v_output_count-1), '.Variable_value REGEXP ''^[0-9]+\\\\.[0-9]+$'' OR s', v_output_count, '.Variable_value REGEXP ''^[0-9]+\\\\.[0-9]+$'',
                    ROUND((s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value), 2),
                    (s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value)
                   ),
                 '' ('', ROUND((s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value)/(', v_output_time, '-', v_output_time_prev, '), 2), ''/sec)''
          ),
          ''''
       ) AS ''Delta (', (v_output_count-1), ' -> ', v_output_count, ')''');
        END IF;
        SET v_output_time_prev = v_output_time;
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            SELECT 'SELECT * FROM sys.metrics' AS 'The following output is:';
            -- Ensures that the output here is the same as the one used in the status summary at the end
            CALL sys.execute_prepared_stmt(CONCAT('SELECT Type, Variable_name, Enabled, Variable_value FROM ', v_table_name, ' ORDER BY Type, Variable_name'));
        END IF;
        -- InnoDB
        IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN
            SELECT 'SHOW ENGINE INNODB STATUS' AS 'The following output is:';
            EXECUTE stmt_innodb_status;
            SELECT 'InnoDB - Transactions' AS 'The following output is:';
            SELECT * FROM information_schema.INNODB_TRX;
        END IF;
        -- NDBCluster
        IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
            SELECT 'SHOW ENGINE NDBCLUSTER STATUS' AS 'The following output is:';
            EXECUTE stmt_ndbcluster_status;
            SELECT 'ndbinfo.memoryusage' AS 'The following output is:';
            SELECT node_id, memory_type, format_bytes(used) AS used, used_pages, format_bytes(total) AS total, total_pages,
                   ROUND(100*(used/total), 2) AS 'Used %'
            FROM ndbinfo.memoryusage;
            -- Loop over the ndbinfo tables (except memoryusage which was handled separately above).
            -- The exact tables available are version dependent, so get the list from the Information Schema.
            SET v_done = FALSE;
            OPEN c_ndbinfo;
            c_ndbinfo_loop: LOOP
                FETCH c_ndbinfo INTO v_table_name;
                IF v_done THEN
                LEAVE c_ndbinfo_loop;
                END IF;
                SELECT CONCAT('SELECT * FROM ndbinfo.', v_table_name) AS 'The following output is:';
                CALL sys.execute_prepared_stmt(CONCAT('SELECT * FROM `ndbinfo`.`', v_table_name, '`'));
            END LOOP;
            CLOSE c_ndbinfo;
            SELECT * FROM information_schema.FILES;
        END IF;
        SELECT 'SELECT * FROM sys.processlist' AS 'The following output is:';
        SELECT processlist.* FROM sys.processlist;
        IF (v_has_ps = 'YES') THEN
            -- latest_file_io
            IF (sys.ps_is_consumer_enabled('events_waits_history_long') = 'YES') THEN
                SELECT 'SELECT * FROM sys.latest_file_io' AS 'The following output is:';
                SELECT * FROM sys.latest_file_io;
            END IF;
            -- current memory usage
            IF (EXISTS(SELECT 1 FROM performance_schema.setup_instruments WHERE NAME LIKE 'memory/%' AND ENABLED = 'YES')) THEN
                SELECT 'SELECT * FROM sys.memory_by_host_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_by_host_by_current_bytes;
                SELECT 'SELECT * FROM sys.memory_by_thread_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_by_thread_by_current_bytes;
                SELECT 'SELECT * FROM sys.memory_by_user_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_by_user_by_current_bytes;
                SELECT 'SELECT * FROM sys.memory_global_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_global_by_current_bytes;
            END IF;
        END IF;
        SET v_runtime = (UNIX_TIMESTAMP(NOW(2)) - v_start);
    UNTIL (v_runtime + in_interval >= in_max_runtime) END REPEAT;
    -- Get Performance Schema status
    IF (v_has_ps = 'YES') THEN
        SELECT 'SHOW ENGINE PERFORMANCE_SCHEMA STATUS' AS 'The following output is:';
        EXECUTE stmt_ps_status;
    END IF;
    -- Deallocate prepared statements
    IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN
        DEALLOCATE PREPARE stmt_innodb_status;
    END IF;
    IF (v_has_ps = 'YES') THEN
        DEALLOCATE PREPARE stmt_ps_status;
    END IF;
    IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
        DEALLOCATE PREPARE stmt_ndbcluster_status;
    END IF;
    SELECT '

============================

     Schema Information

============================

' AS '';
    SELECT COUNT(*) AS 'Total Number of Tables' FROM information_schema.TABLES;
    -- The cost of information_schema.TABLES.DATA_LENGTH depends mostly on the number of tables
    IF (@sys.diagnostics.allow_i_s_tables = 'ON') THEN
        SELECT 'Storage Engine Usage' AS 'The following output is:';
        SELECT ENGINE, COUNT(*) AS NUM_TABLES,
                format_bytes(SUM(DATA_LENGTH)) AS DATA_LENGTH,
                format_bytes(SUM(INDEX_LENGTH)) AS INDEX_LENGTH,
                format_bytes(SUM(DATA_LENGTH+INDEX_LENGTH)) AS TOTAL
            FROM information_schema.TABLES
            GROUP BY ENGINE;
        SELECT 'Schema Object Overview' AS 'The following output is:';
        SELECT * FROM sys.schema_object_overview;
        SELECT 'Tables without a PRIMARY KEY' AS 'The following output is:';
        SELECT TABLES.TABLE_SCHEMA, ENGINE, COUNT(*) AS NumTables
          FROM information_schema.TABLES
               LEFT OUTER JOIN information_schema.STATISTICS ON STATISTICS.TABLE_SCHEMA = TABLES.TABLE_SCHEMA
                                                                AND STATISTICS.TABLE_NAME = TABLES.TABLE_NAME
                                                                AND STATISTICS.INDEX_NAME = 'PRIMARY'
         WHERE STATISTICS.TABLE_NAME IS NULL
               AND TABLES.TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys')
               AND TABLES.TABLE_TYPE = 'BASE TABLE'
         GROUP BY TABLES.TABLE_SCHEMA, ENGINE;
    END IF;
    IF (v_has_ps = 'YES') THEN
        SELECT 'Unused Indexes' AS 'The following output is:';
        SELECT object_schema, COUNT(*) AS NumUnusedIndexes
          FROM performance_schema.table_io_waits_summary_by_index_usage
         WHERE index_name IS NOT NULL
               AND count_star = 0
               AND object_schema NOT IN ('mysql', 'sys')
               AND index_name != 'PRIMARY'
         GROUP BY object_schema;
    END IF;
    IF (v_has_ps = 'YES') THEN
        SELECT '

=========================

     Overall Status

=========================

' AS '';
        SELECT 'CALL sys.ps_statement_avg_latency_histogram()' AS 'The following output is:';
        CALL sys.ps_statement_avg_latency_histogram();
        CALL sys.statement_performance_analyzer('snapshot', NULL, NULL);
        CALL sys.statement_performance_analyzer('overall', NULL, 'with_runtimes_in_95th_percentile');
        SET @sys.diagnostics.sql = REPLACE(@sys.diagnostics.sql_gen_query_template, '%{OUTPUT}', 'end');
        IF (@sys.debug = 'ON') THEN
            SELECT 'The following query will be used to generate the query for each sys view' AS 'Debug';
            SELECT @sys.diagnostics.sql AS 'Debug';
        END IF;
        PREPARE stmt_gen_query FROM @sys.diagnostics.sql;
        SET v_done = FALSE;
        OPEN c_sysviews_w_delta;
        c_sysviews_w_delta_loop: LOOP
            FETCH c_sysviews_w_delta INTO v_table_name;
            IF v_done THEN
                LEAVE c_sysviews_w_delta_loop;
            END IF;
            IF (@sys.debug = 'ON') THEN
                SELECT CONCAT('The following queries are for storing the final content of ', v_table_name) AS 'Debug';
            END IF;
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS `tmp_', v_table_name, '_end`'));
            CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE `tmp_', v_table_name, '_end` SELECT * FROM `sys`.`x$', v_table_name, '`'));
            SET @sys.diagnostics.table_name = CONCAT('x$', v_table_name);
            EXECUTE stmt_gen_query USING @sys.diagnostics.table_name;
            -- If necessary add ORDER BY and LIMIT
            SELECT CONCAT(@sys.diagnostics.sql_select,
                            IF(order_by IS NOT NULL, CONCAT('\n ORDER BY ', REPLACE(order_by, '%{TABLE}', CONCAT('tmp_', v_table_name, '_end'))), ''),
                            IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '')
                    )
                INTO @sys.diagnostics.sql_select
                FROM tmp_sys_views_delta
                WHERE TABLE_NAME COLLATE utf8mb4_0900_as_ci = v_table_name;
            SELECT CONCAT('Overall ', v_table_name) AS 'The following output is:';
            CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select);
        END LOOP;
        CLOSE c_sysviews_w_delta;
        DEALLOCATE PREPARE stmt_gen_query;
        SELECT '

======================

     Delta Status

======================

' AS '';
        CALL sys.statement_performance_analyzer('delta', 'tmp_digests_start', 'with_runtimes_in_95th_percentile');
        CALL sys.statement_performance_analyzer('cleanup', NULL, NULL);
        DROP TEMPORARY TABLE tmp_digests_start;
        -- @sys.diagnostics.sql_gen_query_delta is defined near the to together with @sys.diagnostics.sql_gen_query_template
        IF (@sys.debug = 'ON') THEN
            SELECT 'The following query will be used to generate the query for each sys view delta' AS 'Debug';
            SELECT @sys.diagnostics.sql_gen_query_delta AS 'Debug';
        END IF;
        PREPARE stmt_gen_query_delta FROM @sys.diagnostics.sql_gen_query_delta;
        SET v_old_group_concat_max_len = @@session.group_concat_max_len;
        SET @@session.group_concat_max_len = 2048;
        SET v_done = FALSE;
        OPEN c_sysviews_w_delta;
        c_sysviews_w_delta_loop: LOOP
            FETCH c_sysviews_w_delta INTO v_table_name;
            IF v_done THEN
                LEAVE c_sysviews_w_delta_loop;
            END IF;
            SET @sys.diagnostics.table_name = v_table_name;
            EXECUTE stmt_gen_query_delta USING @sys.diagnostics.table_name;
            -- If necessary add WHERE, ORDER BY, and LIMIT
            SELECT CONCAT(@sys.diagnostics.sql_select,
                            IF(where_delta IS NOT NULL, CONCAT('\n WHERE ', where_delta), ''),
                            IF(order_by_delta IS NOT NULL, CONCAT('\n ORDER BY ', order_by_delta), ''),
                            IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '')
                    )
                INTO @sys.diagnostics.sql_select
                FROM tmp_sys_views_delta
                WHERE TABLE_NAME COLLATE utf8mb4_0900_as_ci = v_table_name;
            SELECT CONCAT('Delta ', v_table_name) AS 'The following output is:';
            CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select);
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE `tmp_', v_table_name, '_end`'));
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE `tmp_', v_table_name, '_start`'));
        END LOOP;
        CLOSE c_sysviews_w_delta;
        SET @@session.group_concat_max_len = v_old_group_concat_max_len;
        DEALLOCATE PREPARE stmt_gen_query_delta;
        DROP TEMPORARY TABLE tmp_sys_views_delta;
    END IF;
    SELECT 'SELECT * FROM sys.metrics' AS 'The following output is:';
    CALL sys.execute_prepared_stmt(
        CONCAT(v_sql_status_summary_select, v_sql_status_summary_delta, ', Type, s1.Enabled', v_sql_status_summary_from,
               '
 ORDER BY Type, Variable_name'
        )
    );
    -- Remove all the metrics temporary tables again
    SET v_count = 0;
    WHILE (v_count < v_output_count) DO
        SET v_count = v_count + 1;
        SET v_table_name = CONCAT('tmp_metrics_', v_count);
        CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS ', v_table_name));
    END WHILE;
    IF (in_auto_config <> 'current') THEN
        CALL sys.ps_setup_reload_saved();
        SET sql_log_bin = @log_bin;
    END IF;
    -- Reset the @sys.diagnostics.% user variables internal to this procedure
    SET @sys.diagnostics.output_time            = NULL,
        @sys.diagnostics.sql                    = NULL,
        @sys.diagnostics.sql_gen_query_delta    = NULL,
        @sys.diagnostics.sql_gen_query_template = NULL,
        @sys.diagnostics.sql_select             = NULL,
        @sys.diagnostics.table_name             = NULL;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    IF (@log_bin = 1) THEN
        SET sql_log_bin = @log_bin;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `execute_prepared_stmt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `execute_prepared_stmt`(
        IN in_query longtext CHARACTER SET UTF8MB4
    )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes the query in the argument and executes it using a prepared statement. The prepared statement is deallocated,\nso the procedure is mainly useful for executing one off dynamically created queries.\n\nThe sys_execute_prepared_stmt prepared statement name is used for the query and is required not to exist.\n\n\nParameters\n-----------\n\nin_query (longtext CHARACTER SET UTF8MB4):\n  The query to execute.\n\n\nConfiguration Options\n----------------------\n\nsys.debug\n  Whether to provide debugging output.\n  Default is ''OFF''. Set to ''ON'' to include.\n\n\nExample\n--------\n\nmysql> CALL sys.execute_prepared_stmt(''SELECT * FROM sys.sys_config'');\n+------------------------+-------+---------------------+--------+\n| variable               | value | set_time            | set_by |\n+------------------------+-------+---------------------+--------+\n| statement_truncate_len | 64    | 2015-06-30 13:06:00 | NULL   |\n+------------------------+-------+---------------------+--------+\n1 row in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.00 sec)\n'
BEGIN
    -- Set configuration options
    IF (@sys.debug IS NULL) THEN
        SET @sys.debug = sys.sys_get_config('debug', 'OFF');
    END IF;
    -- Verify the query exists
    -- The shortest possible query is "DO 1"
    IF (in_query IS NULL OR LENGTH(in_query) < 4) THEN
       SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = "The @sys.execute_prepared_stmt.sql must contain a query";
    END IF;
    SET @sys.execute_prepared_stmt.sql = in_query;
    IF (@sys.debug = 'ON') THEN
        SELECT @sys.execute_prepared_stmt.sql AS 'Debug';
    END IF;
    PREPARE sys_execute_prepared_stmt FROM @sys.execute_prepared_stmt.sql;
    EXECUTE sys_execute_prepared_stmt;
    DEALLOCATE PREPARE sys_execute_prepared_stmt;
    SET @sys.execute_prepared_stmt.sql = NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_background_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_background_threads`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisable all background thread instrumentation within Performance Schema.\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_disable_background_threads();\n+--------------------------------+\n| summary                        |\n+--------------------------------+\n| Disabled 18 background threads |\n+--------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'NO'
     WHERE type = 'BACKGROUND';
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' background thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_consumer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_consumer`(
        IN consumer VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisables consumers within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nconsumer (VARCHAR(128)):\n  A LIKE pattern match (using "%consumer%") of consumers to disable\n\nExample\n-----------\n\nTo disable all consumers:\n\nmysql> CALL sys.ps_setup_disable_consumer('''');\n+--------------------------+\n| summary                  |\n+--------------------------+\n| Disabled 15 consumers    |\n+--------------------------+\n1 row in set (0.02 sec)\n\nTo disable just the event_stage consumers:\n\nmysql> CALL sys.ps_setup_disable_comsumers(''stage'');\n+------------------------+\n| summary                |\n+------------------------+\n| Disabled 3 consumers   |\n+------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.setup_consumers
       SET enabled = 'NO'
     WHERE name LIKE CONCAT('%', consumer, '%');
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' consumer', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_instrument` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_instrument`(
        IN in_pattern VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisables instruments within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nin_pattern (VARCHAR(128)):\n  A LIKE pattern match (using "%in_pattern%") of events to disable\n\nExample\n-----------\n\nTo disable all mutex instruments:\n\nmysql> CALL sys.ps_setup_disable_instrument(''wait/synch/mutex'');\n+--------------------------+\n| summary                  |\n+--------------------------+\n| Disabled 155 instruments |\n+--------------------------+\n1 row in set (0.02 sec)\n\nTo disable just a specific TCP/IP based network IO instrument:\n\nmysql> CALL sys.ps_setup_disable_instrument(''wait/io/socket/sql/server_tcpip_socket'');\n+------------------------+\n| summary                |\n+------------------------+\n| Disabled 1 instruments |\n+------------------------+\n1 row in set (0.00 sec)\n\nTo disable all instruments:\n\nmysql> CALL sys.ps_setup_disable_instrument('''');\n+--------------------------+\n| summary                  |\n+--------------------------+\n| Disabled 547 instruments |\n+--------------------------+\n1 row in set (0.01 sec)\n'
BEGIN
    UPDATE performance_schema.setup_instruments
       SET enabled = 'NO', timed = 'NO'
     WHERE name LIKE CONCAT('%', in_pattern, '%');
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' instrument', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_thread`(
        IN in_connection_id BIGINT
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisable the given connection/thread in Performance Schema.\n\nParameters\n-----------\n\nin_connection_id (BIGINT):\n  The connection ID (PROCESSLIST_ID from performance_schema.threads\n  or the ID shown within SHOW PROCESSLIST)\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_disable_thread(3);\n+-------------------+\n| summary           |\n+-------------------+\n| Disabled 1 thread |\n+-------------------+\n1 row in set (0.01 sec)\n\nTo disable the current connection:\n\nmysql> CALL sys.ps_setup_disable_thread(CONNECTION_ID());\n+-------------------+\n| summary           |\n+-------------------+\n| Disabled 1 thread |\n+-------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'NO'
     WHERE processlist_id = in_connection_id;
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_background_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_background_threads`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnable all background thread instrumentation within Performance Schema.\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_enable_background_threads();\n+-------------------------------+\n| summary                       |\n+-------------------------------+\n| Enabled 18 background threads |\n+-------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'YES'
     WHERE type = 'BACKGROUND';
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' background thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_consumer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_consumer`(
        IN consumer VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnables consumers within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nconsumer (VARCHAR(128)):\n  A LIKE pattern match (using "%consumer%") of consumers to enable\n\nExample\n-----------\n\nTo enable all consumers:\n\nmysql> CALL sys.ps_setup_enable_consumer('''');\n+-------------------------+\n| summary                 |\n+-------------------------+\n| Enabled 10 consumers    |\n+-------------------------+\n1 row in set (0.02 sec)\n\nQuery OK, 0 rows affected (0.02 sec)\n\nTo enable just "waits" consumers:\n\nmysql> CALL sys.ps_setup_enable_consumer(''waits'');\n+-----------------------+\n| summary               |\n+-----------------------+\n| Enabled 3 consumers   |\n+-----------------------+\n1 row in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.setup_consumers
       SET enabled = 'YES'
     WHERE name LIKE CONCAT('%', consumer, '%');
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' consumer', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_instrument` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_instrument`(
        IN in_pattern VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnables instruments within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nin_pattern (VARCHAR(128)):\n  A LIKE pattern match (using "%in_pattern%") of events to enable\n\nExample\n-----------\n\nTo enable all mutex instruments:\n\nmysql> CALL sys.ps_setup_enable_instrument(''wait/synch/mutex'');\n+-------------------------+\n| summary                 |\n+-------------------------+\n| Enabled 155 instruments |\n+-------------------------+\n1 row in set (0.02 sec)\n\nQuery OK, 0 rows affected (0.02 sec)\n\nTo enable just a specific TCP/IP based network IO instrument:\n\nmysql> CALL sys.ps_setup_enable_instrument(''wait/io/socket/sql/server_tcpip_socket'');\n+-----------------------+\n| summary               |\n+-----------------------+\n| Enabled 1 instruments |\n+-----------------------+\n1 row in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.00 sec)\n\nTo enable all instruments:\n\nmysql> CALL sys.ps_setup_enable_instrument('''');\n+-------------------------+\n| summary                 |\n+-------------------------+\n| Enabled 547 instruments |\n+-------------------------+\n1 row in set (0.01 sec)\n\nQuery OK, 0 rows affected (0.01 sec)\n'
BEGIN
    UPDATE performance_schema.setup_instruments
       SET enabled = 'YES', timed = 'YES'
     WHERE name LIKE CONCAT('%', in_pattern, '%');
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' instrument', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_thread`(
        IN in_connection_id BIGINT
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnable the given connection/thread in Performance Schema.\n\nParameters\n-----------\n\nin_connection_id (BIGINT):\n  The connection ID (PROCESSLIST_ID from performance_schema.threads\n  or the ID shown within SHOW PROCESSLIST)\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_enable_thread(3);\n+------------------+\n| summary          |\n+------------------+\n| Enabled 1 thread |\n+------------------+\n1 row in set (0.01 sec)\n\nTo enable the current connection:\n\nmysql> CALL sys.ps_setup_enable_thread(CONNECTION_ID());\n+------------------+\n| summary          |\n+------------------+\n| Enabled 1 thread |\n+------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'YES'
     WHERE processlist_id = in_connection_id;
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_reload_saved` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_reload_saved`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReloads a saved Performance Schema configuration,\nso that you can alter the setup for debugging purposes, \nbut restore it to a previous state.\n\nUse the companion procedure - ps_setup_save(), to \nsave a configuration.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_save();\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> UPDATE performance_schema.setup_instruments SET enabled = ''YES'', timed = ''YES'';\nQuery OK, 547 rows affected (0.40 sec)\nRows matched: 784  Changed: 547  Warnings: 0\n\n/* Run some tests that need more detailed instrumentation here */\n\nmysql> CALL sys.ps_setup_reload_saved();\nQuery OK, 0 rows affected (0.32 sec)\n'
BEGIN
    DECLARE v_done bool DEFAULT FALSE;
    DECLARE v_lock_result INT;
    DECLARE v_lock_used_by BIGINT;
    DECLARE v_signal_message TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SIGNAL SQLSTATE VALUE '90001'
           SET MESSAGE_TEXT = 'An error occurred, was sys.ps_setup_save() run before this procedure?';
    END;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    SELECT IS_USED_LOCK('sys.ps_setup_save') INTO v_lock_used_by;
    IF (v_lock_used_by != CONNECTION_ID()) THEN
        SET v_signal_message = CONCAT('The sys.ps_setup_save lock is currently owned by ', v_lock_used_by);
        SIGNAL SQLSTATE VALUE '90002'
           SET MESSAGE_TEXT = v_signal_message;
    END IF;
    DELETE FROM performance_schema.setup_actors;
    INSERT INTO performance_schema.setup_actors SELECT * FROM tmp_setup_actors;
    BEGIN
        -- Workaround for http://bugs.mysql.com/bug.php?id=70025
        DECLARE v_name varchar(64);
        DECLARE v_enabled enum('YES', 'NO');
        DECLARE c_consumers CURSOR FOR SELECT NAME, ENABLED FROM tmp_setup_consumers;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
        SET v_done = FALSE;
        OPEN c_consumers;
        c_consumers_loop: LOOP
            FETCH c_consumers INTO v_name, v_enabled;
            IF v_done THEN
               LEAVE c_consumers_loop;
            END IF;
            UPDATE performance_schema.setup_consumers
               SET ENABLED = v_enabled
             WHERE NAME = v_name;
         END LOOP;
         CLOSE c_consumers;
    END;
    UPDATE performance_schema.setup_instruments
     INNER JOIN tmp_setup_instruments USING (NAME)
       SET performance_schema.setup_instruments.ENABLED = tmp_setup_instruments.ENABLED,
           performance_schema.setup_instruments.TIMED   = tmp_setup_instruments.TIMED;
    BEGIN
        -- Workaround for http://bugs.mysql.com/bug.php?id=70025
        DECLARE v_thread_id bigint unsigned;
        DECLARE v_instrumented enum('YES', 'NO');
        DECLARE c_threads CURSOR FOR SELECT THREAD_ID, INSTRUMENTED FROM tmp_threads;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
        SET v_done = FALSE;
        OPEN c_threads;
        c_threads_loop: LOOP
            FETCH c_threads INTO v_thread_id, v_instrumented;
            IF v_done THEN
               LEAVE c_threads_loop;
            END IF;
            UPDATE performance_schema.threads
               SET INSTRUMENTED = v_instrumented
             WHERE THREAD_ID = v_thread_id;
        END LOOP;
        CLOSE c_threads;
    END;
    UPDATE performance_schema.threads
       SET INSTRUMENTED = IF(PROCESSLIST_USER IS NOT NULL,
                             sys.ps_is_account_enabled(PROCESSLIST_HOST, PROCESSLIST_USER),
                             'YES')
     WHERE THREAD_ID NOT IN (SELECT THREAD_ID FROM tmp_threads);
    DROP TEMPORARY TABLE tmp_setup_actors;
    DROP TEMPORARY TABLE tmp_setup_consumers;
    DROP TEMPORARY TABLE tmp_setup_instruments;
    DROP TEMPORARY TABLE tmp_threads;
    SELECT RELEASE_LOCK('sys.ps_setup_save') INTO v_lock_result;
    SET sql_log_bin = @log_bin; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_reset_to_default` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_reset_to_default`(
       IN in_verbose BOOLEAN
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nResets the Performance Schema setup to the default settings.\n\nParameters\n-----------\n\nin_verbose (BOOLEAN):\n  Whether to print each setup stage (including the SQL) whilst running.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_reset_to_default(true)\\G\n*************************** 1. row ***************************\nstatus: Resetting: setup_actors\nDELETE\nFROM performance_schema.setup_actors\n WHERE NOT (HOST = ''%'' AND USER = ''%'' AND `ROLE` = ''%'')\n1 row in set (0.00 sec)\n\n*************************** 1. row ***************************\nstatus: Resetting: setup_actors\nINSERT IGNORE INTO performance_schema.setup_actors\nVALUES (''%'', ''%'', ''%'')\n1 row in set (0.00 sec)\n...\n\nmysql> CALL sys.ps_setup_reset_to_default(false)\\G\nQuery OK, 0 rows affected (0.00 sec)\n'
BEGIN
    SET @query = 'DELETE
                    FROM performance_schema.setup_actors
                   WHERE NOT (HOST = ''%'' AND USER = ''%'' AND `ROLE` = ''%'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_actors\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'INSERT IGNORE INTO performance_schema.setup_actors
                  VALUES (''%'', ''%'', ''%'', ''YES'', ''YES'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_actors\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'UPDATE performance_schema.setup_instruments
                     SET ENABLED = sys.ps_is_instrument_default_enabled(NAME),
                         TIMED   = sys.ps_is_instrument_default_timed(NAME)';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_instruments\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'UPDATE performance_schema.setup_consumers
                     SET ENABLED = IF(NAME IN (''events_statements_current'', ''events_transactions_current'', ''global_instrumentation'', ''thread_instrumentation'', ''statements_digest''), ''YES'', ''NO'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_consumers\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'DELETE
                    FROM performance_schema.setup_objects
                   WHERE NOT (OBJECT_TYPE IN (''EVENT'', ''FUNCTION'', ''PROCEDURE'', ''TABLE'', ''TRIGGER'') AND OBJECT_NAME = ''%'' 
                     AND (OBJECT_SCHEMA = ''mysql''              AND ENABLED = ''NO''  AND TIMED = ''NO'' )
                      OR (OBJECT_SCHEMA = ''performance_schema'' AND ENABLED = ''NO''  AND TIMED = ''NO'' )
                      OR (OBJECT_SCHEMA = ''information_schema'' AND ENABLED = ''NO''  AND TIMED = ''NO'' )
                      OR (OBJECT_SCHEMA = ''%''                  AND ENABLED = ''YES'' AND TIMED = ''YES''))';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_objects\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'INSERT IGNORE INTO performance_schema.setup_objects
                  VALUES (''EVENT''    , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''EVENT''    , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''EVENT''    , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''EVENT''    , ''%''                 , ''%'', ''YES'', ''YES''),
                         (''FUNCTION'' , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''FUNCTION'' , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''FUNCTION'' , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''FUNCTION'' , ''%''                 , ''%'', ''YES'', ''YES''),
                         (''PROCEDURE'', ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''PROCEDURE'', ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''PROCEDURE'', ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''PROCEDURE'', ''%''                 , ''%'', ''YES'', ''YES''),
                         (''TABLE''    , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''TABLE''    , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TABLE''    , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TABLE''    , ''%''                 , ''%'', ''YES'', ''YES''),
                         (''TRIGGER''  , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''TRIGGER''  , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TRIGGER''  , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TRIGGER''  , ''%''                 , ''%'', ''YES'', ''YES'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_objects\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'UPDATE performance_schema.threads
                     SET INSTRUMENTED = ''YES''';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: threads\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_save`(
        IN in_timeout INT
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nSaves the current configuration of Performance Schema, \nso that you can alter the setup for debugging purposes, \nbut restore it to a previous state.\n\nUse the companion procedure - ps_setup_reload_saved(), to \nrestore the saved config.\n\nThe named lock "sys.ps_setup_save" is taken before the\ncurrent configuration is saved. If the attempt to get the named\nlock times out, an error occurs.\n\nThe lock is released after the settings have been restored by\ncalling ps_setup_reload_saved().\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_timeout INT\n  The timeout in seconds used when trying to obtain the lock.\n  A negative timeout means infinite timeout.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_save(-1);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> UPDATE performance_schema.setup_instruments \n    ->    SET enabled = ''YES'', timed = ''YES'';\nQuery OK, 547 rows affected (0.40 sec)\nRows matched: 784  Changed: 547  Warnings: 0\n\n/* Run some tests that need more detailed instrumentation here */\n\nmysql> CALL sys.ps_setup_reload_saved();\nQuery OK, 0 rows affected (0.32 sec)\n'
BEGIN
    DECLARE v_lock_result INT;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    SELECT GET_LOCK('sys.ps_setup_save', in_timeout) INTO v_lock_result;
    IF v_lock_result THEN
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_actors;
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_consumers;
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_instruments;
        DROP TEMPORARY TABLE IF EXISTS tmp_threads;
        CREATE TEMPORARY TABLE tmp_setup_actors SELECT * FROM performance_schema.setup_actors LIMIT 0;
        CREATE TEMPORARY TABLE tmp_setup_consumers LIKE performance_schema.setup_consumers;
        CREATE TEMPORARY TABLE tmp_setup_instruments LIKE performance_schema.setup_instruments;
        CREATE TEMPORARY TABLE tmp_threads (THREAD_ID bigint unsigned NOT NULL PRIMARY KEY, INSTRUMENTED enum('YES','NO') NOT NULL);
        INSERT INTO tmp_setup_actors SELECT * FROM performance_schema.setup_actors;
        INSERT INTO tmp_setup_consumers SELECT * FROM performance_schema.setup_consumers;
        INSERT INTO tmp_setup_instruments SELECT * FROM performance_schema.setup_instruments;
        INSERT INTO tmp_threads SELECT THREAD_ID, INSTRUMENTED FROM performance_schema.threads;
    ELSE
        SIGNAL SQLSTATE VALUE '90000'
           SET MESSAGE_TEXT = 'Could not lock the sys.ps_setup_save user lock, another thread has a saved configuration';
    END IF;
    SET sql_log_bin = @log_bin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_disabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled`(
        IN in_show_instruments BOOLEAN,
        IN in_show_threads BOOLEAN
    )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently disable Performance Schema configuration.\n\nDisabled users is only available for MySQL 5.7.6 and later.\nIn earlier versions it was only possible to enable users.\n\nParameters\n-----------\n\nin_show_instruments (BOOLEAN):\n  Whether to print disabled instruments (can print many items)\n\nin_show_threads (BOOLEAN):\n  Whether to print disabled threads\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_disabled(TRUE, TRUE);\n+----------------------------+\n| performance_schema_enabled |\n+----------------------------+\n|                          1 |\n+----------------------------+\n1 row in set (0.00 sec)\n\n+--------------------+\n| disabled_users     |\n+--------------------+\n| ''mark''@''localhost'' |\n+--------------------+\n1 row in set (0.00 sec)\n\n+-------------+----------------------+---------+-------+\n| object_type | objects              | enabled | timed |\n+-------------+----------------------+---------+-------+\n| EVENT       | mysql.%              | NO      | NO    |\n| EVENT       | performance_schema.% | NO      | NO    |\n| EVENT       | information_schema.% | NO      | NO    |\n| FUNCTION    | mysql.%              | NO      | NO    |\n| FUNCTION    | performance_schema.% | NO      | NO    |\n| FUNCTION    | information_schema.% | NO      | NO    |\n| PROCEDURE   | mysql.%              | NO      | NO    |\n| PROCEDURE   | performance_schema.% | NO      | NO    |\n| PROCEDURE   | information_schema.% | NO      | NO    |\n| TABLE       | mysql.%              | NO      | NO    |\n| TABLE       | performance_schema.% | NO      | NO    |\n| TABLE       | information_schema.% | NO      | NO    |\n| TRIGGER     | mysql.%              | NO      | NO    |\n| TRIGGER     | performance_schema.% | NO      | NO    |\n| TRIGGER     | information_schema.% | NO      | NO    |\n+-------------+----------------------+---------+-------+\n15 rows in set (0.00 sec)\n\n+----------------------------------+\n| disabled_consumers               |\n+----------------------------------+\n| events_stages_current            |\n| events_stages_history            |\n| events_stages_history_long       |\n| events_statements_history        |\n| events_statements_history_long   |\n| events_transactions_history      |\n| events_transactions_history_long |\n| events_waits_current             |\n| events_waits_history             |\n| events_waits_history_long        |\n+----------------------------------+\n10 rows in set (0.00 sec)\n\nEmpty set (0.00 sec)\n\n+---------------------------------------------------------------------------------------+-------+\n| disabled_instruments                                                                  | timed |\n+---------------------------------------------------------------------------------------+-------+\n| wait/synch/mutex/sql/TC_LOG_MMAP::LOCK_tc                                             | NO    |\n| wait/synch/mutex/sql/LOCK_des_key_file                                                | NO    |\n| wait/synch/mutex/sql/MYSQL_BIN_LOG::LOCK_commit                                       | NO    |\n...\n| memory/sql/servers_cache                                                              | NO    |\n| memory/sql/udf_mem                                                                    | NO    |\n| wait/lock/metadata/sql/mdl                                                            | NO    |\n+---------------------------------------------------------------------------------------+-------+\n547 rows in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.01 sec)\n'
BEGIN
    SELECT @@performance_schema AS performance_schema_enabled;
    SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS disabled_users
      FROM performance_schema.setup_actors
     WHERE enabled = 'NO'
     ORDER BY disabled_users;
    SELECT object_type,
           CONCAT(object_schema, '.', object_name) AS objects,
           enabled,
           timed
      FROM performance_schema.setup_objects
     WHERE enabled = 'NO'
     ORDER BY object_type, objects;
    SELECT name AS disabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'NO'
     ORDER BY disabled_consumers;
    IF (in_show_threads) THEN
        SELECT IF(name = 'thread/sql/one_connection', 
                  CONCAT(processlist_user, '@', processlist_host), 
                  REPLACE(name, 'thread/', '')) AS disabled_threads,
        TYPE AS thread_type
          FROM performance_schema.threads
         WHERE INSTRUMENTED = 'NO'
         ORDER BY disabled_threads;
    END IF;
    IF (in_show_instruments) THEN
        SELECT name AS disabled_instruments,
               timed
          FROM performance_schema.setup_instruments
         WHERE enabled = 'NO'
         ORDER BY disabled_instruments;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_disabled_consumers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled_consumers`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently disabled consumers.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_disabled_consumers();\n\n+---------------------------+\n| disabled_consumers        |\n+---------------------------+\n| events_statements_current |\n| global_instrumentation    |\n| thread_instrumentation    |\n| statements_digest         |\n+---------------------------+\n4 rows in set (0.05 sec)\n'
BEGIN
    SELECT name AS disabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'NO'
     ORDER BY disabled_consumers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_disabled_instruments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled_instruments`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently disabled instruments.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_disabled_instruments();\n'
BEGIN
    SELECT name AS disabled_instruments, timed
      FROM performance_schema.setup_instruments
     WHERE enabled = 'NO'
     ORDER BY disabled_instruments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled`(
        IN in_show_instruments BOOLEAN,
        IN in_show_threads BOOLEAN
    )
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently enabled Performance Schema configuration.\n\nParameters\n-----------\n\nin_show_instruments (BOOLEAN):\n  Whether to print enabled instruments (can print many items)\n\nin_show_threads (BOOLEAN):\n  Whether to print enabled threads\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_enabled(TRUE, TRUE);\n+----------------------------+\n| performance_schema_enabled |\n+----------------------------+\n|                          1 |\n+----------------------------+\n1 row in set (0.00 sec)\n\n+---------------+\n| enabled_users |\n+---------------+\n| ''%''@''%''       |\n+---------------+\n1 row in set (0.01 sec)\n\n+-------------+---------+---------+-------+\n| object_type | objects | enabled | timed |\n+-------------+---------+---------+-------+\n| EVENT       | %.%     | YES     | YES   |\n| FUNCTION    | %.%     | YES     | YES   |\n| PROCEDURE   | %.%     | YES     | YES   |\n| TABLE       | %.%     | YES     | YES   |\n| TRIGGER     | %.%     | YES     | YES   |\n+-------------+---------+---------+-------+\n5 rows in set (0.01 sec)\n\n+---------------------------+\n| enabled_consumers         |\n+---------------------------+\n| events_statements_current |\n| global_instrumentation    |\n| thread_instrumentation    |\n| statements_digest         |\n+---------------------------+\n4 rows in set (0.05 sec)\n\n+---------------------------------+-------------+\n| enabled_threads                 | thread_type |\n+---------------------------------+-------------+\n| sql/main                        | BACKGROUND  |\n| sql/thread_timer_notifier       | BACKGROUND  |\n| innodb/io_ibuf_thread           | BACKGROUND  |\n| innodb/io_log_thread            | BACKGROUND  |\n| innodb/io_read_thread           | BACKGROUND  |\n| innodb/io_read_thread           | BACKGROUND  |\n| innodb/io_write_thread          | BACKGROUND  |\n| innodb/io_write_thread          | BACKGROUND  |\n| innodb/page_cleaner_thread      | BACKGROUND  |\n| innodb/srv_lock_timeout_thread  | BACKGROUND  |\n| innodb/srv_error_monitor_thread | BACKGROUND  |\n| innodb/srv_monitor_thread       | BACKGROUND  |\n| innodb/srv_master_thread        | BACKGROUND  |\n| innodb/srv_purge_thread         | BACKGROUND  |\n| innodb/srv_worker_thread        | BACKGROUND  |\n| innodb/srv_worker_thread        | BACKGROUND  |\n| innodb/srv_worker_thread        | BACKGROUND  |\n| innodb/buf_dump_thread          | BACKGROUND  |\n| innodb/dict_stats_thread        | BACKGROUND  |\n| sql/signal_handler              | BACKGROUND  |\n| sql/compress_gtid_table         | FOREGROUND  |\n| root@localhost                  | FOREGROUND  |\n+---------------------------------+-------------+\n22 rows in set (0.01 sec)\n\n+-------------------------------------+-------+\n| enabled_instruments                 | timed |\n+-------------------------------------+-------+\n| wait/io/file/sql/map                | YES   |\n| wait/io/file/sql/binlog             | YES   |\n...\n| statement/com/Error                 | YES   |\n| statement/com/                      | YES   |\n| idle                                | YES   |\n+-------------------------------------+-------+\n210 rows in set (0.08 sec)\n\nQuery OK, 0 rows affected (0.89 sec)\n'
BEGIN
    SELECT @@performance_schema AS performance_schema_enabled;
    SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS enabled_users
      FROM performance_schema.setup_actors
     WHERE enabled = 'YES'
     ORDER BY enabled_users;
    SELECT object_type,
           CONCAT(object_schema, '.', object_name) AS objects,
           enabled,
           timed
      FROM performance_schema.setup_objects
     WHERE enabled = 'YES'
     ORDER BY object_type, objects;
    SELECT name AS enabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'YES'
     ORDER BY enabled_consumers;
    IF (in_show_threads) THEN
        SELECT IF(name = 'thread/sql/one_connection', 
                  CONCAT(processlist_user, '@', processlist_host), 
                  REPLACE(name, 'thread/', '')) AS enabled_threads,
        TYPE AS thread_type
          FROM performance_schema.threads
         WHERE INSTRUMENTED = 'YES'
         ORDER BY enabled_threads;
    END IF;
    IF (in_show_instruments) THEN
        SELECT name AS enabled_instruments,
               timed
          FROM performance_schema.setup_instruments
         WHERE enabled = 'YES'
         ORDER BY enabled_instruments;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_enabled_consumers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled_consumers`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently enabled consumers.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_enabled_consumers();\n\n+---------------------------+\n| enabled_consumers         |\n+---------------------------+\n| events_statements_current |\n| global_instrumentation    |\n| thread_instrumentation    |\n| statements_digest         |\n+---------------------------+\n4 rows in set (0.05 sec)\n'
BEGIN
    SELECT name AS enabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'YES'
     ORDER BY enabled_consumers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_enabled_instruments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled_instruments`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently enabled instruments.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_enabled_instruments();\n'
BEGIN
    SELECT name AS enabled_instruments, timed
      FROM performance_schema.setup_instruments
     WHERE enabled = 'YES'
     ORDER BY enabled_instruments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_statement_avg_latency_histogram` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_statement_avg_latency_histogram`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nOutputs a textual histogram graph of the average latency values\nacross all normalized queries tracked within the Performance Schema\nevents_statements_summary_by_digest table.\n\nCan be used to show a very high level picture of what kind of \nlatency distribution statements running within this instance have.\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_statement_avg_latency_histogram()\\G\n*************************** 1. row ***************************\nPerformance Schema Statement Digest Average Latency Histogram:\n\n  . = 1 unit\n  * = 2 units\n  # = 3 units\n\n(0 - 38ms)     240 | ################################################################################\n(38 - 77ms)    38  | ......................................\n(77 - 115ms)   3   | ...\n(115 - 154ms)  62  | *******************************\n(154 - 192ms)  3   | ...\n(192 - 231ms)  0   |\n(231 - 269ms)  0   |\n(269 - 307ms)  0   |\n(307 - 346ms)  0   |\n(346 - 384ms)  1   | .\n(384 - 423ms)  1   | .\n(423 - 461ms)  0   |\n(461 - 499ms)  0   |\n(499 - 538ms)  0   |\n(538 - 576ms)  0   |\n(576 - 615ms)  1   | .\n\n  Total Statements: 350; Buckets: 16; Bucket Size: 38 ms;\n'
BEGIN
SELECT CONCAT('\n',
       '\n  . = 1 unit',
       '\n  * = 2 units',
       '\n  # = 3 units\n',
       @label := CONCAT(@label_inner := CONCAT('\n(0 - ',
                                               ROUND((@bucket_size := (SELECT ROUND((MAX(avg_us) - MIN(avg_us)) / (@buckets := 16)) AS size
                                                                         FROM sys.x$ps_digest_avg_latency_distribution)) / (@unit_div := 1000)),
                                                (@unit := 'ms'), ')'),
                        REPEAT(' ', (@max_label_size := ((1 + LENGTH(ROUND((@bucket_size * 15) / @unit_div)) + 3 + LENGTH(ROUND(@bucket_size * 16) / @unit_div)) + 1)) - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us <= @bucket_size), 0)),
       REPEAT(' ', (@max_label_len := (@max_label_size + LENGTH((@total_queries := (SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution)))) + 1) - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < (@one_unit := 40), '.', IF(@count_in_bucket < (@two_unit := 80), '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND(@bucket_size / @unit_div), ' - ', ROUND((@bucket_size * 2) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size AND b1.avg_us <= @bucket_size * 2), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 2) / @unit_div), ' - ', ROUND((@bucket_size * 3) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 2 AND b1.avg_us <= @bucket_size * 3), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 3) / @unit_div), ' - ', ROUND((@bucket_size * 4) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 3 AND b1.avg_us <= @bucket_size * 4), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 4) / @unit_div), ' - ', ROUND((@bucket_size * 5) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 4 AND b1.avg_us <= @bucket_size * 5), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 5) / @unit_div), ' - ', ROUND((@bucket_size * 6) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 5 AND b1.avg_us <= @bucket_size * 6), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 6) / @unit_div), ' - ', ROUND((@bucket_size * 7) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 6 AND b1.avg_us <= @bucket_size * 7), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 7) / @unit_div), ' - ', ROUND((@bucket_size * 8) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 7 AND b1.avg_us <= @bucket_size * 8), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 8) / @unit_div), ' - ', ROUND((@bucket_size * 9) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 8 AND b1.avg_us <= @bucket_size * 9), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 9) / @unit_div), ' - ', ROUND((@bucket_size * 10) / @unit_div), @unit, ')'),
                         REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                         @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                       FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                      WHERE b1.avg_us > @bucket_size * 9 AND b1.avg_us <= @bucket_size * 10), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 10) / @unit_div), ' - ', ROUND((@bucket_size * 11) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 10 AND b1.avg_us <= @bucket_size * 11), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 11) / @unit_div), ' - ', ROUND((@bucket_size * 12) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 11 AND b1.avg_us <= @bucket_size * 12), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 12) / @unit_div), ' - ', ROUND((@bucket_size * 13) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 12 AND b1.avg_us <= @bucket_size * 13), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 13) / @unit_div), ' - ', ROUND((@bucket_size * 14) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 13 AND b1.avg_us <= @bucket_size * 14), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 14) / @unit_div), ' - ', ROUND((@bucket_size * 15) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 14 AND b1.avg_us <= @bucket_size * 15), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 15) / @unit_div), ' - ', ROUND((@bucket_size * 16) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 15 AND b1.avg_us <= @bucket_size * 16), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       '\n\n  Total Statements: ', @total_queries, '; Buckets: ', @buckets , '; Bucket Size: ', ROUND(@bucket_size / @unit_div) , ' ', @unit, ';\n'
      ) AS `Performance Schema Statement Digest Average Latency Histogram`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_trace_statement_digest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_trace_statement_digest`(
        IN in_digest VARCHAR(64),
        IN in_runtime INT,
        IN in_interval DECIMAL(2,2),
        IN in_start_fresh BOOLEAN,
        IN in_auto_enable BOOLEAN
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTraces all instrumentation within Performance Schema for a specific\nStatement Digest.\n\nWhen finding a statement of interest within the\nperformance_schema.events_statements_summary_by_digest table, feed\nthe DIGEST value in to this procedure, set how long to poll for,\nand at what interval to poll, and it will generate a report of all\nstatistics tracked within Performance Schema for that digest for the\ninterval.\n\nIt will also attempt to generate an EXPLAIN for the longest running\nexample of the digest during the interval. Note this may fail, as:\n\n   * Performance Schema truncates long SQL_TEXT values (and hence the\n     EXPLAIN will fail due to parse errors)\n   * the default schema is sys (so tables that are not fully qualified\n     in the query may not be found)\n   * some queries such as SHOW are not supported in EXPLAIN.\n\nWhen the EXPLAIN fails, the error will be ignored and no EXPLAIN\noutput generated.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_digest (VARCHAR(64)):\n  The statement digest identifier you would like to analyze\nin_runtime (INT):\n  The number of seconds to run analysis for\nin_interval (DECIMAL(2,2)):\n  The interval (in seconds, may be fractional) at which to try\n  and take snapshots\nin_start_fresh (BOOLEAN):\n  Whether to TRUNCATE the events_statements_history_long and\n  events_stages_history_long tables before starting\nin_auto_enable (BOOLEAN):\n  Whether to automatically turn on required consumers\n\nExample\n-----------\n\nmysql> call ps_trace_statement_digest(''891ec6860f98ba46d89dd20b0c03652c'', 10, 0.1, true, true);\n+--------------------+\n| SUMMARY STATISTICS |\n+--------------------+\n| SUMMARY STATISTICS |\n+--------------------+\n1 row in set (9.11 sec)\n\n+------------+-----------+-----------+-----------+---------------+------------+------------+\n| executions | exec_time | lock_time | rows_sent | rows_examined | tmp_tables | full_scans |\n+------------+-----------+-----------+-----------+---------------+------------+------------+\n|         21 | 4.11 ms   | 2.00 ms   |         0 |            21 |          0 |          0 |\n+------------+-----------+-----------+-----------+---------------+------------+------------+\n1 row in set (9.11 sec)\n\n+------------------------------------------+-------+-----------+\n| event_name                               | count | latency   |\n+------------------------------------------+-------+-----------+\n| stage/sql/checking query cache for query |    16 | 724.37 us |\n| stage/sql/statistics                     |    16 | 546.92 us |\n| stage/sql/freeing items                  |    18 | 520.11 us |\n| stage/sql/init                           |    51 | 466.80 us |\n...\n| stage/sql/cleaning up                    |    18 | 11.92 us  |\n| stage/sql/executing                      |    16 | 6.95 us   |\n+------------------------------------------+-------+-----------+\n17 rows in set (9.12 sec)\n\n+---------------------------+\n| LONGEST RUNNING STATEMENT |\n+---------------------------+\n| LONGEST RUNNING STATEMENT |\n+---------------------------+\n1 row in set (9.16 sec)\n\n+-----------+-----------+-----------+-----------+---------------+------------+-----------+\n| thread_id | exec_time | lock_time | rows_sent | rows_examined | tmp_tables | full_scan |\n+-----------+-----------+-----------+-----------+---------------+------------+-----------+\n|    166646 | 618.43 us | 1.00 ms   |         0 |             1 |          0 |         0 |\n+-----------+-----------+-----------+-----------+---------------+------------+-----------+\n1 row in set (9.16 sec)\n\n// Truncated for clarity...\n+-----------------------------------------------------------------+\n| sql_text                                                        |\n+-----------------------------------------------------------------+\n| select hibeventhe0_.id as id1382_, hibeventhe0_.createdTime ... |\n+-----------------------------------------------------------------+\n1 row in set (9.17 sec)\n\n+------------------------------------------+-----------+\n| event_name                               | latency   |\n+------------------------------------------+-----------+\n| stage/sql/init                           | 8.61 us   |\n| stage/sql/Waiting for query cache lock   | 453.23 us |\n| stage/sql/init                           | 331.07 ns |\n| stage/sql/checking query cache for query | 43.04 us  |\n...\n| stage/sql/freeing items                  | 30.46 us  |\n| stage/sql/cleaning up                    | 662.13 ns |\n+------------------------------------------+-----------+\n18 rows in set (9.23 sec)\n\n+----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n| id | select_type | table        | type  | possible_keys | key       | key_len | ref         | rows | Extra |\n+----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n|  1 | SIMPLE      | hibeventhe0_ | const | fixedTime     | fixedTime | 775     | const,const |    1 | NULL  |\n+----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n1 row in set (9.27 sec)\n\nQuery OK, 0 rows affected (9.28 sec)\n'
BEGIN
    DECLARE v_start_fresh BOOLEAN DEFAULT false;
    DECLARE v_auto_enable BOOLEAN DEFAULT false;
    DECLARE v_explain     BOOLEAN DEFAULT true;
    DECLARE v_this_thread_enabed ENUM('YES', 'NO');
    DECLARE v_runtime INT DEFAULT 0;
    DECLARE v_start INT DEFAULT 0;
    DECLARE v_found_stmts INT;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    -- Do not track the current thread, it will kill the stack
    SELECT INSTRUMENTED INTO v_this_thread_enabed FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    DROP TEMPORARY TABLE IF EXISTS stmt_trace;
    CREATE TEMPORARY TABLE stmt_trace (
        thread_id BIGINT UNSIGNED,
        timer_start BIGINT UNSIGNED,
        event_id BIGINT UNSIGNED,
        sql_text longtext,
        timer_wait BIGINT UNSIGNED,
        lock_time BIGINT UNSIGNED,
        errors BIGINT UNSIGNED,
        mysql_errno INT,
        rows_sent BIGINT UNSIGNED,
        rows_affected BIGINT UNSIGNED,
        rows_examined BIGINT UNSIGNED,
        created_tmp_tables BIGINT UNSIGNED,
        created_tmp_disk_tables BIGINT UNSIGNED,
        no_index_used BIGINT UNSIGNED,
        PRIMARY KEY (thread_id, timer_start)
    );
    DROP TEMPORARY TABLE IF EXISTS stmt_stages;
    CREATE TEMPORARY TABLE stmt_stages (
       event_id BIGINT UNSIGNED,
       stmt_id BIGINT UNSIGNED,
       event_name VARCHAR(128),
       timer_wait BIGINT UNSIGNED,
       PRIMARY KEY (event_id)
    );
    SET v_start_fresh = in_start_fresh;
    IF v_start_fresh THEN
        TRUNCATE TABLE performance_schema.events_statements_history_long;
        TRUNCATE TABLE performance_schema.events_stages_history_long;
    END IF;
    SET v_auto_enable = in_auto_enable;
    IF v_auto_enable THEN
        CALL sys.ps_setup_save(0);
        UPDATE performance_schema.threads
           SET INSTRUMENTED = IF(PROCESSLIST_ID IS NOT NULL, 'YES', 'NO');
        -- Only the events_statements_history_long and events_stages_history_long tables and their ancestors are needed
        UPDATE performance_schema.setup_consumers
           SET ENABLED = 'YES'
         WHERE NAME NOT LIKE '%\_history'
               AND NAME NOT LIKE 'events_wait%'
               AND NAME NOT LIKE 'events_transactions%'
               AND NAME <> 'statements_digest';
        UPDATE performance_schema.setup_instruments
           SET ENABLED = 'YES',
               TIMED   = 'YES'
         WHERE NAME LIKE 'statement/%' OR NAME LIKE 'stage/%';
    END IF;
    WHILE v_runtime < in_runtime DO
        SELECT UNIX_TIMESTAMP() INTO v_start;
        INSERT IGNORE INTO stmt_trace
        SELECT thread_id, timer_start, event_id, sql_text, timer_wait, lock_time, errors, mysql_errno, 
               rows_sent, rows_affected, rows_examined, created_tmp_tables, created_tmp_disk_tables, no_index_used
          FROM performance_schema.events_statements_history_long
        WHERE digest = in_digest;
        INSERT IGNORE INTO stmt_stages
        SELECT stages.event_id, stmt_trace.event_id,
               stages.event_name, stages.timer_wait
          FROM performance_schema.events_stages_history_long AS stages
          JOIN stmt_trace ON stages.nesting_event_id = stmt_trace.event_id;
        SELECT SLEEP(in_interval) INTO @sleep;
        SET v_runtime = v_runtime + (UNIX_TIMESTAMP() - v_start);
    END WHILE;
    SELECT "SUMMARY STATISTICS";
    SELECT COUNT(*) executions,
           format_pico_time(SUM(timer_wait)) AS exec_time,
           format_pico_time(SUM(lock_time)) AS lock_time,
           SUM(rows_sent) AS rows_sent,
           SUM(rows_affected) AS rows_affected,
           SUM(rows_examined) AS rows_examined,
           SUM(created_tmp_tables) AS tmp_tables,
           SUM(no_index_used) AS full_scans
      FROM stmt_trace;
    SELECT event_name,
           COUNT(*) as count,
           format_pico_time(SUM(timer_wait)) as latency
      FROM stmt_stages
     GROUP BY event_name
     ORDER BY SUM(timer_wait) DESC;
    SELECT "LONGEST RUNNING STATEMENT";
    SELECT thread_id,
           format_pico_time(timer_wait) AS exec_time,
           format_pico_time(lock_time) AS lock_time,
           rows_sent,
           rows_affected,
           rows_examined,
           created_tmp_tables AS tmp_tables,
           no_index_used AS full_scan
      FROM stmt_trace
     ORDER BY timer_wait DESC LIMIT 1;
    SELECT sql_text
      FROM stmt_trace
     ORDER BY timer_wait DESC LIMIT 1;
    SELECT sql_text, event_id INTO @sql, @sql_id
      FROM stmt_trace
    ORDER BY timer_wait DESC LIMIT 1;
    IF (@sql_id IS NOT NULL) THEN
        SELECT event_name,
               format_pico_time(timer_wait) as latency
          FROM stmt_stages
         WHERE stmt_id = @sql_id
         ORDER BY event_id;
    END IF;
    DROP TEMPORARY TABLE stmt_trace;
    DROP TEMPORARY TABLE stmt_stages;
    IF (@sql IS NOT NULL) THEN
        SET @stmt := CONCAT("EXPLAIN FORMAT=JSON ", @sql);
        BEGIN
            -- Not all queries support EXPLAIN, so catch the cases that are
            -- not supported. Currently that includes cases where the table
            -- is not fully qualified and is not in the default schema for this
            -- procedure as it's not possible to change the default schema inside
            -- a procedure.
            --
            -- Errno = 1064: You have an error in your SQL syntax
            -- Errno = 1146: Table '...' doesn't exist
            DECLARE CONTINUE HANDLER FOR 1064, 1146 SET v_explain = false;
            PREPARE explain_stmt FROM @stmt;
        END;
        IF (v_explain) THEN
            EXECUTE explain_stmt;
            DEALLOCATE PREPARE explain_stmt;
        END IF;
    END IF;
    IF v_auto_enable THEN
        CALL sys.ps_setup_reload_saved();
    END IF;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabed = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    SET sql_log_bin = @log_bin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_trace_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_trace_thread`(
        IN in_thread_id BIGINT UNSIGNED,
        IN in_outfile VARCHAR(255),
        IN in_max_runtime DECIMAL(20,2),
        IN in_interval DECIMAL(20,2),
        IN in_start_fresh BOOLEAN,
        IN in_auto_setup BOOLEAN,
        IN in_debug BOOLEAN
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDumps all data within Performance Schema for an instrumented thread,\nto create a DOT formatted graph file. \n\nEach resultset returned from the procedure should be used for a complete graph\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_thread_id (BIGINT UNSIGNED):\n  The thread that you would like a stack trace for\nin_outfile  (VARCHAR(255)):\n  The filename the dot file will be written to\nin_max_runtime (DECIMAL(20,2)):\n  The maximum time to keep collecting data.\n  Use NULL to get the default which is 60 seconds.\nin_interval (DECIMAL(20,2)): \n  How long to sleep between data collections. \n  Use NULL to get the default which is 1 second.\nin_start_fresh (BOOLEAN):\n  Whether to reset all Performance Schema data before tracing.\nin_auto_setup (BOOLEAN):\n  Whether to disable all other threads and enable all consumers/instruments. \n  This will also reset the settings at the end of the run.\nin_debug (BOOLEAN):\n  Whether you would like to include file:lineno in the graph\n\nExample\n-----------\n\nmysql> CALL sys.ps_trace_thread(25, CONCAT(''/tmp/stack-'', REPLACE(NOW(), '' '', ''-''), ''.dot''), NULL, NULL, TRUE, TRUE, TRUE);\n+-------------------+\n| summary           |\n+-------------------+\n| Disabled 1 thread |\n+-------------------+\n1 row in set (0.00 sec)\n\n+---------------------------------------------+\n| Info                                        |\n+---------------------------------------------+\n| Data collection starting for THREAD_ID = 25 |\n+---------------------------------------------+\n1 row in set (0.03 sec)\n\n+-----------------------------------------------------------+\n| Info                                                      |\n+-----------------------------------------------------------+\n| Stack trace written to /tmp/stack-2014-02-16-21:18:41.dot |\n+-----------------------------------------------------------+\n1 row in set (60.07 sec)\n\n+-------------------------------------------------------------------+\n| Convert to PDF                                                    |\n+-------------------------------------------------------------------+\n| dot -Tpdf -o /tmp/stack_25.pdf /tmp/stack-2014-02-16-21:18:41.dot |\n+-------------------------------------------------------------------+\n1 row in set (60.07 sec)\n\n+-------------------------------------------------------------------+\n| Convert to PNG                                                    |\n+-------------------------------------------------------------------+\n| dot -Tpng -o /tmp/stack_25.png /tmp/stack-2014-02-16-21:18:41.dot |\n+-------------------------------------------------------------------+\n1 row in set (60.07 sec)\n\n+------------------+\n| summary          |\n+------------------+\n| Enabled 1 thread |\n+------------------+\n1 row in set (60.32 sec)\n'
BEGIN
    DECLARE v_done bool DEFAULT FALSE;
    DECLARE v_start, v_runtime DECIMAL(20,2) DEFAULT 0.0;
    DECLARE v_min_event_id bigint unsigned DEFAULT 0;
    DECLARE v_this_thread_enabed ENUM('YES', 'NO');
    DECLARE v_event longtext;
    DECLARE c_stack CURSOR FOR
        SELECT CONCAT(IF(nesting_event_id IS NOT NULL, CONCAT(nesting_event_id, ' -> '), ''), 
                    event_id, '; ', event_id, ' [label="',
                    -- Convert from picoseconds to microseconds
                    '(', format_pico_time(timer_wait), ') ',
                    IF (event_name NOT LIKE 'wait/io%', 
                        SUBSTRING_INDEX(event_name, '/', -2), 
                        IF (event_name NOT LIKE 'wait/io/file%' OR event_name NOT LIKE 'wait/io/socket%',
                            SUBSTRING_INDEX(event_name, '/', -4),
                            event_name)
                        ),
                    -- Always dump the extra wait information gathered for transactions and statements
                    IF (event_name LIKE 'transaction', IFNULL(CONCAT('\\n', wait_info), ''), ''),
                    IF (event_name LIKE 'statement/%', IFNULL(CONCAT('\\n', wait_info), ''), ''),
                    -- If debug is enabled, add the file:lineno information for waits
                    IF (in_debug AND event_name LIKE 'wait%', wait_info, ''),
                    '", ', 
                    -- Depending on the type of event, style appropriately
                    CASE WHEN event_name LIKE 'wait/io/file%' THEN 
                           'shape=box, style=filled, color=red'
                         WHEN event_name LIKE 'wait/io/table%' THEN 
                           'shape=box, style=filled, color=green'
                         WHEN event_name LIKE 'wait/io/socket%' THEN
                           'shape=box, style=filled, color=yellow'
                         WHEN event_name LIKE 'wait/synch/mutex%' THEN
                           'style=filled, color=lightskyblue'
                         WHEN event_name LIKE 'wait/synch/cond%' THEN
                           'style=filled, color=darkseagreen3'
                         WHEN event_name LIKE 'wait/synch/rwlock%' THEN
                           'style=filled, color=orchid'
                         WHEN event_name LIKE 'wait/synch/sxlock%' THEN
                           'style=filled, color=palevioletred' 
                         WHEN event_name LIKE 'wait/lock%' THEN
                           'shape=box, style=filled, color=tan'
                         WHEN event_name LIKE 'statement/%' THEN
                           CONCAT('shape=box, style=bold',
                                  -- Style statements depending on COM vs SQL
                                  CASE WHEN event_name LIKE 'statement/com/%' THEN
                                         ' style=filled, color=darkseagreen'
                                       ELSE
                                         -- Use long query time from the server to
                                         -- flag long running statements in red
                                         IF((timer_wait/1000000000000) > @@long_query_time, 
                                            ' style=filled, color=red', 
                                            ' style=filled, color=lightblue')
                                  END
                           )
                         WHEN event_name LIKE 'transaction' THEN
                           'shape=box, style=filled, color=lightblue3'
                         WHEN event_name LIKE 'stage/%' THEN
                           'style=filled, color=slategray3'
                         -- IDLE events are on their own, call attention to them
                         WHEN event_name LIKE '%idle%' THEN
                           'shape=box, style=filled, color=firebrick3'
                         ELSE '' END,
                     '];\n'
                   ) event, event_id
        FROM (
             -- Select all transactions
             (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id,
                     CONCAT('trx_id: ',  IFNULL(trx_id, ''), '\\n',
                            'gtid: ', IFNULL(gtid, ''), '\\n',
                            'state: ', state, '\\n',
                            'mode: ', access_mode, '\\n',
                            'isolation: ', isolation_level, '\\n',
                            'autocommit: ', autocommit, '\\n',
                            'savepoints: ', number_of_savepoints, '\\n'
                     ) AS wait_info
                FROM performance_schema.events_transactions_history_long
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
             UNION
             -- Select all statements, with the extra tracing information available
             (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, 
                     CONCAT('statement: ', sql_text, '\\n',
                            'errors: ', errors, '\\n',
                            'warnings: ', warnings, '\\n',
                            'lock time: ', format_pico_time(lock_time),'\\n',
                            'rows affected: ', rows_affected, '\\n',
                            'rows sent: ', rows_sent, '\\n',
                            'rows examined: ', rows_examined, '\\n',
                            'tmp tables: ', created_tmp_tables, '\\n',
                            'tmp disk tables: ', created_tmp_disk_tables, '\\n'
                            'select scan: ', select_scan, '\\n',
                            'select full join: ', select_full_join, '\\n',
                            'select full range join: ', select_full_range_join, '\\n',
                            'select range: ', select_range, '\\n',
                            'select range check: ', select_range_check, '\\n', 
                            'sort merge passes: ', sort_merge_passes, '\\n',
                            'sort rows: ', sort_rows, '\\n',
                            'sort range: ', sort_range, '\\n',
                            'sort scan: ', sort_scan, '\\n',
                            'no index used: ', IF(no_index_used, 'TRUE', 'FALSE'), '\\n',
                            'no good index used: ', IF(no_good_index_used, 'TRUE', 'FALSE'), '\\n'
                     ) AS wait_info
                FROM performance_schema.events_statements_history_long
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
             UNION
             -- Select all stages
             (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, null AS wait_info
                FROM performance_schema.events_stages_history_long 
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
             UNION 
             -- Select all events, adding information appropriate to the event
             (SELECT thread_id, event_id, 
                     CONCAT(event_name, 
                            IF(event_name NOT LIKE 'wait/synch/mutex%', IFNULL(CONCAT(' - ', operation), ''), ''), 
                            IF(number_of_bytes IS NOT NULL, CONCAT(' ', number_of_bytes, ' bytes'), ''),
                            IF(event_name LIKE 'wait/io/file%', '\\n', ''),
                            IF(object_schema IS NOT NULL, CONCAT('\\nObject: ', object_schema, '.'), ''), 
                            IF(object_name IS NOT NULL, 
                               IF (event_name LIKE 'wait/io/socket%',
                                   -- Print the socket if used, else the IP:port as reported
                                   CONCAT('\\n', IF (object_name LIKE ':0%', @@socket, object_name)),
                                   object_name),
                               ''
                            ),
                            IF(index_name IS NOT NULL, CONCAT(' Index: ', index_name), ''), '\\n'
                     ) AS event_name,
                     timer_wait, timer_start, nesting_event_id, source AS wait_info
                FROM performance_schema.events_waits_history_long
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
           ) events 
       ORDER BY event_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    -- Do not track the current thread, it will kill the stack
    SELECT INSTRUMENTED INTO v_this_thread_enabed FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    IF (in_auto_setup) THEN
        CALL sys.ps_setup_save(0);
        -- Ensure only the thread to create the stack trace for is instrumented and that we instrument everything.
        DELETE FROM performance_schema.setup_actors;
        UPDATE performance_schema.threads
           SET INSTRUMENTED = IF(THREAD_ID = in_thread_id, 'YES', 'NO');
        -- only the %_history_long tables and it ancestors are needed
        UPDATE performance_schema.setup_consumers
           SET ENABLED = 'YES'
         WHERE NAME NOT LIKE '%\_history';
        UPDATE performance_schema.setup_instruments
           SET ENABLED = 'YES',
               TIMED   = 'YES';
    END IF;
    IF (in_start_fresh) THEN
        TRUNCATE performance_schema.events_transactions_history_long;
        TRUNCATE performance_schema.events_statements_history_long;
        TRUNCATE performance_schema.events_stages_history_long;
        TRUNCATE performance_schema.events_waits_history_long;
    END IF;
    DROP TEMPORARY TABLE IF EXISTS tmp_events;
    CREATE TEMPORARY TABLE tmp_events (
      event_id bigint unsigned NOT NULL,
      event longblob,
      PRIMARY KEY (event_id)
    );
    -- Print headers for a .dot file
    INSERT INTO tmp_events VALUES (0, CONCAT('digraph events { rankdir=LR; nodesep=0.10;\n',
                                             '// Stack created .....: ', NOW(), '\n',
                                             '// MySQL version .....: ', VERSION(), '\n',
                                             '// MySQL hostname ....: ', @@hostname, '\n',
                                             '// MySQL port ........: ', @@port, '\n',
                                             '// MySQL socket ......: ', @@socket, '\n',
                                             '// MySQL user ........: ', CURRENT_USER(), '\n'));
    SELECT CONCAT('Data collection starting for THREAD_ID = ', in_thread_id) AS 'Info';
    SET v_min_event_id = 0,
        v_start        = UNIX_TIMESTAMP(),
        in_interval    = IFNULL(in_interval, 1.00),
        in_max_runtime = IFNULL(in_max_runtime, 60.00);
    WHILE (v_runtime < in_max_runtime
           AND (SELECT INSTRUMENTED FROM performance_schema.threads WHERE THREAD_ID = in_thread_id) = 'YES') DO
        SET v_done = FALSE;
        OPEN c_stack;
        c_stack_loop: LOOP
            FETCH c_stack INTO v_event, v_min_event_id;
            IF v_done THEN
                LEAVE c_stack_loop;
            END IF;
            IF (LENGTH(v_event) > 0) THEN
                INSERT INTO tmp_events VALUES (v_min_event_id, v_event);
            END IF;
        END LOOP;
        CLOSE c_stack;
        SELECT SLEEP(in_interval) INTO @sleep;
        SET v_runtime = (UNIX_TIMESTAMP() - v_start);
    END WHILE;
    INSERT INTO tmp_events VALUES (v_min_event_id+1, '}');
    SET @query = CONCAT('SELECT event FROM tmp_events ORDER BY event_id INTO OUTFILE ''', in_outfile, ''' FIELDS ESCAPED BY '''' LINES TERMINATED BY ''''');
    PREPARE stmt_output FROM @query;
    EXECUTE stmt_output;
    DEALLOCATE PREPARE stmt_output;
    SELECT CONCAT('Stack trace written to ', in_outfile) AS 'Info';
    SELECT CONCAT('dot -Tpdf -o /tmp/stack_', in_thread_id, '.pdf ', in_outfile) AS 'Convert to PDF';
    SELECT CONCAT('dot -Tpng -o /tmp/stack_', in_thread_id, '.png ', in_outfile) AS 'Convert to PNG';
    DROP TEMPORARY TABLE tmp_events;
    -- Reset the settings for the performance schema
    IF (in_auto_setup) THEN
        CALL sys.ps_setup_reload_saved();
    END IF;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabed = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    SET sql_log_bin = @log_bin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_truncate_all_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_truncate_all_tables`(
        IN in_verbose BOOLEAN
    )
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTruncates all summary tables within Performance Schema, \nresetting all aggregated instrumentation as a snapshot.\n\nParameters\n-----------\n\nin_verbose (BOOLEAN):\n  Whether to print each TRUNCATE statement before running\n\nExample\n-----------\n\nmysql> CALL sys.ps_truncate_all_tables(false);\n+---------------------+\n| summary             |\n+---------------------+\n| Truncated 44 tables |\n+---------------------+\n1 row in set (0.10 sec)\n\nQuery OK, 0 rows affected (0.10 sec)\n'
BEGIN
    DECLARE v_done INT DEFAULT FALSE;
    DECLARE v_total_tables INT DEFAULT 0;
    DECLARE v_ps_table VARCHAR(64);
    DECLARE ps_tables CURSOR FOR
        SELECT table_name 
          FROM INFORMATION_SCHEMA.TABLES 
         WHERE table_schema = 'performance_schema' 
           AND (table_name LIKE '%summary%' 
            OR table_name LIKE '%history%');
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN ps_tables;
    ps_tables_loop: LOOP
        FETCH ps_tables INTO v_ps_table;
        IF v_done THEN
          LEAVE ps_tables_loop;
        END IF;
        SET @truncate_stmt := CONCAT('TRUNCATE TABLE performance_schema.', v_ps_table);
        IF in_verbose THEN
            SELECT CONCAT('Running: ', @truncate_stmt) AS status;
        END IF;
        PREPARE truncate_stmt FROM @truncate_stmt;
        EXECUTE truncate_stmt;
        DEALLOCATE PREPARE truncate_stmt;
        SET v_total_tables = v_total_tables + 1;
    END LOOP;
    CLOSE ps_tables;
    SELECT CONCAT('Truncated ', v_total_tables, ' tables') AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `statement_performance_analyzer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `statement_performance_analyzer`(
        IN in_action ENUM('snapshot', 'overall', 'delta', 'create_table', 'create_tmp', 'save', 'cleanup'),
        IN in_table VARCHAR(129),
        IN in_views SET ('with_runtimes_in_95th_percentile', 'analysis', 'with_errors_or_warnings', 'with_full_table_scans', 'with_sorting', 'with_temp_tables', 'custom')
    )
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nCreate a report of the statements running on the server.\n\nThe views are calculated based on the overall and/or delta activity.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_action (ENUM(''snapshot'', ''overall'', ''delta'', ''create_tmp'', ''create_table'', ''save'', ''cleanup'')):\n  The action to take. Supported actions are:\n    * snapshot      Store a snapshot. The default is to make a snapshot of the current content of\n                    performance_schema.events_statements_summary_by_digest, but by setting in_table\n                    this can be overwritten to copy the content of the specified table.\n                    The snapshot is stored in the sys.tmp_digests temporary table.\n    * overall       Generate analyzis based on the content specified by in_table. For the overall analyzis,\n                    in_table can be NOW() to use a fresh snapshot. This will overwrite an existing snapshot.\n                    Use NULL for in_table to use the existing snapshot. If in_table IS NULL and no snapshot\n                    exists, a new will be created.\n                    See also in_views and @sys.statement_performance_analyzer.limit.\n    * delta         Generate a delta analysis. The delta will be calculated between the reference table in\n                    in_table and the snapshot. An existing snapshot must exist.\n                    The action uses the sys.tmp_digests_delta temporary table.\n                    See also in_views and @sys.statement_performance_analyzer.limit.\n    * create_table  Create a regular table suitable for storing the snapshot for later use, e.g. for\n                    calculating deltas.\n    * create_tmp    Create a temporary table suitable for storing the snapshot for later use, e.g. for\n                    calculating deltas.\n    * save          Save the snapshot in the table specified by in_table. The table must exists and have\n                    the correct structure.\n                    If no snapshot exists, a new is created.\n    * cleanup       Remove the temporary tables used for the snapshot and delta.\n\nin_table (VARCHAR(129)):\n  The table argument used for some actions. Use the format ''db1.t1'' or ''t1'' without using any backticks (`)\n  for quoting. Periods (.) are not supported in the database and table names.\n\n  The meaning of the table for each action supporting the argument is:\n\n    * snapshot      The snapshot is created based on the specified table. Set to NULL or NOW() to use\n                    the current content of performance_schema.events_statements_summary_by_digest.\n    * overall       The table with the content to create the overall analyzis for. The following values\n                    can be used:\n                      - A table name - use the content of that table.\n                      - NOW()        - create a fresh snapshot and overwrite the existing snapshot.\n                      - NULL         - use the last stored snapshot.\n    * delta         The table name is mandatory and specified the reference view to compare the currently\n                    stored snapshot against. If no snapshot exists, a new will be created.\n    * create_table  The name of the regular table to create.\n    * create_tmp    The name of the temporary table to create.\n    * save          The name of the table to save the currently stored snapshot into.\n\nin_views (SET (''with_runtimes_in_95th_percentile'', ''analysis'', ''with_errors_or_warnings'',\n               ''with_full_table_scans'', ''with_sorting'', ''with_temp_tables'', ''custom''))\n  Which views to include:\n\n    * with_runtimes_in_95th_percentile  Based on the sys.statements_with_runtimes_in_95th_percentile view\n    * analysis                          Based on the sys.statement_analysis view\n    * with_errors_or_warnings           Based on the sys.statements_with_errors_or_warnings view\n    * with_full_table_scans             Based on the sys.statements_with_full_table_scans view\n    * with_sorting                      Based on the sys.statements_with_sorting view\n    * with_temp_tables                  Based on the sys.statements_with_temp_tables view\n    * custom                            Use a custom view. This view must be specified in @sys.statement_performance_analyzer.view to an existing view or a query\n\nDefault is to include all except ''custom''.\n\n\nConfiguration Options\n----------------------\n\nsys.statement_performance_analyzer.limit\n  The maximum number of rows to include for the views that does not have a built-in limit (e.g. the 95th percentile view).\n  If not set the limit is 100.\n\nsys.statement_performance_analyzer.view\n  Used together with the ''custom'' view. If the value contains a space, it is considered a query, otherwise it must be\n  an existing view querying the performance_schema.events_statements_summary_by_digest table. There cannot be any limit\n  clause including in the query or view definition if @sys.statement_performance_analyzer.limit > 0.\n  If specifying a view, use the same format as for in_table.\n\nsys.debug\n  Whether to provide debugging output.\n  Default is ''OFF''. Set to ''ON'' to include.\n\n\nExample\n--------\n\nTo create a report with the queries in the 95th percentile since last truncate of performance_schema.events_statements_summary_by_digest\nand the delta for a 1 minute period:\n\n   1. Create a temporary table to store the initial snapshot.\n   2. Create the initial snapshot.\n   3. Save the initial snapshot in the temporary table.\n   4. Wait one minute.\n   5. Create a new snapshot.\n   6. Perform analyzis based on the new snapshot.\n   7. Perform analyzis based on the delta between the initial and new snapshots.\n\nmysql> CALL sys.statement_performance_analyzer(''create_tmp'', ''mydb.tmp_digests_ini'', NULL);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL);\nQuery OK, 0 rows affected (0.02 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''save'', ''mydb.tmp_digests_ini'', NULL);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DO SLEEP(60);\nQuery OK, 0 rows affected (1 min 0.00 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL);\nQuery OK, 0 rows affected (0.02 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''overall'', NULL, ''with_runtimes_in_95th_percentile'');\n+-----------------------------------------+\n| Next Output                             |\n+-----------------------------------------+\n| Queries with Runtime in 95th Percentile |\n+-----------------------------------------+\n1 row in set (0.05 sec)\n\n...\n\nmysql> CALL sys.statement_performance_analyzer(''delta'', ''mydb.tmp_digests_ini'', ''with_runtimes_in_95th_percentile'');\n+-----------------------------------------+\n| Next Output                             |\n+-----------------------------------------+\n| Queries with Runtime in 95th Percentile |\n+-----------------------------------------+\n1 row in set (0.03 sec)\n\n...\n\n\nTo create an overall report of the 95th percentile queries and the top 10 queries with full table scans:\n\nmysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SET @sys.statement_performance_analyzer.limit = 10;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''overall'', NULL, ''with_runtimes_in_95th_percentile,with_full_table_scans'');\n+-----------------------------------------+\n| Next Output                             |\n+-----------------------------------------+\n| Queries with Runtime in 95th Percentile |\n+-----------------------------------------+\n1 row in set (0.01 sec)\n\n...\n\n+-------------------------------------+\n| Next Output                         |\n+-------------------------------------+\n| Top 10 Queries with Full Table Scan |\n+-------------------------------------+\n1 row in set (0.09 sec)\n\n...\n\n\nUse a custom view showing the top 10 query sorted by total execution time refreshing the view every minute using\nthe watch command in Linux.\n\nmysql> CREATE OR REPLACE VIEW mydb.my_statements AS\n    -> SELECT sys.format_statement(DIGEST_TEXT) AS query,\n    ->        SCHEMA_NAME AS db,\n    ->        COUNT_STAR AS exec_count,\n    ->        format_pico_time(SUM_TIMER_WAIT) AS total_latency,\n    ->        format_pico_time(AVG_TIMER_WAIT) AS avg_latency,\n    ->        ROUND(IFNULL(SUM_ROWS_SENT / NULLIF(COUNT_STAR, 0), 0)) AS rows_sent_avg,\n    ->        ROUND(IFNULL(SUM_ROWS_EXAMINED / NULLIF(COUNT_STAR, 0), 0)) AS rows_examined_avg,\n    ->        ROUND(IFNULL(SUM_ROWS_AFFECTED / NULLIF(COUNT_STAR, 0), 0)) AS rows_affected_avg,\n    ->        DIGEST AS digest\n    ->   FROM performance_schema.events_statements_summary_by_digest\n    -> ORDER BY SUM_TIMER_WAIT DESC;\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''create_table'', ''mydb.digests_prev'', NULL);\nQuery OK, 0 rows affected (0.10 sec)\n\nshell$ watch -n 60 "mysql sys --table -e "\n> SET @sys.statement_performance_analyzer.view = ''mydb.my_statements'';\n> SET @sys.statement_performance_analyzer.limit = 10;\n> CALL statement_performance_analyzer(''snapshot'', NULL, NULL);\n> CALL statement_performance_analyzer(''delta'', ''mydb.digests_prev'', ''custom'');\n> CALL statement_performance_analyzer(''save'', ''mydb.digests_prev'', NULL);\n> ""\n\nEvery 60.0s: mysql sys --table -e "                                                                                                   ...  Mon Dec 22 10:58:51 2014\n\n+----------------------------------+\n| Next Output                      |\n+----------------------------------+\n| Top 10 Queries Using Custom View |\n+----------------------------------+\n+-------------------+-------+------------+---------------+-------------+---------------+-------------------+-------------------+----------------------------------+\n| query             | db    | exec_count | total_latency | avg_latency | rows_sent_avg | rows_examined_avg | rows_affected_avg | digest                           |\n+-------------------+-------+------------+---------------+-------------+---------------+-------------------+-------------------+----------------------------------+\n...\n'
BEGIN
    DECLARE v_table_exists, v_tmp_digests_table_exists, v_custom_view_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY') DEFAULT '';
    DECLARE v_this_thread_enabled ENUM('YES', 'NO');
    DECLARE v_force_new_snapshot BOOLEAN DEFAULT FALSE;
    DECLARE v_digests_table VARCHAR(133);
    DECLARE v_quoted_table, v_quoted_custom_view VARCHAR(133) DEFAULT '';
    DECLARE v_table_db, v_table_name, v_custom_db, v_custom_name VARCHAR(64);
    DECLARE v_digest_table_template, v_checksum_ref, v_checksum_table text;
    DECLARE v_sql longtext;
    -- Maximum supported length for MESSAGE_TEXT with the SIGNAL command is 128 chars.
    DECLARE v_error_msg VARCHAR(128);
    DECLARE v_old_group_concat_max_len INT UNSIGNED DEFAULT 0;
    -- Don't instrument this thread
    SELECT INSTRUMENTED INTO v_this_thread_enabled FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    END IF;
    -- Temporary table are used - disable sql_log_bin if necessary to prevent them replicating
    SET @log_bin := @@sql_log_bin;
    IF (@log_bin = 1) THEN
        SET sql_log_bin = 0;
    END IF;
    -- Set configuration options
    IF (@sys.statement_performance_analyzer.limit IS NULL) THEN
        SET @sys.statement_performance_analyzer.limit = sys.sys_get_config('statement_performance_analyzer.limit', '100');
    END IF;
    IF (@sys.debug IS NULL) THEN
        SET @sys.debug                                = sys.sys_get_config('debug'                               , 'OFF');
    END IF;
    -- If in_table is set, break in_table into a db and table component and check whether it exists
    -- in_table = NOW() is considered like it's not set.
    IF (in_table = 'NOW()') THEN
        SET v_force_new_snapshot = TRUE,
            in_table             = NULL;
    ELSEIF (in_table IS NOT NULL) THEN
        IF (NOT INSTR(in_table, '.')) THEN
            -- No . in the table name - use current database
            -- DATABASE() will be the database of the procedure
            SET v_table_db   = DATABASE(),
                v_table_name = in_table;
        ELSE
            SET v_table_db   = SUBSTRING_INDEX(in_table, '.', 1);
            SET v_table_name = SUBSTRING(in_table, CHAR_LENGTH(v_table_db)+2);
        END IF;
        SET v_quoted_table = CONCAT('`', v_table_db, '`.`', v_table_name, '`');
        IF (@sys.debug = 'ON') THEN
            SELECT CONCAT('in_table is: db = ''', v_table_db, ''', table = ''', v_table_name, '''') AS 'Debug';
        END IF;
        IF (v_table_db = DATABASE() AND (v_table_name = 'tmp_digests' OR v_table_name = 'tmp_digests_delta')) THEN
            SET v_error_msg = CONCAT('Invalid value for in_table: ', v_quoted_table, ' is reserved table name.');
            SIGNAL SQLSTATE '45000'
               SET MESSAGE_TEXT = v_error_msg;
        END IF;
        CALL sys.table_exists(v_table_db, v_table_name, v_table_exists);
        IF (@sys.debug = 'ON') THEN
            SELECT CONCAT('v_table_exists = ', v_table_exists) AS 'Debug';
        END IF;
        IF (v_table_exists = 'BASE TABLE') THEN
            SET v_old_group_concat_max_len = @@session.group_concat_max_len;
            SET @@session.group_concat_max_len = 2048;
            -- Verify that the table has the correct table definition
            -- This can only be done for base tables as temporary aren't in information_schema.COLUMNS.
            -- This also minimises the risk of using a production table.
            SET v_checksum_ref = (
                 SELECT GROUP_CONCAT(CONCAT(COLUMN_NAME, COLUMN_TYPE) ORDER BY ORDINAL_POSITION) AS Checksum
                   FROM information_schema.COLUMNS
                  WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'events_statements_summary_by_digest'
                ),
                v_checksum_table = (
                 SELECT GROUP_CONCAT(CONCAT(COLUMN_NAME, COLUMN_TYPE) ORDER BY ORDINAL_POSITION) AS Checksum
                   FROM information_schema.COLUMNS
                  WHERE TABLE_SCHEMA = v_table_db AND TABLE_NAME = v_table_name
                );
            SET @@session.group_concat_max_len = v_old_group_concat_max_len;
            IF (v_checksum_ref <> v_checksum_table) THEN
                -- The table does not have the correct definition, so abandon
                SET v_error_msg = CONCAT('The table ',
                                         IF(CHAR_LENGTH(v_quoted_table) > 93, CONCAT('...', SUBSTRING(v_quoted_table, -90)), v_quoted_table),
                                         ' has the wrong definition.');
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
        END IF;
    END IF;
    IF (in_views IS NULL OR in_views = '') THEN
        -- Set to default
        SET in_views = 'with_runtimes_in_95th_percentile,analysis,with_errors_or_warnings,with_full_table_scans,with_sorting,with_temp_tables';
    END IF;
    -- Validate settings
    CALL sys.table_exists(DATABASE(), 'tmp_digests', v_tmp_digests_table_exists);
    IF (@sys.debug = 'ON') THEN
        SELECT CONCAT('v_tmp_digests_table_exists = ', v_tmp_digests_table_exists) AS 'Debug';
    END IF;
    CASE
        WHEN in_action IN ('snapshot', 'overall') THEN
            -- in_table must be NULL, NOW(), or an existing table
            IF (in_table IS NOT NULL) THEN
                IF (NOT v_table_exists IN ('TEMPORARY', 'BASE TABLE')) THEN
                    SET v_error_msg = CONCAT('The ', in_action, ' action requires in_table to be NULL, NOW() or specify an existing table.',
                                             ' The table ',
                                             IF(CHAR_LENGTH(v_quoted_table) > 16, CONCAT('...', SUBSTRING(v_quoted_table, -13)), v_quoted_table),
                                             ' does not exist.');
                    SIGNAL SQLSTATE '45000'
                       SET MESSAGE_TEXT = v_error_msg;
                END IF;
            END IF;
        WHEN in_action IN ('delta', 'save') THEN
            -- in_table must be an existing table
            IF (v_table_exists NOT IN ('TEMPORARY', 'BASE TABLE')) THEN
                SET v_error_msg = CONCAT('The ', in_action, ' action requires in_table to be an existing table.',
                                         IF(in_table IS NOT NULL, CONCAT(' The table ',
                                             IF(CHAR_LENGTH(v_quoted_table) > 39, CONCAT('...', SUBSTRING(v_quoted_table, -36)), v_quoted_table),
                                             ' does not exist.'), ''));
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
            IF (in_action = 'delta' AND v_tmp_digests_table_exists <> 'TEMPORARY') THEN
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = 'An existing snapshot generated with the statement_performance_analyzer() must exist.';
            END IF;
        WHEN in_action = 'create_tmp' THEN
            -- in_table must not exists as a temporary table
            IF (v_table_exists = 'TEMPORARY') THEN
                SET v_error_msg = CONCAT('Cannot create the table ',
                                         IF(CHAR_LENGTH(v_quoted_table) > 72, CONCAT('...', SUBSTRING(v_quoted_table, -69)), v_quoted_table),
                                         ' as it already exists.');
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
        WHEN in_action = 'create_table' THEN
            -- in_table must not exists at all
            IF (v_table_exists <> '') THEN
                SET v_error_msg = CONCAT('Cannot create the table ',
                                         IF(CHAR_LENGTH(v_quoted_table) > 52, CONCAT('...', SUBSTRING(v_quoted_table, -49)), v_quoted_table),
                                         ' as it already exists',
                                         IF(v_table_exists = 'TEMPORARY', ' as a temporary table.', '.'));
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
        WHEN in_action = 'cleanup' THEN
            -- doesn't use any of the arguments
            DO (SELECT 1);
        ELSE
            SIGNAL SQLSTATE '45000'
               SET MESSAGE_TEXT = 'Unknown action. Supported actions are: cleanup, create_table, create_tmp, delta, overall, save, snapshot';
    END CASE;
    SET v_digest_table_template = 'CREATE %{TEMPORARY}TABLE %{TABLE_NAME} (
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `DIGEST` varchar(64) DEFAULT NULL,
  `DIGEST_TEXT` longtext,
  `COUNT_STAR` bigint unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_LOCK_TIME` bigint unsigned NOT NULL,
  `SUM_ERRORS` bigint unsigned NOT NULL,
  `SUM_WARNINGS` bigint unsigned NOT NULL,
  `SUM_ROWS_AFFECTED` bigint unsigned NOT NULL,
  `SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint unsigned NOT NULL,
  `SUM_SELECT_SCAN` bigint unsigned NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint unsigned NOT NULL,
  `SUM_SORT_RANGE` bigint unsigned NOT NULL,
  `SUM_SORT_ROWS` bigint unsigned NOT NULL,
  `SUM_SORT_SCAN` bigint unsigned NOT NULL,
  `SUM_NO_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint unsigned NOT NULL,
  `FIRST_SEEN` timestamp(6) NULL DEFAULT NULL,
  `LAST_SEEN` timestamp(6) NULL DEFAULT NULL,
  `QUANTILE_95` bigint unsigned NOT NULL,
  `QUANTILE_99` bigint unsigned NOT NULL,
  `QUANTILE_999` bigint unsigned NOT NULL,
  `QUERY_SAMPLE_TEXT` longtext,
  `QUERY_SAMPLE_SEEN` timestamp(6) NULL DEFAULT NULL,
  `QUERY_SAMPLE_TIMER_WAIT` bigint unsigned NOT NULL,
  INDEX (SCHEMA_NAME, DIGEST)
) DEFAULT CHARSET=utf8mb4';
    -- Do the action
    -- The actions snapshot, ... requires a fresh snapshot - create it now
    IF (v_force_new_snapshot
           OR in_action = 'snapshot'
           OR (in_action = 'overall' AND in_table IS NULL)
           OR (in_action = 'save' AND v_tmp_digests_table_exists <> 'TEMPORARY')
       ) THEN
        IF (v_tmp_digests_table_exists = 'TEMPORARY') THEN
            IF (@sys.debug = 'ON') THEN
                SELECT 'DROP TEMPORARY TABLE IF EXISTS tmp_digests' AS 'Debug';
            END IF;
            DROP TEMPORARY TABLE IF EXISTS tmp_digests;
        END IF;
        CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', 'TEMPORARY '), '%{TABLE_NAME}', 'tmp_digests'));
        SET v_sql = CONCAT('INSERT INTO tmp_digests SELECT * FROM ',
                           IF(in_table IS NULL OR in_action = 'save', 'performance_schema.events_statements_summary_by_digest', v_quoted_table));
        CALL sys.execute_prepared_stmt(v_sql);
    END IF;
    -- Go through the remaining actions
    IF (in_action IN ('create_table', 'create_tmp')) THEN
        IF (in_action = 'create_table') THEN
            CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', ''), '%{TABLE_NAME}', v_quoted_table));
        ELSE
            CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', 'TEMPORARY '), '%{TABLE_NAME}', v_quoted_table));
        END IF;
    ELSEIF (in_action = 'save') THEN
        CALL sys.execute_prepared_stmt(CONCAT('DELETE FROM ', v_quoted_table));
        CALL sys.execute_prepared_stmt(CONCAT('INSERT INTO ', v_quoted_table, ' SELECT * FROM tmp_digests'));
    ELSEIF (in_action = 'cleanup') THEN
        DROP TEMPORARY TABLE IF EXISTS sys.tmp_digests;
        DROP TEMPORARY TABLE IF EXISTS sys.tmp_digests_delta;
    ELSEIF (in_action IN ('overall', 'delta')) THEN
        -- These are almost the same - for delta calculate the delta in tmp_digests_delta and use that instead of tmp_digests.
        -- And overall allows overriding the table to use.
        IF (in_action = 'overall') THEN
            IF (in_table IS NULL) THEN
                SET v_digests_table = 'tmp_digests';
            ELSE
                SET v_digests_table = v_quoted_table;
            END IF;
        ELSE
            SET v_digests_table = 'tmp_digests_delta';
            DROP TEMPORARY TABLE IF EXISTS tmp_digests_delta;
            CREATE TEMPORARY TABLE tmp_digests_delta LIKE tmp_digests;
            SET v_sql = CONCAT('INSERT INTO tmp_digests_delta
SELECT `d_end`.`SCHEMA_NAME`,
       `d_end`.`DIGEST`,
       `d_end`.`DIGEST_TEXT`,
       `d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0) AS ''COUNT_STAR'',
       `d_end`.`SUM_TIMER_WAIT`-IFNULL(`d_start`.`SUM_TIMER_WAIT`, 0) AS ''SUM_TIMER_WAIT'',
       `d_end`.`MIN_TIMER_WAIT` AS ''MIN_TIMER_WAIT'',
       IFNULL((`d_end`.`SUM_TIMER_WAIT`-IFNULL(`d_start`.`SUM_TIMER_WAIT`, 0))/NULLIF(`d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0), 0), 0) AS ''AVG_TIMER_WAIT'',
       `d_end`.`MAX_TIMER_WAIT` AS ''MAX_TIMER_WAIT'',
       `d_end`.`SUM_LOCK_TIME`-IFNULL(`d_start`.`SUM_LOCK_TIME`, 0) AS ''SUM_LOCK_TIME'',
       `d_end`.`SUM_ERRORS`-IFNULL(`d_start`.`SUM_ERRORS`, 0) AS ''SUM_ERRORS'',
       `d_end`.`SUM_WARNINGS`-IFNULL(`d_start`.`SUM_WARNINGS`, 0) AS ''SUM_WARNINGS'',
       `d_end`.`SUM_ROWS_AFFECTED`-IFNULL(`d_start`.`SUM_ROWS_AFFECTED`, 0) AS ''SUM_ROWS_AFFECTED'',
       `d_end`.`SUM_ROWS_SENT`-IFNULL(`d_start`.`SUM_ROWS_SENT`, 0) AS ''SUM_ROWS_SENT'',
       `d_end`.`SUM_ROWS_EXAMINED`-IFNULL(`d_start`.`SUM_ROWS_EXAMINED`, 0) AS ''SUM_ROWS_EXAMINED'',
       `d_end`.`SUM_CREATED_TMP_DISK_TABLES`-IFNULL(`d_start`.`SUM_CREATED_TMP_DISK_TABLES`, 0) AS ''SUM_CREATED_TMP_DISK_TABLES'',
       `d_end`.`SUM_CREATED_TMP_TABLES`-IFNULL(`d_start`.`SUM_CREATED_TMP_TABLES`, 0) AS ''SUM_CREATED_TMP_TABLES'',
       `d_end`.`SUM_SELECT_FULL_JOIN`-IFNULL(`d_start`.`SUM_SELECT_FULL_JOIN`, 0) AS ''SUM_SELECT_FULL_JOIN'',
       `d_end`.`SUM_SELECT_FULL_RANGE_JOIN`-IFNULL(`d_start`.`SUM_SELECT_FULL_RANGE_JOIN`, 0) AS ''SUM_SELECT_FULL_RANGE_JOIN'',
       `d_end`.`SUM_SELECT_RANGE`-IFNULL(`d_start`.`SUM_SELECT_RANGE`, 0) AS ''SUM_SELECT_RANGE'',
       `d_end`.`SUM_SELECT_RANGE_CHECK`-IFNULL(`d_start`.`SUM_SELECT_RANGE_CHECK`, 0) AS ''SUM_SELECT_RANGE_CHECK'',
       `d_end`.`SUM_SELECT_SCAN`-IFNULL(`d_start`.`SUM_SELECT_SCAN`, 0) AS ''SUM_SELECT_SCAN'',
       `d_end`.`SUM_SORT_MERGE_PASSES`-IFNULL(`d_start`.`SUM_SORT_MERGE_PASSES`, 0) AS ''SUM_SORT_MERGE_PASSES'',
       `d_end`.`SUM_SORT_RANGE`-IFNULL(`d_start`.`SUM_SORT_RANGE`, 0) AS ''SUM_SORT_RANGE'',
       `d_end`.`SUM_SORT_ROWS`-IFNULL(`d_start`.`SUM_SORT_ROWS`, 0) AS ''SUM_SORT_ROWS'',
       `d_end`.`SUM_SORT_SCAN`-IFNULL(`d_start`.`SUM_SORT_SCAN`, 0) AS ''SUM_SORT_SCAN'',
       `d_end`.`SUM_NO_INDEX_USED`-IFNULL(`d_start`.`SUM_NO_INDEX_USED`, 0) AS ''SUM_NO_INDEX_USED'',
       `d_end`.`SUM_NO_GOOD_INDEX_USED`-IFNULL(`d_start`.`SUM_NO_GOOD_INDEX_USED`, 0) AS ''SUM_NO_GOOD_INDEX_USED'',
       `d_end`.`FIRST_SEEN`,
       `d_end`.`LAST_SEEN`,
       `d_end`.`QUANTILE_95`,
       `d_end`.`QUANTILE_99`,
       `d_end`.`QUANTILE_999`,
       `d_end`.`QUERY_SAMPLE_TEXT`,
       `d_end`.`QUERY_SAMPLE_SEEN`,
       `d_end`.`QUERY_SAMPLE_TIMER_WAIT`
  FROM tmp_digests d_end
       LEFT OUTER JOIN ', v_quoted_table, ' d_start ON `d_start`.`DIGEST` = `d_end`.`DIGEST`
                                                    AND (`d_start`.`SCHEMA_NAME` = `d_end`.`SCHEMA_NAME`
                                                          OR (`d_start`.`SCHEMA_NAME` IS NULL AND `d_end`.`SCHEMA_NAME` IS NULL)
                                                        )
 WHERE `d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0) > 0');
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_runtimes_in_95th_percentile', in_views)) THEN
            SELECT 'Queries with Runtime in 95th Percentile' AS 'Next Output';
            DROP TEMPORARY TABLE IF EXISTS tmp_digest_avg_latency_distribution1;
            DROP TEMPORARY TABLE IF EXISTS tmp_digest_avg_latency_distribution2;
            DROP TEMPORARY TABLE IF EXISTS tmp_digest_95th_percentile_by_avg_us;
            CREATE TEMPORARY TABLE tmp_digest_avg_latency_distribution1 (
              cnt bigint unsigned NOT NULL,
              avg_us decimal(21,0) NOT NULL,
              PRIMARY KEY (avg_us)
            ) ENGINE=InnoDB;
            SET v_sql = CONCAT('INSERT INTO tmp_digest_avg_latency_distribution1
SELECT COUNT(*) cnt,
       ROUND(avg_timer_wait/1000000) AS avg_us
  FROM ', v_digests_table, '
 GROUP BY avg_us');
            CALL sys.execute_prepared_stmt(v_sql);
            CREATE TEMPORARY TABLE tmp_digest_avg_latency_distribution2 LIKE tmp_digest_avg_latency_distribution1;
            INSERT INTO tmp_digest_avg_latency_distribution2 SELECT * FROM tmp_digest_avg_latency_distribution1;
            CREATE TEMPORARY TABLE tmp_digest_95th_percentile_by_avg_us (
              avg_us decimal(21,0) NOT NULL,
              percentile decimal(46,4) NOT NULL,
              PRIMARY KEY (avg_us)
            ) ENGINE=InnoDB;
            SET v_sql = CONCAT('INSERT INTO tmp_digest_95th_percentile_by_avg_us
SELECT s2.avg_us avg_us,
       IFNULL(SUM(s1.cnt)/NULLIF((SELECT COUNT(*) FROM ', v_digests_table, '), 0), 0) percentile
  FROM tmp_digest_avg_latency_distribution1 AS s1
       JOIN tmp_digest_avg_latency_distribution2 AS s2 ON s1.avg_us <= s2.avg_us
 GROUP BY s2.avg_us
HAVING percentile > 0.95
 ORDER BY percentile
 LIMIT 1');
            CALL sys.execute_prepared_stmt(v_sql);
            SET v_sql =
                REPLACE(
                    REPLACE(
                        (SELECT VIEW_DEFINITION
                           FROM information_schema.VIEWS
                          WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_runtimes_in_95th_percentile'
                        ),
                        '`performance_schema`.`events_statements_summary_by_digest`',
                        v_digests_table
                    ),
                    'sys.x$ps_digest_95th_percentile_by_avg_us',
                    '`sys`.`x$ps_digest_95th_percentile_by_avg_us`'
              );
            CALL sys.execute_prepared_stmt(v_sql);
            DROP TEMPORARY TABLE tmp_digest_avg_latency_distribution1;
            DROP TEMPORARY TABLE tmp_digest_avg_latency_distribution2;
            DROP TEMPORARY TABLE tmp_digest_95th_percentile_by_avg_us;
        END IF;
        IF (FIND_IN_SET('analysis', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries Ordered by Total Latency') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statement_analysis'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_errors_or_warnings', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Errors') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_errors_or_warnings'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_full_table_scans', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Full Table Scan') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_full_table_scans'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_sorting', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Sorting') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_sorting'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_temp_tables', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Internal Temporary Tables') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_temp_tables'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('custom', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries Using Custom View') AS 'Next Output';
            IF (@sys.statement_performance_analyzer.view IS NULL) THEN
                SET @sys.statement_performance_analyzer.view = sys.sys_get_config('statement_performance_analyzer.view', NULL);
            END IF;
            IF (@sys.statement_performance_analyzer.view IS NULL) THEN
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = 'The @sys.statement_performance_analyzer.view user variable must be set with the view or query to use.';
            END IF;
            IF (NOT INSTR(@sys.statement_performance_analyzer.view, ' ')) THEN
                -- No spaces, so can't be a query
                IF (NOT INSTR(@sys.statement_performance_analyzer.view, '.')) THEN
                    -- No . in the table name - use current database
                    -- DATABASE() will be the database of the procedure
                    SET v_custom_db   = DATABASE(),
                        v_custom_name = @sys.statement_performance_analyzer.view;
                ELSE
                    SET v_custom_db   = SUBSTRING_INDEX(@sys.statement_performance_analyzer.view, '.', 1);
                    SET v_custom_name = SUBSTRING(@sys.statement_performance_analyzer.view, CHAR_LENGTH(v_custom_db)+2);
                END IF;
                CALL sys.table_exists(v_custom_db, v_custom_name, v_custom_view_exists);
                IF (v_custom_view_exists <> 'VIEW') THEN
                    SIGNAL SQLSTATE '45000'
                       SET MESSAGE_TEXT = 'The @sys.statement_performance_analyzer.view user variable is set but specified neither an existing view nor a query.';
                END IF;
                SET v_sql =
                    REPLACE(
                        (SELECT VIEW_DEFINITION
                           FROM information_schema.VIEWS
                          WHERE TABLE_SCHEMA = v_custom_db AND TABLE_NAME = v_custom_name
                        ),
                        '`performance_schema`.`events_statements_summary_by_digest`',
                        v_digests_table
                    );
            ELSE
                SET v_sql = REPLACE(@sys.statement_performance_analyzer.view, '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table);
            END IF;
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
    END IF;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    IF (@log_bin = 1) THEN
        SET sql_log_bin = @log_bin;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `table_exists`(
        IN in_db VARCHAR(64), IN in_table VARCHAR(64),
        OUT out_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY')
    )
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTests whether the table specified in in_db and in_table exists either as a regular\ntable, or as a temporary table. The returned value corresponds to the table that\nwill be used, so if there''s both a temporary and a permanent table with the given\nname, then ''TEMPORARY'' will be returned.\n\nParameters\n-----------\n\nin_db (VARCHAR(64)):\n  The database name to check for the existance of the table in.\n\nin_table (VARCHAR(64)):\n  The name of the table to check the existance of.\n\nout_exists ENUM('''', ''BASE TABLE'', ''VIEW'', ''TEMPORARY''):\n  The return value: whether the table exists. The value is one of:\n    * ''''           - the table does not exist neither as a base table, view, nor temporary table.\n    * ''BASE TABLE'' - the table name exists as a permanent base table table.\n    * ''VIEW''       - the table name exists as a view.\n    * ''TEMPORARY''  - the table name exists as a temporary table.\n\nExample\n--------\n\nmysql> CREATE DATABASE db1;\nQuery OK, 1 row affected (0.07 sec)\n\nmysql> use db1;\nDatabase changed\nmysql> CREATE TABLE t1 (id INT PRIMARY KEY);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> CREATE TABLE t2 (id INT PRIMARY KEY);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> CREATE view v_t1 AS SELECT * FROM t1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CREATE TEMPORARY TABLE t1 (id INT PRIMARY KEY);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''t1'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.00 sec)\n\n+------------+\n| @exists    |\n+------------+\n| TEMPORARY  |\n+------------+\n1 row in set (0.00 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''t2'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.00 sec)\n\n+------------+\n| @exists    |\n+------------+\n| BASE TABLE |\n+------------+\n1 row in set (0.01 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''v_t1'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.00 sec)\n\n+---------+\n| @exists |\n+---------+\n| VIEW    |\n+---------+\n1 row in set (0.00 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''t3'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.01 sec)\n\n+---------+\n| @exists |\n+---------+\n|         |\n+---------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_error BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR 1050 SET v_error = TRUE;
    DECLARE CONTINUE HANDLER FOR 1146 SET v_error = TRUE;
    SET out_exists = '';
    -- Verify whether the table name exists as a normal table
    IF (EXISTS(SELECT 1 FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table)) THEN
        -- Unfortunately the only way to determine whether there is also a temporary table is to try to create
        -- a temporary table with the same name. If it succeeds the table didn't exist as a temporary table.
        SET @sys.tmp.table_exists.SQL = CONCAT('CREATE TEMPORARY TABLE `', in_db, '`.`', in_table, '` (id INT PRIMARY KEY)');
        PREPARE stmt_create_table FROM @sys.tmp.table_exists.SQL;
        EXECUTE stmt_create_table;
        DEALLOCATE PREPARE stmt_create_table;
        IF (v_error) THEN
            SET out_exists = 'TEMPORARY';
        ELSE
            -- The temporary table was created, i.e. it didn't exist. Remove it again so we don't leave garbage around.
            SET @sys.tmp.table_exists.SQL = CONCAT('DROP TEMPORARY TABLE `', in_db, '`.`', in_table, '`');
            PREPARE stmt_drop_table FROM @sys.tmp.table_exists.SQL;
            EXECUTE stmt_drop_table;
            DEALLOCATE PREPARE stmt_drop_table;
            SET out_exists = (SELECT TABLE_TYPE FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table);
        END IF;
    ELSE
        -- Check whether a temporary table exists with the same name.
        -- If it does it's possible to SELECT from the table without causing an error.
        -- If it does not exist even a PREPARE using the table will fail.
        SET @sys.tmp.table_exists.SQL = CONCAT('SELECT COUNT(*) FROM `', in_db, '`.`', in_table, '`');
        PREPARE stmt_select FROM @sys.tmp.table_exists.SQL;
        IF (NOT v_error) THEN
            DEALLOCATE PREPARE stmt_select;
            SET out_exists = 'TEMPORARY';
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `host_summary`
--

/*!50001 DROP VIEW IF EXISTS `host_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary` (`host`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_users`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,format_pico_time(sum(`stmt`.`total_latency`)) AS `statement_latency`,format_pico_time(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,format_pico_time(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,format_bytes(sum(`mem`.`current_allocated`)) AS `current_memory`,format_bytes(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_file_io` (`host`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_file_io_type` (`host`,`event_name`,`total`,`total_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_stages` (`host`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_statement_latency` (`host`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_statement_type` (`host`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_buffer_stats_by_schema`
--

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_buffer_stats_by_schema` (`object_schema`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,format_bytes(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,format_bytes(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_buffer_stats_by_table`
--

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_buffer_stats_by_table` (`object_schema`,`object_name`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,format_bytes(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,format_bytes(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_lock_waits` (`wait_started`,`wait_age`,`wait_age_secs`,`locked_table`,`locked_table_schema`,`locked_table_name`,`locked_table_partition`,`locked_table_subpartition`,`locked_index`,`locked_type`,`waiting_trx_id`,`waiting_trx_started`,`waiting_trx_age`,`waiting_trx_rows_locked`,`waiting_trx_rows_modified`,`waiting_pid`,`waiting_query`,`waiting_lock_id`,`waiting_lock_mode`,`blocking_trx_id`,`blocking_pid`,`blocking_query`,`blocking_lock_id`,`blocking_lock_mode`,`blocking_trx_started`,`blocking_trx_age`,`blocking_trx_rows_locked`,`blocking_trx_rows_modified`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,concat(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`),'.',`sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,`rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,`rl`.`OBJECT_NAME` AS `locked_table_name`,`rl`.`PARTITION_NAME` AS `locked_table_partition`,`rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,`rl`.`INDEX_NAME` AS `locked_index`,`rl`.`LOCK_TYPE` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`sys`.`format_statement`(`r`.`trx_query`) AS `waiting_query`,`rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,`rl`.`LOCK_MODE` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`sys`.`format_statement`(`b`.`trx_query`) AS `blocking_query`,`bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,`bl`.`LOCK_MODE` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`performance_schema`.`data_lock_waits` `w` join `information_schema`.`INNODB_TRX` `b` on((`b`.`trx_id` = cast(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `information_schema`.`INNODB_TRX` `r` on((`r`.`trx_id` = cast(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `performance_schema`.`data_locks` `bl` on((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`))) join `performance_schema`.`data_locks` `rl` on((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`))) order by `r`.`trx_wait_started` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_by_thread_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_by_thread_by_latency` (`user`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`thread_id`,`processlist_id`) AS select if((`performance_schema`.`threads`.`PROCESSLIST_ID` is null),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',convert(`performance_schema`.`threads`.`PROCESSLIST_HOST` using utf8mb4))) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`)) AS `avg_latency`,format_pico_time(max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_file_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_file_by_bytes` (`file`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_write`,`total`,`write_pct`) AS select `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00)) AS `avg_write`,format_bytes((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`)) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_file_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_file_by_latency` (`file`,`total`,`total_latency`,`count_read`,`read_latency`,`count_write`,`write_latency`,`count_misc`,`misc_latency`) AS select `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_wait_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_wait_by_bytes` (`event_name`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`,`total_requested`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written`,format_bytes((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`)) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_wait_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_wait_by_latency` (`event_name`,`total`,`total_latency`,`avg_latency`,`max_latency`,`read_latency`,`write_latency`,`misc_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ`) AS `read_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE`) AS `write_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC`) AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_file_io`
--

/*!50001 DROP VIEW IF EXISTS `latest_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `latest_file_io` (`thread`,`file`,`latency`,`operation`,`requested`) AS select if((`information_schema`.`processlist`.`ID` is null),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),convert(concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`) using utf8mb4)) AS `thread`,`sys`.`format_path`(`performance_schema`.`events_waits_history_long`.`OBJECT_NAME`) AS `file`,format_pico_time(`performance_schema`.`events_waits_history_long`.`TIMER_WAIT`) AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,format_bytes(`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES`) AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`PROCESSLIST` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_host_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_thread_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_thread_by_current_bytes` (`thread_id`,`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select `mt`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `mt`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_user_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_user_by_current_bytes` (`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_global_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_global_by_current_bytes` (`event_name`,`current_count`,`current_alloc`,`current_avg_alloc`,`high_count`,`high_alloc`,`high_avg_alloc`) AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_alloc`,format_bytes(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0)) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED`) AS `high_alloc`,format_bytes(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0)) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_global_total`
--

/*!50001 DROP VIEW IF EXISTS `memory_global_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_global_total` (`total_allocated`) AS select format_bytes(sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `metrics`
--

/*!50001 DROP VIEW IF EXISTS `metrics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `metrics` (`Variable_name`,`Variable_value`,`Type`,`Enabled`) AS select lower(`performance_schema`.`global_status`.`VARIABLE_NAME`) AS `Variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `Variable_value`,'Global Status' AS `Type`,'YES' AS `Enabled` from `performance_schema`.`global_status` union all select `information_schema`.`innodb_metrics`.`NAME` AS `Variable_name`,`information_schema`.`innodb_metrics`.`COUNT` AS `Variable_value`,concat('InnoDB Metrics - ',`information_schema`.`innodb_metrics`.`SUBSYSTEM`) AS `Type`,if((`information_schema`.`innodb_metrics`.`STATUS` = 'enabled'),'YES','NO') AS `Enabled` from `information_schema`.`INNODB_METRICS` where (`information_schema`.`innodb_metrics`.`NAME` not in ('lock_row_lock_time','lock_row_lock_time_avg','lock_row_lock_time_max','lock_row_lock_waits','buffer_pool_reads','buffer_pool_read_requests','buffer_pool_write_requests','buffer_pool_wait_free','buffer_pool_read_ahead','buffer_pool_read_ahead_evicted','buffer_pool_pages_total','buffer_pool_pages_misc','buffer_pool_pages_data','buffer_pool_bytes_data','buffer_pool_pages_dirty','buffer_pool_bytes_dirty','buffer_pool_pages_free','buffer_pages_created','buffer_pages_written','buffer_pages_read','buffer_data_reads','buffer_data_written','file_num_open_files','os_log_bytes_written','os_log_fsyncs','os_log_pending_fsyncs','os_log_pending_writes','log_waits','log_write_requests','log_writes','innodb_dblwr_writes','innodb_dblwr_pages_written','innodb_page_size')) union all select 'memory_current_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name` union all select 'memory_total_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name` union all select 'NOW()' AS `Variable_name`,now(3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled` union all select 'UNIX_TIMESTAMP()' AS `Variable_name`,round(unix_timestamp(now(3)),3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled` order by `Type`,`Variable_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `processlist`
--

/*!50001 DROP VIEW IF EXISTS `processlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `processlist` (`thd_id`,`conn_id`,`user`,`db`,`command`,`state`,`time`,`current_statement`,`statement_latency`,`progress`,`lock_latency`,`rows_examined`,`rows_sent`,`rows_affected`,`tmp_tables`,`tmp_disk_tables`,`full_scan`,`last_statement`,`last_statement_latency`,`current_memory`,`last_wait`,`last_wait_latency`,`source`,`trx_latency`,`trx_state`,`trx_autocommit`,`pid`,`program_name`) AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',convert(`pps`.`PROCESSLIST_HOST` using utf8mb4)),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`sys`.`format_statement`(`pps`.`PROCESSLIST_INFO`) AS `current_statement`,if((`esc`.`END_EVENT_ID` is null),format_pico_time(`esc`.`TIMER_WAIT`),NULL) AS `statement_latency`,if((`esc`.`END_EVENT_ID` is null),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,format_pico_time(`esc`.`LOCK_TIME`) AS `lock_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`sys`.`format_statement`(`esc`.`SQL_TEXT`),NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),format_pico_time(`esc`.`TIMER_WAIT`),NULL) AS `last_statement_latency`,format_bytes(`mem`.`current_allocated`) AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if(((`ewc`.`END_EVENT_ID` is null) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',convert(format_pico_time(`ewc`.`TIMER_WAIT`) using utf8mb4)) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,format_pico_time(`etc`.`TIMER_WAIT`) AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ps_check_lost_instrumentation`
--

/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `ps_check_lost_instrumentation` (`variable_name`,`variable_value`) AS select `performance_schema`.`global_status`.`VARIABLE_NAME` AS `variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `variable_value` from `performance_schema`.`global_status` where ((`performance_schema`.`global_status`.`VARIABLE_NAME` like 'perf%lost') and (`performance_schema`.`global_status`.`VARIABLE_VALUE` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_auto_increment_columns`
--

/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_auto_increment_columns` (`table_schema`,`table_name`,`column_name`,`data_type`,`column_type`,`is_signed`,`is_unsigned`,`max_value`,`auto_increment`,`auto_increment_ratio`) AS select `information_schema`.`columns`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`columns`.`COLUMN_NAME` AS `COLUMN_NAME`,`information_schema`.`columns`.`DATA_TYPE` AS `DATA_TYPE`,`information_schema`.`columns`.`COLUMN_TYPE` AS `COLUMN_TYPE`,(locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) = 0) AS `is_signed`,(locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0) AS `is_unsigned`,((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1)) AS `max_value`,`information_schema`.`tables`.`AUTO_INCREMENT` AS `AUTO_INCREMENT`,(`information_schema`.`tables`.`AUTO_INCREMENT` / ((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1))) AS `auto_increment_ratio` from (`information_schema`.`COLUMNS` join `information_schema`.`TABLES` on(((`information_schema`.`columns`.`TABLE_SCHEMA` = `information_schema`.`tables`.`TABLE_SCHEMA`) and (`information_schema`.`columns`.`TABLE_NAME` = `information_schema`.`tables`.`TABLE_NAME`)))) where ((`information_schema`.`columns`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','performance_schema')) and (`information_schema`.`tables`.`TABLE_TYPE` = 'BASE TABLE') and (`information_schema`.`columns`.`EXTRA` = 'auto_increment')) order by (`information_schema`.`tables`.`AUTO_INCREMENT` / ((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1))) desc,((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_index_statistics`
--

/*!50001 DROP VIEW IF EXISTS `schema_index_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_index_statistics` (`table_schema`,`table_name`,`index_name`,`rows_selected`,`select_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH`) AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT`) AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE`) AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE`) AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_object_overview`
--

/*!50001 DROP VIEW IF EXISTS `schema_object_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_object_overview` (`db`,`object_type`,`count`) AS select `information_schema`.`routines`.`ROUTINE_SCHEMA` AS `db`,`information_schema`.`routines`.`ROUTINE_TYPE` AS `object_type`,count(0) AS `count` from `information_schema`.`ROUTINES` group by `information_schema`.`routines`.`ROUTINE_SCHEMA`,`information_schema`.`routines`.`ROUTINE_TYPE` union select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` AS `TABLE_TYPE`,count(0) AS `COUNT(*)` from `information_schema`.`TABLES` group by `information_schema`.`tables`.`TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` union select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,concat('INDEX (',`information_schema`.`statistics`.`INDEX_TYPE`,')') AS `CONCAT('INDEX (', INDEX_TYPE, ')')`,count(0) AS `COUNT(*)` from `information_schema`.`STATISTICS` group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`INDEX_TYPE` union select `information_schema`.`triggers`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,'TRIGGER' AS `TRIGGER`,count(0) AS `COUNT(*)` from `information_schema`.`TRIGGERS` group by `information_schema`.`triggers`.`TRIGGER_SCHEMA` union select `information_schema`.`events`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,'EVENT' AS `EVENT`,count(0) AS `COUNT(*)` from `information_schema`.`EVENTS` group by `information_schema`.`events`.`EVENT_SCHEMA` order by `db`,`object_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_redundant_indexes`
--

/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_redundant_indexes` (`table_schema`,`table_name`,`redundant_index_name`,`redundant_index_columns`,`redundant_index_non_unique`,`dominant_index_name`,`dominant_index_columns`,`dominant_index_non_unique`,`subpart_exists`,`sql_drop_index`) AS select `redundant_keys`.`table_schema` AS `table_schema`,`redundant_keys`.`table_name` AS `table_name`,`redundant_keys`.`index_name` AS `redundant_index_name`,`redundant_keys`.`index_columns` AS `redundant_index_columns`,`redundant_keys`.`non_unique` AS `redundant_index_non_unique`,`dominant_keys`.`index_name` AS `dominant_index_name`,`dominant_keys`.`index_columns` AS `dominant_index_columns`,`dominant_keys`.`non_unique` AS `dominant_index_non_unique`,if(((0 <> `redundant_keys`.`subpart_exists`) or (0 <> `dominant_keys`.`subpart_exists`)),1,0) AS `subpart_exists`,concat('ALTER TABLE `',`redundant_keys`.`table_schema`,'`.`',`redundant_keys`.`table_name`,'` DROP INDEX `',`redundant_keys`.`index_name`,'`') AS `sql_drop_index` from (`x$schema_flattened_keys` `redundant_keys` join `x$schema_flattened_keys` `dominant_keys` on(((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`) and (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`)))) where ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`) and (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`) and ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`) or ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`) and (if((`redundant_keys`.`index_name` = 'PRIMARY'),'',`redundant_keys`.`index_name`) > if((`dominant_keys`.`index_name` = 'PRIMARY'),'',`dominant_keys`.`index_name`))))) or ((locate(concat(`redundant_keys`.`index_columns`,','),`dominant_keys`.`index_columns`) = 1) and (`redundant_keys`.`non_unique` = 1)) or ((locate(concat(`dominant_keys`.`index_columns`,','),`redundant_keys`.`index_columns`) = 1) and (`dominant_keys`.`non_unique` = 0)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_lock_waits` (`object_schema`,`object_name`,`waiting_thread_id`,`waiting_pid`,`waiting_account`,`waiting_lock_type`,`waiting_lock_duration`,`waiting_query`,`waiting_query_secs`,`waiting_query_rows_affected`,`waiting_query_rows_examined`,`blocking_thread_id`,`blocking_pid`,`blocking_account`,`blocking_lock_type`,`blocking_lock_duration`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`sys`.`format_statement`(`pt`.`PROCESSLIST_INFO`) AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_statistics`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_statistics` (`table_schema`,`table_name`,`total_latency`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,format_pico_time(`pst`.`SUM_TIMER_WAIT`) AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,format_pico_time(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,format_pico_time(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,format_pico_time(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,format_pico_time(`fsbi`.`sum_timer_misc`) AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_statistics_with_buffer`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_statistics_with_buffer` (`table_schema`,`table_name`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`,`innodb_buffer_allocated`,`innodb_buffer_data`,`innodb_buffer_free`,`innodb_buffer_pages`,`innodb_buffer_pages_hashed`,`innodb_buffer_pages_old`,`innodb_buffer_rows_cached`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,format_pico_time(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,format_pico_time(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,format_pico_time(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,format_pico_time(`fsbi`.`sum_timer_misc`) AS `io_misc_latency`,format_bytes(`ibp`.`allocated`) AS `innodb_buffer_allocated`,format_bytes(`ibp`.`data`) AS `innodb_buffer_data`,format_bytes((`ibp`.`allocated` - `ibp`.`data`)) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = convert(`ibp`.`object_schema` using utf8mb4)) and (`pst`.`OBJECT_NAME` = convert(`ibp`.`object_name` using utf8mb4))))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_tables_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_tables_with_full_table_scans` (`object_schema`,`object_name`,`rows_full_scanned`,`latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT`) AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is null) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_unused_indexes`
--

/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_unused_indexes` (`object_schema`,`object_name`,`index_name`) AS select `t`.`OBJECT_SCHEMA` AS `object_schema`,`t`.`OBJECT_NAME` AS `object_name`,`t`.`INDEX_NAME` AS `index_name` from (`performance_schema`.`table_io_waits_summary_by_index_usage` `t` join `information_schema`.`STATISTICS` `s` on(((convert(`t`.`OBJECT_SCHEMA` using utf8) = `information_schema`.`s`.`TABLE_SCHEMA`) and (convert(`t`.`OBJECT_NAME` using utf8) = `information_schema`.`s`.`TABLE_NAME`) and (convert(`t`.`INDEX_NAME` using utf8) = `information_schema`.`s`.`INDEX_NAME`)))) where ((`t`.`INDEX_NAME` is not null) and (`t`.`COUNT_STAR` = 0) and (`t`.`OBJECT_SCHEMA` <> 'mysql') and (`t`.`INDEX_NAME` <> 'PRIMARY') and (`information_schema`.`s`.`NON_UNIQUE` = 1) and (`information_schema`.`s`.`SEQ_IN_INDEX` = 1)) order by `t`.`OBJECT_SCHEMA`,`t`.`OBJECT_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session`
--

/*!50001 DROP VIEW IF EXISTS `session`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `session` AS select `processlist`.`thd_id` AS `thd_id`,`processlist`.`conn_id` AS `conn_id`,`processlist`.`user` AS `user`,`processlist`.`db` AS `db`,`processlist`.`command` AS `command`,`processlist`.`state` AS `state`,`processlist`.`time` AS `time`,`processlist`.`current_statement` AS `current_statement`,`processlist`.`statement_latency` AS `statement_latency`,`processlist`.`progress` AS `progress`,`processlist`.`lock_latency` AS `lock_latency`,`processlist`.`rows_examined` AS `rows_examined`,`processlist`.`rows_sent` AS `rows_sent`,`processlist`.`rows_affected` AS `rows_affected`,`processlist`.`tmp_tables` AS `tmp_tables`,`processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`processlist`.`full_scan` AS `full_scan`,`processlist`.`last_statement` AS `last_statement`,`processlist`.`last_statement_latency` AS `last_statement_latency`,`processlist`.`current_memory` AS `current_memory`,`processlist`.`last_wait` AS `last_wait`,`processlist`.`last_wait_latency` AS `last_wait_latency`,`processlist`.`source` AS `source`,`processlist`.`trx_latency` AS `trx_latency`,`processlist`.`trx_state` AS `trx_state`,`processlist`.`trx_autocommit` AS `trx_autocommit`,`processlist`.`pid` AS `pid`,`processlist`.`program_name` AS `program_name` from `processlist` where ((`processlist`.`conn_id` is not null) and (`processlist`.`command` <> 'Daemon')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session_ssl_status`
--

/*!50001 DROP VIEW IF EXISTS `session_ssl_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `session_ssl_status` (`thread_id`,`ssl_version`,`ssl_cipher`,`ssl_sessions_reused`) AS select `sslver`.`THREAD_ID` AS `thread_id`,`sslver`.`VARIABLE_VALUE` AS `ssl_version`,`sslcip`.`VARIABLE_VALUE` AS `ssl_cipher`,`sslreuse`.`VARIABLE_VALUE` AS `ssl_sessions_reused` from ((`performance_schema`.`status_by_thread` `sslver` left join `performance_schema`.`status_by_thread` `sslcip` on(((`sslcip`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslcip`.`VARIABLE_NAME` = 'Ssl_cipher')))) left join `performance_schema`.`status_by_thread` `sslreuse` on(((`sslreuse`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslreuse`.`VARIABLE_NAME` = 'Ssl_sessions_reused')))) where (`sslver`.`VARIABLE_NAME` = 'Ssl_version') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statement_analysis`
--

/*!50001 DROP VIEW IF EXISTS `statement_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statement_analysis` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`lock_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`rows_affected`,`rows_affected_avg`,`tmp_tables`,`tmp_disk_tables`,`rows_sorted`,`sort_merge_passes`,`digest`,`first_seen`,`last_seen`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME`) AS `lock_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_errors_or_warnings`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_errors_or_warnings` (`query`,`db`,`exec_count`,`errors`,`error_pct`,`warnings`,`warning_pct`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_full_table_scans` (`query`,`db`,`exec_count`,`total_latency`,`no_index_used_count`,`no_good_index_used_count`,`no_index_used_pct`,`rows_sent`,`rows_examined`,`rows_sent_avg`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_runtimes_in_95th_percentile`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_runtimes_in_95th_percentile` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`stmts`.`DIGEST_TEXT`) AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,format_pico_time(`stmts`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`stmts`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`stmts`.`AVG_TIMER_WAIT`) AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_sorting`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_sorting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_sorting` (`query`,`db`,`exec_count`,`total_latency`,`sort_merge_passes`,`avg_sort_merges`,`sorts_using_scans`,`sort_using_range`,`rows_sorted`,`avg_rows_sorted`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_temp_tables`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_temp_tables` (`query`,`db`,`exec_count`,`total_latency`,`memory_tmp_tables`,`disk_tmp_tables`,`avg_tmp_tables_per_query`,`tmp_tables_to_disk_pct`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary`
--

/*!50001 DROP VIEW IF EXISTS `user_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary` (`user`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_hosts`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,format_pico_time(sum(`stmt`.`total_latency`)) AS `statement_latency`,format_pico_time(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,format_pico_time(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,format_bytes(sum(`mem`.`current_allocated`)) AS `current_memory`,format_bytes(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_file_io` (`user`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_file_io_type` (`user`,`event_name`,`total`,`latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_stages` (`user`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_statement_latency` (`user`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_statement_type` (`user`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `version`
--

/*!50001 DROP VIEW IF EXISTS `version`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `version` (`sys_version`,`mysql_version`) AS select '2.1.1' AS `sys_version`,version() AS `mysql_version` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wait_classes_global_by_avg_latency`
--

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `wait_classes_global_by_avg_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,format_pico_time(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wait_classes_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `wait_classes_global_by_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,format_pico_time(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_by_host_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_by_host_by_latency` (`host`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_by_user_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_by_user_by_latency` (`user`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary` (`host`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_users`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_file_io` (`host`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_file_io_type` (`host`,`event_name`,`total`,`total_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_stages` (`host`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_statement_latency` (`host`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_statement_type` (`host`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_buffer_stats_by_schema`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_buffer_stats_by_schema` (`object_schema`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_buffer_stats_by_table`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_buffer_stats_by_table` (`object_schema`,`object_name`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_lock_waits` (`wait_started`,`wait_age`,`wait_age_secs`,`locked_table`,`locked_table_schema`,`locked_table_name`,`locked_table_partition`,`locked_table_subpartition`,`locked_index`,`locked_type`,`waiting_trx_id`,`waiting_trx_started`,`waiting_trx_age`,`waiting_trx_rows_locked`,`waiting_trx_rows_modified`,`waiting_pid`,`waiting_query`,`waiting_lock_id`,`waiting_lock_mode`,`blocking_trx_id`,`blocking_pid`,`blocking_query`,`blocking_lock_id`,`blocking_lock_mode`,`blocking_trx_started`,`blocking_trx_age`,`blocking_trx_rows_locked`,`blocking_trx_rows_modified`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,concat(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`),'.',`sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,`rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,`rl`.`OBJECT_NAME` AS `locked_table_name`,`rl`.`PARTITION_NAME` AS `locked_table_partition`,`rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,`rl`.`INDEX_NAME` AS `locked_index`,`rl`.`LOCK_TYPE` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`r`.`trx_query` AS `waiting_query`,`rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,`rl`.`LOCK_MODE` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`b`.`trx_query` AS `blocking_query`,`bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,`bl`.`LOCK_MODE` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`performance_schema`.`data_lock_waits` `w` join `information_schema`.`INNODB_TRX` `b` on((`b`.`trx_id` = cast(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `information_schema`.`INNODB_TRX` `r` on((`r`.`trx_id` = cast(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `performance_schema`.`data_locks` `bl` on((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`))) join `performance_schema`.`data_locks` `rl` on((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`))) order by `r`.`trx_wait_started` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_by_thread_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_by_thread_by_latency` (`user`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`thread_id`,`processlist_id`) AS select if((`performance_schema`.`threads`.`PROCESSLIST_ID` is null),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',convert(`performance_schema`.`threads`.`PROCESSLIST_HOST` using utf8mb4))) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_file_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_file_by_bytes` (`file`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_write`,`total`,`write_pct`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00) AS `avg_write`,(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_file_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_file_by_latency` (`file`,`total`,`total_latency`,`count_read`,`read_latency`,`count_write`,`write_latency`,`count_misc`,`misc_latency`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC` AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_wait_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_wait_by_bytes` (`event_name`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`,`total_requested`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_wait_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_wait_by_latency` (`event_name`,`total`,`total_latency`,`avg_latency`,`max_latency`,`read_latency`,`write_latency`,`misc_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC` AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$latest_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$latest_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$latest_file_io` (`thread`,`file`,`latency`,`operation`,`requested`) AS select if((`information_schema`.`processlist`.`ID` is null),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),convert(concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`) using utf8mb4)) AS `thread`,`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,`performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`PROCESSLIST` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_host_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_thread_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_thread_by_current_bytes` (`thread_id`,`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select `t`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `t`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_user_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_user_by_current_bytes` (`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_global_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_global_by_current_bytes` (`event_name`,`current_count`,`current_alloc`,`current_avg_alloc`,`high_count`,`high_alloc`,`high_avg_alloc`) AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` AS `current_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` AS `high_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_global_total`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_global_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_global_total` (`total_allocated`) AS select sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$processlist`
--

/*!50001 DROP VIEW IF EXISTS `x$processlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$processlist` (`thd_id`,`conn_id`,`user`,`db`,`command`,`state`,`time`,`current_statement`,`statement_latency`,`progress`,`lock_latency`,`rows_examined`,`rows_sent`,`rows_affected`,`tmp_tables`,`tmp_disk_tables`,`full_scan`,`last_statement`,`last_statement_latency`,`current_memory`,`last_wait`,`last_wait_latency`,`source`,`trx_latency`,`trx_state`,`trx_autocommit`,`pid`,`program_name`) AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',convert(`pps`.`PROCESSLIST_HOST` using utf8mb4)),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`pps`.`PROCESSLIST_INFO` AS `current_statement`,if((`esc`.`END_EVENT_ID` is null),`esc`.`TIMER_WAIT`,NULL) AS `statement_latency`,if((`esc`.`END_EVENT_ID` is null),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,`esc`.`LOCK_TIME` AS `lock_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,`mem`.`current_allocated` AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if(((`ewc`.`END_EVENT_ID` is null) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,`etc`.`TIMER_WAIT` AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_digest_95th_percentile_by_avg_us`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_digest_95th_percentile_by_avg_us` (`avg_us`,`percentile`) AS select `s2`.`avg_us` AS `avg_us`,ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) AS `percentile` from (`x$ps_digest_avg_latency_distribution` `s1` join `x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) > 0.95) order by `percentile` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_digest_avg_latency_distribution`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_digest_avg_latency_distribution` (`cnt`,`avg_us`) AS select count(0) AS `cnt`,round((`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` / 1000000),0) AS `avg_us` from `performance_schema`.`events_statements_summary_by_digest` group by `avg_us` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_schema_table_statistics_io`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_schema_table_statistics_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_schema_table_statistics_io` (`table_schema`,`table_name`,`count_read`,`sum_number_of_bytes_read`,`sum_timer_read`,`count_write`,`sum_number_of_bytes_write`,`sum_timer_write`,`count_misc`,`sum_timer_misc`) AS select `extract_schema_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_schema`,`extract_table_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_name`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`) AS `count_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `sum_number_of_bytes_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `sum_timer_read`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`) AS `count_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `sum_number_of_bytes_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `sum_timer_write`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_MISC`) AS `count_misc`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `sum_timer_misc` from `performance_schema`.`file_summary_by_instance` group by `table_schema`,`table_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_flattened_keys`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_flattened_keys` (`table_schema`,`table_name`,`index_name`,`non_unique`,`subpart_exists`,`index_columns`) AS select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME` AS `INDEX_NAME`,max(`information_schema`.`statistics`.`NON_UNIQUE`) AS `non_unique`,max(if((`information_schema`.`statistics`.`SUB_PART` is null),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`statistics`.`COLUMN_NAME` order by `information_schema`.`statistics`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns` from `information_schema`.`STATISTICS` where ((`information_schema`.`statistics`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`statistics`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_index_statistics`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_index_statistics` (`table_schema`,`table_name`,`index_name`,`rows_selected`,`select_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH` AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT` AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE` AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE` AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_lock_waits` (`object_schema`,`object_name`,`waiting_thread_id`,`waiting_pid`,`waiting_account`,`waiting_lock_type`,`waiting_lock_duration`,`waiting_query`,`waiting_query_secs`,`waiting_query_rows_affected`,`waiting_query_rows_examined`,`blocking_thread_id`,`blocking_pid`,`blocking_account`,`blocking_lock_type`,`blocking_lock_duration`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`pt`.`PROCESSLIST_INFO` AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_statistics`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_statistics` (`table_schema`,`table_name`,`total_latency`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`SUM_TIMER_WAIT` AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_statistics_with_buffer`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_statistics_with_buffer` (`table_schema`,`table_name`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`,`innodb_buffer_allocated`,`innodb_buffer_data`,`innodb_buffer_free`,`innodb_buffer_pages`,`innodb_buffer_pages_hashed`,`innodb_buffer_pages_old`,`innodb_buffer_rows_cached`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency`,`ibp`.`allocated` AS `innodb_buffer_allocated`,`ibp`.`data` AS `innodb_buffer_data`,(`ibp`.`allocated` - `ibp`.`data`) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = convert(`ibp`.`object_schema` using utf8mb4)) and (`pst`.`OBJECT_NAME` = convert(`ibp`.`object_name` using utf8mb4))))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_tables_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_tables_with_full_table_scans` (`object_schema`,`object_name`,`rows_full_scanned`,`latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is null) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$session`
--

/*!50001 DROP VIEW IF EXISTS `x$session`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$session` AS select `x$processlist`.`thd_id` AS `thd_id`,`x$processlist`.`conn_id` AS `conn_id`,`x$processlist`.`user` AS `user`,`x$processlist`.`db` AS `db`,`x$processlist`.`command` AS `command`,`x$processlist`.`state` AS `state`,`x$processlist`.`time` AS `time`,`x$processlist`.`current_statement` AS `current_statement`,`x$processlist`.`statement_latency` AS `statement_latency`,`x$processlist`.`progress` AS `progress`,`x$processlist`.`lock_latency` AS `lock_latency`,`x$processlist`.`rows_examined` AS `rows_examined`,`x$processlist`.`rows_sent` AS `rows_sent`,`x$processlist`.`rows_affected` AS `rows_affected`,`x$processlist`.`tmp_tables` AS `tmp_tables`,`x$processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`x$processlist`.`full_scan` AS `full_scan`,`x$processlist`.`last_statement` AS `last_statement`,`x$processlist`.`last_statement_latency` AS `last_statement_latency`,`x$processlist`.`current_memory` AS `current_memory`,`x$processlist`.`last_wait` AS `last_wait`,`x$processlist`.`last_wait_latency` AS `last_wait_latency`,`x$processlist`.`source` AS `source`,`x$processlist`.`trx_latency` AS `trx_latency`,`x$processlist`.`trx_state` AS `trx_state`,`x$processlist`.`trx_autocommit` AS `trx_autocommit`,`x$processlist`.`pid` AS `pid`,`x$processlist`.`program_name` AS `program_name` from `x$processlist` where ((`x$processlist`.`conn_id` is not null) and (`x$processlist`.`command` <> 'Daemon')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statement_analysis`
--

/*!50001 DROP VIEW IF EXISTS `x$statement_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statement_analysis` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`lock_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`rows_affected`,`rows_affected_avg`,`tmp_tables`,`tmp_disk_tables`,`rows_sorted`,`sort_merge_passes`,`digest`,`first_seen`,`last_seen`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_errors_or_warnings`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_errors_or_warnings` (`query`,`db`,`exec_count`,`errors`,`error_pct`,`warnings`,`warning_pct`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_full_table_scans` (`query`,`db`,`exec_count`,`total_latency`,`no_index_used_count`,`no_good_index_used_count`,`no_index_used_pct`,`rows_sent`,`rows_examined`,`rows_sent_avg`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_runtimes_in_95th_percentile`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_runtimes_in_95th_percentile` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `stmts`.`DIGEST_TEXT` AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,`stmts`.`SUM_TIMER_WAIT` AS `total_latency`,`stmts`.`MAX_TIMER_WAIT` AS `max_latency`,`stmts`.`AVG_TIMER_WAIT` AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_sorting`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_sorting` (`query`,`db`,`exec_count`,`total_latency`,`sort_merge_passes`,`avg_sort_merges`,`sorts_using_scans`,`sort_using_range`,`rows_sorted`,`avg_rows_sorted`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_temp_tables`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_temp_tables` (`query`,`db`,`exec_count`,`total_latency`,`memory_tmp_tables`,`disk_tmp_tables`,`avg_tmp_tables_per_query`,`tmp_tables_to_disk_pct`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary` (`user`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_hosts`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_file_io` (`user`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_file_io_type` (`user`,`event_name`,`total`,`latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_stages` (`user`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_statement_latency` (`user`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_statement_type` (`user`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$wait_classes_global_by_avg_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$wait_classes_global_by_avg_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$wait_classes_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$wait_classes_global_by_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_by_host_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_by_host_by_latency` (`host`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_by_user_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_by_user_by_latency` (`user`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 17:11:41
