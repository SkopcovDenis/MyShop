--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-12-13 01:24:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 51074)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 51073)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 51080)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 51079)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 51086)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 51085)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 51092)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 51091)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 51100)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 51109)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 51108)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 51099)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3350 (class 0 OID 51074)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Мебель');
INSERT INTO public.category (id, name) VALUES (3, 'Одежда');
INSERT INTO public.category (id, name) VALUES (2, 'Бытовая техника');


--
-- TOC entry 3352 (class 0 OID 51080)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (21, '5a042101-9e44-4146-bbd5-ae3549cd928b.1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'f70453e5-ef05-4752-a90d-da48c87d388c.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, 'c6dc9f51-2162-49a0-b924-c14e3c6597de.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, 'b3343ad9-16e6-4c18-97b2-63b889d0b3e6.2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '77490cd4-e604-4fa3-87c3-9eb33b117e41.4.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '94ec8504-94c8-4868-8566-06a0fc7d8d11.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '4d6b7a30-d2c6-4030-8db2-f7dda8106bd8.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '6bd2a309-a49d-4e29-85ef-e0699276e94e.5.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '0f5064bd-fcdf-461b-866e-6d857e86113b.2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '7293f0cc-bf9d-4200-8073-421ede6cf794.4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '478ced02-9c93-41b3-9ab8-780219e9c19b.1.jpeg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '289b353d-ea08-4c5b-a109-df421d169eda.3.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '44362a6a-183b-42db-a8a7-a8bbbf7024c4.5.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'e3188547-0568-4f3c-a3dd-bc607f5fb295.2.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '7058cddb-70c2-47e0-82bb-1bc88efd9b4c.4.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '7be48f0a-3a6b-446b-85cc-3353cac98430.1.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '8b803ef4-d0cb-40ab-b7f6-7599de271649.3.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '223072d9-c922-486d-a1d5-b73cf917e49f.4.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'de68c99e-c091-405f-94cb-e50fd4e5171d.2.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '4f555a44-5c17-4abd-af38-116ae2ba8508.5.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '18f670b4-2c68-4e72-9fe8-40f87cc6ccba.1.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, 'b3d0e61e-4e38-4b2f-84cd-b84a27515449.2.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'ac7293be-33f0-4ca6-a3de-94ed228b7c24.4.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, 'e843db5b-c340-48e0-8c51-619bb6fe4db3.5.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '51076510-14fe-4bc7-9e51-5a2364d47f10.3.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '41ddb9c4-6ee8-4000-b690-90b736196f7a.1 (1).jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '3f027e4c-7d55-43cb-a01f-9761b79f10ce.3.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '28498e2b-ef81-41ad-abfe-671c1d41f242.5.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'e0abfbe6-077c-4617-a849-5f23f1e9c088.2.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, 'ce90d8f9-aabd-414f-b294-59b3ece4c900.4.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, '7c3738bc-e134-4115-91e7-3194e8714253.1 .jpeg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, '9cddc21a-fbdf-41e7-aa49-98a1c4400cb5.3.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, '9fc83a9f-7ead-4839-a50b-1ef0d7e47809.5.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, '568007bc-07e4-4b94-b8a7-435cb5008e41.2.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, '309bdbe9-ace8-4921-8b80-79ac4937f6a9.4.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (56, '853607f9-921a-4625-9cd8-7ba3b8cc041e.1.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (57, 'e6f0bf83-ba4d-41a8-ad33-03a62ec2cf58.3.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (58, '8a5437ae-f8ea-45d2-a6cb-3628f1f25503.5.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (59, 'a0e0ddd9-1090-4fa1-8180-105dece115e6.2.jpeg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (60, '6adfca20-4c8a-4b5f-a8ce-1915dc1eca7e.4.jpeg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (61, '143fa636-abd9-4b2b-8e9c-a4f95ffbfa9b.1.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (62, '5443143a-6728-488a-b11f-57da98227125.3.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (63, '383e11c7-7290-44a9-8bf0-f582a1c51e3f.5.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (64, 'c7516273-f9c0-49ef-8076-c6740b1a1482.2.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (65, '6324a8ec-0fa2-4d3e-8ab5-bfca5ab7e1d3.4.jpg', 17);


--
-- TOC entry 3354 (class 0 OID 51086)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2022-12-13 00:26:46.964937', 'd9dbe009-9026-4ed8-8c54-462bfbaf04e2', 3960, 1, 1, 9);


--
-- TOC entry 3356 (class 0 OID 51092)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'user_test', '$2a$10$nmbGWf/PMg3CtQAjUphnu.GPiOWqWix4P5pzNGzaPJZhKAxONeSkO', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'admin', '$2a$10$s2gskarPcMYa5b/W.b/exeFTCRXUSuqQk/EhmdT3kHZjHotS6ZZp.', 'ROLE_ADMIN');


--
-- TOC entry 3358 (class 0 OID 51100)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (9, '2022-12-13 00:10:04.663435', 'Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев', 3960, 'Стендмебель - фабрика мебели', 'Стендмебель Комод с ящиками Ксения СТМ для вещей', 'Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, '2022-12-13 00:11:33.191668', 'Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129.', 2520, 'Стендмебель - фабрика мебели', 'Стендмебель Обувница Джулия СТМ, тумба для обуви', 'Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (11, '2022-12-13 00:12:59.7514', 'Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке.', 3000, 'Стендмебель - фабрика мебели', 'Стендмебель Стол письменный Софи СТМ, компьютерный', 'Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (12, '2022-12-13 00:14:31.053672', 'Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки', 1450, 'EREMES', 'Eremes Джинсы мужские прямые классические', 'Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (13, '2022-12-13 00:16:24.570036', 'Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!', 338, 'UZcotton', 'UZcotton Футболка мужская хлопок спортивная однотонная базовая', 'Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (14, '2022-12-13 00:17:43.183002', 'Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой.', 11249, 'ВАЙЛДБЕРРИЗ', 'adidas Куртка', 'Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (15, '2022-12-13 00:19:54.474609', '**5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт.', 10999, 'ВАЙЛДБЕРРИЗ', 'Polaris Планетарный миксер / Кухонная машина PKM 1104, (POLARIS)', 'Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (16, '2022-12-13 00:21:21.173945', 'Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома.', 17995, 'Официальный магазин Polaris', 'Redkey Вертикальный пылесос , моющий пылесос', 'Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (17, '2022-12-13 00:22:40.607383', 'Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель.', 33615, 'ВАЙЛДБЕРРИЗ', 'ATLANT Стиральная машина CMA-80 C 1214-01', 'Коледино', 2);


--
-- TOC entry 3360 (class 0 OID 51109)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_cart (id, person_id, product_id) VALUES (1, 1, 9);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 65, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 2, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 1, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 17, true);


--
-- TOC entry 3191 (class 2606 OID 51078)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 51084)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 51090)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 51098)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 51113)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 51107)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 51115)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3205 (class 2606 OID 51121)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3207 (class 2606 OID 51131)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3206 (class 2606 OID 51126)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3204 (class 2606 OID 51116)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3209 (class 2606 OID 51141)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3208 (class 2606 OID 51136)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-13 01:24:07

--
-- PostgreSQL database dump complete
--

