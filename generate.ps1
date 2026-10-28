# Generates production index.html for AP African American Studies Unit Diagnostic
$ErrorActionPreference = 'Stop'
$out = Join-Path $PSScriptRoot 'index.html'

function T($id, $title, $lo, $ek, $sources, $stem, $answer, $accept, $distractors, $hint, $simType, $simPrompt, $simOptions, $simCorrect, $simFeedback) {
  [ordered]@{
    id = $id; title = $title; lo = $lo; ek = @($ek); sources = @($sources)
    question = [ordered]@{
      stem = $stem; answer = $answer; accept = @($accept); distractors = @($distractors)
    }
    hint = $hint
    simulation = [ordered]@{
      type = $simType; prompt = $simPrompt; options = @($simOptions)
      correct = $simCorrect; feedback = $simFeedback
    }
  }
}

$units = [ordered]@{}

# ========== UNIT 1 ==========
$u1 = @()
$u1 += T '1.1' 'What Is African American Studies?' `
  'LO 1.1.A: Describe the features that characterize African American Studies.' `
  @('African American Studies uses an interdisciplinary approach to analyze history, culture, and contributions of people of African descent in the U.S. and the diaspora.','The field grew from Black artistic, intellectual, and political work that predated formal university programs.','It examines Africa''s history and its ongoing relationship to diaspora communities.') `
  @('Photo of Black Student Union Strike for Black Studies at San Francisco State College, 1968','Schedule of Courses for Black and Puerto Rican Studies, Hunter College, 1972','Program for the First National Council for Black Studies Annual Conference, 1975') `
  'Aligned to LO 1.1.A and the 1968 San Francisco State Black Student Union strike source, African American Studies is best characterized as an __________ approach that analyzes Black experiences across disciplines.' `
  'interdisciplinary' @('interdisciplinary','multi-disciplinary','multidisciplinary') @('monolithic','isolationist','segregationist') `
  'Think about how the field draws on history, literature, art, and political thought together.' `
  'source-match' 'Which required source best evidences student activism that helped institutionalize Black Studies?' `
  @('Black Student Union Strike photo, San Francisco State, 1968','Catalan Atlas by Abraham Cresques, 1375','Stowage of the British Slave Ship Brookes') 'Black Student Union Strike photo, San Francisco State, 1968' `
  'Campus protests in the late 1960s and early 1970s pressed colleges to create Black Studies programs.'

$u1 += T '1.2' 'The African Continent: A Varied Landscape' `
  'LO 1.2.A: Explain how Africa''s varied landscapes shaped societies and connections.' `
  @('Africa includes deserts, rainforests, savannas, mountains, and major river systems.','Geographic diversity supported distinct economies, migration patterns, and trade networks.') `
  @('Map Showing the Major Climate Regions of Africa') `
  'Using the CED climate-regions map (LO 1.2.A), Africa''s __________ diversity helped produce varied societies, economies, and migration routes.' `
  'geographic' @('geographic','geographical','landscape') @('uniform','industrial','colonial') `
  'Focus on climate regions and physical features, not a single environment.' `
  'artifact' 'A student claims Africa is mostly desert. Which CED idea corrects that claim?' `
  @('Major climate regions include savanna, rainforest, desert, and more','All African societies depended only on Nile flooding','Trade never crossed climate zones') 'Major climate regions include savanna, rainforest, desert, and more' `
  'The climate-regions map shows ecological variety across the continent.'

$u1 += T '1.3' 'Population Growth and Ethnolinguistic Diversity' `
  'LO 1.3.A: Explain patterns of population growth and ethnolinguistic diversity in Africa.' `
  @('Bantu-speaking peoples expanded across large parts of Africa, spreading languages and technologies.','Africa has long been home to exceptional ethnolinguistic diversity.') `
  @('Map Showing the Movement of Bantu Peoples, Languages, and Technologies') `
  'Per LO 1.3.A and the Bantu movement map, the spread of __________ languages and technologies reshaped large regions of Africa.' `
  'Bantu' @('Bantu','bantu') @('Latin','Norse','Quechua') `
  'Look at the map of peoples, languages, and technologies moving across the continent.' `
  'source-match' 'Which source traces language and technology expansion across Africa?' `
  @('Map of Bantu peoples, languages, and technologies','Queen Mother Pendant Mask: Iyoba','Amistad sketches, 1839') 'Map of Bantu peoples, languages, and technologies' `
  'The Bantu expansion map is the required CED visual for this topic.'

$u1 += T '1.4' 'Africa''s Ancient Societies' `
  'LO 1.4.A: Describe key features of early African societies such as Nok and Aksum.' `
  @('Ancient African societies developed complex art, trade, and political systems.','Aksum minted coins and participated in Red Sea/Indian Ocean networks; Nok is known for early terracotta sculpture.') `
  @('Image of Aksumite Coin Showing King Ezana, Circa 340–400','Image of Nok Sculpture, Circa 900 BCE–200 CE') `
  'Drawing on LO 1.4.A and the Aksumite coin of King Ezana, Aksum''s coinage helps evidence early African __________ complexity and long-distance exchange.' `
  'political' @('political','state','economic') @('nomadic-only','illiterate','isolated') `
  'Coins bearing a ruler''s image signal organized authority and trade connections.' `
  'scenario' 'You are analyzing Nok terracotta. What historical claim is best supported?' `
  @('Early West African societies produced sophisticated art centuries before colonial contact','Sculpture only arrived with European missionaries','Nok art proves writing systems never existed in Africa') 'Early West African societies produced sophisticated art centuries before colonial contact' `
  'Nok sculpture demonstrates artistic complexity in early West Africa.'

$u1 += T '1.5' 'The Sudanic Empires: Ghana, Mali, and Songhai' `
  'LO 1.5.A: Explain the rise and significance of the Sudanic empires.' `
  @('Ghana, Mali, and Songhai controlled trans-Saharan trade in gold, salt, and other goods.','Mali''s wealth and scholarship (e.g., associations with Mansa Musa and Timbuktu) became widely known.') `
  @('Map of Africa''s Kingdoms and Empires','Catalan Atlas by Abraham Cresques, 1375','Image of Mali Equestrian Figure, Thirteenth to Fifteenth Century') `
  'According to LO 1.5.A and the 1375 Catalan Atlas, European mapmakers depicted West African imperial __________ connected to gold-rich Sudanic states.' `
  'wealth' @('wealth','prosperity','power') @('poverty','isolation','collapse') `
  'The Catalan Atlas famously associates West African rulers with gold.' `
  'source-match' 'Which required source visually linked West African power to gold in medieval Europe''s imagination?' `
  @('Catalan Atlas by Abraham Cresques, 1375','Stono Rebellion account, 1739','Clark Doll Test photos, 1947') 'Catalan Atlas by Abraham Cresques, 1375' `
  'Cresques''s atlas is a key CED source for Mali/Sudanic empire visibility.'

$u1 += T '1.6' 'Learning Traditions' `
  'LO 1.6.A: Describe African learning traditions including griot performance and scholarship.' `
  @('Griots preserved history through oral performance of epics such as Sundiata.','Centers of Islamic learning in West Africa transmitted scholarship across generations.') `
  @('The Sunjata Story—Glimpse of a Mande Epic (griot performance video)','Image of Griot Basimana with Guitar, Mali') `
  'Per LO 1.6.A and the Sunjata griot performance source, West African __________ traditions preserved political history through performed narrative.' `
  'oral' @('oral','griot','spoken') @('silent','censored','purely-written') `
  'Griots sing and recite communal memory; writing is not the only archive.' `
  'artifact' 'Why is a griot performance a valid historical source in African American Studies?' `
  @('It transmits communal memory, genealogy, and political narrative across generations','It replaces all need for archaeology','It only entertains and never conveys facts') 'It transmits communal memory, genealogy, and political narrative across generations' `
  'Oral epics are disciplined knowledge systems, not mere folklore.'

$u1 += T '1.7' 'Indigenous Cosmologies and Religious Syncretism' `
  'LO 1.7.A: Explain indigenous African cosmologies and later religious syncretism in the diaspora.' `
  @('Yoruba and other West African religious systems shaped diaspora practices.','Syncretism blended African spiritual traditions with Christianity and other faiths in the Americas.') `
  @('Osain del Monte by Grupo Abbilona (video)','Yoruba Oshe Shango Ceremonial Wand','Oya''s Betrayal by Harmonia Rosales, 2020') `
  'Using LO 1.7.A and the Yoruba Oshe Shango wand, ceremonial objects help reveal __________ systems that later informed diaspora religions.' `
  'cosmological' @('cosmological','religious','spiritual') @('purely-secular','industrial','feudal-European') `
  'Shango-related objects point to deities, ritual power, and worldview.' `
  'source-match' 'Which artwork reimagines Yoruba sacred narrative in a contemporary visual form?' `
  @('Oya''s Betrayal by Harmonia Rosales, 2020','Broadside for Charleston slave auction, 1859','G.I. Bill pamphlet') 'Oya''s Betrayal by Harmonia Rosales, 2020' `
  'Rosales''s painting is a required CED visual for this topic.'

$u1 += T '1.8' 'Culture and Trade in Southern and East Africa' `
  'LO 1.8.A: Explain cultural and commercial connections in southern and East Africa.' `
  @('Great Zimbabwe''s stone architecture signals political complexity and trade.','Swahili Coast cities linked Africa to Indian Ocean trade networks.') `
  @('Photographs of Great Zimbabwe''s Walls and Stone Enclosures','Map Showing Indian Ocean Trade Routes from the Swahili Coast') `
  'Per LO 1.8.A and Great Zimbabwe photographs, monumental stone enclosures evidence African __________ organization and long-distance exchange.' `
  'political' @('political','state','urban') @('accidental','temporary-camp','purely-European') `
  'Large engineered walls imply organized labor and authority.' `
  'scenario' 'A map shows Swahili Coast routes into the Indian Ocean. What conclusion fits CED content?' `
  @('East African port societies participated in cosmopolitan trade before the Atlantic slave trade era','African coasts were closed to Asian merchants','Trade only moved north-south within the Sahara') 'East African port societies participated in cosmopolitan trade before the Atlantic slave trade era' `
  'Indian Ocean networks connected the Swahili Coast to wider Afro-Eurasian exchange.'

$u1 += T '1.9' 'West Central Africa: The Kingdom of Kongo' `
  'LO 1.9.A: Explain political and religious developments in the Kingdom of Kongo.' `
  @('Kongo leaders engaged Portuguese traders and missionaries while defending sovereignty.','Christian imagery, such as crucifixes, reflected complex cultural exchange and local meaning.') `
  @('Excerpt of Letter from Nzinga Mbemba to Portuguese King João III, 1526','Image of Triple Crucifix, Sixteenth to Nineteenth Century') `
  'Aligned to LO 1.9.A and Nzinga Mbemba''s 1526 letter, Kongolese rulers negotiated with Portugal while resisting destructive __________ practices tied to the early slave trade.' `
  'Portuguese' @('Portuguese','european','slave-trading') @('Ottoman','Incan','Qing') `
  'The letter protests Portuguese abuses and the draining of his kingdom.' `
  'artifact' 'What does the Kongo Triple Crucifix most usefully illustrate for historians?' `
  @('Local reinterpretation of Christianity within Kongolese political-religious life','Total rejection of all foreign contact','Identical practice to medieval France with no local change') 'Local reinterpretation of Christianity within Kongolese political-religious life' `
  'Christian forms were adapted within Kongo contexts.'

$u1 += T '1.10' 'Kinship and Political Leadership' `
  'LO 1.10.A: Explain how kinship shaped political leadership in Central and West African societies.' `
  @('Queen Njinga of Ndongo/Matamba used diplomacy and military strategy against Portuguese expansion.','Royal motherhood and kinship symbolism (e.g., Iyoba mask) reinforced political authority.') `
  @('Illustration of Queen Njinga, Seventeenth Century','Image of Queen Mother Pendant Mask: Iyoba, Sixteenth Century') `
  'Per LO 1.10.A and sources on Queen Njinga, Central African __________ leadership could include powerful women defending sovereignty.' `
  'political' @('political','royal','state') @('apolitical','purely-domestic','symbolic-only') `
  'Njinga is remembered as a strategist and sovereign, not a private figure only.' `
  'source-match' 'Which required source centers a Benin royal mother''s authority through court art?' `
  @('Queen Mother Pendant Mask: Iyoba','Brookes slave-ship stowage diagram','Harlem Renaissance poem Heritage') 'Queen Mother Pendant Mask: Iyoba' `
  'The Iyoba mask encodes kinship and political power.'

$u1 += T '1.11' 'Global Africans' `
  'LO 1.11.A: Explain the presence and roles of Africans in early global (including European) contexts before the height of the plantation complex.' `
  @('Africans lived, worked, and held varied statuses in early modern Europe and Atlantic worlds.','Visual sources like Chafariz d''El-Rey show Africans in Lisbon''s urban life.') `
  @('Chafariz d''El-Rey (The King''s Fountain), 1570–1580') `
  'Using LO 1.11.A and Chafariz d''El-Rey, historians see Africans as part of early modern __________ urban society, not only as later plantation laborers.' `
  'European' @('European','Iberian','Portuguese','global') @('exclusively-American','exclusively-rural','imaginary') `
  'The painting places Africans within Lisbon''s crowded public life.' `
  'scenario' 'A classmate says Africans only appear in history after 1619 Virginia. How do you respond with CED Unit 1 knowledge?' `
  @('Africans were already visible in Iberian and Atlantic contexts earlier, as Chafariz d''El-Rey shows','1619 is the first moment Africans existed anywhere','Unit 1 only covers U.S. plantation slavery') 'Africans were already visible in Iberian and Atlantic contexts earlier, as Chafariz d''El-Rey shows' `
  'Global Africans predates the later U.S.-centered enslavement narrative.'

$units["1"] = [ordered]@{
  id = 1
  title = 'Origins of the African Diaspora'
  shortTitle = 'Origins of the African Diaspora'
  examWeight = '20–25%'
  periods = '~18 class periods'
  blurb = 'Africa''s landscapes, states, learning traditions, and early global connections (~900 BCE–16th century).'
  topics = $u1
}

# ========== UNIT 2 ==========
$u2 = @()
$u2 += T '2.1' 'African Explorers in the Americas' `
  'LO 2.1.A: Explain early African presence and participation in Spanish American expeditions.' `
  @('Free and enslaved Africans participated in early Iberian exploration of the Americas.','Juan Garrido petitioned for recognition of his service in Spanish campaigns.') `
  @('Juan Garrido''s Petition, 1538','Image of Juan Garrido on a Spanish Expedition, Sixteenth Century') `
  'Per LO 2.1.A and Juan Garrido''s 1538 petition, Africans were present as __________ in early Spanish American expeditions, not only as later plantation laborers.' `
  'explorers' @('explorers','participants','conquistadors','soldiers') @('absentees','only-cargo','myths') `
  'Garrido documents African agency within imperial conquest structures.' `
  'source-match' 'Which source is a first-person petition by an African conquistador in New Spain?' `
  @('Juan Garrido''s Petition, 1538','Appeal by David Walker, 1829','SNCC Position Paper, 1964') 'Juan Garrido''s Petition, 1538' `
  'Garrido''s petition is the core primary text for Topic 2.1.'

$u2 += T '2.2' 'Departure Zones in Africa and the Slave Trade to the United States' `
  'LO 2.2.A: Explain African departure zones and patterns of forced migration to North America.' `
  @('Enslaved Africans were taken from multiple coastal regions with shifting intensities over time.','Maps reveal regional origins of people forced to North America.') `
  @('Map Showing an Overview of the Slave Trade Out of Africa','Map Showing the Regional Origins of Enslaved People Forcibly Transported to North America') `
  'Aligned to LO 2.2.A and CED slave-trade maps, forced migration followed identifiable African __________ zones rather than a single point of origin.' `
  'departure' @('departure','coastal','regional','embarkation') @('random','only-Egyptian','only-Cape') `
  'The maps emphasize multiple embarkation regions.' `
  'artifact' 'What analytical skill do the Unit 2 slave-trade maps most directly train?' `
  @('Reading spatial patterns of forced migration and regional origins','Memorizing ship names only','Ignoring African geography') 'Reading spatial patterns of forced migration and regional origins' `
  'Source analysis of maps is a spiraled AP skill.'

$u2 += T '2.3' 'Capture and the Impact of the Slave Trade on West African Societies' `
  'LO 2.3.A: Explain capture processes and impacts of the slave trade on West African societies.' `
  @('Capture and sale disrupted families, polities, and demographics.','Narratives by Equiano and poetry by Wheatley offer perspectives on enslavement and identity.') `
  @('On Being Brought from Africa to America by Phillis Wheatley, 1773','Excerpt from The Interesting Narrative of the Life of Olaudah Equiano, 1789') `
  'Using LO 2.3.A and Equiano''s narrative, firsthand accounts help historians understand the human __________ of capture and the Middle Passage on African communities.' `
  'impact' @('impact','effects','consequences','cost') @('celebration','irrelevance','prosperity-only') `
  'Equiano describes terror, separation, and social rupture.' `
  'scenario' 'Why pair Wheatley''s 1773 poem with Equiano''s narrative in this topic?' `
  @('Both required sources give African-descended perspectives on enslavement and identity','They deny that the slave trade affected Africa','They only discuss Reconstruction') 'Both required sources give African-descended perspectives on enslavement and identity' `
  'Multiple genres deepen source analysis.'

$u2 += T '2.4' 'African Resistance on Slave Ships and the Antislavery Movement' `
  'LO 2.4.A: Explain African resistance aboard ships and links to antislavery politics.' `
  @('Shipboard revolts and legal cases like Amistad challenged the trade.','Diagrams such as the Brookes stowage plan became abolitionist evidence.') `
  @('Stowage of the British Slave Ship Brookes','Plea to the Jurisdiction of Cinque and Others, 1839','Sketches of the Captive Survivors from the Amistad Trial, 1839','Stowage by Willie Cole, 1997') `
  'Per LO 2.4.A and the Brookes diagram, abolitionists used visual evidence of __________ conditions to mobilize opposition to the slave trade.' `
  'stowage' @('stowage','crowding','inhumane','shipping') @('luxury','voluntary','festive') `
  'The Brookes image quantified packed human cargo.' `
  'source-match' 'Which 1839 case materials highlight captive Africans contesting jurisdiction and freedom?' `
  @('Amistad plea and captive survivor sketches','Freedmen''s Bureau Circular No. 11','Négritude painting Les Fétiches') 'Amistad plea and captive survivor sketches' `
  'Amistad documents are required for Topic 2.4.'

$u2 += T '2.5' 'Slave Auctions and the Domestic Slave Trade' `
  'LO 2.5.A: Explain auctions and the domestic slave trade''s role in family separation.' `
  @('The domestic trade tore apart families within the United States.','Northup''s narrative and auction broadsides document commodification of people.') `
  @('Excerpt from Twelve Years a Slave by Solomon Northup, 1853','Broadside for an Auction of Enslaved Persons at the Charleston Courthouse, 1859') `
  'Aligned to LO 2.5.A and the 1859 Charleston auction broadside, the domestic trade treated people as __________ at public sale.' `
  'property' @('property','commodities','chattel') @('citizens','shareholders','diplomats') `
  'Broadsides list human beings like merchandise.' `
  'artifact' 'What does an auction broadside most clearly reveal as a primary source?' `
  @('The legal-commercial framing of enslaved people as salable goods','That slavery had ended in 1808 everywhere','Only free wage labor existed in Charleston') 'The legal-commercial framing of enslaved people as salable goods' `
  'Form and genre matter in source analysis.'

$u2 += T '2.6' 'Labor, Culture, and Economy' `
  'LO 2.6.A: Explain how enslaved labor shaped economies and how African knowledge persisted in material culture.' `
  @('Sugar, rice, and other staple economies depended on enslaved skill and coercion.','Objects like rice fanner baskets show African-derived agricultural knowledge.') `
  @('Sugar Cane Harvest, Antigua, West Indies 1823/1826','Broadside Advertising Valuable Slaves at Auction in New Orleans, 1859','Rice Fanner Basket, Circa 1863') `
  'Per LO 2.6.A and the rice fanner basket source, African-descended __________ knowledge shaped staple crop economies in the Americas.' `
  'agricultural' @('agricultural','agronomic','farming','rice-growing') @('irrelevant','only-European','purely-industrial') `
  'Basket technology connects to rice processing skill.' `
  'scenario' 'Why include both Caribbean sugar imagery and a Southern rice basket?' `
  @('To compare labor regimes and cultural knowledge across plantation economies','To prove slavery existed only in Antigua','To ignore U.S. markets') 'To compare labor regimes and cultural knowledge across plantation economies' `
  'Topic 2.6 links labor, culture, and economy across regions.'

$u2 += T '2.7' 'Slavery and American Law: Slave Codes and Landmark Cases' `
  'LO 2.7.A: Explain how law constructed and protected slavery, including Dred Scott.' `
  @('Slave codes regulated movement, assembly, and punishment.','Constitutional clauses and Dred Scott denied Black citizenship claims.') `
  @('Louisiana Code Noir articles (1724)','South Carolina Slave Code (1740)','U.S. Constitution Article I Sec. 2 and Article IV Sec. 2','Dred Scott v. Sandford excerpts, 1857') `
  'Using LO 2.7.A and Dred Scott (1857), the Court ruled that African Americans could not claim federal __________, intensifying sectional crisis.' `
  'citizenship' @('citizenship','citizen status','legal personhood') @('property-taxes','free-postage','knighthood') `
  'Taney''s opinion denied citizenship to Black people.' `
  'source-match' 'Which required legal text pair shows colonial slave regulation before the Constitution?' `
  @('Louisiana Code Noir and South Carolina Slave Code','UNIA Convention Address, 1921','Brown v. Board opinion, 1954') 'Louisiana Code Noir and South Carolina Slave Code' `
  'Codes are foundational for Topic 2.7.'

$u2 += T '2.8' 'The Social Construction of Race and the Reproduction of Status' `
  'LO 2.8.A: Explain how law and culture constructed race and inherited enslaved status.' `
  @('Virginia''s 1662 law tied children''s status to the mother.','Abolitionist imagery like Am I Not a Woman and a Sister? contested dehumanization.') `
  @('Laws of Virginia, Act XII, 1662','Am I Not a Woman and a Sister? from The Liberator, 1849') `
  'Per LO 2.8.A and Virginia Act XII (1662), hereditary slavery was reproduced by defining a child''s status through the __________.' `
  'mother' @('mother','maternal line','matriline') @('father-only','church','employer') `
  'Partus sequitur ventrem logic made status follow the mother.' `
  'artifact' 'What historical process does the 1662 Virginia act illustrate?' `
  @('Legal construction of race and inheritable unfreedom','Natural biological races fixed in science','The end of gendered exploitation') 'Legal construction of race and inheritable unfreedom' `
  'Race and status were made through law.'

$u2 += T '2.9' 'Creating African American Culture' `
  'LO 2.9.A: Explain cultural creativity among enslaved African Americans.' `
  @('Quilts, pottery, literacy struggles, and spirituals show cultural formation under constraint.','Coded and communal religious music sustained hope and covert communication.') `
  @('Cream and Red Appliqued Quilted Bedcover, Circa 1850','My Bondage and My Freedom excerpt (Douglass), 1855','Storage Jar by David Drake, 1858','Steal Away to Jesus performance/lyrics') `
  'Aligned to LO 2.9.A and David Drake''s inscribed storage jar, enslaved artisans asserted __________ and voice through craft.' `
  'literacy' @('literacy','authorship','creative voice','artistry') @('silence-only','illiteracy-mandate-success','European-guild membership') `
  'Drake signed and versified pots despite bans on literacy.' `
  'scenario' 'Why is Steal Away to Jesus listed among required sources?' `
  @('Spirituals encode religious meaning and sometimes covert community communication','It is a Reconstruction constitutional amendment','It is a Négritude manifesto') 'Spirituals encode religious meaning and sometimes covert community communication' `
  'Music is a primary cultural archive.'

$u2 += T '2.10' 'Black Pride, Identity, and the Question of Naming' `
  'LO 2.10.A: Explain debates over naming and Black identity in the early nineteenth century.' `
  @('Free Black communities debated collective names and public identity.','Newspaper letters in Call and Response capture those debates.') `
  @('Selections of Letters Written to Newspapers from Call and Response, 1831–1841') `
  'Per LO 2.10.A and Call and Response newspaper letters, free Black writers publicly debated collective __________ and self-definition.' `
  'naming' @('naming','identity','names','self-designation') @('silence','only-foreign-policy','sharecropping') `
  'What a people calls itself is political.' `
  'source-match' 'Which required source set captures 1830s–1840s debates on Black collective naming?' `
  @('Call and Response newspaper letters, 1831–1841','Tulsa Race Massacre photographs, 1921','Black Panther Ten-Point Program, 1966') 'Call and Response newspaper letters, 1831–1841' `
  'Topic 2.10 centers those letters.'

$u2 += T '2.11' 'The Stono Rebellion and Fort Mose' `
  'LO 2.11.A: Explain the Stono Rebellion and Spanish Florida freedom destinations such as Fort Mose.' `
  @('The 1739 Stono Rebellion was a major colonial uprising in South Carolina.','Spanish Florida offered paths to freedom that shaped escape and revolt.') `
  @('Letter from Governor of Florida to His Majesty, 1739','Excerpt from An Account of the Stono Rebellion, 1739') `
  'Using LO 2.11.A and the 1739 Stono account, the rebellion shows organized __________ to slavery in colonial South Carolina.' `
  'resistance' @('resistance','revolt','uprising','armed resistance') @('loyalty-oaths','indenture-contracts','quietism-only') `
  'Stono is a landmark revolt narrative.' `
  'scenario' 'Why pair Stono sources with a Florida governor''s letter?' `
  @('To connect revolt in Carolina to Spanish Florida as a freedom geography','To prove Florida had no Black communities','To discuss only the Harlem Renaissance') 'To connect revolt in Carolina to Spanish Florida as a freedom geography' `
  'Fort Mose and Spanish policy matter for escape calculus.'

$u2 += T '2.12' 'Legacies of the Haitian Revolution' `
  'LO 2.12.A: Explain the Haitian Revolution''s significance and diasporic legacies.' `
  @('Haiti''s independence challenged slavery hemispherically.','Douglass''s Chicago lecture and Jacob Lawrence''s Toussaint series interpret its meaning.') `
  @('Preliminary Declaration from the Constitution of Haiti, 1805','Frederick Douglass''s Lecture on Haiti, 1893','Jacob Lawrence Toussaint L''Ouverture series selections') `
  'Per LO 2.12.A and Haiti''s 1805 constitutional declaration, the revolution established a Black-led __________ that transformed Atlantic politics.' `
  'republic' @('republic','nation','independent state','Black republic') @('colony-forever','company-town','mission-station') `
  'Haiti became an independent Black republic.' `
  'artifact' 'What do Lawrence''s Toussaint paintings add beyond textual sources?' `
  @('Visual interpretation of revolutionary strategy, freedom, and historical memory','Proof that Haiti never existed','Only decorative unrelated modernism') 'Visual interpretation of revolutionary strategy, freedom, and historical memory' `
  'Art is a required mode of source analysis.'

$u2 += T '2.13' 'Resistance and Revolts in the United States' `
  'LO 2.13.A: Explain patterns and consequences of revolts in the United States.' `
  @('Revolts and conspiracy scares shaped white repression and Black resistance strategies.','Jefferson''s letter to Rufus King reflects elite anxiety after Haitian-influenced fears.') `
  @('Letter from Thomas Jefferson to Rufus King, 1802') `
  'Aligned to LO 2.13.A and Jefferson''s 1802 letter to Rufus King, U.S. leaders feared the __________ effects of Caribbean revolution on American slavery.' `
  'contagious' @('contagious','spreading','inspirational','hemispheric') @('irrelevant','purely-economic-neutral','celebratory-official') `
  'Elite correspondence shows political panic about revolt.' `
  'scenario' 'How should students use Jefferson''s letter as a source?' `
  @('As evidence of elite fear and policy thinking about Black resistance','As a slave narrative written by an enslaved author','As a Harlem Renaissance poem') 'As evidence of elite fear and policy thinking about Black resistance' `
  'Perspective and audience are key AP skills.'

$u2 += T '2.14' 'Black Organizing in the North: Freedom, Women''s Rights, and Education' `
  'LO 2.14.A: Explain free Black organizing around freedom, women''s rights, and education.' `
  @('Northern free Black activists built schools, churches, and reform networks.','Maria W. Stewart challenged audiences to act against injustice.') `
  @('Why Sit Here and Die by Maria W. Stewart, 1832') `
  'Per LO 2.14.A and Maria Stewart''s 1832 address, Black women intellectuals linked spiritual urgency to public __________ for freedom and education.' `
  'activism' @('activism','organizing','reform','protest') @('withdrawal-only','royalism','sharecropping') `
  'Stewart''s title itself is a call to action.' `
  'source-match' 'Which required source is a Black woman''s early public political address in the North?' `
  @('Why Sit Here and Die by Maria W. Stewart, 1832','Queen Njinga illustration','Soul Train photograph') 'Why Sit Here and Die by Maria W. Stewart, 1832' `
  'Stewart is central to Topic 2.14.'

$u2 += T '2.15' 'Maroon Societies and Autonomous Black Communities' `
  'LO 2.15.A: Explain maroon societies and autonomous Black communities.' `
  @('Maroons formed self-governing communities after escaping slavery.','Visual sources depict maroon warfare and autonomy in the Caribbean and beyond.') `
  @('Leonard Parkinson, a Captain of the Maroons (1796)','The Maroons in Ambush... Trelawney, Jamaica (1801)','The Hunted Slaves by Richard Ansdell, 1862') `
  'Using LO 2.15.A and maroon imagery from Jamaica, escaped communities practiced armed __________ and self-rule beyond plantation control.' `
  'autonomy' @('autonomy','self-government','independence','resistance') @('total-submission','factory-work','pilgrimage-only') `
  'Maroon societies were political formations.' `
  'artifact' 'What claim do ambush scenes of Jamaican maroons best support?' `
  @('Self-liberated communities used terrain and military tactics to defend freedom','Maroons only appear in twentieth-century U.S. cities','Escape was impossible in the Caribbean') 'Self-liberated communities used terrain and military tactics to defend freedom' `
  'Images document conflict and sovereignty claims.'

$u2 += T '2.16' 'Diasporic Connections: Slavery and Freedom in Brazil' `
  'LO 2.16.A: Explain slavery, culture, and freedom struggles in Brazil within the diaspora.' `
  @('Brazil received a vast share of enslaved Africans and developed distinctive Afro-Brazilian cultures.','Religious festivals and capoeira illustrate cultural persistence and adaptation.') `
  @('Festival of Our Lady of the Rosary... by Carlos Julião','Escravo Mina and Escrava Mina photographs, 1864','Capoeira Players and Musicians on Beach in Salvador da Bahia') `
  'Per LO 2.16.A and capoeira imagery from Bahia, Afro-Brazilian __________ practices preserved martial and musical traditions under and after slavery.' `
  'cultural' @('cultural','diasporic','Afro-Brazilian') @('erased','purely-Portuguese-court','Inuit') `
  'Capoeira embodies embodied cultural survival.' `
  'scenario' 'Why does the CED require Brazilian sources in a U.S.-facing AP course?' `
  @('To situate African American experiences within a wider African diaspora','To replace all U.S. content','To study only Portuguese royalty') 'To situate African American experiences within a wider African diaspora' `
  'Diasporic comparison is a course throughline.'

$u2 += T '2.17' 'African Americans in Indigenous Territory' `
  'LO 2.17.A: Explain relationships among African Americans and Indigenous nations, including Black Seminoles.' `
  @('Black Seminoles and other communities negotiated freedom, alliance, and conflict in Indigenous territories.','Military diaries and portraits document leaders and U.S. campaigns.') `
  @('Diary Entry... Capture of 41 Black Seminoles by Gen. Jesup, 1836','Abraham, a Black Seminole leader, 1863','Gopher John... 1863','Arkansas Petition for Freedmen''s Rights, 1869') `
  'Aligned to LO 2.17.A and Jesup''s 1836 diary, U.S. military campaigns targeted Black Seminole __________ in Indigenous territory.' `
  'communities' @('communities','alliances','freedom settlements','people') @('factories','universities','steamships-only') `
  'The diary records capture of Black Seminoles.' `
  'source-match' 'Which postwar document shows freedpeople seeking rights in Arkansas?' `
  @('Arkansas Petition for Freedmen''s Rights, 1869','Catalan Atlas, 1375','Brookes stowage diagram') 'Arkansas Petition for Freedmen''s Rights, 1869' `
  'The petition extends the topic into emancipation politics.'

$u2 += T '2.18' 'Debates About Emigration, Colonization, and Belonging in America' `
  'LO 2.18.A: Explain debates over emigration, colonization, and belonging.' `
  @('Activists disagreed about whether freedom required leaving the United States.','Delany, Douglass, and others argued competing visions of belonging.') `
  @('Emigration to Mexico letter in The Liberator, 1832','Martin R. Delany Condition... excerpt, 1852','West India Emancipation by Frederick Douglass, 1857') `
  'Per LO 2.18.A and Delany''s 1852 text, some Black thinkers promoted __________ as a path to dignity when U.S. belonging seemed blocked.' `
  'emigration' @('emigration','colonization','exodus','leaving America') @('loyalty-oaths-only','sharecropping-contracts','jazz-critique') `
  'Emigration was a contested strategy, not consensus.' `
  'scenario' 'Douglass''s West India Emancipation speech is useful because it...' `
  @('Shows a major voice arguing for struggle and belonging tied to emancipation politics','Proves everyone supported the American Colonization Society','Ends Unit 4 civil rights content') 'Shows a major voice arguing for struggle and belonging tied to emancipation politics' `
  'Compare Delany and Douglass rather than flattening them.'

$u2 += T '2.19' 'Black Political Thought: Radical Resistance' `
  'LO 2.19.A: Explain radical resistance in Black political thought.' `
  @('David Walker''s Appeal and Garnet''s Address urged forceful opposition to slavery.','Radical texts expanded the spectrum beyond gradualism.') `
  @('Appeal by David Walker, 1829','An Address to the Slaves of the United States by Henry Highland Garnet, 1843') `
  'Using LO 2.19.A and Walker''s 1829 Appeal, radical authors demanded immediate confrontation with __________ rather than patient delay.' `
  'slavery' @('slavery','enslavement','bondage') @('jazz','redlining','HBCU curricula') `
  'Walker''s Appeal is uncompromising.' `
  'artifact' 'What shared feature links Walker and Garnet as required pair?' `
  @('They articulate radical resistance strategies addressed to Black audiences','They are Confederate military orders','They are 1960s SNCC memos') 'They articulate radical resistance strategies addressed to Black audiences' `
  'Topic 2.19 is about radical political thought.'

$u2 += T '2.20' 'Race to the Promised Land: Abolitionism and the Underground Railroad' `
  'LO 2.20.A: Explain abolitionism and Underground Railroad networks, including Tubman''s leadership.' `
  @('Harriet Tubman guided freedom seekers and later reflected on that work.','Abolitionist networks combined vigilance, safe houses, and political advocacy.') `
  @('Harriet Tubman''s reflection in The Refugee by Benjamin Drew, 1856','Excerpt from Harriet, the Moses of Her People by Sarah H. Bradford, 1886') `
  'Per LO 2.20.A and Tubman''s reflection in The Refugee (1856), conductors risked their lives to lead freedom seekers on the __________.' `
  'Underground Railroad' @('Underground Railroad','underground railroad','UGRR') @('Transcontinental Railroad','Erie Canal','Panama Canal') `
  'Tubman is iconic within clandestine freedom networks.' `
  'source-match' 'Which source type pair appears for Tubman in Topic 2.20?' `
  @('A contemporary reflection and a later biography excerpt','Only twentieth-century hip-hop lyrics','Only Supreme Court opinions') 'A contemporary reflection and a later biography excerpt' `
  'Compare genre and time of composition.'

$u2 += T '2.21' 'Legacies of Resistance in African American Art and Photography' `
  'LO 2.21.A: Explain how art and photography shaped memories of resistance, including Tubman''s image.' `
  @('Photographs of Tubman across her life shaped public memory.','Contemporary artists like Bisa Butler reinterpret historical photographs in textile form.') `
  @('Photographs of Harriet Tubman across her life','I Go to Prepare a Place for You by Bisa Butler, 2021') `
  'Aligned to LO 2.21.A and Bisa Butler''s 2021 portrait, artists use visual media to extend __________ of resistance into the present.' `
  'legacies' @('legacies','memory','remembrance','commemoration') @('erasure','censorship-only','forgetting-mandates') `
  'Butler''s quilted portrait dialogues with historic photos.' `
  'artifact' 'Why study multiple Tubman photographs together?' `
  @('To analyze how image-making constructed leadership and legacy over time','To prove photography never circulated','To replace all textual sources') 'To analyze how image-making constructed leadership and legacy over time' `
  'Visual series enable continuity/change analysis.'

$u2 += T '2.22' 'Gender and Resistance in Slave Narratives' `
  'LO 2.22.A: Explain gendered dimensions of enslavement and resistance in women''s narratives.' `
  @('Mary Prince and Harriet Jacobs detail sexual vulnerability, family, and strategic resistance.','Women''s narratives expand what counts as political resistance.') `
  @('The History of Mary Prince excerpt, 1831','Incidents in the Life of a Slave Girl excerpts by Harriet Jacobs, 1860') `
  'Per LO 2.22.A and Jacobs''s Incidents, enslaved women narrated gendered oppression and __________ strategies often omitted from male-centered accounts.' `
  'resistance' @('resistance','survival','agency','self-liberation') @('passivity-only','royal-patronage','futurism') `
  'Jacobs theorizes loopholes of retreat and moral claim-making.' `
  'scenario' 'What AP skill is emphasized by comparing Prince and Jacobs?' `
  @('Comparing perspective, purpose, and evidence across women''s slave narratives','Ignoring gender entirely','Treating both as identical government reports') 'Comparing perspective, purpose, and evidence across women''s slave narratives' `
  'Source analysis + argumentation.'

$u2 += T '2.23' 'The Civil War and Black Communities' `
  'LO 2.23.A: Explain African American contributions and experiences during the Civil War.' `
  @('Black soldiers and civilians transformed the war''s meaning toward freedom.','Photographs and Dunbar''s poem commemorate Black military service.') `
  @('Civil War-era photographs (washerwoman; Charles Remond Douglass)','The Colored Soldiers by Paul Laurence Dunbar, 1895') `
  'Using LO 2.23.A and Dunbar''s The Colored Soldiers, artistic memory honors Black __________ service that helped secure Union victory and emancipation.' `
  'military' @('military','armed','soldier','Union') @('neutral','Confederate-cabinet','astronaut') `
  'Dunbar centers Black soldiers'' valor.' `
  'source-match' 'Which required poem commemorates Black Civil War soldiers?' `
  @('The Colored Soldiers by Paul Laurence Dunbar, 1895','Lift Every Voice and Sing','Still I Rise') 'The Colored Soldiers by Paul Laurence Dunbar, 1895' `
  'Dunbar is the Topic 2.23 literary source.'

$u2 += T '2.24' 'Freedom Days: Commemorating the Ongoing Struggle for Freedom' `
  'LO 2.24.A: Explain Juneteenth and other freedom commemorations as living political memory.' `
  @('General Order No. 3 (1865) announced freedom in Texas, grounding Juneteenth.','Contemporary Juneteenth celebrations continue commemorative politics.') `
  @('General Order 3 by Maj. Gen. Gordon Granger, 1865','Photographs of Juneteenth celebrations (2019–2021)') `
  'Per LO 2.24.A and General Order No. 3, Juneteenth commemorates delayed enforcement of __________ in Texas and the ongoing freedom struggle.' `
  'emancipation' @('emancipation','freedom','liberation') @('colonization','prohibition','internment') `
  'Order No. 3 is the textual root of Juneteenth.' `
  'scenario' 'Why include twenty-first-century Juneteenth photos beside an 1865 order?' `
  @('To show continuity of commemorative practice and evolving public memory','To prove the Civil War never ended slavery','To study only sports history') 'To show continuity of commemorative practice and evolving public memory' `
  'Then-and-now sourcing is intentional.'

$units["2"] = [ordered]@{
  id = 2
  title = 'Freedom, Enslavement, and Resistance'
  shortTitle = 'Freedom, Enslavement, and Resistance'
  examWeight = '30–35%'
  periods = '~39 class periods'
  blurb = 'Captivity, law, culture, revolt, and emancipation (16th century–1865).'
  topics = $u2
}

Write-Host "Units 1-2 topic counts: $($u1.Count) / $($u2.Count)"
# Continue in part 2 file via dot-sourcing pattern - embed remaining in same script

