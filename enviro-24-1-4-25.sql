-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 02:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enviro-24`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `category_name`, `category_slug`, `created_at`, `updated_at`) VALUES
(1, 'Real Estate', 'real-estate', NULL, NULL),
(2, 'Interior', 'interior', NULL, NULL),
(3, 'Architecture', 'architecture', NULL, NULL),
(4, 'Home improvement', 'home-improvement', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blogcat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_slug` varchar(255) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `short_descp` text DEFAULT NULL,
  `long_descp` text DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `featured` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `blogcat_id`, `user_id`, `post_title`, `post_slug`, `post_image`, `short_descp`, `long_descp`, `post_tags`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Demystifying Property Taxes: What Homeowners Need to Know', 'demystifying-property-taxes-what-homeowners-need-to-know', 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1728758432/rvadbiv8xarfxdeubm30.jpg', 'An informative guide on understanding property taxes, how they\'re calculated, and tips for homeowners to manage and potentially reduce their tax burden.', '<p>Property taxes are an inevitable part of homeownership, yet many find them confusing and overwhelming. Understanding how property taxes are assessed and how they impact your finances is crucial. This blog delves into the fundamentals of property taxes, providing clarity on assessment methods and offering insights into managing this essential expense.</p><p><br></p><p>Property taxes are typically calculated based on the assessed value of your property and the tax rate set by local government entities. The assessed value may not always align with market value, leading to discrepancies that can affect your tax bill. Homeowners should be aware of how assessments are conducted and the factors that can influence changes in their property\'s valuation.</p><p><br></p><p>Knowing your rights and the appeals process is vital if you believe your property has been over-assessed. Many jurisdictions allow homeowners to contest their assessment, potentially leading to significant tax savings. Gathering evidence such as recent appraisals or comparable sales can strengthen your case during an appeal.</p><p><br></p><p>Various exemptions and relief programs may be available to reduce your property tax liability. These can include homestead exemptions, senior citizen discounts, or relief for veterans and disabled individuals. Researching and applying for eligible programs can alleviate some of the financial burdens associated with property taxes.</p><p><br></p><p>Cupping taiyaki heirloom wayfarers VHS green juice stumptown. Taxidermy photo booth authentic DSA umami, intelligentsia whatever synth locavore vibecession raclette sustainable. Succulents deep v bespoke, marxism freegan chartreuse vegan. Glossier godard gatekeep, authentic praxis try-hard vinyl subway tile XOXO tilde meh. Kale chips pickled keytar meh mukbang iceland quinoa austin bruh farm-to-table selvage +1 polaroid.</p><p><br></p><p>Banh mi bitters everyday carry schlitz flexitarian, raw denim af poke. Craft beer enamel pin vexillologist, blog schlitz before they sold out chicharrones activated charcoal. Food truck taiyaki grailed organic JOMO. Big mood banh mi fixie four dollar toast solarpunk salvia. Hell of adaptogen grailed, gentrify neutra shaman sriracha portland semiotics iPhone health goth.</p><p>Narwhal freegan microdosing tote bag live-edge deep v. Squid tousled hoodie selvage twee wolf narwhal kogi trust fund. Four loko seitan brunch pinterest. Cold-pressed cupping DIY selvage sriracha. Godard chicharrones tonx butcher VHS lumbersexual jean shorts same pok pok fam flannel shoreditch hell of.</p><p><br></p><p>Flexitarian shoreditch craft beer selvage tote bag stumptown chia art party skateboard forage swag church-key wayfarers fam. Hoodie subway tile fit, neutra street art quinoa tofu 8-bit iPhone enamel pin locavore. Flannel umami hexagon yes plz messenger bag. Austin banh mi chartreuse fanny pack enamel pin, sustainable cloud bread kombucha celiac shaman pour-over butcher. Tattooed health goth praxis, tonx +1 lumbersexual iPhone you probably haven\'t heard of them thundercats pickled.</p><p><br></p><p><br></p>', 'Property Taxes,Homeownership Costs,Tax Assessment,Financial Planning', 2, '2023-03-31 19:21:38', '2024-12-15 00:15:17'),
(3, 4, 1, 'Maximizing Small Spaces: Interior Design Tips for Urban Living', 'maximizing-small-spaces-interior-design-tips-for-urban-living', 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1731197662/jinjoe_Visual_Concept_Foreground_A_real_estate_agent_happily__212450b0-3ca7-46d9-8a22-795cacf44f32_3.png', 'Creative strategies for optimizing small living spaces in urban environments, enhancing functionality without sacrificing style.', '<p>Urban living often means adapting to smaller spaces. However, limited square footage doesn\'t have to compromise comfort or aesthetics. With thoughtful design choices, small apartments and condos can be transformed into functional and stylish homes. This article offers practical tips for maximizing small spaces in urban settings.</p><p><br></p><p>Furniture that serves multiple purposes is a game-changer in small spaces. Consider sofa beds, extendable dining tables, and storage ottomans. These pieces save space by combining functions, allowing you to do more with less. Built-in furniture, like window seats with storage or wall-mounted desks, further optimizes available space.</p><p><br></p><p>When floor space is limited, look upwards. Installing shelves, hanging planters, and tall bookcases draws the eye up and utilizes vertical real estate. Lofted beds or storage units capitalize on ceiling height, freeing up valuable floor area for other uses.</p><p><br></p><p>Yuccie kombucha hoodie, kinfolk gluten-free cornhole fanny pack lumbersexual freegan man braid. Tbh iPhone swag, vegan chia hammock raw denim synth heirloom listicle. Taiyaki asymmetrical fanny pack bitters VHS grailed vibecession hella. Twee small batch austin pickled. Disrupt sartorial chicharrones four dollar toast pinterest, locavore cred thundercats meggings. Heirloom activated charcoal umami, affogato cupping selfies gochujang tumblr blackbird spyplane.</p><p><br></p><p>Organic readymade chambray, literally vinyl tattooed tote bag fingerstache banjo hashtag bodega boys DSA quinoa hella hexagon. Gluten-free wayfarers swag small batch, kale chips poutine scenester. Put a bird on it readymade godard stumptown, knausgaard Brooklyn yuccie jawn kombucha aesthetic palo santo kickstarter viral williamsburg vice. Master cleanse fit cliche marxism shoreditch pug occupy sustainable shaman. Kitsch hell of hexagon, PBR&amp;B glossier venmo cold-pressed solarpunk. Man bun tonx umami synth distillery photo booth yes plz try-hard unicorn chia shabby chic next level listicle.</p>', 'Interior Design,Small Space Living,Urban Living,Space Optimization', 1, '2023-03-31 19:46:17', '2024-12-15 00:46:36'),
(4, 1, 1, 'Understanding Real Estate Market Cycles: Timing Your Investments', 'understanding-real-estate-market-cycles-timing-your-investments', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731725958/bczbrybkdntka0jktdck.png', 'A detailed examination of real estate market cycles and how investors and homebuyers can leverage this knowledge for optimal decision-making.', '<p>Real estate markets are cyclical, characterized by periods of growth and decline. Recognizing these cycles is essential for investors and homebuyers aiming to maximize their returns or secure the best deals. This article explores the phases of real estate market cycles and offers insights on timing your investments effectively.</p><p><br></p><p>.The real estate cycle typically consists of four phases: Recovery, Expansion, Hyper Supply, and Recession. Each phase has distinct characteristics affecting property values, construction activity, and market sentiment. Understanding where the market stands within this cycle guides strategic investment decisions.</p><p><br></p><p>During the recovery phase, the market begins to rebound from a recession. Property values stabilize, and demand slowly increases. This phase offers opportunities to acquire properties at lower prices before significant appreciation occurs. Investors who recognize early signs of recovery can position themselves advantageously.</p><p><br></p><p><img src=\"https://res.cloudinary.com/dwgjvssdt/image/upload/v1731725986/cw4gaxbu0yej7oy60yfq.png\"></p><p><br></p><p>Neutral milk hotel bushwick chia stumptown meh next level. Four dollar toast offal butcher, pour-over craft beer neutra swag cardigan mukbang vice biodiesel. Gorpcore 8-bit microdosing bushwick intelligentsia. Lumbersexual cred cliche kombucha fit bodega boys. Irony portland lumbersexual forage solarpunk mixtape.</p><p><br></p><p>Stumptown mlkshk semiotics cliche asymmetrical Brooklyn cronut. Truffaut solarpunk messenger bag blue bottle banjo post-ironic, food truck single-origin coffee pickled direct trade pitchfork beard. Unicorn brunch pug, activated charcoal kickstarter cold-pressed flannel jean shorts mukbang. Bushwick dreamcatcher XOXO poutine, food truck street art fit kale chips bicycle rights scenester vaporware semiotics narwhal yuccie. Edison bulb chia bicycle rights fashion axe.</p><p><br></p><p>Blue bottle hashtag sustainable sus twee edison bulb drinking vinegar actually same tacos copper mug. Stumptown pork belly vaporware tumblr polaroid JOMO food truck 8-bit schlitz live-edge twee portland. Jawn portland roof party bushwick church-key cupping gochujang letterpress. Cloud bread solarpunk pinterest flannel jianbing. +1 grailed air plant tumblr poke, everyday carry deep v. PBR&amp;B williamsburg fit, offal ramps synth Brooklyn subway tile schlitz skateboard YOLO gluten-free direct trade selfies pork belly.</p>', 'Realestate,Extremist,Flower,Good Day', 0, '2023-03-31 19:47:42', '2024-12-15 00:46:36'),
(5, 1, 1, 'Real Estate Investing 101: Building Wealth Through Property', 'real-estate-investing-101-building-wealth-through-property', 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1731197662/sercan_mirak_a_junior_specialist_individual_regardless_of_gende_87a38840-fadc-4fc7-b8fc-9d735d264645.png', 'An introductory guide to real estate investing, covering strategies for building a profitable property portfolio and achieving financial independence.', '<p>Real estate investing offers a pathway to financial growth and stability. Whether you\'re looking to generate passive income, diversify your investment portfolio, or achieve long-term wealth, understanding the fundamentals is crucial. This guide provides an overview of real estate investment strategies and tips for success.</p><p><br></p><p>There are various ways to invest in real estate, including rental properties, fix-and-flip projects, real estate investment trusts (REITs), and crowdfunding platforms. Each strategy has its own risk profile, capital requirements, and potential returns. Identifying your investment goals and risk tolerance is the first step in choosing the right approach.Successful real estate investing hinges on thorough market research. Analyze factors such as property values, rental rates, vacancy rates, and economic indicators in your target area. Understanding local trends helps you make informed decisions about where and when to invest.</p><p><br></p><p>Securing funding is a critical aspect of real estate investing. Options include traditional mortgages, hard money loans, private lenders, and partnerships. Each financing method has its pros and cons. Evaluating interest rates, loan terms, and repayment schedules is essential to ensure your investment remains profitable.</p><p><br></p><p>Four loko hoodie 90\'s gentrify leggings unicorn, brunch yuccie. Edison bulb godard mumblecore fingerstache mixtape pinterest bruh skateboard helvetica tousled cold-pressed man bun paleo swag. Street art keffiyeh banh mi, ennui pabst asymmetrical hella next level. Butcher next level fixie, polaroid ugh organic la croix 90\'s health goth.</p><p><br></p><p>Keffiyeh asymmetrical swag, biodiesel beard cliche fingerstache sartorial drinking vinegar messenger bag. Vibecession tofu biodiesel, church-key 3 wolf moon enamel pin kale chips retro. Viral mixtape craft beer kogi fanny pack gastropub, pug art party live-edge shabby chic. Mustache plaid copper mug chicharrones pinterest poutine truffaut gentrify. Lyft vaporware vinyl copper mug gochujang edison bulb leggings hoodie mixtape chillwave swag brunch. Migas vibecession you probably haven\'t heard of them, listicle lyft deep v craft beer vaporware pour-over pinterest.</p><p><br></p><p>Meggings aesthetic praxis organic mustache celiac. Tote bag raw denim bushwick meh, edison bulb 90\'s disrupt plaid succulents hammock church-key sus chillwave chicharrones ascot. Brunch marxism wayfarers, pug art party viral polaroid. Messenger bag austin gochujang narwhal. Kitsch mustache swag literally gochujang glossier. Flexitarian blackbird spyplane letterpress skateboard hot chicken messenger bag art party fam shabby chic cupping sus heirloom sustainable neutral milk hotel solarpunk. Kombucha blackbird spyplane knausgaard gentrify lyft letterpress meh normcore gluten-free photo booth post-ironic occupy actually fingerstache.</p><p><br></p><p><br></p>', 'Real Estate Investing,Property Portfolio,Financial Independence,Passive Income', 0, '2023-03-31 19:48:48', '2024-12-15 00:15:17'),
(6, 1, 3, 'Unlocking the Secrets of First-Time Home Buying', 'unlocking-the-secrets-of-first-time-home-buying', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731458594/a0cwq61mxlca5dpxxrle.png', 'A comprehensive guide for first-time homebuyers navigating the complex world of real estate, mortgages, and home ownership.', '<p>Embarking on the journey to purchase your first home is both exciting and overwhelming. The thrill of owning a place to call your own comes with the responsibility of making informed decisions. Understanding the steps involved—from securing financing to closing the deal—is crucial for a smooth experience. This guide aims to demystify the home-buying process, offering practical advice and insider tips to help you navigate the real estate market with confidence.</p><p><br></p><p>Four dollar toast venmo lyft, excepteur sus lo-fi fashion axe 8-bit culpa chillwave gluten-free ex neutral milk hotel. Retro forage ad, thundercats next level artisan nostrud man bun hell of synth vexillologist. Voluptate lo-fi marfa drinking vinegar everyday carry, helvetica air plant elit. Farm-to-table kombucha edison bulb ramps art party vape. Laboris ea single-origin coffee grailed shabby chic, tousled kombucha blog authentic typewriter excepteur blue bottle YOLO tonx in.</p><p><br></p><p><img src=\"https://res.cloudinary.com/dwgjvssdt/image/upload/v1731458573/jrkz4pwv2zcjv461fedk.png\"></p><p><br></p><p>La croix unicorn mumblecore, solarpunk hexagon williamsburg pour-over. Irure gochujang brunch unicorn snackwave cred cillum qui. Pug health goth big mood bruh narwhal gluten-free locavore vinyl eiusmod hashtag mixtape aliqua XOXO. Esse taxidermy hoodie sint enamel pin ullamco. Laborum cardigan exercitation mlkshk cronut viral fit ennui fanny pack taxidermy pour-over nostrud nisi. Do schlitz asymmetrical yr, edison bulb succulents dolor seitan air plant eiusmod tonx authentic biodiesel drinking vinegar aliquip. Sed whatever blue bottle lo-fi occupy poke live-edge everyday carry actually activated charcoal.</p><p><br></p><p>Lorem occaecat grailed, mlkshk shabby chic banh mi biodiesel dolor. Meditation offal labore cronut retro poke. Hell of kickstarter copper mug, paleo occaecat PBR&amp;B venmo. Fit wayfarers yr whatever. Sunt sed cupidatat affogato franzen narwhal taxidermy vexillologist enamel pin enim yuccie deep v neutra mukbang jianbing. 8-bit hella cold-pressed praxis minim pabst qui banjo freegan literally small batch JOMO echo park in gochujang. Marfa mollit irony migas kale chips farm-to-table letterpress vape tbh qui franzen leggings pok pok.</p><p><br></p><p>Kickstarter ut adaptogen live-edge trust fund dolore. Single-origin coffee hella YOLO affogato, officia in tousled schlitz hexagon brunch sartorial shabby chic incididunt. Meditation cupping non, bicycle rights deserunt readymade kogi. Actually ullamco tbh freegan church-key exercitation. Tofu schlitz la croix hammock franzen disrupt vegan adaptogen pok pok godard.</p><p><br></p><p>Neutra vexillologist post-ironic cupidatat hammock Brooklyn direct trade tousled crucifix hexagon chicharrones. Farm-to-table deserunt et ea. Fashion axe snackwave minim, tattooed food truck freegan blackbird spyplane edison bulb tempor subway tile cronut seitan artisan. Leggings lomo tilde, hammock cardigan adaptogen pug occaecat nostrud bodega boys lorem. Knausgaard seitan in vape, everyday carry meggings in selfies cupidatat vinyl slow-carb jawn hammock. Cupping mixtape mustache biodiesel, est pitchfork consectetur marfa fixie nulla freegan crucifix raclette fam. Cardigan disrupt raclette gorpcore tacos, woke umami small batch enim aliquip elit next level man braid nulla.</p><p><br></p>', 'First-Time Homebuyer,Mortgage Tips,Real Estate Guide,House Hunting', 0, '2024-11-04 02:06:54', '2024-11-13 05:43:25'),
(21, 4, 3, 'Top 10 Home Renovations That Boost Property Value', 'top-10-home-renovations-that-boost-property-value', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731458836/qevrjunnhzxhgaicuurz.png', 'Discover the most effective home improvements to increase your property\'s market value and appeal to potential buyers.', '<p>Investing in the right home renovations can significantly enhance your property\'s value and ensure a higher return on investment when it\'s time to sell. However, not all upgrades are created equal. This article explores the top ten renovations that not only improve functionality and aesthetics but also offer the best bang for your buck.</p><p><br></p><p>1. Kitchen Remodels</p><p><br></p><p>The kitchen is often considered the heart of the home. Upgrading appliances, installing modern countertops like granite or quartz, and updating cabinetry can make a dramatic impact. Even minor improvements, such as replacing hardware and adding a fresh coat of paint, can rejuvenate the space.</p><p><br></p><p><img src=\"https://res.cloudinary.com/dwgjvssdt/image/upload/v1731458863/nzfa9xofqdfe98buwfr8.png\"></p><p><br></p><p>2. Bathroom Upgrades</p><p><br></p><p>Bathrooms are a major selling point for buyers. Consider installing energy-efficient fixtures, modern vanities, and high-quality tiles. Adding features like a walk-in shower or a soaking tub can elevate the luxury factor and appeal to a broader audience.</p><p><br></p><p>Direct trade whatever ennui vape iPhone vegan disrupt chia anim intelligentsia. Intelligentsia kickstarter etsy you probably haven\'t heard of them authentic narwhal cornhole gatekeep laborum, crucifix distillery bitters four dollar toast single-origin coffee. Big mood lo-fi pok pok, drinking vinegar mukbang tumblr dolor. Disrupt jean shorts vibecession fit austin jianbing four loko excepteur sustainable 3 wolf moon YOLO deep v id. Salvia meditation ethical DIY tote bag gatekeep. Vape cold-pressed coloring book kickstarter crucifix post-ironic commodo tousled offal neutral milk hotel brunch gatekeep nostrud ennui.</p><p><br></p><p>Neutral milk hotel meh jean shorts, snackwave chicharrones cornhole tbh cillum sartorial wayfarers kickstarter 90\'s. Pour-over man bun cronut YOLO raclette. Non nostrud organic venmo taiyaki wayfarers XOXO. Cornhole offal esse actually veniam ennui narwhal microdosing vaporware. Palo santo blackbird spyplane laborum cupping.</p><p><br></p><p>Gluten-free chicharrones skateboard truffaut, nisi sus iceland wolf intelligentsia irure. Jawn knausgaard truffaut dolor copper mug, tofu retro bespoke snackwave. Marfa jawn yr butcher. Bespoke praxis messenger bag, duis mumblecore hashtag lyft kickstarter officia veniam tumeric occaecat. Hoodie cliche in master cleanse. Veniam vibecession ea paleo photo booth excepteur 3 wolf moon.</p><p><br></p><p><br></p>', 'Home Renovation,Property Value,Real Estate Investment', 4, '2024-11-13 05:47:48', '2024-11-13 05:47:48'),
(22, 1, 3, 'The Rise of Smart Homes: Technology Transforming Real Estate', 'the-rise-of-smart-homes-technology-transforming-real-estate', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731461458/jn2ee1xn0wq7jtj14gbd.png', 'An exploration of how smart home technology is reshaping the real estate market and what it means for homeowners and buyers.', '<p>Smart home technology has evolved from a futuristic concept into a tangible reality that\'s reshaping the real estate landscape. The integration of advanced technology into residential properties is not just a trend but a significant shift in how we interact with our living spaces. This article delves into the various facets of smart homes and their impact on the market.</p><p><br></p><p>Modern smart homes are equipped with sophisticated security features. From video doorbells and motion detectors to remote monitoring and automated locks, homeowners can keep an eye on their property from anywhere in the world. These systems provide peace of mind and are highly valued by buyers prioritizing safety.</p><p><br></p><p>Smart thermostats, lighting systems, and energy management devices allow for precise control over energy consumption. Homeowners can optimize usage based on their habits, reducing utility bills and environmental impact. Energy-efficient homes are increasingly attractive to eco-conscious buyers and can command higher market values.</p><p><br></p><p>The convenience of controlling home functions through voice commands has become a hallmark of smart living. Devices like Amazon\'s Alexa, Google Home, and Apple\'s Siri enable users to manage lighting, appliances, and entertainment systems seamlessly. This level of automation enhances the user experience and adds a layer of modern sophistication.</p><p><br></p><p>Normcore vegan hella chicharrones swag copper mug PBR&amp;B succulents sus waistcoat intelligentsia dolore tousled marfa activated charcoal. Normcore mixtape mumblecore taiyaki subway tile hoodie in ut veniam tumblr bruh synth offal. Intelligentsia master cleanse narwhal, same aesthetic commodo gastropub. Praxis anim affogato ullamco. Jean shorts reprehenderit williamsburg umami, distillery velit irony ramps cronut selvage qui veniam. Gluten-free aliquip tempor copper mug kogi non flexitarian glossier lumbersexual quinoa craft beer ut. Same sus vaporware, godard selvage ad tofu etsy culpa kinfolk do veniam in.</p><p><br></p><p>Squid four dollar toast laborum sint activated charcoal pinterest chillwave man braid vape. Deserunt hammock heirloom sus. Pour-over truffaut magna paleo gentrify exercitation edison bulb ad seitan officia banjo master cleanse cupping kickstarter. Kale chips freegan actually, marxism knausgaard mlkshk bushwick et pitchfork brunch PBR&amp;B vibecession tofu shoreditch. Brooklyn affogato XOXO, freegan iPhone grailed culpa. Live-edge heirloom consequat beard, gochujang quis Brooklyn pork belly.</p><p><br></p><p>Health goth godard in cupping 8-bit cold-pressed pok pok heirloom. Heirloom vape biodiesel poke magna. Polaroid blue bottle cloud bread offal. Lo-fi sartorial fam copper mug, church-key air plant bicycle rights keffiyeh.</p><p><br></p><p>Health goth dolor non edison bulb. Selfies hot chicken hammock same grailed pop-up quis big mood tacos next level taxidermy. Cardigan irure shoreditch reprehenderit pour-over lyft umami mukbang DIY nisi squid lomo chambray laboris. Irure kombucha tattooed, eiusmod taiyaki pour-over small batch vegan laborum incididunt master cleanse est et YOLO cray.</p>', 'Smart Homes,Real Estate Technology,Home Automation', 3, '2024-11-13 06:31:44', '2024-12-15 00:24:50'),
(23, 1, 7, 'Navigating the Luxury Real Estate Market: A Buyer\'s Guide', 'navigating-the-luxury-real-estate-market-a-buyers-guide', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731462294/y7k2bf7zx5kiuzvrsmap.png', 'An in-depth look at the nuances of purchasing luxury properties, including market trends, investment potential, and key considerations for discerning buyers.', '<p>The luxury real estate market offers unparalleled opportunities for those seeking not just a home, but a statement of lifestyle and investment. However, navigating this exclusive sector requires a keen understanding of its unique dynamics. This guide delves into the intricacies of buying luxury properties, from identifying the right location to assessing the true value of high-end amenities.</p><p><br></p><p><strong>1. Understanding Luxury Market Trends</strong></p><p><br></p><p>The luxury market is influenced by factors distinct from the broader real estate industry. Economic indicators, global wealth distribution, and even geopolitical events can impact property values and availability. Staying informed about these trends helps buyers make strategic decisions. For instance, emerging markets may offer growth potential, while established locales provide stability.</p><p><br></p><p><img src=\"https://res.cloudinary.com/dwgjvssdt/image/upload/v1731462315/nfv34nxcyn0uw1bosltt.png\"></p><p><br></p><p><strong>2. Location is Paramount</strong></p><p><br></p><p>In luxury real estate, location takes on heightened importance. Prime locations often feature exclusivity, privacy, and proximity to desirable amenities such as fine dining, cultural institutions, and natural beauty. Waterfront properties, urban penthouses, and estates in prestigious neighborhoods command higher premiums. Evaluate how the location aligns with your lifestyle and long-term investment goals.</p><p><br></p><p><strong>3. Evaluating Property Features and Amenities</strong></p><p><br></p><p>Luxury properties boast features that set them apart—think state-of-the-art smart home systems, wellness facilities like spas and gyms, wine cellars, and expansive outdoor spaces. It\'s essential to distinguish between amenities that enhance your personal enjoyment versus those that add tangible value. Customizations can be a double-edged sword; while they may suit your tastes, they might not appeal to future buyers.</p><p><br></p><p>Wayfarers unicorn iPhone, meggings typewriter solarpunk jianbing mustache. Lyft twee cray chambray keytar, everyday carry gorpcore air plant cardigan activated charcoal paleo art party. Pickled celiac kale chips gochujang artisan. Microdosing activated charcoal XOXO raclette tofu +1. Next level mixtape skateboard meggings sus keytar.</p><p><br></p><p>Tacos readymade biodiesel, live-edge green juice etsy sustainable chia swag affogato seitan gluten-free cardigan bushwick woke. Waistcoat williamsburg activated charcoal flexitarian gochujang humblebrag salvia tumeric pour-over sus live-edge gentrify pinterest. Mustache selvage selfies listicle. Jianbing street art slow-carb kombucha green juice post-ironic.</p><p><br></p><p>Coloring book edison bulb williamsburg ascot. Viral sus hashtag, swag green juice crucifix aesthetic. Hella chartreuse retro lumbersexual, humblebrag gluten-free try-hard banjo gentrify. Brooklyn jianbing tofu pug blue bottle hot chicken. Green juice pitchfork pop-up direct trade authentic butcher tbh crucifix praxis food truck synth plaid af poutine. Blue bottle snackwave asymmetrical, vexillologist street art church-key godard migas meggings sriracha. Kale chips cornhole marfa, vaporware heirloom pug microdosing vape direct trade thundercats helvetica ethical leggings echo park farm-to-table.</p><p><br></p><p>Cliche small batch jianbing, slow-carb gentrify biodiesel bushwick godard raw denim direct trade. Cred crucifix XOXO, tofu selvage quinoa schlitz gastropub chicharrones artisan big mood fit synth. Ennui live-edge iPhone, wayfarers taxidermy selvage blog skateboard vaporware JOMO kale chips knausgaard pug kombucha man bun. Flexitarian subway tile twee PBR&amp;B kogi, echo park hella pinterest next level fingerstache schlitz offal raw denim blog. YOLO keytar literally raw denim thundercats.</p>', 'Luxury Real Estate,High-End Properties,Exclusive Listings,Real Estate Advice', 0, '2024-11-13 06:47:08', '2024-12-15 00:24:50'),
(24, 3, 7, 'Eco-Friendly Homes: The Future of Sustainable Living', 'eco-friendly-homes-the-future-of-sustainable-living', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731462966/wqal30utaescnns7mggo.png', 'An exploration of eco-friendly building practices, sustainable materials, and how green homes are transforming the real estate market.', '<p>As environmental consciousness grows, eco-friendly homes have moved from niche to mainstream in the real estate market. Sustainable living isn\'t just beneficial for the planet; it also offers significant advantages to homeowners, including energy savings and improved health. This article examines the key features of eco-friendly homes and their impact on the future of housing.</p><p><br></p><p>Green building practices prioritize sustainability at every construction stage. This includes using renewable resources, minimizing waste, and reducing the carbon footprint. Certifications like LEED (Leadership in Energy and Environmental Design) set standards for environmentally responsible construction. Builders adopting these practices contribute to a market shift towards sustainability.</p><p><br></p><blockquote>Eco-friendly homes often feature energy-efficient appliances, superior insulation, and solar panels. Implementing renewable energy sources reduces reliance on fossil fuels and lowers utility bills. Innovations like geothermal heating and cooling systems provide efficient climate control by leveraging the earth\'s natural temperatures.</blockquote><p><br></p><p>Using sustainable materials like bamboo flooring, recycled metal, and reclaimed wood reduces environmental impact. Additionally, low-VOC (volatile organic compounds) paints and finishes improve indoor air quality, promoting healthier living environments. These choices reflect a commitment to both environmental and personal well-being. Water-efficient fixtures, rainwater harvesting systems, and xeriscaping are methods used to conserve water. Greywater recycling systems allow for the reuse of wastewater from sinks and showers for irrigation. These features are particularly valuable in regions prone to drought or water restrictions.</p><p><br></p><p><img src=\"https://res.cloudinary.com/dwgjvssdt/image/upload/v1731463030/shimxlrpvz3tpwduum6v.png\"></p><p><br></p><p>Celiac williamsburg retro jean shorts lomo, man bun craft beer kombucha YOLO austin neutra. Single-origin coffee cred next level, XOXO shaman whatever fam marxism aesthetic fanny pack farm-to-table af pug meditation viral. Neutra umami meh green juice. XOXO hella grailed literally, tumblr chillwave microdosing skateboard fingerstache celiac +1. Helvetica 90\'s grailed banjo pok pok celiac, mixtape schlitz tattooed letterpress post-ironic. Meditation tofu grailed, marfa pinterest biodiesel ascot humblebrag kitsch cupping jawn artisan kale chips hella. Street art man bun gluten-free poke dreamcatcher aesthetic YOLO chambray sartorial freegan.</p><p><br></p><p>Quinoa hammock tumblr +1, lo-fi XOXO 3 wolf moon asymmetrical offal. Normcore tilde green juice, mumblecore locavore bitters twee 8-bit hoodie tote bag hashtag semiotics. Iceland neutral milk hotel health goth la croix. Irony Brooklyn praxis schlitz before they sold out meh cliche.</p><p><br></p><p>Fit banjo YOLO mukbang hell of bodega boys raw denim waistcoat mustache art party intelligentsia tilde lomo pour-over. Cold-pressed marfa paleo artisan bespoke hammock snackwave gluten-free narwhal lo-fi swag irony sus. Hell of kogi scenester skateboard poutine portland air plant synth. Ramps keytar echo park tilde messenger bag iPhone, tousled small batch coloring book pabst 8-bit.</p><p><br></p><p>Yuccie pabst shabby chic XOXO neutral milk hotel air plant paleo vaporware. Quinoa glossier polaroid irony asymmetrical succulents gastropub thundercats occupy man bun crucifix JOMO keffiyeh fashion axe. Prism normcore thundercats, kombucha vape narwhal chia fanny pack PBR&amp;B keytar cold-pressed occupy praxis scenester gochujang. Poke cliche pok pok, vegan pork belly everyday carry authentic locavore. Sus pickled lomo cold-pressed, asymmetrical messenger bag wayfarers flannel squid tofu ennui lyft mukbang cloud bread. Tonx food truck snackwave health goth, ugh chia typewriter before they sold out actually readymade artisan austin taxidermy.</p><p><br></p><p>Banh mi hammock synth crucifix. Occupy live-edge jean shorts grailed try-hard succulents. Chia scenester letterpress lomo tumblr pug mixtape viral slow-carb. Street art meh live-edge blog crucifix tote bag selvage kinfolk. Shaman blue bottle echo park, ethical normcore lomo hell of aesthetic trust fund mlkshk fit JOMO selvage kitsch. Cray franzen jawn pug.</p><p><br></p><p><br></p>', 'Eco-Friendly Homes,Sustainable Living,Green Building,Energy Efficiency', 0, '2024-11-13 06:57:25', '2024-12-15 00:24:39'),
(25, 1, 7, 'Real Estate Investing 101: Building Wealth Through Property', 'real-estate-investing-101-building-wealth-through-property', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731538877/nu5cc0faswy0nbakqapj.png', 'An introductory guide to real estate investing, covering strategies for building a profitable property portfolio and achieving financial independence.', '<p>Real estate investing offers a pathway to financial growth and stability. Whether you\'re looking to generate passive income, diversify your investment portfolio, or achieve long-term wealth, understanding the fundamentals is crucial. This guide provides an overview of real estate investment strategies and tips for success.</p><p><br></p><p>There are various ways to invest in real estate, including rental properties, fix-and-flip projects, real estate investment trusts (REITs), and crowdfunding platforms. Each strategy has its own risk profile, capital requirements, and potential returns. Identifying your investment goals and risk tolerance is the first step in choosing the right approach.</p><p><br></p><p>Vaporware heirloom taiyaki, cold-pressed post-ironic selvage kitsch asymmetrical grailed trust fund. Bitters shoreditch authentic man braid drinking vinegar. Small batch iPhone squid fanny pack hell of biodiesel street art tofu. Authentic marfa irony glossier fit. Chambray DIY health goth venmo prism, locavore schlitz narwhal. Tonx fam coloring book XOXO, selfies unicorn post-ironic truffaut.</p><p><br></p><p>Health goth blackbird spyplane swag, cliche next level fingerstache vape beard narwhal DSA distillery solarpunk artisan. Direct trade man braid ennui bruh. Brooklyn trust fund celiac XOXO, copper mug cred snackwave venmo 90\'s. Small batch migas pork belly chia.</p><p><br></p><p>Organic mixtape mukbang authentic selvage. Synth jianbing taxidermy snackwave, master cleanse salvia dreamcatcher flexitarian crucifix etsy iPhone craft beer poutine mlkshk selfies. Gentrify echo park leggings gluten-free, umami church-key you probably haven\'t heard of them man bun pickled green juice pork belly air plant gastropub. Distillery paleo DSA hoodie leggings schlitz keytar XOXO hot chicken art party. Master cleanse knausgaard occupy gochujang biodiesel kombucha activated charcoal church-key air plant YOLO fanny pack narwhal lyft. Banjo keytar +1 freegan typewriter palo santo snackwave four dollar toast PBR&amp;B ugh roof party letterpress.</p><p><br></p><p>Ugh thundercats selfies man bun, slow-carb yr kickstarter fashion axe gentrify hexagon hella tonx vegan. Scenester vibecession bicycle rights chillwave quinoa street art air plant jean shorts raclette sustainable selfies. YOLO bicycle rights wayfarers sartorial twee scenester mlkshk chia. Neutra lomo kickstarter chillwave vinyl.</p>', 'Real Estate Investing,Property Portfolio,Financial Independence', 0, '2024-11-14 04:01:37', '2024-12-15 00:18:50'),
(26, 1, 6, 'How to Stage Your Home for a Quick Sale', 'how-to-stage-your-home-for-a-quick-sale', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731727105/lzji4kct0uravjguoeoz.png', 'Tips and strategies for effectively staging your home to attract buyers and expedite the selling process.', '<p>Selling a home quickly and at the desired price often hinges on making a strong first impression. Home staging is a powerful tool that showcases your property\'s best features, helping potential buyers envision themselves living there. This blog explores effective staging techniques that can make your home stand out in a competitive market.</p><p><br></p><p>The first step in staging is decluttering and depersonalizing your space. Removing personal items like family photos and memorabilia allows buyers to imagine their own belongings in the home. A clean, clutter-free environment also makes rooms appear larger and more inviting.</p><p><br></p><p><img src=\"https://res.cloudinary.com/dwgjvssdt/image/upload/v1731727063/w8oi9oecdm897zggeqkn.png\"></p><p><br></p><p>Neutralizing the color palette can appeal to a broader audience. While bold colors may reflect your personal style, neutral tones like whites, beiges, and grays create a blank canvas. Fresh paint can also refresh the space and eliminate any scuff marks or signs of wear.</p><p><br></p><p>Strategic furniture placement enhances the flow of a room and highlights its functionality. Arrange furniture to create open pathways and define areas for living, dining, and working. In smaller spaces, consider using mirrors to reflect light and create the illusion of more space.</p><p><br></p><p>Paying attention to lighting is crucial. Ensure that each room is well-lit by maximizing natural light and supplementing with artificial lighting where necessary. Open curtains and blinds during showings, and consider adding floor or table lamps to brighten darker areas.</p><p><br></p><p>Finally, don\'t overlook curb appeal. The exterior of your home is the first thing buyers see. Maintain the lawn, plant flowers, and ensure the entrance is welcoming. Small touches like a new welcome mat or freshly painted front door can make a significant difference in attracting buyers.</p><p><br></p><p>Drinking vinegar leggings enamel pin cupping poke. Jawn coloring book copper mug gochujang pork belly. Direct trade meditation kale chips pitchfork slow-carb. Cliche fingerstache iPhone biodiesel cray austin fam iceland ennui poke venmo subway tile. Roof party sus affogato marfa, austin semiotics af church-key blog. Offal 90\'s shoreditch gentrify slow-carb. Blog deep v gorpcore cupping fanny pack retro austin before they sold out church-key farm-to-table YOLO sustainable cornhole.</p><p><br></p><p>XOXO raclette messenger bag, actually blog fanny pack hot chicken yuccie heirloom shabby chic iceland +1 iPhone wayfarers readymade. Pug bruh chia mustache cloud bread 8-bit synth ramps polaroid gochujang big mood. Artisan air plant readymade grailed taiyaki. Typewriter cloud bread cardigan deep v vice. Shabby chic godard hoodie, 90\'s meditation banh mi yes plz mumblecore heirloom wolf.</p><p><br></p><p>Aesthetic hexagon forage iPhone woke. Poutine narwhal pop-up, 3 wolf moon before they sold out asymmetrical mixtape celiac organic lumbersexual occupy. Deep v photo booth hoodie succulents. Cloud bread twee hammock offal everyday carry YOLO, heirloom vegan prism big mood 8-bit meditation ethical pour-over ramps. Taiyaki lomo microdosing, church-key tote bag waistcoat cornhole butcher normcore pork belly mixtape lo-fi cred. Dreamcatcher jawn hexagon intelligentsia whatever sus copper mug.</p><p><br></p><p>Chicharrones PBR&amp;B shoreditch, photo booth everyday carry cred ramps. DSA dreamcatcher mlkshk irony man braid. Gochujang affogato twee af. Neutral milk hotel ascot etsy grailed, affogato pour-over actually authentic jawn distillery air plant. Skateboard tilde blue bottle kickstarter tattooed keytar humblebrag.</p>', 'Home Staging,Selling Tips,Real Estate Marketing,Curb Appeal', 0, '2024-11-16 08:19:57', '2024-12-15 00:15:38'),
(27, 1, 6, 'Understanding Homeowners Insurance: Protecting Your Investment', 'understanding-homeowners-insurance-protecting-your-investment', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731727573/qn5dbput3zt5wsepd36y.png', 'An essential guide to homeowners insurance, covering policy types, coverage options, and tips for selecting the right protection for your home.', '<p>Homeowners insurance is a critical component of safeguarding your property and personal assets. It provides financial protection against losses due to disasters, theft, and accidents. This blog aims to demystify homeowners insurance, helping you understand policy options and how to choose the coverage that best fits your needs.</p><p><br></p><p>Policies vary widely, but most standard plans cover the structure of your home, personal belongings, liability protection, and additional living expenses if your home becomes uninhabitable. It\'s important to assess the replacement cost of your home and possessions accurately to ensure adequate coverage.</p><p><br></p><p>Understanding the difference between actual cash value and replacement cost coverage is key. Actual cash value accounts for depreciation, potentially leaving you with less than needed to replace lost items. Replacement cost coverage provides funds to replace items at current market prices, offering more comprehensive protection.</p><p><br></p><p>Williamsburg jianbing vegan irony celiac. Marxism adaptogen flannel yes plz, yuccie food truck la croix man bun retro jean shorts jianbing. Lyft bushwick subway tile vibecession schlitz. Farm-to-table godard pinterest, sriracha cliche sartorial biodiesel. Offal jawn austin umami subway tile gastropub lomo raclette church-key. Big mood migas tattooed godard etsy VHS, hella swag adaptogen post-ironic ethical. Fam health goth vibecession cold-pressed, vaporware venmo kombucha selvage.</p><p><br></p><p>Kogi schlitz literally kickstarter pinterest, live-edge fixie farm-to-table iceland sartorial fanny pack occupy whatever prism thundercats. VHS direct trade venmo fingerstache blue bottle grailed flannel. +1 paleo vice selvage schlitz same vibecession glossier cardigan. +1 messenger bag small batch, retro ugh ethical wolf next level letterpress.</p><p><br></p><p>Leggings hot chicken fam lyft, meggings tattooed vegan. Slow-carb hashtag aesthetic pork belly, cliche scenester iPhone. Wolf poke hell of selvage blackbird spyplane leggings, gluten-free intelligentsia slow-carb vegan copper mug VHS woke iceland fit. 8-bit vice iPhone cred chambray chillwave listicle hella aesthetic gatekeep poutine viral brunch taiyaki.</p><p><br></p>', 'Homeowners Insurance,Property Protection,Insurance Policies,Financial Security,Risk Management', 0, '2024-11-16 08:26:21', '2024-11-16 08:26:21'),
(28, 4, 10, 'Preparing Your Home for Winter: Maintenance Tips to Protect Your Investment', 'preparing-your-home-for-winter-maintenance-tips-to-protect-your-investment', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1731728387/u1vfyttwersc4dg8subx.png', 'Essential winter home maintenance tasks that help prevent damage and maintain the value of your property.', '<p>As temperatures drop, preparing your home for winter becomes a priority. Proper maintenance not only ensures comfort during the cold months but also protects your property from potential damage. This blog outlines key tasks homeowners should undertake to safeguard their investment through the winter season.</p><p><br></p><p>Inspecting and cleaning gutters is crucial. Clogged gutters can lead to ice dams, causing water to back up and potentially damage your roof and interior walls. Ensure gutters and downspouts are clear of debris to allow proper drainage.</p><p>Sealing gaps and cracks around windows and doors prevents drafts and improves energy efficiency. Applying weatherstripping or caulking reduces heat loss, resulting in lower heating bills. It\'s also beneficial to check insulation in attics and crawl spaces to maintain consistent indoor temperatures.</p><p><br></p><p><img src=\"https://res.cloudinary.com/dwgjvssdt/image/upload/v1731728477/afxlvedu3oohh1nheqqh.png\"></p><p><br></p><p>Heating systems should be serviced before heavy use. Replace filters, check for leaks, and ensure that the system operates efficiently. This not only enhances performance but also reduces the risk of carbon monoxide leaks. Installing or testing smoke and carbon monoxide detectors adds an extra layer of safety.</p><p>Protecting plumbing is essential to prevent frozen pipes. Insulate exposed pipes in unheated areas like basements or garages. Let faucets drip slightly during extreme cold to keep water moving. Knowing how to shut off the main water supply can minimize damage if a pipe bursts.</p>', 'Home Maintenance,Winter Preparation,Property Protection,Energy Efficiency', 5, '2024-11-16 08:41:26', '2024-11-16 08:41:26'),
(29, 3, 13, '\"Exploring Alternative Housing: Tiny Homes, Container Houses, and More', 'exploring-alternative-housing-tiny-homes-container-houses-and-more', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1735837539/fiyibpdmoatrhq6fhiwi.jpg', 'An exploration of alternative housing options that offer innovative, sustainable, and cost-effective living solutions.', '<p>Traditional housing isn\'t the only option for those looking to own a home. Alternative housing solutions like tiny homes, container houses, and modular constructions are gaining popularity. This blog examines these unconventional options, highlighting their benefits and considerations.</p><p><br></p><p>Tiny homes emphasize simplicity and minimalism, often measuring under 400 square feet. They offer affordability, reduced environmental impact, and the freedom to relocate easily if built on wheels. Living in a tiny home requires thoughtful space utilization and a willingness to downsize possessions.</p><p><br></p><p>Container houses repurpose shipping containers into functional living spaces. They are durable, customizable, and can be more cost-effective than traditional construction. Container homes can be stacked or combined to create larger structures, offering flexibility in design.</p><p><br></p><p>+1 portland mumblecore squid schlitz jawn readymade tofu locavore shaman. Chambray ascot shabby chic cupping butcher kogi, same Brooklyn. Coloring book artisan neutral milk hotel blue bottle DIY blog man braid craft beer banh mi distillery gluten-free. Yr vaporware gastropub, chartreuse umami mlkshk cred actually jawn swag same blackbird spyplane tofu normcore. Chambray raw denim affogato scenester, bicycle rights four loko shoreditch gluten-free pinterest JOMO vaporware chicharrones. Intelligentsia vape man bun tumblr chia, fam shoreditch gentrify lyft selvage biodiesel selfies.</p><p><br></p><p>Wolf everyday carry keffiyeh, truffaut forage venmo hell of DSA fixie swag etsy. Tattooed tacos keffiyeh succulents beard coloring book kickstarter sriracha single-origin coffee lumbersexual. Shoreditch forage tilde truffaut, bodega boys yes plz DIY shaman. Sartorial lumbersexual artisan etsy bicycle rights. Tofu lomo taxidermy prism VHS same. Cornhole authentic ascot waistcoat lo-fi tattooed actually neutral milk hotel.</p><p><br></p><p>Ennui food truck shaman disrupt mukbang gorpcore palo santo synth semiotics thundercats pok pok. Schlitz bespoke vape pickled vexillologist hexagon cred man bun ascot hammock chartreuse crucifix sus hella. Godard lo-fi direct trade fashion axe. Bodega boys chillwave austin hell of listicle snackwave same green juice tote bag occupy etsy semiotics poutine live-edge. Craft beer squid typewriter, church-key fanny pack seitan vegan tattooed woke gatekeep meh. Microdosing cornhole cray tumeric meh, subway tile asymmetrical poutine tattooed photo booth marfa health goth lyft. Art party austin poke, vexillologist raclette wayfarers intelligentsia selfies palo santo yr paleo marxism.</p><p><br></p><p><br></p>', 'Alternative Housing,Tiny Homes.Sustainable Living,Modular Construction', 0, '2025-01-02 22:05:44', '2025-01-02 22:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'House', NULL, NULL),
(2, 'Apartment', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`, `state_id`) VALUES
(1, 'Springfield', '2018-05-17 10:00:20', '2018-05-17 10:00:20', 21),
(2, 'Agawam', '2018-05-17 10:00:54', '2018-05-17 10:00:54', 21),
(3, 'East  Longmeadow', '2018-05-17 10:01:19', '2018-05-17 10:01:19', 21),
(4, 'Longmeadow', '2018-05-17 10:01:34', '2018-05-17 10:01:34', 21),
(5, 'Chicopee', '2018-05-17 10:01:48', '2018-05-17 10:01:48', 21),
(6, 'Granby (CT)', '2018-05-17 10:01:57', '2018-05-17 10:01:57', 7),
(7, 'Granby (MA)', '2018-05-17 10:02:38', '2018-05-17 10:02:38', 21),
(8, 'Avon', '2018-05-17 10:02:50', '2018-05-17 10:02:50', 7),
(9, 'Enfield', '2018-05-17 10:02:57', '2018-05-17 10:02:57', 7),
(10, 'Sommers', '2018-05-17 10:03:09', '2018-05-17 10:03:09', 7),
(11, 'Suffield', '2018-05-17 10:03:22', '2018-05-17 10:03:22', 7),
(12, 'Westfield', '2018-05-17 10:03:38', '2018-05-17 10:03:38', 21),
(13, 'West Springfield', '2018-05-17 10:03:48', '2018-05-17 10:03:48', 21),
(14, 'Pittsfield', '2018-05-17 10:04:14', '2018-05-17 10:04:14', 21),
(15, 'Greenfield', '2018-05-17 10:04:33', '2018-05-17 10:04:33', 21),
(16, 'Brattleboro', '2018-05-17 10:05:15', '2018-05-17 10:05:15', 45),
(17, 'East Windsor', '2018-05-17 10:05:36', '2018-05-17 10:05:36', 7),
(18, 'Manchester', '2018-05-17 10:07:56', '2018-05-17 10:07:56', 7),
(19, 'Bloomfield', '2018-05-17 10:08:54', '2018-05-17 10:08:54', 7),
(20, 'Monson', '2018-05-17 10:09:06', '2018-05-17 10:09:06', 21),
(21, 'Wibraham', '2018-05-17 10:09:18', '2018-05-17 10:09:18', 21),
(22, 'Warren', '2018-05-17 10:34:35', '2018-05-17 10:34:35', 21),
(23, 'Holyoke', '2024-04-26 02:05:52', '2024-04-26 02:05:52', 21),
(24, 'New Haven', '2024-04-26 03:03:02', '2024-04-26 03:03:02', 7),
(25, 'New Britain', '2024-04-26 03:10:17', '2024-04-26 03:10:17', 7),
(28, 'Portland', '2024-10-12 22:45:38', '2024-10-12 22:45:38', 19),
(29, 'Chicago', '2024-10-12 22:51:22', '2024-10-12 22:51:22', 3),
(30, 'Springfield', '2024-10-13 01:24:34', '2024-10-13 01:24:34', 1),
(31, 'Concord', '2024-11-03 06:22:52', '2024-11-03 06:22:52', 29),
(32, 'Keene', '2024-11-03 06:23:50', '2024-11-03 06:23:50', 29),
(33, 'Burlington', '2024-11-03 06:25:35', '2024-11-03 06:25:35', 45),
(34, 'Treehaven', '2024-12-02 04:02:08', '2024-12-02 04:02:08', 45),
(35, 'Ware', '2024-12-02 04:08:24', '2024-12-02 04:08:24', 21),
(36, 'Warner', '2024-12-02 04:16:15', '2024-12-02 04:16:15', 39),
(37, 'Warrick', '2024-12-02 04:20:47', '2024-12-02 04:20:47', 39),
(38, 'Ludlow', '2024-12-03 04:43:27', '2024-12-03 04:43:27', 21),
(39, 'Fairway', '2024-12-07 23:05:07', '2024-12-07 23:05:07', 45);

-- --------------------------------------------------------

--
-- Table structure for table `extra_photo_fours`
--

CREATE TABLE `extra_photo_fours` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_photo_fours`
--

INSERT INTO `extra_photo_fours` (`id`, `file`, `created_at`, `updated_at`) VALUES
(28, '1522460183pexels-photo-280208.jpg', '2018-03-31 10:36:23', '2018-03-31 10:36:23'),
(29, '1522460535pexels-photo-709767.png', '2018-03-31 10:42:15', '2018-03-31 10:42:15'),
(30, '1522460785pexels-photo-265004.jpeg', '2018-03-31 10:46:25', '2018-03-31 10:46:25'),
(31, '1522460941pexels-photo-271624.jpg', '2018-03-31 10:49:01', '2018-03-31 10:49:01'),
(32, '1522461134pexels-photo-276653.jpeg', '2018-03-31 10:52:14', '2018-03-31 10:52:14'),
(33, '1522461277pexels-photo-77931.jpeg', '2018-03-31 10:54:37', '2018-03-31 10:54:37'),
(34, '1522785654pexels-photo-273669.jpeg', '2018-04-04 05:00:54', '2018-04-04 05:00:54'),
(35, '1522788571pexels-photo-276551.jpeg', '2018-04-04 05:49:31', '2018-04-04 05:49:31'),
(36, '1522788677pexels-photo-279719.jpg', '2018-04-04 05:51:17', '2018-04-04 05:51:17'),
(37, '1526257734pexels-photo-271618.jpg', '2018-05-14 09:28:54', '2018-05-14 09:28:54'),
(38, '1526257861pexels-photo-276551.jpeg', '2018-05-14 09:31:01', '2018-05-14 09:31:01'),
(39, '1526257996pexels-photo-273843.jpg', '2018-05-14 09:33:16', '2018-05-14 09:33:16'),
(40, '1526519762pexels-photo-263189.jpeg', '2018-05-17 10:16:02', '2018-05-17 10:16:02'),
(41, '1526519937pexels-photo-271753.jpeg', '2018-05-17 10:18:57', '2018-05-17 10:18:57'),
(42, '1526520079pexels-photo-257344.jpeg', '2018-05-17 10:21:19', '2018-05-17 10:21:19'),
(43, '1526522366pexels-photo-271722.jpg', '2018-05-17 10:59:26', '2018-05-17 10:59:26'),
(44, '1526522488pexels-photo-276508.jpg', '2018-05-17 11:01:28', '2018-05-17 11:01:28'),
(45, '1526522618pexels-photo-276551.jpeg', '2018-05-17 11:03:38', '2018-05-17 11:03:38'),
(46, '1526522809pexels-photo-276700.jpeg', '2018-05-17 11:06:49', '2018-05-17 11:06:49'),
(47, '1526523218pexels-photo-276511.jpg', '2018-05-17 11:13:38', '2018-05-17 11:13:38'),
(48, '1526523393pexels-photo-276724.jpeg', '2018-05-17 11:16:33', '2018-05-17 11:16:33'),
(49, '1526523545pexels-photo-709767.png', '2018-05-17 11:19:05', '2018-05-17 11:19:05'),
(50, '1526523820pexels-photo-279607.jpeg', '2018-05-17 11:23:40', '2018-05-17 11:23:40'),
(51, '1526524107pexels-photo-276715.jpeg', '2018-05-17 11:28:27', '2018-05-17 11:28:27'),
(52, '1526524294pexels-photo-342800.jpg', '2018-05-17 11:31:34', '2018-05-17 11:31:34'),
(53, '1526524449pexels-photo-545046.jpg', '2018-05-17 11:34:09', '2018-05-17 11:34:09'),
(54, '1526524609pexels-photo-279719.jpg', '2018-05-17 11:36:49', '2018-05-17 11:36:49'),
(55, '1526524856pexels-photo-276551.jpeg', '2018-05-17 11:40:56', '2018-05-17 11:40:56'),
(56, '1526525131pexels-photo-279607.jpeg', '2018-05-17 11:45:31', '2018-05-17 11:45:31'),
(57, '1526525357pexels-photo-276554.jpg', '2018-05-17 11:49:17', '2018-05-17 11:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `extra_photo_ones`
--

CREATE TABLE `extra_photo_ones` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_photo_ones`
--

INSERT INTO `extra_photo_ones` (`id`, `file`, `created_at`, `updated_at`) VALUES
(42, '1522460183kitchen-stove-sink-kitchen-counter-349749.jpg', '2018-03-31 10:36:23', '2018-03-31 10:36:23'),
(43, '1522460535pexels-photo-275484.jpeg', '2018-03-31 10:42:15', '2018-03-31 10:42:15'),
(44, '1522460785pexels-photo-121668.jpg', '2018-03-31 10:46:25', '2018-03-31 10:46:25'),
(45, '1522460941pexels-photo-106936.jpeg', '2018-03-31 10:49:01', '2018-03-31 10:49:01'),
(46, '1522461134pexels-photo-210265.jpg', '2018-03-31 10:52:14', '2018-03-31 10:52:14'),
(47, '1522461277pexels-photo-210265.jpg', '2018-03-31 10:54:37', '2018-03-31 10:54:37'),
(48, '1522785654pexels-photo-238377.jpeg', '2018-04-04 05:00:54', '2018-04-04 05:00:54'),
(49, '1522788571kitchen-stove-sink-kitchen-counter-349749.jpg', '2018-04-04 05:49:31', '2018-04-04 05:49:31'),
(50, '1522788677pexels-photo-276625.jpg', '2018-04-04 05:51:17', '2018-04-04 05:51:17'),
(51, '1526257734living-room-couch-interior-room-584399.jpeg', '2018-05-14 09:28:54', '2018-05-14 09:28:54'),
(52, '1526257860pexels-photo-271696.jpg', '2018-05-14 09:31:01', '2018-05-14 09:31:01'),
(53, '1526257996pexels-photo-271696.jpg', '2018-05-14 09:33:16', '2018-05-14 09:33:16'),
(54, '1526519762pexels-photo-189333.jpeg', '2018-05-17 10:16:02', '2018-05-17 10:16:02'),
(55, '1526519937kitchen-stove-sink-kitchen-counter-349749.jpg', '2018-05-17 10:18:57', '2018-05-17 10:18:57'),
(56, '1526520079pexels-photo-271696.jpg', '2018-05-17 10:21:19', '2018-05-17 10:21:19'),
(57, '1526522366pexels-photo-271654.jpeg', '2018-05-17 10:59:26', '2018-05-17 10:59:26'),
(58, '1526522488pexels-photo-269218.jpeg', '2018-05-17 11:01:28', '2018-05-17 11:01:28'),
(59, '1526522618pexels-photo-273669.jpeg', '2018-05-17 11:03:38', '2018-05-17 11:03:38'),
(60, '1526522809pexels-photo-276554.jpg', '2018-05-17 11:06:49', '2018-05-17 11:06:49'),
(61, '1526523217pexels-photo-210265.jpg', '2018-05-17 11:13:37', '2018-05-17 11:13:37'),
(62, '1526523393pexels-photo-273669.jpeg', '2018-05-17 11:16:33', '2018-05-17 11:16:33'),
(63, '1526523545pexels-photo-276700.jpeg', '2018-05-17 11:19:05', '2018-05-17 11:19:05'),
(64, '1526523820pexels-photo-271618.jpg', '2018-05-17 11:23:40', '2018-05-17 11:23:40'),
(65, '1526524107kitchen-stove-sink-kitchen-counter-349749.jpg', '2018-05-17 11:28:27', '2018-05-17 11:28:27'),
(66, '1526524294pexels-photo-276715.jpeg', '2018-05-17 11:31:34', '2018-05-17 11:31:34'),
(67, '1526524449pexels-photo-276724.jpeg', '2018-05-17 11:34:09', '2018-05-17 11:34:09'),
(68, '1526524609pexels-photo-262048.jpg', '2018-05-17 11:36:49', '2018-05-17 11:36:49'),
(69, '1526524856pexels-photo-261410.jpeg', '2018-05-17 11:40:56', '2018-05-17 11:40:56'),
(70, '1526525131pexels-photo-271618.jpg', '2018-05-17 11:45:31', '2018-05-17 11:45:31'),
(71, '1526525357pexels-photo-265004.jpeg', '2018-05-17 11:49:17', '2018-05-17 11:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `extra_photo_threes`
--

CREATE TABLE `extra_photo_threes` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_photo_threes`
--

INSERT INTO `extra_photo_threes` (`id`, `file`, `created_at`, `updated_at`) VALUES
(26, '1522453916pexels-photo-269218.jpeg', '2018-03-31 08:51:56', '2018-03-31 08:51:56'),
(27, '1522454874pexels-photo-257344.jpeg', '2018-03-31 09:07:54', '2018-03-31 09:07:54'),
(28, '1522460183pexels-photo-545034.jpg', '2018-03-31 10:36:23', '2018-03-31 10:36:23'),
(29, '1522460535pexels-photo-276583.jpeg', '2018-03-31 10:42:15', '2018-03-31 10:42:15'),
(30, '1522460785pexels-photo-238377.jpeg', '2018-03-31 10:46:25', '2018-03-31 10:46:25'),
(31, '1522460941pexels-photo-271632.jpg', '2018-03-31 10:49:01', '2018-03-31 10:49:01'),
(32, '1522461134pexels-photo-273843.jpg', '2018-03-31 10:52:14', '2018-03-31 10:52:14'),
(33, '1522461277pexels-photo-271795.jpeg', '2018-03-31 10:54:37', '2018-03-31 10:54:37'),
(34, '1522785654pexels-photo-271618.jpg', '2018-04-04 05:00:54', '2018-04-04 05:00:54'),
(35, '1522788571pexels-photo-271816.jpeg', '2018-04-04 05:49:31', '2018-04-04 05:49:31'),
(36, '1522788677pexels-photo-280239.jpg', '2018-04-04 05:51:17', '2018-04-04 05:51:17'),
(37, '1526257734pexels-photo-261045.jpg', '2018-05-14 09:28:54', '2018-05-14 09:28:54'),
(38, '1526257861pexels-photo-276677.jpeg', '2018-05-14 09:31:01', '2018-05-14 09:31:01'),
(39, '1526257996pexels-photo-265004.jpeg', '2018-05-14 09:33:16', '2018-05-14 09:33:16'),
(40, '1526519762pexels-photo-271632.jpg', '2018-05-17 10:16:02', '2018-05-17 10:16:02'),
(41, '1526519937pexels-photo-269262.jpg', '2018-05-17 10:18:57', '2018-05-17 10:18:57'),
(42, '1526520079pexels-photo-273822.jpeg', '2018-05-17 10:21:19', '2018-05-17 10:21:19'),
(43, '1526522366pexels-photo-271654.jpeg', '2018-05-17 10:59:26', '2018-05-17 10:59:26'),
(44, '1526522488pexels-photo-276583.jpeg', '2018-05-17 11:01:28', '2018-05-17 11:01:28'),
(45, '1526522618pexels-photo-189333.jpeg', '2018-05-17 11:03:38', '2018-05-17 11:03:38'),
(46, '1526522809pexels-photo-121668.jpg', '2018-05-17 11:06:49', '2018-05-17 11:06:49'),
(47, '1526523217pexels-photo-271816.jpeg', '2018-05-17 11:13:37', '2018-05-17 11:13:37'),
(48, '1526523393pexels-photo-276625.jpg', '2018-05-17 11:16:33', '2018-05-17 11:16:33'),
(49, '1526523545pexels-photo-309724.jpg', '2018-05-17 11:19:05', '2018-05-17 11:19:05'),
(50, '1526523820pexels-photo-238377.jpeg', '2018-05-17 11:23:40', '2018-05-17 11:23:40'),
(51, '1526524107pexels-photo-121668.jpg', '2018-05-17 11:28:27', '2018-05-17 11:28:27'),
(52, '1526524294pexels-photo-271753.jpeg', '2018-05-17 11:31:34', '2018-05-17 11:31:34'),
(53, '1526524449pexels-photo-545034.jpg', '2018-05-17 11:34:09', '2018-05-17 11:34:09'),
(54, '1526524609pexels-photo-269218.jpeg', '2018-05-17 11:36:49', '2018-05-17 11:36:49'),
(55, '1526524856pexels-photo-271632.jpg', '2018-05-17 11:40:56', '2018-05-17 11:40:56'),
(56, '1526525131pexels-photo-271696.jpg', '2018-05-17 11:45:31', '2018-05-17 11:45:31'),
(57, '1526525357pexels-photo-238377.jpeg', '2018-05-17 11:49:17', '2018-05-17 11:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `extra_photo_twos`
--

CREATE TABLE `extra_photo_twos` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_photo_twos`
--

INSERT INTO `extra_photo_twos` (`id`, `file`, `created_at`, `updated_at`) VALUES
(34, '1522460183pexels-photo-276508.jpg', '2018-03-31 10:36:23', '2018-03-31 10:36:23'),
(35, '1522460535pexels-photo-276551.jpeg', '2018-03-31 10:42:15', '2018-03-31 10:42:15'),
(36, '1522460785pexels-photo-261410.jpeg', '2018-03-31 10:46:25', '2018-03-31 10:46:25'),
(37, '1522460941pexels-photo-269218.jpeg', '2018-03-31 10:49:01', '2018-03-31 10:49:01'),
(38, '1522461134living-room-couch-interior-room-584399.jpeg', '2018-03-31 10:52:14', '2018-03-31 10:52:14'),
(39, '1522461277pexels-photo-257344.jpeg', '2018-03-31 10:54:37', '2018-03-31 10:54:37'),
(40, '1522785654pexels-photo-106936.jpeg', '2018-04-04 05:00:54', '2018-04-04 05:00:54'),
(41, '1522788571pexels-photo-271654.jpeg', '2018-04-04 05:49:31', '2018-04-04 05:49:31'),
(42, '1522788677pexels-photo-276653.jpeg', '2018-04-04 05:51:17', '2018-04-04 05:51:17'),
(43, '1526257734pexels-photo-259962.jpg', '2018-05-14 09:28:54', '2018-05-14 09:28:54'),
(44, '1526257861pexels-photo-273669.jpeg', '2018-05-14 09:31:01', '2018-05-14 09:31:01'),
(45, '1526257996pexels-photo-269262.jpg', '2018-05-14 09:33:16', '2018-05-14 09:33:16'),
(46, '1526519762pexels-photo-210552.jpeg', '2018-05-17 10:16:02', '2018-05-17 10:16:02'),
(47, '1526519937pexels-photo-77931.jpeg', '2018-05-17 10:18:57', '2018-05-17 10:18:57'),
(48, '1526520079pexels-photo-261410.jpeg', '2018-05-17 10:21:19', '2018-05-17 10:21:19'),
(49, '1526522366pexels-photo-238377.jpeg', '2018-05-17 10:59:26', '2018-05-17 10:59:26'),
(50, '1526522488pexels-photo-265004.jpeg', '2018-05-17 11:01:28', '2018-05-17 11:01:28'),
(51, '1526522618pexels-photo-265004.jpeg', '2018-05-17 11:03:38', '2018-05-17 11:03:38'),
(52, '1526522809living-room-couch-interior-room-584399.jpeg', '2018-05-17 11:06:49', '2018-05-17 11:06:49'),
(53, '1526523217pexels-photo-273822.jpeg', '2018-05-17 11:13:37', '2018-05-17 11:13:37'),
(54, '1526523393pexels-photo-271618.jpg', '2018-05-17 11:16:33', '2018-05-17 11:16:33'),
(55, '1526523545pexels-photo-238377.jpeg', '2018-05-17 11:19:05', '2018-05-17 11:19:05'),
(56, '1526523820pexels-photo-265004.jpeg', '2018-05-17 11:23:40', '2018-05-17 11:23:40'),
(57, '1526524107pexels-photo-77931.jpeg', '2018-05-17 11:28:27', '2018-05-17 11:28:27'),
(58, '1526524294pexels-photo-271795.jpeg', '2018-05-17 11:31:34', '2018-05-17 11:31:34'),
(59, '1526524449pexels-photo-238377.jpeg', '2018-05-17 11:34:09', '2018-05-17 11:34:09'),
(60, '1526524609pexels-photo-238377.jpeg', '2018-05-17 11:36:49', '2018-05-17 11:36:49'),
(61, '1526524856pexels-photo-261045.jpg', '2018-05-17 11:40:56', '2018-05-17 11:40:56'),
(62, '1526525131pexels-photo-189333.jpeg', '2018-05-17 11:45:31', '2018-05-17 11:45:31'),
(63, '1526525357pexels-photo-210552.jpeg', '2018-05-17 11:49:17', '2018-05-17 11:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `facility_name` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `street` varchar(255) NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `beds` int(10) UNSIGNED NOT NULL,
  `baths` int(10) UNSIGNED NOT NULL,
  `sqft` int(10) UNSIGNED NOT NULL,
  `fullpic_id` int(11) DEFAULT NULL,
  `extrapicone_id` int(11) DEFAULT NULL,
  `extrapictwo_id` int(11) DEFAULT NULL,
  `extrapicthree_id` int(11) DEFAULT NULL,
  `extrapicfour_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `descrip` text NOT NULL,
  `feat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `extraphotos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extraphotos`)),
  `main_photo` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) NOT NULL,
  `featured` bigint(20) NOT NULL DEFAULT 0,
  `sold` tinyint(1) NOT NULL DEFAULT 0,
  `sold_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `category_id`, `street`, `city_id`, `state_id`, `price`, `beds`, `baths`, `sqft`, `fullpic_id`, `extrapicone_id`, `extrapictwo_id`, `extrapicthree_id`, `extrapicfour_id`, `user_id`, `descrip`, `feat_id`, `created_at`, `updated_at`, `extraphotos`, `main_photo`, `city_name`, `featured`, `sold`, `sold_price`) VALUES
(1, 1, '24 Moonlight Drive', 1, 21, 300000, 5, 1, 3000, 77, 54, 46, 40, 40, 9, 'Elegant custom home offers unparalleled craftsmanship and exceptional \r\namenities! This French-inspired design is truly remarkable inside and out. \r\nFeatures include cherry cabinets, quartz countertops, crown molding, custom \r\nwindows provide plenty of natural lighting, expansive decking (1000 sq. ft.), \r\ngourmet kitchen with island (great for entertaining), gorgeous master suite, \r\nden, storage, plus STUNNING views ', 0, '2018-05-17 10:16:02', '2024-12-09 02:28:20', NULL, NULL, '', 0, 0, NULL),
(2, 2, '1968 Blue Moon Road', 2, 21, 350000, 6, 2, 4000, 78, NULL, NULL, NULL, NULL, 10, '<p>Masterful design and modern luxury are uniquely embodied in this 4 bedroom 4.5 bath Duplex Penthouse with a 4500 SF wraparound terrace atop Sky Lofts Condominium. This one-of-a-kind glass house, created by New York architect James Carpenter who designed 7 World Trade Center, is sheathed in high-performance, museum-quality insulated glass atop an historic Art Deco loft building in the heart of Tribeca. The sun and temperature-controlled glass envelope of its 7500 SF interior was tastefully designed with the top art collector in mind. Unobstructed 360 views from this penthouse are truly unparalleled, and include vistas of the Freedom Tower, Empire State Building and Hudson River.</p>', 0, '2018-05-17 10:18:57', '2024-12-15 00:22:02', '\"[\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526519937kitchen-stove-sink-kitchen-counter-349749.jpg\\\",\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526519937pexels-photo-77931.jpeg\\\",\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526519937pexels-photo-269262.jpg\\\",\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526519937pexels-photo-271753.jpeg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1729962032\\/tizscqkxyenrvynvj5c6.jpg\\\"]\"', '/images/houses/1526519937pexels-photo-164558.jpg', 'Agawam', 1, 0, NULL),
(3, 1, '1969 Sunnyvale Road', 4, 21, 450000, 7, 3, 4000, 79, 56, 48, 42, 42, 11, 'Living is easy in this impressive, generously spacious residence with Delta \r\nviews and access.\r\n\r\nThe open floor plan encompasses four spacious bedrooms with plenty of \r\nroom for study, sleep and storage, four and a half luxurious bathrooms, and a \r\nsleek and stylish gourmet kitchen that flows through to the dining room.  The \r\nexpansive living room opens up to a spacious rear patio with pool and spa and \r\nprivate boat dock on San Joaquin Delta. The master bedroom, complete with \r\nwalk-in closet and ensuite, ensures parents have a private space where they \r\ncan enjoy the Delta views on their private balcony.\r\n\r\nPerfect for anyone, this home is ideally positioned to enjoy summers on the \r\nDelta.  Truly resort style living in Brookside Country Club Estates.', 0, '2018-05-17 10:21:19', '2024-12-08 08:50:27', NULL, NULL, '', 0, 0, NULL),
(4, 1, '1973 Darkville Ave', 5, 21, 140000, 4, 1, 2000, 80, 57, 49, 43, 43, 12, '<p>This immaculate, professionally-designed 2-story condo with a private deck and patio invites comfort, and exudes modern elegance. With 2 bedrooms, 2 and a half baths, generous living space and stylish finishes, you\'ll enjoy a perfect setting for relaxing and entertaining. Beautiful mahogany hardwood floors and plenty of natural night flow throughout the home\'s open, airy layout. Other special highlights include a charming gas fireplace, rich exposed brick, chic recessed lighting and ceiling fans, a Kenmore Elite washer/dryer, marble baths, tons of storage space, and ready-for-cable wiring in all rooms.</p>', 0, '2018-05-17 10:59:26', '2024-12-09 02:30:50', '\"[\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526522366pexels-photo-271654.jpeg\\\",\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526522366pexels-photo-238377.jpeg\\\",\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526522366pexels-photo-271654.jpeg\\\",\\\"http:\\/\\/127.0.0.1:7000\\/images\\/interiors\\/1526522366pexels-photo-271722.jpg\\\"]\"', '/images/houses/1526522366pexels-photo-534184.jpg', 'Chicopee', 0, 0, NULL),
(5, 1, '5488 Hillside Road', 6, 7, 103000, 4, 1, 3000, 81, NULL, NULL, NULL, NULL, 11, '<p>This immaculate, professionally-designed 2-story condo with a private deck and patio invites comfort, and exudes modern elegance. With 2 bedrooms, 2 and a half baths, generous living space and stylish finishes, you\'ll enjoy a perfect setting for relaxing and entertaining. Beautiful mahogany hardwood floors and plenty of natural night flow throughout the home\'s open, airy layout. Other special highlights include a charming gas fireplace, rich exposed brick, chic recessed lighting and ceiling fans, a Kenmore Elite washer/dryer, marble baths, tons of storage space, and ready-for-cable wiring in all rooms.</p>', 0, '2018-05-17 11:01:28', '2024-12-09 02:30:38', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758431\\/xnn8pzink9mytlicbpxw.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758431\\/xqfg7iss2e7pwgzic0qb.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758432\\/rvadbiv8xarfxdeubm30.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758431\\/qr3nvt5vav26vwhbbi0z.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758432\\/a9txywgekptdtymmfnyc.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758432\\/giciqazdrasaswmwjtd1.jpg\\\"]\"', '/images/houses/1526522488pexels-photo-221024.jpg', 'Granby (CT)', 0, 0, NULL),
(6, 1, '669 Blue Ocean Drive', 10, 7, 400000, 8, 3, 4000, 82, 59, 51, 45, 45, 10, 'Living is easy in this impressive, generously spacious residence with Delta \r\nviews and access.\r\n\r\nThe open floor plan encompasses four spacious bedrooms with plenty of \r\nroom for study, sleep and storage, four and a half luxurious bathrooms, and a \r\nsleek and stylish gourmet kitchen that flows through to the dining room.  The \r\nexpansive living room opens up to a spacious rear patio with pool and spa and \r\nprivate boat dock on San Joaquin Delta. The master bedroom, complete with \r\nwalk-in closet and ensuite, ensures parents have a private space where they \r\ncan enjoy the Delta views on their private balcony.', 0, '2018-05-17 11:03:38', '2024-12-09 05:34:46', NULL, NULL, '', 5, 0, NULL),
(7, 1, '56 Morning Breeze Street', 17, 7, 300000, 5, 2, 3000, 83, 60, 52, 46, 46, 10, 'Paradise at The Point! This luxurious 5 bedroom 4.5 bath Dienst-built estate on \r\nthe Lake Norman peninsula is a dream home in a high-end community that\'s \r\nhome to Trump National Golf Club. Spanning over 4900 SF, this magnificent \r\nwaterfront residence graced by soaring ceilings and wall-to-wall windows is a \r\nhaven for gazing at Lake Norman views from multiple vantage points. The grand \r\nentryway with a sweeping staircase draws you into a voluminous layout made \r\nfor entertaining. ', 0, '2018-05-17 11:06:49', '2024-12-15 00:22:02', NULL, NULL, '', 0, 0, NULL),
(8, 1, '34 Greensville Road', 16, 45, 230000, 4, 1, 3000, 84, 61, 53, 47, 47, 9, 'It won’t be easy to click out of holiday mode in this stylishly contemporary \r\nresidence for the modern pleasure-seeker.\r\n\r\nCool, calm and sophisticated with a youthful edge, this functional home is \r\nenveloped in light and comfort. Crisp white walls, timber floors and high \r\nceilings create a style as timeless as the sparkling ocean view. The calming sea \r\nvista, captured through the extensive use of glass, will help you forget your \r\ncity stress.\r\n\r\nThis house screams ‘designer’ and will reflect the personality and taste of \r\nthose accustomed to the best in quality design, finishes and lifestyle', 0, '2018-05-17 11:13:38', '2018-05-17 11:13:38', NULL, NULL, '', 0, 0, NULL),
(9, 1, '718 White Clouds Ave', 17, 7, 300000, 5, 2, 3000, 85, 62, 54, 48, 48, 13, 'This immaculately presented apartment is set amongst manicured grounds \r\nwithin a private and secure complex. As a resident you will have access to \r\nlifestyle amenities including a lap pool, gymnasium, communal terraces, \r\nconcierge service and basement parking.\r\n\r\nThe floorplan incorporates 2 bedrooms, the main with built-in robe and \r\nensuite, a study nook, modern kitchen with quality appliances, luxurious \r\nbathroom, a cleverly concealed laundry and a spacious living/dining area. The \r\ngenerously proportioned interior flows effortlessly from the open-plan living \r\nspace to the private covered balcony from which you can admire the views of \r\nthe garden and beyond.\r\n\r\nWith its warm sense of community, and only moments to shops, eateries and \r\ntransport this home provides all the elements for relaxing, comfortable and \r\neasycare living.', 0, '2018-05-17 11:16:33', '2018-05-17 11:16:33', NULL, NULL, '', 0, 0, NULL),
(10, 1, '45 Forest Drive', 2, 21, 163000, 3, 1, 2000, 86, 63, 55, 49, 49, 7, 'This cozy cottage is nestled against a spectacular coastal backdrop with an \r\nunbroken view of the sea and a faraway coastline. With an environmentally \r\nconscious design that maximizes home efficiency, this spectacular, modern \r\nfamily home provides plenty of space for entertaining. This truly is a dream \r\nabode for the growing family.', 0, '2018-05-17 11:19:05', '2018-05-17 11:19:05', NULL, NULL, '', 0, 0, NULL),
(11, 1, '889 Woodsy Street', 1, 21, 180000, 3, 1, 2500, 88, 64, 56, 50, 50, 4, 'Embrace the spirit of DIY with this original cottage occupying a peaceful street \r\nposition. This charming weatherboard home features 3 roomy bedrooms and \r\nbright, open living spaces.\r\n\r\nThere’s plenty of potential for the savvy investor or first home buyer.', 0, '2018-05-17 11:23:40', '2018-05-17 11:24:28', NULL, NULL, '', 0, 0, NULL),
(12, 1, '1645 Peachville Drive', 2, 21, 240500, 5, 1, 2300, 89, 65, 57, 51, 51, 6, 'The living is easy in this impressive, generously proportioned contemporary \r\nresidence with lake and ocean views, located within a level stroll to the sand \r\nand surf.\r\n\r\nThe floor plan encompasses four spacious bedrooms with plenty of room for \r\nstudy, sleep and storage, three luxurious bathrooms, and a sleek and stylish \r\nkitchen that flows through to the dining room and private rear patio. The \r\nmaster bedroom, complete with walk-in robe and ensuite, ensures parents \r\nhave a private space where they can enjoy the view.\r\n\r\nPerfect for a family or as a holiday retreat, this home is ideally positioned to \r\nenjoy the proximity to beaches, cafes and restaurants, shopping centre, and a \r\nselection of premier schools.', 0, '2018-05-17 11:28:27', '2018-05-17 11:28:27', NULL, NULL, '', 2, 0, NULL),
(13, 1, '90 Granite Ave', 3, 21, 250000, 5, 1, 3000, 90, 66, 58, 52, 52, 12, 'The living is easy in this impressive, generously proportioned contemporary \r\nresidence with lake and ocean views, located within a level stroll to the sand \r\nand surf.\r\n\r\nThe floor plan encompasses four spacious bedrooms with plenty of room for \r\nstudy, sleep and storage, three luxurious bathrooms, and a sleek and stylish \r\nkitchen that flows through to the dining room and private rear patio. The \r\nmaster bedroom, complete with walk-in robe and ensuite, ensures parents \r\nhave a private space where they can enjoy the view.\r\n\r\nPerfect for a family or as a holiday retreat, this home is ideally positioned to \r\nenjoy the proximity to beaches, cafes and restaurants, shopping centre, and a \r\nselection of premier schools.', 0, '2018-05-17 11:31:34', '2018-05-17 11:31:34', NULL, NULL, '', 0, 0, NULL),
(14, 1, '1968 Rocky Hill Road', 9, 7, 180000, 4, 1, 2000, 91, 67, 59, 53, 53, 9, 'The living is easy in this impressive, generously proportioned contemporary \r\nresidence with lake and ocean views, located within a level stroll to the sand \r\nand surf.\r\n\r\nThe floor plan encompasses four spacious bedrooms with plenty of room for \r\nstudy, sleep and storage, three luxurious bathrooms, and a sleek and stylish \r\nkitchen that flows through to the dining room and private rear patio. The \r\nmaster bedroom, complete with walk-in robe and ensuite, ensures parents \r\nhave a private space where they can enjoy the view.\r\n\r\nPerfect for a family or as a holiday retreat, this home is ideally positioned to \r\nenjoy the proximity to beaches, cafes and restaurants, shopping centre, and a \r\nselection of premier schools.', 0, '2018-05-17 11:34:09', '2018-05-17 11:34:09', NULL, NULL, '', 3, 0, NULL),
(15, 1, '1969 Breezy Way', 12, 21, 330000, 5, 2, 4500, 92, 68, 60, 54, 54, 13, 'The living is easy in this impressive, generously proportioned contemporary \r\nresidence with lake and ocean views, located within a level stroll to the sand \r\nand surf.\r\n\r\nThe floor plan encompasses four spacious bedrooms with plenty of room for \r\nstudy, sleep and storage, three luxurious bathrooms, and a sleek and stylish \r\nkitchen that flows through to the dining room and private rear patio. The \r\nmaster bedroom, complete with walk-in robe and ensuite, ensures parents \r\nhave a private space where they can enjoy the view.\r\n\r\nPerfect for a family or as a holiday retreat, this home is ideally positioned to \r\nenjoy the proximity to beaches, cafes and restaurants, shopping centre, and a \r\nselection of premier schools.', 0, '2018-05-17 11:36:49', '2018-05-17 11:36:49', NULL, NULL, '', 0, 0, NULL),
(16, 1, '68 Winter Drive', 18, 7, 465000, 7, 3, 4500, 93, 69, 61, 55, 55, 10, 'This immaculately presented apartment is set amongst manicured grounds \r\nwithin a private and secure complex. As a resident you will have access to \r\nlifestyle amenities including a lap pool, gymnasium, communal terraces, \r\nconcierge service and basement parking.\r\n\r\nThe floorplan incorporates 2 bedrooms, the main with built-in robe and \r\nensuite, a study nook, modern kitchen with quality appliances, luxurious \r\nbathroom, a cleverly concealed laundry and a spacious living/dining area. The \r\ngenerously proportioned interior flows effortlessly from the open-plan living \r\nspace to the private covered balcony from which you can admire the views of \r\nthe garden and beyond.\r\n\r\nWith its warm sense of community, and only moments to shops, eateries and \r\ntransport this home provides all the elements for relaxing, comfortable and \r\neasycare living', 0, '2018-05-17 11:40:56', '2018-05-17 11:40:56', NULL, NULL, '', 0, 0, NULL),
(17, 1, '1071 Floral Street', 2, 21, 270600, 5, 1, 3200, 94, 70, 62, 56, 56, 6, 'This cozy cottage is nestled against a spectacular coastal backdrop with an \r\nunbroken view of the sea and a faraway coastline. With an environmentally \r\nconscious design that maximizes home efficiency, this spectacular, modern \r\nfamily home provides plenty of space for entertaining. This truly is a dream \r\nabode for the growing family.', 0, '2018-05-17 11:45:31', '2018-05-17 11:45:31', NULL, NULL, '', 0, 0, NULL),
(18, 1, '545 Lightning Circle', 7, 21, 251000, 4, 1, 3000, 95, 71, 63, 57, 57, 12, 'Embrace the spirit of DIY with this original cottage occupying a peaceful street \r\nposition. This charming weatherboard home features 3 roomy bedrooms and \r\nbright, open living spaces.\r\n\r\nThere’s plenty of potential for the savvy investor or first home buyer.', 0, '2018-05-17 11:49:17', '2018-05-17 11:49:17', NULL, NULL, '', 0, 0, NULL),
(21, 2, '71 Redfrens Road', 14, 21, 400000, 6, 3, 250, 94, NULL, NULL, NULL, NULL, 3, 'Elegant custom home offers unparalleled craftsmanship and exceptional \namenities! This French-inspired design is truly remarkable inside and out. \nFeatures include cherry cabinets, quartz countertops, crown molding, custom \nwindows provide plenty of natural lighting, expansive decking (1000 sq. ft.), \ngourmet kitchen with island (great for entertaining), gorgeous master suite, \nden, storage, plus STUNNING views', 1, '2024-04-25 02:54:27', '2024-04-25 02:54:27', NULL, 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1717627622/Envirogreen/pexels-pixabay-277667.jpg', '', 0, 0, NULL),
(22, 1, '69 Blueridge Road', 7, 21, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 13, 'Elegant custom home offers unparalleled craftsmanship and exceptional \namenities! This French-inspired design is truly remarkable inside and out. \nFeatures include cherry cabinets, quartz countertops, crown molding, custom \nwindows provide plenty of natural lighting, expansive decking (1000 sq. ft.), \ngourmet kitchen with island (great for entertaining), gorgeous master suite, \nden, storage, plus STUNNING views', NULL, '2024-04-26 02:27:54', '2024-04-26 02:27:54', NULL, 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1713916455/Envirogreen/jinjoe_a_large_home_in_a_quiet_neighborhood_in_the_style_of_u_63eda1cd-a1a8-4f2d-837a-6398244bab67_1.png', 'Holyoke', 0, 0, NULL),
(24, 1, '69 Blueridge Road', 23, 21, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 13, 'Elegant custom home offers unparalleled craftsmanship and exceptional \namenities! This French-inspired design is truly remarkable inside and out. \nFeatures include cherry cabinets, quartz countertops, crown molding, custom \nwindows provide plenty of natural lighting, expansive decking (1000 sq. ft.), \ngourmet kitchen with island (great for entertaining), gorgeous master suite, \nden, storage, plus STUNNING views', NULL, '2024-04-26 02:33:23', '2024-04-26 02:33:23', NULL, 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1717627622/Envirogreen/pexels-pixabay-209315.jpg', 'Holyoke', 0, 0, NULL),
(25, 1, '73 Moonglow Road', 2, 21, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 13, '<p>Elegant custom home offers unparalleled craftsmanship and exceptional amenities! This French-inspired design is truly remarkable inside and out.Features include cherry cabinets, quartz countertops, crown molding, custom windows provide plenty of natural lighting, expansive decking (1000 sq. ft.), gourmet kitchen with island (great for entertaining), gorgeous master suite, den, storage, plus STUNNING views </p>', NULL, '2024-04-26 02:36:58', '2024-04-26 02:36:58', NULL, 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1717627629/Envirogreen/pexels-heyho-7031593.jpg', 'Agawam', 0, 0, NULL),
(26, 1, '75 Moonglow Road', 2, 21, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 13, '<p>Elegant custom home offers unparalleled craftsmanship and exceptional amenities! This French-inspired design is truly remarkable inside and out.Features include cherry cabinets, quartz countertops, crown molding, custom windows provide plenty of natural lighting, expansive decking (1000 sq. ft.), gourmet kitchen with island (great for entertaining), gorgeous master suite, den, storage, plus STUNNING views </p>', NULL, '2024-04-26 02:38:37', '2024-04-26 02:38:37', NULL, 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1717627615/Envirogreen/pexels-pixabay-209274.jpg', 'Agawam', 4, 0, NULL),
(27, 1, '75 Moonglow Road', 2, 21, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 13, '<p>Elegant custom home offers unparalleled craftsmanship and exceptional amenities! This French-inspired design is truly remarkable inside and out.Features include cherry cabinets, quartz countertops, crown molding, custom windows provide plenty of natural lighting, expansive decking (1000 sq. ft.), gourmet kitchen with island (great for entertaining), gorgeous master suite, den, storage, plus STUNNING views </p>', NULL, '2024-04-26 02:53:51', '2024-04-26 02:53:51', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916451\\/Envirogreen\\/blackbirdai_85975_interior_of_a_modern_european_flat_bedroom_ph_5ca63423-4947-416e-8089-369cc3b4e565.png\\\", \\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916444\\/Envirogreen\\/jadedea_An_8k_uhd_resolution_photo_realistic_living_room_with_a_90c4ba5d-2e2a-4715-929a-e424ea83b002.png\\\"]\"', 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1717627603/Envirogreen/pexels-curtis-adams-1694007-3935333.jpg', 'Agawam', 0, 0, NULL),
(28, 1, '88 Greeway Road', 23, 21, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 12, '<p>Elegant custom home offers unparalleled craftsmanship and exceptional amenities! This French-inspired design is truly remarkable inside and out.Features include cherry cabinets, quartz countertops, crown molding, custom windows provide plenty of natural lighting, expansive decking (1000 sq. ft.), gourmet kitchen with island (great for entertaining), gorgeous master suite, den, storage, plus STUNNING views </p>', NULL, '2024-04-26 02:55:22', '2024-04-26 02:55:22', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916451\\/Envirogreen\\/blackbirdai_85975_interior_of_a_modern_european_flat_bedroom_ph_5ca63423-4947-416e-8089-369cc3b4e565.png\\\", \\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916444\\/Envirogreen\\/jadedea_An_8k_uhd_resolution_photo_realistic_living_room_with_a_90c4ba5d-2e2a-4715-929a-e424ea83b002.png\\\"]\"', 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1713916445/Envirogreen/aaravsawlani_suburban_home_with_beautiful_front_lawn_on_a_sunny_7447f54a-9488-49d1-b613-aecdec5fb95f.png', 'Holyoke', 0, 0, NULL),
(29, 1, '89 Greeway Road', 23, 21, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 13, '<p>Elegant custom home offers unparalleled craftsmanship and exceptional amenities! This French-inspired design is truly remarkable inside and out.Features include cherry cabinets, quartz countertops, crown molding, custom windows provide plenty of natural lighting, expansive decking (1000 sq. ft.), gourmet kitchen with island (great for entertaining), gorgeous master suite, den, storage, plus STUNNING views </p>', NULL, '2024-04-26 03:00:14', '2024-04-26 03:00:14', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916451\\/Envirogreen\\/blackbirdai_85975_interior_of_a_modern_european_flat_bedroom_ph_5ca63423-4947-416e-8089-369cc3b4e565.png\\\", \\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916444\\/Envirogreen\\/jadedea_An_8k_uhd_resolution_photo_realistic_living_room_with_a_90c4ba5d-2e2a-4715-929a-e424ea83b002.png\\\"]\"', 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1717627593/Envirogreen/pexels-scottwebb-1029599.jpg', 'Holyoke', 0, 0, NULL),
(30, 1, '7 Blue Ave', 25, 7, 250000, 4, 2, 250, NULL, NULL, NULL, NULL, NULL, 13, '<p>Elegant custom home offers unparalleled craftsmanship and exceptional amenities! This French-inspired design is truly remarkable inside and out.Features include cherry cabinets, quartz countertops, crown molding, custom windows provide plenty of natural lighting, expansive decking (1000 sq. ft.), gourmet kitchen with island (great for entertaining), gorgeous master suite, den, storage, plus STUNNING views </p>', NULL, '2024-04-26 03:03:02', '2024-12-09 05:34:46', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916451\\/Envirogreen\\/blackbirdai_85975_interior_of_a_modern_european_flat_bedroom_ph_5ca63423-4947-416e-8089-369cc3b4e565.png\\\", \\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1713916444\\/Envirogreen\\/jadedea_An_8k_uhd_resolution_photo_realistic_living_room_with_a_90c4ba5d-2e2a-4715-929a-e424ea83b002.png\\\"]\"', 'https://res.cloudinary.com/dwgjvssdt/image/upload/v1713916457/Envirogreen/jinjoe_a_large_home_in_a_quiet_neighborhood_in_the_style_of_u_32a877fa-4a28-4d1a-891a-59e6c84f00dc_1.png', 'New Britain', 0, 0, NULL),
(34, 1, '22 Morninghour Road', 23, 21, 350000, 4, 2, 3000, NULL, NULL, NULL, NULL, NULL, 13, '<p>Fashion axe gentrify aute jawn taiyaki, in occaecat man braid 90\'s consectetur sed quinoa mlkshk commodo shaman. Fingerstache slow-carb vinyl consectetur. Adaptogen lo-fi you probably haven\'t heard of them hexagon. Reprehenderit poke quinoa distillery umami velit meh shoreditch, JOMO narwhal gastropub kale chips same salvia. Kale chips mollit shoreditch vape craft beer lo-fi yes plz ullamco. 90\'s kinfolk laboris occupy.</p><p>Aute same XOXO sint viral adipisicing. Tote bag beard jianbing vape hot chicken PBR&amp;B paleo iceland. Ipsum vape subway tile, gastropub beard hoodie fingerstache aliquip yr. Health goth umami bodega boys actually, everyday carry live-edge magna ethical banh mi aesthetic vibecession shoreditch. Copper mug viral lorem godard hexagon meh. Helvetica drinking vinegar truffaut heirloom air plant prism woke fashion axe aliquip fixie af marfa intelligentsia williamsburg.</p>', NULL, '2024-10-02 03:07:56', '2024-10-02 03:07:56', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823843\\/ae4yg4tyt3tg5jgi9zao.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823843\\/nsfly68w1xiwpcbowp0b.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823844\\/ujsnbkizbbvnh4wxlgp7.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823844\\/jxpgqwt1tho9gulo0xwt.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823844\\/ivzsgdugmmy1stt0ac0c.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823843\\/mtv4ixmjshdq5pt7ekiz.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823845\\/aaqbbglofcz0znwccpps.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823845\\/iudp3cgogcbzb8n0w2c5.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823845\\/jizrpetfe5xmjje8nzpt.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823845\\/la4mvwxmua2galmqecve.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823845\\/dlepqfudgnnkyreztwog.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823845\\/onh6ukted7hm8njyjyhm.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823846\\/nn1lj4fux4pw4jy18nz1.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1727823846\\/fkzhjoxfl0ftn5sz432m.jpg\\\"]\"', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1727823887/ceecrtpmhaidtrvq4rkn.jpg', 'Holyoke', 0, 0, NULL),
(35, 1, 'Sunny Avenue', 9, 7, 300000, 5, 2, 300, NULL, NULL, NULL, NULL, NULL, 3, '<p>Listicle kale chips ea est selvage scenester. Keffiyeh selfies dolor chartreuse et quinoa aliqua slow-carb DSA selvage DIY. Everyday carry farm-to-table schlitz lo-fi actually etsy ut. Schlitz snackwave ugh aesthetic gatekeep.</p><p>Chambray butcher authentic waistcoat, small batch ut disrupt af shaman tonx dolore meggings knausgaard narwhal in. Ethical sustainable post-ironic forage microdosing direct trade franzen waistcoat hexagon mlkshk irony yes plz DSA. Palo santo authentic hoodie, cardigan knausgaard literally pour-over. Ex eiusmod jean shorts, lorem esse pok pok drinking vinegar ascot magna mlkshk.</p><p>Yuccie salvia anim seitan. Gorpcore pug tofu, blackbird spyplane echo park raclette helvetica sint kogi slow-carb raw denim microdosing activated charcoal organic in. Activated charcoal Brooklyn yr, microdosing in do aute eu pitchfork shabby chic copper mug retro. Gluten-free edison bulb pok pok, squid tattooed locavore pitchfork excepteur cred culpa same occaecat yr irony.</p><p>Heirloom big mood 8-bit scenester banh mi taiyaki iceland dolor enamel pin mixtape af sint swag tacos. Aute excepteur hella, fugiat master cleanse scenester letterpress vape. Fingerstache nostrud grailed bitters, narwhal distillery excepteur et synth consectetur brunch kinfolk banjo chia tattooed. Labore culpa kombucha, whatever cold-pressed la croix cloud bread voluptate. Etsy mixtape flexitarian williamsburg vegan cronut whatever officia cloud bread biodiesel flannel. Sriracha officia cillum, shoreditch plaid enamel pin street art vibecession kinfolk portland hashtag.</p><p>Distillery minim velit heirloom slow-carb butcher tattooed, occaecat put a bird on it quinoa hella air plant kitsch narwhal. Officia in kogi, la croix post-ironic farm-to-table ramps poutine kombucha austin try-hard dreamcatcher. Typewriter ex man bun bruh synth occaecat meggings direct trade. Knausgaard trust fund iPhone dolor vegan, semiotics neutral milk hotel. Fanny pack migas humblebrag vinyl meh ramps irony street art. Prism blog wayfarers, organic venmo big mood twee eu authentic. Excepteur tote bag pitchfork organic portland wayfarers readymade eu air plant est butcher literally tacos jean shorts velit.</p><p>Et grailed hoodie biodiesel gatekeep tbh, fit microdosing flannel. Hot chicken affogato chillwave qui tousled whatever ramps next level subway tile umami blackbird spyplane cupidatat pabst. Enim banjo artisan cupping gastropub subway tile excepteur chambray mukbang. Mumblecore mlkshk YOLO sus. Direct trade vice hell of fixie ea meh austin dolore.</p><p>Lyft butcher eiusmod gatekeep. Id vibecession narwhal authentic celiac put a bird on it anim ullamco sustainable. Salvia yes plz synth chia marfa readymade schlitz mukbang tousled sartorial occaecat. Cliche raw denim kombucha, selfies grailed hell of distillery freegan occupy. Pitchfork next level portland, in coloring book ipsum lo-fi authentic selfies knausgaard esse bespoke poutine DIY typewriter. Umami fam VHS, wayfarers JOMO cupidatat proident kombucha tattooed bodega boys af pok pok fixie irure art party.</p>', NULL, '2024-10-05 20:55:03', '2024-10-05 20:55:03', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147268\\/kijzp3iubtviomwmun1n.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147269\\/yxc78vrrs02dkhes3wic.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147269\\/ctgmhqoqjm6sa4fpamkz.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147269\\/ge2cegutt4vfxebmkx8s.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147269\\/uc2z40sagqyeypqsxmql.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147269\\/umgr7xy1thckvxostdvc.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147269\\/qgkuoecw5yxzf6lrrgtl.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147270\\/tpkopnuqbffykduwuww2.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147270\\/i75ogelunxicyljjginj.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728147270\\/teychxxn3bnk3nbda5uj.jpg\\\"]\"', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1728147187/bmfw8parl1vzkisanvc9.jpg', 'Enfield', 0, 0, NULL),
(36, 1, '1971 Williams Street', 28, 19, 400000, 6, 3, 600, NULL, NULL, NULL, NULL, NULL, 10, '<p>YOLO kombucha lyft man bun duis, shaman vegan tempor mollit marfa. Fanny pack la croix same sriracha sustainable before they sold out gentrify, 3 wolf moon retro glossier freegan venmo. Kinfolk pariatur vexillologist fixie marfa consectetur. Hashtag mixtape green juice vibecession veniam authentic. Selfies do gluten-free butcher af yuccie blue bottle cold-pressed woke ex in sustainable. </p><p><br></p><p>Excepteur officia craft beer beard eu.</p><p>Chicharrones artisan before they sold out fugiat, reprehenderit dolore exercitation proident laborum live-edge aesthetic sed aliquip synth. Locavore laborum pork belly, typewriter portland bruh cray leggings wolf pok pok migas. Coloring book authentic viral cloud bread vaporware, lo-fi dolor ipsum. Neutra cloud bread irure, ad aute shoreditch venmo pop-up. Vibecession pug cardigan, echo park mixtape ethical mlkshk fashion axe cloud bread mumblecore.</p><p><br></p><p>Hashtag irure keytar, unicorn ennui neutra helvetica retro leggings in fingerstache. Duis in affogato chillwave chia humblebrag pug godard anim excepteur glossier cold-pressed intelligentsia lorem kale chips. Ethical kogi food truck small batch praxis freegan tumblr jianbing prism officia raclette succulents drinking vinegar skateboard. Crucifix ut wolf, mustache put a bird on it in four dollar toast. Waistcoat cardigan bespoke poutine everyday carry.</p>', NULL, '2024-10-12 22:57:44', '2024-12-08 08:33:38', '\"[\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758430\\/ybdiz1tpnfrgeu59woia.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758431\\/xnn8pzink9mytlicbpxw.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758431\\/odsmpmm5kjn7nlf5ir1w.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758431\\/xqfg7iss2e7pwgzic0qb.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758432\\/rvadbiv8xarfxdeubm30.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758431\\/qr3nvt5vav26vwhbbi0z.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758432\\/a9txywgekptdtymmfnyc.jpg\\\",\\\"https:\\/\\/res.cloudinary.com\\/dwgjvssdt\\/image\\/upload\\/v1728758432\\/giciqazdrasaswmwjtd1.jpg\\\"]\"', 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1728758409/x59holjylnzyg3vwtuvq.jpg', 'Portland', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2017_12_30_015856_create_posts_table', 1),
(5, '2018_01_03_013953_create_categories_table', 1),
(6, '2018_02_18_193437_create_roles_table', 1),
(7, '2018_03_06_034118_create_photoStaff_table', 1),
(8, '2018_03_06_034156_create_photoListing_table', 1),
(9, '2018_03_06_035435_create_positions_table', 1),
(10, '2018_03_06_035531_create_listings_table', 1),
(11, '2018_03_13_235355_create_states_table', 1),
(12, '2018_05_15_222344_create_cities_table', 1),
(13, '2024_04_20_173940_create_personal_access_tokens_table', 1),
(14, '2024_04_20_180652_add_additional_fields_to_users_table', 1),
(15, '2018_03_12_234943_create_extra_photo_ones_table', 2),
(16, '2018_03_12_235001_create_extra_photo_twos_table', 2),
(17, '2018_03_12_235010_create_extra_photo_threes_table', 2),
(18, '2018_03_12_235021_create_extra_photo_fours_table', 2),
(19, '2018_01_18_195525_add_slug_column', 3),
(20, '2018_05_15_225033_add_state_column_to_cities_table', 4),
(21, '2024_04_20_193112_add_additional_fields_to_states_table', 5),
(22, '2024_04_24_225127_make_fields_nullable_in_listings_table', 6),
(23, '2024_04_24_230839_add_extraphotos_to_listings_table', 7),
(24, '2024_04_24_234250_make_fullpic_id_nullable_in_listings_table', 8),
(25, '2024_04_24_235144_add_main_photo_to_listings_table', 9),
(26, '2024_04_25_000155_make_city_id_nullable_in_listings_table', 10),
(27, '2024_04_25_222721_make_feat_id_nullable_in_listings_table', 11),
(28, '2023_03_08_190335_create_facilities_table', 12),
(29, '2023_03_20_182407_create_wishlists_table', 12),
(30, '2023_03_31_184038_create_blog_categories_table', 12),
(31, '2023_03_31_201542_create_blog_posts_table', 12),
(32, '2024_06_06_221813_add_featured_field_to_listings_table', 13),
(34, '2024_07_06_210050_update_cities_table_add_state_id', 14),
(35, '2024_10_05_144635_update_listings_table_add_sold', 15),
(36, '2024_11_04_203209_add_featured_to_blog_posts_table', 16),
(37, '2024_12_09_004144_create_settings_table', 17),
(38, '2024_12_10_010749_add_fields_to_settings_table', 18),
(39, '2024_12_15_200709_create_messages_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(5, 'App\\Models\\User', 3, 'myapptoken', '6868ad34858ab1900d6255e953655bcbb648d710bb35b586a58327585f952ebd', '[\"*\"]', '2024-06-29 21:18:08', NULL, '2024-04-28 02:13:05', '2024-06-29 21:18:08'),
(6, 'App\\Models\\User', 3, 'myapptoken', 'f94ea283e5f97131e9687641fcb0bf392fc811829664d7d3376f2308378bfe20', '[\"*\"]', NULL, NULL, '2024-05-05 01:35:21', '2024-05-05 01:35:21'),
(7, 'App\\Models\\User', 3, 'myapptoken', '57ca1c219268e2d6b12a25841f83b0fd1daefed1b5b68971ef37fd0e3d7a12ca', '[\"*\"]', NULL, NULL, '2024-06-09 01:44:03', '2024-06-09 01:44:03'),
(8, 'App\\Models\\User', 3, 'myapptoken', 'b38cbb543df93269a1d902be0c3ae828464a52b3bb186d28d69929527aeb3bb5', '[\"*\"]', NULL, NULL, '2024-10-06 01:22:17', '2024-10-06 01:22:17'),
(9, 'App\\Models\\User', 3, 'myapptoken', '0f890ef6284e23a40aa2791bdb5016a3a9a424fba1ff81a3c7394bed984e3f1c', '[\"*\"]', NULL, NULL, '2024-10-06 03:45:14', '2024-10-06 03:45:14'),
(10, 'App\\Models\\User', 3, 'myapptoken', 'e7e62d622ce10c56700c1e193cfdce068e52996b38503e0c3be212b26e63ffb8', '[\"*\"]', NULL, NULL, '2024-10-06 03:46:48', '2024-10-06 03:46:48'),
(11, 'App\\Models\\User', 3, 'myapptoken', 'f24db11a28349c4096bf914fc5e739776767c16e8403e8a347cb9b10118ca6d9', '[\"*\"]', NULL, NULL, '2024-10-06 03:47:51', '2024-10-06 03:47:51'),
(12, 'App\\Models\\User', 3, 'myapptoken', 'f32bead2f56d6adeb0f7a8cbb1c12c61ca622501fc472c6a65a4b9c503ad060e', '[\"*\"]', NULL, NULL, '2024-10-06 03:47:58', '2024-10-06 03:47:58'),
(13, 'App\\Models\\User', 3, 'myapptoken', 'c87bf99607c95c512b8fa06ef62eb7bd2a258c9c653314d9efe420831f12cb06', '[\"*\"]', NULL, NULL, '2024-10-06 03:48:52', '2024-10-06 03:48:52'),
(14, 'App\\Models\\User', 3, 'myapptoken', 'b3b280d006b294ff7e5641e67c1b9c3f4d2d9c7d52ac5722c862bb806ebd1a14', '[\"*\"]', NULL, NULL, '2024-10-06 03:50:52', '2024-10-06 03:50:52'),
(15, 'App\\Models\\User', 3, 'myapptoken', '5682513eca027073f882f8f861b0cf4f0c181d2d253670b79136809e8a93e36c', '[\"*\"]', NULL, NULL, '2024-10-06 03:56:43', '2024-10-06 03:56:43'),
(16, 'App\\Models\\User', 3, 'myapptoken', '2162e26dda9713d9b49d3b6bfef3dc8407d7a3078440f2e5b8715085bd6deeb9', '[\"*\"]', NULL, NULL, '2024-10-06 03:57:45', '2024-10-06 03:57:45'),
(17, 'App\\Models\\User', 3, 'myapptoken', '857c1247090d96bc599a96f51932ccd611e4a7b83d6e26433785b8815d647c7f', '[\"*\"]', NULL, NULL, '2024-10-06 04:01:59', '2024-10-06 04:01:59'),
(18, 'App\\Models\\User', 3, 'myapptoken', 'a36eec2a6eb6840f05c485e45939d9208000c70b46a967a65dcbd688c09b523f', '[\"*\"]', NULL, NULL, '2024-10-06 04:03:28', '2024-10-06 04:03:28'),
(19, 'App\\Models\\User', 3, 'myapptoken', '5daff297304358882da83365bd38b8c8ba5a9eec57bbdcfcddcab82ae81ddf97', '[\"*\"]', NULL, NULL, '2024-10-06 04:04:05', '2024-10-06 04:04:05'),
(20, 'App\\Models\\User', 3, 'myapptoken', 'b7e3dc45a836e17922cebf408d5f8bfc2aebf9acb2b8c668f36f45d3c7efcdde', '[\"*\"]', NULL, NULL, '2024-10-06 04:13:26', '2024-10-06 04:13:26'),
(21, 'App\\Models\\User', 3, 'myapptoken', '9aa9c08be7efd53f71b443fb9e041ce2b64c620d31b54f96ffcdaefbfdb9931e', '[\"*\"]', NULL, NULL, '2024-10-06 04:14:28', '2024-10-06 04:14:28'),
(22, 'App\\Models\\User', 3, 'myapptoken', '10f06a38eb2ff7c5364c6699047b97abc21fd5f3289951b6302b4b68fdd12540', '[\"*\"]', NULL, NULL, '2024-10-06 05:09:52', '2024-10-06 05:09:52'),
(23, 'App\\Models\\User', 3, 'myapptoken', '998b1fdf2e8b513f4440241e936de12924783ec7596505eff08c6b709553c307', '[\"*\"]', NULL, NULL, '2024-10-06 05:11:05', '2024-10-06 05:11:05'),
(24, 'App\\Models\\User', 3, 'myapptoken', '85f09c7b91a36d144be8bc08f2b838507d5a86919622a2a0e875fe8f1c4d502d', '[\"*\"]', NULL, NULL, '2024-10-06 23:27:24', '2024-10-06 23:27:24'),
(25, 'App\\Models\\User', 3, 'myapptoken', '2f6f20217f04d5e9b16a18d634360b355dd38c055230d257120c7a8d774d2e84', '[\"*\"]', '2024-11-13 06:31:44', NULL, '2024-10-06 23:28:56', '2024-11-13 06:31:44'),
(26, 'App\\Models\\User', 3, 'myapptoken', '7f5920984aa6832ce912eeff9e8d821be93b476daf1355f53e36a324617257b9', '[\"*\"]', NULL, NULL, '2024-11-04 02:07:39', '2024-11-04 02:07:39'),
(27, 'App\\Models\\User', 3, 'myapptoken', 'dd60d42fd7257c10aa526378d51ea0a7a0ad9289b6f06c6f4a64432025db590e', '[\"*\"]', '2024-11-04 23:42:56', NULL, '2024-11-04 02:17:16', '2024-11-04 23:42:56'),
(28, 'App\\Models\\User', 3, 'myapptoken', '999e5a9e9179b13745625193f042bfb6ed8bdc1c830406f616c8aa3d38a7226c', '[\"*\"]', NULL, NULL, '2024-11-04 02:25:55', '2024-11-04 02:25:55'),
(29, 'App\\Models\\User', 3, 'myapptoken', '72d64c4d3121970725c013bde47df44f89ec1e90edcac80e01b549d1e38205dc', '[\"*\"]', NULL, NULL, '2024-11-04 02:26:31', '2024-11-04 02:26:31'),
(30, 'App\\Models\\User', 3, 'myapptoken', '6ed44059e558ddc1f1e0113783bcef6106b71d01074385598ef90ff88339d9f3', '[\"*\"]', '2024-11-04 23:45:07', NULL, '2024-11-04 23:43:45', '2024-11-04 23:45:07'),
(31, 'App\\Models\\User', 3, 'myapptoken', '0cafb7698d779fc78ba9fb0bb890f924af9617a6bad787d76fcc2d3862fd53dd', '[\"*\"]', NULL, NULL, '2024-11-04 23:53:58', '2024-11-04 23:53:58'),
(32, 'App\\Models\\User', 3, 'myapptoken', '2067d24efab30ef0a4e012164ffeef0775354191ef5f37f03932b90f336934b7', '[\"*\"]', '2024-11-05 01:16:47', NULL, '2024-11-05 00:01:59', '2024-11-05 01:16:47'),
(34, 'App\\Models\\User', 7, 'myapptoken', '41d2489341ba5c40ec5b502db7d4b03c0adbe18c3f5cadbb794565809323f86b', '[\"*\"]', '2024-11-16 08:12:04', NULL, '2024-11-13 06:39:21', '2024-11-16 08:12:04'),
(35, 'App\\Models\\User', 6, 'myapptoken', '4e4130768839c658e44603429601fd026c2a023aad914453f4231bb52624b6d6', '[\"*\"]', '2024-11-16 08:26:21', NULL, '2024-11-16 08:13:12', '2024-11-16 08:26:21'),
(36, 'App\\Models\\User', 10, 'myapptoken', 'a15cf5db1f720b744ee487fc9e3507bbd22d905e53f6c1ea0745ec19d56d31c6', '[\"*\"]', '2024-11-16 08:41:25', NULL, '2024-11-16 08:35:26', '2024-11-16 08:41:25'),
(37, 'App\\Models\\User', 3, 'myapptoken', 'd372591776ee5f1ca656844e90c0d0338e65b89701b5664184b2950a74c6f0af', '[\"*\"]', NULL, NULL, '2024-11-29 21:07:36', '2024-11-29 21:07:36'),
(38, 'App\\Models\\User', 3, 'myapptoken', 'ed798fe86d0429402ef55e03a1e25fd7dd01554099b465b287378f2bb5509e5c', '[\"*\"]', NULL, NULL, '2024-11-29 21:09:17', '2024-11-29 21:09:17'),
(39, 'App\\Models\\User', 3, 'myapptoken', '1788f962305be32607e17f710827fb1a8ba052b1b29db5d717eab08a9946473f', '[\"*\"]', NULL, NULL, '2024-11-29 21:09:40', '2024-11-29 21:09:40'),
(40, 'App\\Models\\User', 3, 'myapptoken', '8209689840bec4544d485e4bde2e1fc1c162f180e5f2b53deff53c073b5f6550', '[\"*\"]', NULL, NULL, '2024-11-29 21:10:15', '2024-11-29 21:10:15'),
(41, 'App\\Models\\User', 3, 'myapptoken', 'a44e27e801b4128ca2cbbeda481c0d56c904185e77f6d70042e84a429723d460', '[\"*\"]', NULL, NULL, '2024-11-29 23:17:44', '2024-11-29 23:17:44'),
(42, 'App\\Models\\User', 3, 'myapptoken', 'faaacce0e96d7015ee1ecfaab5440d94c61f3865f8a2edfb87a924344953667c', '[\"*\"]', NULL, NULL, '2024-11-29 23:17:57', '2024-11-29 23:17:57'),
(43, 'App\\Models\\User', 3, 'myapptoken', '292483dd778b34460fa5e19c0aed50cd24b6bc304f963170bc1d5fdd802a87e0', '[\"*\"]', NULL, NULL, '2024-11-29 23:18:08', '2024-11-29 23:18:08'),
(44, 'App\\Models\\User', 3, 'myapptoken', 'e6b24509540569bd3878aaafecacc3ee59ed6f5eaf958d83541b52973753b3dd', '[\"*\"]', NULL, NULL, '2024-11-29 23:19:03', '2024-11-29 23:19:03'),
(45, 'App\\Models\\User', 3, 'myapptoken', 'ecdd58257f6d23be5cd195367168f98312b9ea6721bb5c2fa94eb6c91855d772', '[\"*\"]', NULL, NULL, '2024-11-29 23:20:29', '2024-11-29 23:20:29'),
(46, 'App\\Models\\User', 3, 'myapptoken', '18fd79d324627af74b2b28171470df14809a6d7bbec09a8eab97f2eb357f3c9a', '[\"*\"]', NULL, NULL, '2024-11-29 23:21:11', '2024-11-29 23:21:11'),
(47, 'App\\Models\\User', 3, 'myapptoken', '87431c6d562b7e45b57339d4123659e8fa1a5fa8f95d5f8e0ef0f2ef6fcd4570', '[\"*\"]', NULL, NULL, '2024-11-29 23:23:01', '2024-11-29 23:23:01'),
(48, 'App\\Models\\User', 3, 'myapptoken', '442210581667b5bbce61e3b91b8de1198ba16b20e229fe8abeed8040785138ef', '[\"*\"]', NULL, NULL, '2024-11-29 23:32:47', '2024-11-29 23:32:47'),
(49, 'App\\Models\\User', 3, 'myapptoken', '963808b2bbd5d048359180817b525d6b6cd7b9914c0a73a7aeb3d82bee821f62', '[\"*\"]', NULL, NULL, '2024-11-29 23:49:11', '2024-11-29 23:49:11'),
(50, 'App\\Models\\User', 3, 'myapptoken', '929a04c59512201808a419345bc97bfdc771d2b67c93eb744a83fed83e037667', '[\"*\"]', NULL, NULL, '2024-11-29 23:50:01', '2024-11-29 23:50:01'),
(51, 'App\\Models\\User', 3, 'myapptoken', 'a86b3d791933cd0114139ae9245dfc334bfa8f01bde2b69138f67e24997c5fbc', '[\"*\"]', NULL, NULL, '2024-11-29 23:53:06', '2024-11-29 23:53:06'),
(52, 'App\\Models\\User', 3, 'myapptoken', '5e9d6639ebf856e17a84b83f55d60de39f29fdb2ebacaf3aac3cc5ac55b3164c', '[\"*\"]', NULL, NULL, '2024-11-29 23:55:09', '2024-11-29 23:55:09'),
(53, 'App\\Models\\User', 3, 'myapptoken', 'a213916899aad099b67925881c3fe64a2b80770827f2cb97b0b04d9e5e56fe92', '[\"*\"]', NULL, NULL, '2024-11-30 00:17:46', '2024-11-30 00:17:46'),
(54, 'App\\Models\\User', 3, 'myapptoken', 'caf5fb7daaeddfe697520b55ffd5ce9cc7f144d203f326502f3ee7b7a16375a0', '[\"*\"]', NULL, NULL, '2024-11-30 00:17:58', '2024-11-30 00:17:58'),
(55, 'App\\Models\\User', 3, 'myapptoken', 'fe05565fcf50c11e67ff4971bc65999c8aff7384d2800a16177635ede3816898', '[\"*\"]', NULL, NULL, '2024-11-30 00:26:55', '2024-11-30 00:26:55'),
(56, 'App\\Models\\User', 9, 'myapptoken', '3ef43f5390e0d453afa05b8e286800b40c9518e1f0a7802cd800e1f02602c83d', '[\"*\"]', NULL, NULL, '2024-11-30 00:31:50', '2024-11-30 00:31:50'),
(57, 'App\\Models\\User', 3, 'myapptoken', '20632870e6f2f4849a241bbbd5e4239381588167d60f9661affd1c4494cce462', '[\"*\"]', NULL, NULL, '2024-11-30 00:39:51', '2024-11-30 00:39:51'),
(58, 'App\\Models\\User', 3, 'myapptoken', '9a59fa5c4bfc01bdabf6ed39807b0cd0942d23bacd06783735952b89bfed09a4', '[\"*\"]', NULL, NULL, '2024-11-30 00:44:01', '2024-11-30 00:44:01'),
(59, 'App\\Models\\User', 3, 'myapptoken', '37621169203e531129f625c1f8ad49c11dee0b4de9e8a49392767a8604eb4903', '[\"*\"]', NULL, NULL, '2024-11-30 00:44:49', '2024-11-30 00:44:49'),
(60, 'App\\Models\\User', 3, 'myapptoken', 'afaa9c8dcfe79bf5fa0fd12f9d623bcf7ea92ee65afaf986a3b7d0d4d7277478', '[\"*\"]', NULL, NULL, '2024-11-30 00:45:18', '2024-11-30 00:45:18'),
(61, 'App\\Models\\User', 3, 'myapptoken', '7125d8d5ab6ffdc5253b448bb069483e684317447d85927af3caf4a57ae9a36a', '[\"*\"]', NULL, NULL, '2024-11-30 00:46:20', '2024-11-30 00:46:20'),
(62, 'App\\Models\\User', 15, 'myapptoken', '3f67bf489685eedc8dd5bd2047ba4368353a6a59a48cfc8e86635e895da06c8e', '[\"*\"]', NULL, NULL, '2024-11-30 00:53:44', '2024-11-30 00:53:44'),
(63, 'App\\Models\\User', 16, 'myapptoken', '630f041c16f7281e30a3eb7199d29276629831313d6202ebce80d36f1be02330', '[\"*\"]', NULL, NULL, '2024-11-30 00:56:38', '2024-11-30 00:56:38'),
(64, 'App\\Models\\User', 17, 'myapptoken', '2e0d03f8ec5cef23ccdb1c42d20d4b83bba2dc729f155730c0725f0919fac396', '[\"*\"]', NULL, NULL, '2024-11-30 00:58:07', '2024-11-30 00:58:07'),
(65, 'App\\Models\\User', 18, 'myapptoken', 'da63c2b2f89d6ddb65639c0cf8748c7ab1e2ec915c02b7f23292aaffe2701d16', '[\"*\"]', NULL, NULL, '2024-11-30 01:46:49', '2024-11-30 01:46:49'),
(66, 'App\\Models\\User', 19, 'myapptoken', 'cf9e41e61768873e03a16cd9e7405326683ea3274b27c8c32129ce4a180b904f', '[\"*\"]', NULL, NULL, '2024-11-30 01:53:08', '2024-11-30 01:53:08'),
(67, 'App\\Models\\User', 20, 'myapptoken', '8942990f7e4f6a0f0f45e4c41d19a82598593af7a84b392ac3c266a14d228b53', '[\"*\"]', NULL, NULL, '2024-11-30 01:55:22', '2024-11-30 01:55:22'),
(68, 'App\\Models\\User', 21, 'myapptoken', '5470fe2f7c68c7398728f1270f9537794ed3f5f7dcb068ec2bc774719ae5424a', '[\"*\"]', NULL, NULL, '2024-11-30 02:01:33', '2024-11-30 02:01:33'),
(69, 'App\\Models\\User', 3, 'myapptoken', '5c58311dae8a5499384819e24cb07e996320e82e485b73e0184b805cc7944a89', '[\"*\"]', NULL, NULL, '2024-11-30 02:04:11', '2024-11-30 02:04:11'),
(70, 'App\\Models\\User', 3, 'myapptoken', '52bff4c8bb2d1ab3fbe9d116556acf92d40762865fed7d0736018e7f5b9a0ce8', '[\"*\"]', NULL, NULL, '2024-11-30 02:04:40', '2024-11-30 02:04:40'),
(71, 'App\\Models\\User', 3, 'myapptoken', '650cceb07d83549a0bc4e00adcceea1d3039447d87f5b8be7d3abb8c3f068169', '[\"*\"]', NULL, NULL, '2024-11-30 02:04:42', '2024-11-30 02:04:42'),
(72, 'App\\Models\\User', 21, 'myapptoken', 'ce920eb4369f333fa9032cc08904975995be848a55306dd5bc4657d92a7a8b74', '[\"*\"]', NULL, NULL, '2024-11-30 02:16:15', '2024-11-30 02:16:15'),
(73, 'App\\Models\\User', 21, 'myapptoken', '7bc3769066968646d62f5e585a2c8cb20d37fba1de1bf0bbdbcb3d652221a3a2', '[\"*\"]', NULL, NULL, '2024-11-30 02:16:25', '2024-11-30 02:16:25'),
(74, 'App\\Models\\User', 3, 'myapptoken', '5be2b6e7ece135610ca9e4c796700f59bace3f9a131ba4e37f5391f1069a0a94', '[\"*\"]', '2024-12-03 04:46:13', NULL, '2024-11-30 02:17:04', '2024-12-03 04:46:13'),
(75, 'App\\Models\\User', 21, 'myapptoken', '35ef38a0ac5e3e3408167d07bd5562d6583f9d4ef0aeea5f927085775f697c9c', '[\"*\"]', NULL, NULL, '2024-11-30 04:01:32', '2024-11-30 04:01:32'),
(76, 'App\\Models\\User', 21, 'myapptoken', '0f419bb2da42728436d83b01c54017ad71a5b8c3a58de08d1e45782d1fa56e77', '[\"*\"]', NULL, NULL, '2024-11-30 04:10:18', '2024-11-30 04:10:18'),
(77, 'App\\Models\\User', 3, 'myapptoken', 'f8a344e5d7741ee40f385bcc7ac0e203ef7d4b69772e82b1664d40079711f087', '[\"*\"]', '2024-11-30 04:13:34', NULL, '2024-11-30 04:11:19', '2024-11-30 04:13:34'),
(78, 'App\\Models\\User', 4, 'myapptoken', '0270a70038d96f60adb91c0dd68b61f06ce6daee00d86969af30094df9ca7f3f', '[\"*\"]', '2024-12-15 00:11:28', NULL, '2024-11-30 04:16:00', '2024-12-15 00:11:28'),
(79, 'App\\Models\\User', 1, 'myapptoken', 'fe87d9392c55f755b2e3bd6cc5b0d6afa45e72dfefc1ae13a554ccc224caf109', '[\"*\"]', '2024-12-15 00:46:36', NULL, '2024-12-08 08:16:20', '2024-12-15 00:46:36'),
(80, 'App\\Models\\User', 1, 'myapptoken', '87a684c2e623996144c7687fc48c26e66943d6d1bbfa1dc923970f7286049d12', '[\"*\"]', NULL, NULL, '2024-12-16 00:38:03', '2024-12-16 00:38:03'),
(81, 'App\\Models\\User', 13, 'myapptoken', '764cb207dc29e7c03d7c1445e120898403117dbed61f216019cad4ccef886689', '[\"*\"]', NULL, NULL, '2024-12-27 07:38:58', '2024-12-27 07:38:58'),
(82, 'App\\Models\\User', 13, 'myapptoken', 'd6efddde3c8f30340db0d5d0c6a03b3fba8d0d8b321e0b83fe6dea37fab51c90', '[\"*\"]', NULL, NULL, '2024-12-31 00:56:18', '2024-12-31 00:56:18'),
(83, 'App\\Models\\User', 13, 'myapptoken', '92e9d639aecedef7a3e0957b42678888ab26aacca170ec22aafd6cb4a4a9e2da', '[\"*\"]', NULL, NULL, '2024-12-31 04:00:20', '2024-12-31 04:00:20'),
(84, 'App\\Models\\User', 13, 'myapptoken', 'a4deec9c152d7adb731c223f9382801641673fd559ff0bf8c9f0bea5babf8bc4', '[\"*\"]', '2025-01-02 22:05:44', NULL, '2025-01-02 21:56:35', '2025-01-02 22:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `photoslisting`
--

CREATE TABLE `photoslisting` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photoslisting`
--

INSERT INTO `photoslisting` (`id`, `file`, `created_at`, `updated_at`) VALUES
(65, '1522460183pexels-photo-164516.jpg', '2018-03-31 10:36:23', '2018-03-31 10:36:23'),
(66, '1522460535pexels-photo-210617.jpg', '2018-03-31 10:42:15', '2018-03-31 10:42:15'),
(67, '1522460785pexels-photo-140511.jpeg', '2018-03-31 10:46:25', '2018-03-31 10:46:25'),
(68, '1522460941pexels-photo-210617.jpg', '2018-03-31 10:49:01', '2018-03-31 10:49:01'),
(69, '1522461134pexels-photo-534184.jpg', '2018-03-31 10:52:14', '2018-03-31 10:52:14'),
(70, '1522461277pexels-photo-139115.jpeg', '2018-03-31 10:54:37', '2018-03-31 10:54:37'),
(71, '1522785654pexels-photo-259098.jpg', '2018-04-04 05:00:54', '2018-04-04 05:00:54'),
(72, '1522788571pexels-photo-139115.jpeg', '2018-04-04 05:49:31', '2018-04-04 05:49:31'),
(73, '1522788677pexels-photo-209296.jpg', '2018-04-04 05:51:17', '2018-04-04 05:51:17'),
(74, '1526257734pexels-photo-206172.jpeg', '2018-05-14 09:28:54', '2018-05-14 09:28:54'),
(75, '1526257860pexels-photo-259646.jpg', '2018-05-14 09:31:00', '2018-05-14 09:31:00'),
(76, '1526257996pexels-photo-221024_1.jpg', '2018-05-14 09:33:16', '2018-05-14 09:33:16'),
(77, '1526519761pexels-photo-164539.jpeg', '2018-05-17 10:16:02', '2018-05-17 10:16:02'),
(78, '1526519937pexels-photo-164558.jpg', '2018-05-17 10:18:57', '2018-05-17 10:18:57'),
(79, '1526520079pexels-photo-259751.jpeg', '2018-05-17 10:21:19', '2018-05-17 10:21:19'),
(80, '1526522366pexels-photo-534184.jpg', '2018-05-17 10:59:26', '2018-05-17 10:59:26'),
(81, '1526522488pexels-photo-221024.jpg', '2018-05-17 11:01:28', '2018-05-17 11:01:28'),
(82, '1526522618large-home-residential-house-architecture-53610.jpeg', '2018-05-17 11:03:38', '2018-05-17 11:03:38'),
(83, '1526522809pexels-photo-280229.jpeg', '2018-05-17 11:06:49', '2018-05-17 11:06:49'),
(84, '1526523217pexels-photo-243722.jpg', '2018-05-17 11:13:37', '2018-05-17 11:13:37'),
(85, '1526523393pexels-photo-140511.jpeg', '2018-05-17 11:16:33', '2018-05-17 11:16:33'),
(86, '1526523545pexels-photo-139115.jpeg', '2018-05-17 11:19:05', '2018-05-17 11:19:05'),
(87, '1526523820pexels-photo-139115.jpeg', '2018-05-17 11:23:40', '2018-05-17 11:23:40'),
(88, '1526523868pexels-photo-164522.jpg', '2018-05-17 11:24:28', '2018-05-17 11:24:28'),
(89, '1526524107pexels-photo-164516.jpg', '2018-05-17 11:28:27', '2018-05-17 11:28:27'),
(90, '1526524294pexels-photo-206172.jpeg', '2018-05-17 11:31:34', '2018-05-17 11:31:34'),
(91, '1526524449pexels-photo-534184.jpg', '2018-05-17 11:34:09', '2018-05-17 11:34:09'),
(92, '1526524609pexels-photo-106399.jpg', '2018-05-17 11:36:49', '2018-05-17 11:36:49'),
(93, '1526524856pexels-photo-462358.jpg', '2018-05-17 11:40:56', '2018-05-17 11:40:56'),
(94, '1526525131pexels-photo-206673.jpeg', '2018-05-17 11:45:31', '2018-05-17 11:45:31'),
(95, '1526525357pexels-photo-139115.jpeg', '2018-05-17 11:49:17', '2018-05-17 11:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `photosstaff`
--

CREATE TABLE `photosstaff` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photosstaff`
--

INSERT INTO `photosstaff` (`id`, `file`, `created_at`, `updated_at`) VALUES
(1, 'sam.jpg', NULL, NULL),
(2, 'luger.jpg', NULL, NULL),
(9, '1522274393r32fdewq2fdc3eq.jpg', '2018-03-29 06:59:53', '2018-03-29 06:59:53'),
(10, '1522274409454564fw.jpg', '2018-03-29 07:00:09', '2018-03-29 07:00:09'),
(11, '1522457745fdgsdfg.jpg', '2018-03-31 09:55:45', '2018-03-31 09:55:45'),
(12, '152245777232133.jpg', '2018-03-31 09:56:12', '2018-03-31 09:56:12'),
(13, '15224578421522274393r32fdewq2fdc3eq.jpg', '2018-03-31 09:57:22', '2018-03-31 09:57:22'),
(14, '1522457925247885.jpg', '2018-03-31 09:58:45', '2018-03-31 09:58:45'),
(15, '1522457969247885.jpg', '2018-03-31 09:59:29', '2018-03-31 09:59:29'),
(16, '152245804723r2dqd32wq.jpg', '2018-03-31 10:00:47', '2018-03-31 10:00:47'),
(17, '1522458129fwersf.jpg', '2018-03-31 10:02:09', '2018-03-31 10:02:09'),
(18, '152245830243tf3t3e4wr.jpg', '2018-03-31 10:05:02', '2018-03-31 10:05:02'),
(19, '15224583841515033345233254.jpg', '2018-03-31 10:06:24', '2018-03-31 10:06:24'),
(20, '152245845746465456446.jpg', '2018-03-31 10:07:37', '2018-03-31 10:07:37'),
(21, 'man.jpg', NULL, NULL),
(22, 'woman.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Founder', NULL, NULL),
(2, 'Sales Agent', NULL, NULL),
(3, 'Reality Agent', NULL, NULL),
(4, 'Web Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `photo_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'SuperAdmin', NULL, NULL),
(3, 'User', NULL, NULL),
(4, 'Sales', NULL, NULL),
(5, 'Agent', NULL, NULL),
(6, 'Founder', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6zBPZcm7KKiEgBUmLShpwt5ZErGriZYkQtk0jyr5', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibml1ZFFuYTBLaFl0TG9HU0JKVnVFR3IzbDJ2dEJEeFBtenRYbTRxSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728177702),
('8BQ16z5JMkOu9jFDg1n2RSU2lQ74AfDX47nqaLpj', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3VDOTQ0d1d4MnRXNmdzRm12OUxYWGc3Tks4Tnl1Q3R3RWhYUnZjViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyNDU4Mzg0MTUxNTAzMzM0NTIzMzI1NC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728177703),
('c1g8BBEAytBych72QtKAPgXHBEz7tUcsfzPzX2FO', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVExhV05xaVp4UVBoaktSTjVhRFVicHpZSU5JMkx3Ylp2Y1JnRHdKSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728264733),
('d4aiJ5clROFbNRrVElRKa7zBLJB8cKl6z8E2gN53', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlZwUkdTSG5xY1BMR2xnbllGb0tWbHp5RTVpUm1BVll6dWNsY0wzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728242236),
('dfBlebUOqZyfYv5lOj8GR7wWpZ1fFGNdQcuvU8sv', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFRHdVU1czU1OTN1anJsaUd2anduNXZBbzdhdUFWckNodWlaaXBmWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728242131),
('DqgcSEh1xwEEh54Asv2F1XMB8fyhix5PE0wF8vgT', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWp0b2k3V0czV05UbXZaVU9FZk5CcE9YSmFOeFpoMmc3TWVSaXJUcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728242286),
('Et3PBuiaH9lMnS6qtktZqWRh9aAQcUn09f6e5hhq', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU9PR3N3eTNEd0t4R0N4TTRHV3FTMnpYSkJrTkx0dFhoWDJQNVZYciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyNDU4Mzg0MTUxNTAzMzM0NTIzMzI1NC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728242239),
('jDkeSmmBrjNf6cXSeKX49RvWJdy8Txbb7DMDew5P', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFpidk03eGg5WU8yUXVyd3YwYktBZ25oZk9KRTMzdG5sZ1o0VEI3ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728177710),
('Kvkpj7NTKlRq5BofYxnVd5SRXpCqiY74OVZitGuE', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienBscUhXSFJSSHFOSDVBVnNITEF5emlSczZISEZ0S09uMDVWR1lFaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728177700),
('PiEhcMTePsZrhGuV4EM5sMjNlzY6fyXT3r0ucKZG', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibE1VVXFFMzgySzVHZFdDQTgybmk0NVBLWUE5TldnUXJwcU03WlFRZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyNDU4Mzg0MTUxNTAzMzM0NTIzMzI1NC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728242289),
('Qw0xHNH5kiHyb9Iu3lQCnJZl8LetJp0EhUXGqjG9', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0g1VGJ0b0JPNFpmaVVJVU82YUNzQTcwaGJWdE9zR2Y0U0h1V2d1NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728264733),
('szQueGWBrbvLya5DIJ2fYBXbZkxlf73vPYDyTn2z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXpvbmtWZUtzcG9UVWVoNHV6TnJ1dEZOY2xpZDNmNFNtdUZjZWcwZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728699535),
('tBe5Nk4EC52kimHoJN0Kg0PVDInOWtWZ7ysnvyOY', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVprOFplVDBReEVaUE05QUJlUGJBamxTOExLa1FxMDRiNE9VOEZtRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728177711),
('udHb5IOA5NzMpaVXN0LJzkcoulIDMaPxFFJH3R4d', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUdmUkxDZXRmUFkxRkJiaXkwcTAyYXd1RGcwM21OYUNDcVBKbDFldCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728242134),
('v5laCfrxpVAmDjMU9ioxFnJmyOXCk4YuvL0sMEDh', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEJrZ09QQWRRb21INllrSWNCVEdRbDJLR2I5ZkEwWGJNU0FRNkF6cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyNDU4Mzg0MTUxNTAzMzM0NTIzMzI1NC5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728242136),
('WNNIj49gTaLTFLScpisaw58l5xWYDpKnNkwM0pD0', NULL, '127.0.0.1', 'undici', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUpMMkd5cng0RmdTRmJvbW1xbzdaMW12aUJrWDM2eXZqTmRIRUdWZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMjcuMC4wLjE6NzAwMC8vaW1hZ2VzL3Blb3BsZS8xNTIyMjc0NDA5NDU0NTY0ZncuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728245972);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured_posts_slots` int(11) NOT NULL DEFAULT 3,
  `featured_listings_slots` int(11) NOT NULL DEFAULT 3,
  `header_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `featured_posts_slots`, `featured_listings_slots`, `header_image`) VALUES
(1, NULL, '2024-12-31 04:10:46', 5, 3, 'http://res.cloudinary.com/dwgjvssdt/image/upload/v1735600245/ghchdoxt8egzh3zjhlie.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbrev` varchar(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `abbrev`, `created_at`, `updated_at`) VALUES
(1, 'Alabama', 'AL', '2018-05-17 07:19:06', '2018-05-17 07:19:06'),
(2, 'Alaska', 'AK', '2018-05-17 07:20:12', '2018-05-17 07:20:12'),
(3, 'Arizona ', 'AZ', '2018-05-17 07:21:05', '2018-05-17 07:21:05'),
(4, 'Arkansas ', 'AR', '2018-05-17 07:21:19', '2018-05-17 07:21:19'),
(5, 'California ', 'CA', '2018-05-17 07:21:28', '2018-05-17 07:21:28'),
(6, 'Colorado ', 'CO', '2018-05-17 07:21:40', '2018-05-17 07:21:40'),
(7, 'Connecticut ', 'CT', '2018-05-17 07:21:50', '2018-05-17 07:21:50'),
(8, 'Delaware ', 'DE', '2018-05-17 07:22:01', '2018-05-17 07:22:01'),
(9, 'Florida ', 'FL', '2018-05-17 07:22:09', '2018-05-17 07:22:09'),
(10, 'Georgia ', 'GA', '2018-05-17 07:22:40', '2018-05-17 07:22:40'),
(11, 'Hawaii ', 'HI', '2018-05-17 07:22:51', '2018-05-17 07:22:51'),
(12, 'Idaho ', 'ID', '2018-05-17 07:23:01', '2018-05-17 07:23:01'),
(13, 'Illinois ', 'IL', '2018-05-17 07:23:13', '2018-05-17 07:23:13'),
(14, 'Indiana ', 'IN', '2018-05-17 07:23:25', '2018-05-17 07:23:25'),
(15, 'Iowa ', 'IA', '2018-05-17 07:23:36', '2018-05-17 07:23:36'),
(16, 'Kansas ', 'KS', '2018-05-17 07:23:48', '2018-05-17 07:23:48'),
(17, 'Kentucky ', 'KY', '2018-05-17 07:24:02', '2018-05-17 07:24:02'),
(18, 'Louisiana ', 'LA', '2018-05-17 07:24:18', '2018-05-17 07:24:18'),
(19, 'Maine ', 'ME', '2018-05-17 07:24:31', '2018-05-17 07:24:31'),
(20, 'Maryland ', 'MD', '2018-05-17 07:24:42', '2018-05-17 07:24:42'),
(21, 'Massachusetts ', 'MA', '2018-05-17 07:24:56', '2018-05-17 07:24:56'),
(22, 'Michigan ', 'MI', '2018-05-17 07:25:21', '2018-05-17 07:25:21'),
(23, 'Minnesota ', 'MN', '2018-05-17 07:25:32', '2018-05-17 07:25:32'),
(24, 'Mississippi ', 'MS', '2018-05-17 07:25:44', '2018-05-17 07:25:44'),
(25, 'Missouri ', 'MO', '2018-05-17 07:25:57', '2018-05-17 07:25:57'),
(26, 'Montana ', 'MT', '2018-05-17 07:26:07', '2018-05-17 07:26:07'),
(27, 'Nebraska ', 'NE', '2018-05-17 07:26:21', '2018-05-17 07:26:21'),
(28, 'Nevada ', 'NV', '2018-05-17 07:26:35', '2018-05-17 07:26:35'),
(29, 'New Hampshire', 'NH', '2018-05-17 07:26:52', '2018-05-17 07:26:52'),
(30, 'New Jersey', 'NJ', '2018-05-17 07:27:06', '2018-05-17 07:27:06'),
(31, 'New Mexico', 'NM', '2018-05-17 07:27:21', '2018-05-17 07:27:21'),
(32, 'New York', 'NY', '2018-05-17 07:27:33', '2018-05-17 07:27:33'),
(33, 'North Carolina', 'NC', '2018-05-17 07:27:53', '2018-05-17 07:27:53'),
(34, 'North Dakota ', 'ND', '2018-05-17 07:28:09', '2018-05-17 07:28:09'),
(35, 'Ohio ', 'OH', '2018-05-17 07:28:19', '2018-05-17 07:28:19'),
(36, 'Oklahoma ', 'OK', '2018-05-17 07:28:32', '2018-05-17 07:28:32'),
(37, 'Oregon ', 'OR', '2018-05-17 07:28:44', '2018-05-17 07:28:44'),
(38, 'Pennsylvania ', 'PA', '2018-05-17 07:29:20', '2018-05-17 07:29:20'),
(39, 'Rhode Island', 'RI', '2018-05-17 07:29:37', '2018-05-17 07:29:37'),
(40, 'South Carolina', 'SC', '2018-05-17 07:29:48', '2018-05-17 07:29:48'),
(41, 'South Dakota', 'SD', '2018-05-17 07:29:59', '2018-05-17 07:29:59'),
(42, 'Tennessee ', 'TN', '2018-05-17 07:30:10', '2018-05-17 07:30:10'),
(43, 'Texas ', 'TX', '2018-05-17 07:30:24', '2018-05-17 07:30:24'),
(44, 'Utah ', 'UT', '2018-05-17 07:30:34', '2018-05-17 07:30:34'),
(45, 'Vermont ', 'VT', '2018-05-17 07:30:43', '2018-05-17 07:30:43'),
(46, 'Virginia ', 'VA', '2018-05-17 07:30:56', '2018-05-17 07:30:56'),
(47, 'Washington ', 'WA', '2018-05-17 07:31:07', '2018-05-17 07:31:07'),
(48, 'West Virginia', 'WV', '2018-05-17 07:31:20', '2018-05-17 07:31:20'),
(49, 'Wisconsin ', 'WI', '2018-05-17 07:31:31', '2018-05-17 07:31:31'),
(50, 'Wyoming ', 'WY', '2018-05-17 07:31:42', '2018-05-17 07:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 0,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photoStaff_id` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_active`, `role_id`, `position_id`, `photoStaff_id`, `bio`, `phone`, `skype`, `facebook`, `twitter`) VALUES
(1, 'Sam Kerr', 'samker@envirogreen.com', NULL, '$2y$10$Z0VEnobYEJzB3kRgZqoUhO5n5rPn9EduxN1kH.3q41dEFyz007rdy', 'gQjBnyuaDm6xdcSNF5WdXo6z186IHd3jSWs92kQLYtdqYFlJS6bbVMKNiHib', '2018-03-06 14:03:39', '2024-04-28 01:56:14', 0, 6, 1, '1', 'Lorem ipsum dolor amet twee elit shoreditch palo santo labore gluten-free craft beer literally photo booth 3 wolf moon nulla. Mlkshk edison bulb raw denim pickled adipisicing velit minim bushwick wolf. Twee bespoke microdosing waistcoat. Squid 8-bit dolor', '413-788-8888', 'sam', 'samkerr', 'samkerr'),
(2, 'Mike Luger', 'luger@envirogreen.com', NULL, '$2y$10$AD/pkMnE7yU89tdLCgka/ecb5l1oszW02flLQM8qw9pl8udq9v/z2', NULL, '2018-03-06 14:05:45', '2018-03-06 14:05:45', 0, 6, 1, '2', 'Coloring book umami organic, gluten-free consectetur banh mi humblebrag poutine street art shabby chic. Yr blue bottle man braid beard cupidatat neutra. Ipsum poke ullamco, occaecat tote bag selvage hot chicken coloring book art party ea. Distillery volup', '412-555-5555', 'luger', 'luger', NULL),
(3, 'Jane Kennedy', 'jane@envirogreen.com', NULL, '$2y$10$Z0VEnobYEJzB3kRgZqoUhO5n5rPn9EduxN1kH.3q41dEFyz007rdy', NULL, '2018-03-06 14:38:06', '2024-11-03 23:38:04', 0, 5, 2, '10', 'Kale chips occupy enamel pin, dolore austin chicharrones pickled quis. Whatever dolore cupidatat ut, williamsburg kickstarter wolf wayfarers direct trade authentic exercitation squid man braid keytar. Trust fund try-hard umami irony food truck deep v. Dir', '413-569-5569', 'jane', 'janekennedy', 'jane'),
(4, 'Dylan Cougar', 'dylancougar@envirogreen.com', NULL, '$2y$10$eiY3AIVMIpoLF8W4V0SiFusqMYjsCcm1368ChGwIK/gJm00vXTRTy', NULL, '2018-03-06 14:41:17', '2024-11-04 04:33:15', 0, 1, 4, '11', 'Kale chips occupy enamel pin, dolore austin chicharrones pickled quis. Whatever dolore cupidatat ut, williamsburg kickstarter wolf wayfarers direct trade authentic exercitation squid man braid keytar. Trust fund try-hard umami irony food truck deep v. Dir', '413-669-6969', 'dylan', 'dylancougar', 'dylancougar'),
(6, 'Anne Hartly', 'hart@envirogreen.com', NULL, '$2y$10$U/Mz1cdLBo0T7ujkiLWGfOPhAqEuFgYBofNS2r4ZKmZ3jbBYA4az2', NULL, '2018-03-31 09:56:12', '2024-11-04 00:21:58', 0, 4, 2, '12', 'Pour-over pickled pitchfork fanny pack laborum la croix. Mixtape dolor enim, hashtag culpa green juice organic yuccie sustainable. Cred sed locavore chartreuse. Non roof party brooklyn woke consequat vape blog dolore la croix post-ironic kitsch flexitaria', '5555555', 'hart', 'hartly', 'hartly'),
(7, 'Jane Brisbane', 'bliss@envirogreen.com', NULL, '$2y$10$Q9jIXr.oXA6mwqGWJrlxvuTY.nDwcPoY2TgHOYdHP1Wce9UQh2ILK', NULL, '2018-03-31 09:57:22', '2024-11-04 00:41:19', 0, 5, 2, '13', 'Fixie shoreditch chartreuse affogato, duis taiyaki enim taxidermy leggings vinyl. Jianbing small batch sint hammock XOXO tattooed ennui kogi. Yuccie hashtag cronut try-hard proident esse culpa selvage succulents lorem lyft. Artisan edison bulb wayfarers, ', '5555555', 'jane', 'ja-bliss', 'j-bliss'),
(9, 'Steven Sherner', 'shern@envirogreen.com', NULL, '$2y$10$EB/B6T6SqEuvcvZsnPNypuCLvK7GgY/8ZiLaSuCZRv.Z5olGtSYbS', NULL, '2018-03-31 09:59:29', '2018-03-31 09:59:29', 0, 4, 3, '15', 'Coloring book umami organic, gluten-free consectetur banh mi humblebrag poutine street art shabby chic. Yr blue bottle man braid beard cupidatat neutra. Ipsum poke ullamco, occaecat tote bag selvage hot chicken coloring book art party ea. Distillery volup', '5555555', 'shern', 'shern', 'shern'),
(10, 'Tommy Kane', 'kane@envirogreen.com', NULL, '$2y$10$yYj7rS2Q2wnlZu5KS7OpwuY6G2BzXLYGwrMnh91uokQCGDs02.hF.', '3LGQRXDTsJuUBSY85DRk0otCfzKn1c9JdHEkK8EN0WxkzJwQu0I4pwoxl8l5', '2018-03-31 10:00:47', '2018-03-31 10:08:45', 0, 5, 3, '16', 'Non roof party brooklyn woke consequat vape blog dolore la croix post-ironic kitsch flexitarian vaporware heirloom ut. Mumblecore try-hard laborum kale chips hoodie godard labore tacos meggings banh mi nulla.', '5555555', 'kane', 'kane', 'kane'),
(11, 'Randy Lords', 'randy@envirogreen.com', NULL, '$2y$10$5p10aCYXEvtrzpKeENxlQ.i2klqtAl2hw69GDyxkL0BNMNybzFPHa', NULL, '2018-03-31 10:02:09', '2018-03-31 10:02:09', 0, 5, 3, '17', '', '5555555', 'randy', NULL, NULL),
(12, 'Tammy Landis', 'landis@envirogreen.com', NULL, '$2y$10$8nftcl0ChTHw.bglKShiEu4YJInlrBOSd6MeL9zkTWxLynID9FlB.', NULL, '2018-03-31 10:05:02', '2018-03-31 10:05:02', 0, 5, 3, '18', 'Kale chips occupy enamel pin, dolore austin chicharrones pickled quis. Whatever dolore cupidatat ut, williamsburg kickstarter wolf wayfarers direct trade authentic exercitation squid man braid keytar. Trust fund try-hard umami irony food truck deep v. Dir', '55544454', 'landis', NULL, NULL),
(13, 'Greg Handler', 'greg@envirogreen.com', NULL, '$2y$10$NoFIPDSPbEVOlbFkGSHfsOm3aGQjiicR5eW6EXuqTz0DSLjt4xi7m', NULL, '2018-03-31 10:06:24', '2018-03-31 10:06:24', 0, 5, 2, '19', 'Direct trade art party scenester vice, dolor food truck irony celiac XOXO sunt. Mumblecore austin craft beer dolore brunch, poke crucifix in. Raw denim ullamco 3 wolf moon ugh. ', '7777777', 'greg', NULL, NULL),
(14, 'Johnny Bristol', 'bristol@envirogreen.com', NULL, '$2y$10$6OZxGC1/F/u/DdHez5yJl.aCSdJCwfvBxa.kjoo72SfvAqKCscKQm', NULL, '0000-00-00 00:00:00', '2018-03-31 10:07:37', 0, 4, 4, '20', 'Coloring book umami organic, gluten-free consectetur banh mi humblebrag poutine street art shabby chic. Yr blue bottle man braid beard cupidatat neutra. Ipsum poke ullamco, occaecat tote bag selvage hot chicken coloring book art party ea. Distillery volup', '9999999', 'bristol', NULL, NULL),
(17, 'Angie Perez', 'angie@yahoo.com', NULL, '$2y$12$36ldYX.jOcw/YJ5UoyA9hOR.T2APzWVg7OFgYrs32NQ/7PWjWQumO', NULL, '2024-11-30 00:58:07', '2024-11-30 00:58:07', 0, 3, NULL, '22', NULL, NULL, NULL, NULL, NULL),
(18, 'Stacey Morales', 'Morales@yahoo.com', NULL, '$2y$12$nqMB1/3IQ9LRv7q/SNPn0OvNxp6ov4yK.Z1z5ovX1EBf4dK724Psa', NULL, '2024-11-30 01:46:49', '2024-11-30 01:46:49', 0, 3, NULL, '22', NULL, NULL, NULL, NULL, NULL),
(19, 'Gene Holloway', 'gene@aol.com', NULL, '$2y$12$ew/1zk/2rSMRa/WEBr8YZuFxVvBpl4ikvpCzt7oC0O/RELqniVhMW', NULL, '2024-11-30 01:53:08', '2024-11-30 01:53:08', 0, 3, NULL, '21', NULL, NULL, NULL, NULL, NULL),
(20, 'Sara Vann', 'van@aol.com', NULL, '$2y$12$PCe.NSd0C97XP2wOdC4qr.EMwycdnzCGh6GtwhdG74qAQVQS8Kmpm', NULL, '2024-11-30 01:55:22', '2024-11-30 01:55:22', 0, 3, NULL, '22', NULL, NULL, NULL, NULL, NULL),
(21, 'Mike Earl', 'earl@aol.com', NULL, '$2y$12$RXfzcKfhV3TZyMi1.XQ9r.mZ0gqW9DRp3c0th5SEF1.QM4oT7UJc2', NULL, '2024-11-30 02:01:33', '2024-11-30 02:01:33', 0, 3, NULL, '21', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `property_id`, `created_at`, `updated_at`) VALUES
(1, 3, 30, '2024-04-30 02:37:24', NULL),
(2, 3, 5, '2024-04-30 02:38:38', NULL),
(3, 3, 6, '2024-04-30 02:39:00', NULL),
(4, 3, 8, '2024-05-03 02:19:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_featured_index` (`featured`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `extra_photo_fours`
--
ALTER TABLE `extra_photo_fours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_photo_ones`
--
ALTER TABLE `extra_photo_ones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_photo_threes`
--
ALTER TABLE `extra_photo_threes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_photo_twos`
--
ALTER TABLE `extra_photo_twos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listings_fullpic_id_index` (`fullpic_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photoslisting`
--
ALTER TABLE `photoslisting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photosstaff`
--
ALTER TABLE `photosstaff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_category_id_index` (`category_id`),
  ADD KEY `posts_photo_id_index` (`photo_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`),
  ADD KEY `users_position_id_index` (`position_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `extra_photo_fours`
--
ALTER TABLE `extra_photo_fours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `extra_photo_ones`
--
ALTER TABLE `extra_photo_ones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `extra_photo_threes`
--
ALTER TABLE `extra_photo_threes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `extra_photo_twos`
--
ALTER TABLE `extra_photo_twos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `photoslisting`
--
ALTER TABLE `photoslisting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `photosstaff`
--
ALTER TABLE `photosstaff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
