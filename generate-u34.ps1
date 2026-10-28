# Units 3-4 topic data (dot-sourced after generate.ps1 core helpers — standalone rebuild)
$ErrorActionPreference = 'Stop'

function T($id, $title, $lo, $ek, $sources, $stem, $answer, $accept, $distractors, $hint, $simType, $simPrompt, $simOptions, $simCorrect, $simFeedback) {
  [ordered]@{
    id = $id; title = $title; lo = $lo; ek = @($ek); sources = @($sources)
    question = [ordered]@{ stem = $stem; answer = $answer; accept = @($accept); distractors = @($distractors) }
    hint = $hint
    simulation = [ordered]@{ type = $simType; prompt = $simPrompt; options = @($simOptions); correct = $simCorrect; feedback = $simFeedback }
  }
}

$u3 = @()
$u3 += T '3.1' 'The Reconstruction Amendments' `
  'LO 3.1.A: Explain how the Reconstruction Amendments impacted African Americans by defining standards of citizenship.' `
  @('The 13th abolished slavery (except as criminal punishment); 14th defined birthright citizenship and equal protection; 15th barred race-based voting denial.','Black legislators entered Congress during Reconstruction.') `
  @('13th, 14th, and 15th Amendments (selected sections)','Engraved Portrait of Five African American Legislators from Reconstruction Congresses') `
  'Per LO 3.1.A, the Fourteenth Amendment established birthright __________ and equal protection, overturning key parts of the Dred Scott logic.' `
  'citizenship' @('citizenship','citizen status') @('monarchy','colonization','sharecropping') `
  'Focus on Amendment XIV''s citizenship clause.' `
  'source-match' 'Which visual source evidences Black national political representation in Reconstruction?' `
  @('Engraved portrait of five African American Reconstruction congressmen','Brookes stowage diagram','Catalan Atlas') 'Engraved portrait of five African American Reconstruction congressmen' `
  'The engraving documents Black legislators in Congress.'

$u3 += T '3.2' 'Social Life: Reuniting Black Families and the Freedmen''s Bureau' `
  'LO 3.2.A: Explain family reunification efforts and the Freedmen''s Bureau''s roles.' `
  @('Freedpeople searched for kin through newspaper ads and Bureau assistance.','The Bureau addressed relief, labor, and abandoned lands unevenly.') `
  @('Elizabeth Brisco ad, Christian Recorder, 1864','Act to Establish a Bureau for the Relief of Freedmen and Refugees, 1865','Circular No. 11, 1867','Clarissa Reed ad, 1883') `
  'Aligned to LO 3.2.A and kinship ads in Black newspapers, freedpeople used print networks to pursue family __________ after sale and war.' `
  'reunification' @('reunification','reunion','reconnection') @('colonization','internment','prohibition') `
  'Ads plead for information about missing relatives.' `
  'scenario' 'Why are both 1864 and 1883 ads required conceptually?' `
  @('They show the long duration of kin-searching across and after emancipation','They prove families never tried to reunite','They only discuss jazz') 'They show the long duration of kin-searching across and after emancipation' `
  'Reunification was an extended struggle.'

$u3 += T '3.3' 'Black Codes, Land, and Labor' `
  'LO 3.3.A: Explain Black Codes and struggles over land and labor after emancipation.' `
  @('Southern Black Codes sought to control Black labor and mobility.','Land promises collided with restored planter power; convict leasing extended coerced labor.') `
  @('Land Order for Richard Brown, 1865','Circular No. 8, Freedmen''s Bureau, 1866','Juvenile Convicts at Work in the Fields, 1903','Picture Postcard of a North Carolina Convict Camp, Circa 1910') `
  'Per LO 3.3.A and convict-labor images, systems like convict leasing extended coerced __________ after formal emancipation.' `
  'labor' @('labor','work','unfree labor') @('vacation','homesteading-only','jury-service') `
  'Criminal punishment exceptions and leasing bound workers.' `
  'artifact' 'What tension does Richard Brown''s 1865 land order illuminate?' `
  @('Fleeting access to land during Reconstruction''s contested redistribution','Guaranteed 40 acres for every family forever','Only urban factory employment') 'Fleeting access to land during Reconstruction''s contested redistribution' `
  'Land was central and unstable.'

$u3 += T '3.4' 'The Defeat of Reconstruction' `
  'LO 3.4.A: Explain how Reconstruction was defeated and segregation entrenched, including Plessy.' `
  @('Violence, politics, and court decisions rolled back Reconstruction gains.','Plessy v. Ferguson (1896) sanctioned separate but equal segregation.') `
  @('Plessy v. Ferguson Supreme Court ruling, 1896') `
  'Using LO 3.4.A and Plessy (1896), the Court upheld __________ segregation under a separate-but-equal doctrine.' `
  'racial' @('racial','Jim Crow','legalized') @('gender-neutral-housing','random','voluntary-club-only') `
  'Plessy constitutionalized segregation.' `
  'scenario' 'How should students treat Plessy as a turning-point source?' `
  @('As legal authorization that helped defeat Reconstruction''s equality promises','As the amendment that abolished slavery','As a Négritude poem') 'As legal authorization that helped defeat Reconstruction''s equality promises' `
  'Law was a weapon of rollback.'

$u3 += T '3.5' 'Disenfranchisement and Jim Crow Laws' `
  'LO 3.5.A: Explain disfranchisement tools and Jim Crow segregation.' `
  @('Poll taxes, literacy tests, and violence stripped voting power.','Ida B. Wells documented lynching; everyday signs enforced caste.') `
  @('A Red Record excerpt by Ida B. Wells-Barnett, 1895','Segregated Water Fountains','Segregated Restrooms, Circa 1960') `
  'Per LO 3.5.A and Wells''s A Red Record, investigative writing exposed __________ as a tool of racial terror and control.' `
  'lynching' @('lynching','racial terror','mob violence') @('philanthropy','jazz improvisation','homesteading') `
  'Wells pioneered data-driven anti-lynching journalism.' `
  'source-match' 'Which required text is Wells''s anti-lynching investigation?' `
  @('A Red Record (1895)','Sunjata griot video','Black Panther Ten-Point Program') 'A Red Record (1895)' `
  'Topic 3.5 pairs Wells with Jim Crow visuals.'

$u3 += T '3.6' 'White Supremacist Violence and the Red Summer' `
  'LO 3.6.A: Explain white supremacist violence including Red Summer and Tulsa.' `
  @('1919 Red Summer saw widespread anti-Black mass violence.','The Tulsa Massacre destroyed Greenwood; McKay''s If We Must Die answered with defiant verse.') `
  @('If We Must Die by Claude McKay, 1919','Tulsa Race Massacre photographs, 1921') `
  'Aligned to LO 3.6.A and Tulsa photographs, white supremacist mobs destroyed prosperous Black __________ such as Greenwood.' `
  'communities' @('communities','districts','neighborhoods','towns') @('deserts','embassies','glaciers') `
  'Greenwood''s burning is visually documented.' `
  'artifact' 'What dual purpose do McKay''s poem and Tulsa photos serve together?' `
  @('Literary defiance paired with photographic evidence of massacre','Proof that 1919–1921 was peaceful','Only sports commentary') 'Literary defiance paired with photographic evidence of massacre' `
  'Multi-genre sourcing deepens analysis.'

$u3 += T '3.7' 'The Color Line and Double Consciousness in American Society' `
  'LO 3.7.A: Explain Du Bois''s double consciousness and the color line.' `
  @('Du Bois described twoness: American and Black.','Dunbar''s We Wear the Mask explores public concealment under racism.') `
  @('We Wear the Mask by Paul Laurence Dunbar, 1895','The Souls of Black Folk excerpts by W.E.B. Du Bois, 1903') `
  'Per LO 3.7.A and Souls of Black Folk, Du Bois theorized __________ consciousness as measuring oneself through a white world''s contempt.' `
  'double' @('double','dual','twoness') @('single','blank','corporate') `
  'Two-ness is the famous formulation.' `
  'scenario' 'Why pair Dunbar''s mask metaphor with Du Bois?' `
  @('Both analyze psychological and social strategies under the color line','They deny racism existed','They only discuss ancient Aksum') 'Both analyze psychological and social strategies under the color line' `
  'Literature theorized lived experience.'

$u3 += T '3.8' 'Lifting as We Climb: Uplift Ideologies and Black Women''s Rights and Leadership' `
  'LO 3.8.A: Explain uplift ideologies and Black women''s leadership.' `
  @('Anna Julia Cooper, Nannie Helen Burroughs, and others theorized women''s leadership.','Washington''s Atlanta Exposition Address and Lift Every Voice and Sing shaped uplift culture.') `
  @('A Voice from the South excerpts by Anna Julia Cooper, 1892','Atlanta Exposition Address by Booker T. Washington, 1895','How the Sisters Are Hindered from Helping by Nannie Helen Burroughs, 1900','Lift Every Voice and Sing, 1900') `
  'Using LO 3.8.A and Cooper''s A Voice from the South, Black women intellectuals insisted women''s leadership was vital to racial __________.' `
  'uplift' @('uplift','advancement','regeneration','progress') @('resignation','colonization-only','silence') `
  'Uplift was gendered and debated.' `
  'source-match' 'Which song is often called the Black national anthem and is required here?' `
  @('Lift Every Voice and Sing','Hey Mama (Ruth Brown)','Can''t Turn Me Around only') 'Lift Every Voice and Sing' `
  'Johnson & Johnson''s hymn is required.'

$u3 += T '3.9' 'Black Organizations and Institutions' `
  'LO 3.9.A: Explain Black business and institutional building in the Jim Crow era.' `
  @('Entrepreneurs like Madam C.J. Walker built national networks.','Black banks and businesses created semi-autonomous economic spaces.') `
  @('Madam C.J. Walker products advertisement','Photograph of Walker agents at Villa Lewaro, 1924','Clock used by Citizens Savings and Trust Company') `
  'Per LO 3.9.A and Walker agent convention imagery, Black __________ networks combined commerce with community institution-building.' `
  'business' @('business','entrepreneurial','commercial','enterprise') @('plantation','royal-court','only-military') `
  'Walker agents were an organized sales sisterhood.' `
  'artifact' 'What does a Black bank clock as a museum object help argue?' `
  @('Financial institutions were part of collective institution-building under Jim Crow','Banks never existed in Black communities','Only poetry mattered') 'Financial institutions were part of collective institution-building under Jim Crow' `
  'Material culture evidences institutions.'

$u3 += T '3.10' 'HBCUs, Black Greek Letter Organizations, and Black Education' `
  'LO 3.10.A: Explain HBCUs, BGLOs, and Black education''s roles.' `
  @('HBCUs trained professionals and cultural leaders.','Black Greek organizations practiced service and solidarity.') `
  @('Jubilee Singers of Fisk University, 1875','George Washington Carver with students at Tuskegee, 1902','Omega Psi Phi charity photograph, 1964','Professor Gail Hansberry with student at NCCU, 1965') `
  'Aligned to LO 3.10.A and Fisk Jubilee Singers imagery, HBCUs cultivated intellectual life and cultural __________ on national stages.' `
  'leadership' @('leadership','excellence','education','performance') @('illiteracy','eradication','exile-only') `
  'Fisk singers fundraised and represented Black education.' `
  'scenario' 'Why include both nineteenth- and mid-twentieth-century campus images?' `
  @('To show continuity of HBCU educational mission across eras','To prove HBCUs disappeared after 1900','To study only sports') 'To show continuity of HBCU educational mission across eras' `
  'Longue durée of Black higher education.'

$u3 += T '3.11' 'The New Negro Movement and the Harlem Renaissance' `
  'LO 3.11.A: Explain New Negro aesthetics and the Harlem Renaissance.' `
  @('Alain Locke''s New Negro framed a cultural-political awakening.','Hughes defended artists'' freedom from respectability constraints.') `
  @('The New Negro excerpt by Alain Locke, 1925','The Negro Artist and the Racial Mountain by Langston Hughes, 1926') `
  'Per LO 3.11.A and Locke''s New Negro, the Renaissance projected a self-assertive cultural __________ for African America.' `
  'identity' @('identity','renaissance','self-definition','awakening') @('erasure','surrender','medievalism') `
  'New Negro names the shift.' `
  'source-match' 'Which essay critiques the racial mountain facing Black artists?' `
  @('The Negro Artist and the Racial Mountain by Langston Hughes','General Order No. 3','Code Noir') 'The Negro Artist and the Racial Mountain by Langston Hughes' `
  'Hughes is paired with Locke.'

$u3 += T '3.12' 'Photography and Social Change' `
  'LO 3.12.A: Explain how photography documented and shaped Black modern life.' `
  @('James Van Der Zee portrayed Harlem dignity, style, and organization.','Portraiture countered racist caricature.') `
  @('James Van Der Zee portfolio selections (1915–1932)') `
  'Using LO 3.12.A and Van Der Zee''s Harlem portraits, photography could assert dignity and modern __________ against demeaning stereotypes.' `
  'identity' @('identity','self-representation','image','presence') @('invisibility','illiteracy','serfdom') `
  'Studio photography was political aesthetics.' `
  'artifact' 'What historical claim do Van Der Zee''s formal portraits best support?' `
  @('Harlem residents crafted modern, aspirational visual identities','Photography was illegal in Harlem','Only lynching photos exist from the era') 'Harlem residents crafted modern, aspirational visual identities' `
  'Counter-archive of Black modernity.'

$u3 += T '3.13' 'Envisioning Africa in Harlem Renaissance Poetry' `
  'LO 3.13.A: Explain how Renaissance poets imagined Africa and heritage.' `
  @('Bennett and Cullen''s Heritage poems negotiate longing, stereotype, and belonging.','Africa functioned as symbol, critique, and creative resource.') `
  @('Heritage by Gwendolyn Bennett, 1922','Heritage by Countee Cullen, 1925') `
  'Per LO 3.13.A, paired Heritage poems show artists wrestling with ancestral __________ and modern Black identity.' `
  'Africa' @('Africa','heritage','African heritage') @('Antarctica','suburbia-only','factory-life-only') `
  'Both poems are titled Heritage.' `
  'scenario' 'Why assign two different poems with the same title?' `
  @('To compare distinct poetic arguments about Africa and belonging','To prove only one poet mattered','To replace Locke entirely') 'To compare distinct poetic arguments about Africa and belonging' `
  'Comparison is the point.'

$u3 += T '3.14' 'Symphony in Black: Black Performance in Music, Theater, and Film' `
  'LO 3.14.A: Explain Black performance across music, theater, and film.' `
  @('Ellington''s jazz innovation and Cabin in the Sky cast/visuals show entertainment industries'' constraints and creativity.','Performance was labor, art, and politics.') `
  @('Duke Ellington It Don''t Mean a Thing (1943 video)','Katherine Dunham / Ethel Waters / cast images from Cabin in the Sky, 1940–1943') `
  'Aligned to LO 3.14.A and Ellington''s performance source, Black artists innovated American __________ while navigating segregated industries.' `
  'music' @('music','jazz','performance','entertainment') @('silence','only-politics-without-art','medieval-chant-only') `
  'Ellington exemplifies sonic modernism.' `
  'source-match' 'Which Broadway/film cluster is required for dance/theater performance?' `
  @('Cabin in the Sky images (Dunham, Waters, cast)','Stono Rebellion letter only','Aksumite coin only') 'Cabin in the Sky images (Dunham, Waters, cast)' `
  'Topic 3.14 spans music and stage/film.'

$u3 += T '3.15' 'Black History Education and African American Studies' `
  'LO 3.15.A: Explain early projects to institutionalize Black history education.' `
  @('Schomburg argued for recovering African diasporic pasts.','Woodson criticized miseducation and built institutional history work.') `
  @('The Negro Digs Up His Past by Arturo Schomburg, 1925','The Mis-Education of the Negro by Carter G. Woodson, 1933') `
  'Per LO 3.15.A and Woodson''s Mis-Education, controlling curricula can distort freedom by producing __________ about Black life.' `
  'miseducation' @('miseducation','mis-education','distortion','ignorance') @('liberation-automatically','neutrality-guaranteed','silence-as-success') `
  'Woodson''s title is the concept.' `
  'scenario' 'How do Schomburg and Woodson connect to Topic 1.1?' `
  @('They show intellectual foundations for later Black Studies institutionalization','They deny African history exists','They only discuss redlining maps') 'They show intellectual foundations for later Black Studies institutionalization' `
  'Course spiral: field formation.'

$u3 += T '3.16' 'The Great Migration' `
  'LO 3.16.A: Explain causes and consequences of the Great Migration.' `
  @('Millions left the South for Northern and Western cities.','Lawrence''s Migration Series and maps visualize movement and motive.') `
  @('Anonymous letter in The Messenger, 1920','The Migration Series by Jacob Lawrence (esp. Panel No. 1)','Map of The Great Migration') `
  'Using LO 3.16.A and Lawrence''s Migration Series, art narrates mass __________ from the South driven by terror and opportunity.' `
  'migration' @('migration','movement','exodus','relocation') @('hibernation','immigration-from-Mars','stasis') `
  'Panel No. 1 announces the journey.' `
  'artifact' 'What does a Messenger letter beckoning people north add to Lawrence''s paintings?' `
  @('Textual evidence of recruitment and decision-making behind migration','Proof nobody migrated','Only European immigration data') 'Textual evidence of recruitment and decision-making behind migration' `
  'Multi-source causation analysis.'

$u3 += T '3.17' 'Afro-Caribbean Migration' `
  'LO 3.17.A: Explain Afro-Caribbean migration and its effects on Black communities in the U.S.' `
  @('Caribbean migrants shaped Harlem politics, labor, and culture.','Domingo analyzed immigration restriction''s racial politics.') `
  @('Restricted West Indian Immigration and the American Negro by Wilfred A. Domingo, 1924') `
  'Per LO 3.17.A and Domingo''s 1924 Opportunity essay, debates over West Indian __________ intertwined with American racial politics.' `
  'immigration' @('immigration','migration','entry') @('astrology','feudalism','prohibition-of-jazz') `
  'Domingo addresses restriction explicitly.' `
  'source-match' 'Which required source analyzes West Indian immigration and Black America?' `
  @('Domingo''s 1924 Opportunity essay','Queen Mother Iyoba mask','General Order No. 3') 'Domingo''s 1924 Opportunity essay' `
  'Single required text—read it closely.'

$u3 += T '3.18' 'The Universal Negro Improvement Association' `
  'LO 3.18.A: Explain Garveyism and the UNIA''s mass appeal.' `
  @('Garvey built a transnational mass movement emphasizing pride and nationhood.','Photographs and his 1921 convention address capture UNIA spectacle and ideology.') `
  @('Address to the Second UNIA Convention by Marcus Garvey, 1921','Marcus Garvey at His Desk, 1924','Marcus Garvey in Harlem, 1924') `
  'Aligned to LO 3.18.A and Garvey''s 1921 convention address, the UNIA mobilized a mass __________ around pride, enterprise, and diaspora nationhood.' `
  'movement' @('movement','organization','campaign','following') @('silence','only-elite-salon','Confederate-club') `
  'UNIA was a mass movement.' `
  'scenario' 'Why include both Garvey''s speech and Harlem photographs?' `
  @('To connect ideology with visual evidence of leadership and urban mobilization','To prove Garvey never visited Harlem','To study only ancient Mali') 'To connect ideology with visual evidence of leadership and urban mobilization' `
  'Text + image pairing.'

$u4 = @()
$u4 += T '4.1' 'The Négritude and Negrismo Movements' `
  'LO 4.1.A: Explain Négritude and Negrismo as diasporic cultural-political movements.' `
  @('Francophone Négritude and Hispanophone Negrismo affirmed Black being against colonial racism.','Visual art by Jones and Lam dialogues with Césaire''s anticolonial critique.') `
  @('Les Fétiches by Loïs Mailou Jones, 1938','The Jungle (La Jungla) by Wifredo Lam, 1943','Discourse on Colonialism excerpt by Aimé Césaire, 1955') `
  'Per LO 4.1.A and Césaire''s Discourse on Colonialism, Négritude intellectuals condemned __________ as morally and culturally destructive.' `
  'colonialism' @('colonialism','empire','colonial rule') @('jazz','Reconstruction','sharecropping-only') `
  'Césaire theorizes colonial violence.' `
  'source-match' 'Which painting by a U.S.-based artist engages African mask aesthetics in this topic?' `
  @('Les Fétiches by Loïs Mailou Jones, 1938','Brookes diagram','Tulsa photographs') 'Les Fétiches by Loïs Mailou Jones, 1938' `
  'Jones is required alongside Lam and Césaire.'

$u4 += T '4.2' 'Anticolonialism and Black Political Thought' `
  'LO 4.2.A: Explain transnational Black anticolonial solidarity.' `
  @('African American activists linked U.S. freedom struggles to African and Caribbean independence.','Visits to Ghana and Cuba symbolized diasporic political imagination.') `
  @('MLK interview in newly independent Ghana, 1957','Joe Louis with Black leaders in Havana, 1960','Maya Angelou and others petitioning in Accra, 1963') `
  'Using LO 4.2.A and MLK''s Ghana visit source, U.S. Black leaders connected domestic justice to African __________ independence.' `
  'anticolonial' @('anticolonial','national','postcolonial','political') @('feudal','isolationist','pro-colonial') `
  'Ghana''s independence inspired solidarity.' `
  'scenario' 'What does Accra petition imagery add to this topic?' `
  @('Evidence of African American activism on African soil within Cold War/anticolonial contexts','Proof that activists never left the U.S.','Only sports scores') 'Evidence of African American activism on African soil within Cold War/anticolonial contexts' `
  'Transnational method.'

$u4 += T '4.3' 'African Americans and the Second World War: The Double V Campaign and the G.I. Bill' `
  'LO 4.3.A: Explain Double V and unequal access to wartime/veterans'' benefits.' `
  @('Double V demanded victory abroad against fascism and at home against racism.','Black women''s battalions and Tuskegee air personnel exemplify service amid discrimination.') `
  @('James G. Thompson Should I Sacrifice to Live Half-American?, 1942','6888th Central Postal Directory Battalion inspection photo, 1945','Tuskegee flight instructor staff photo, WWII') `
  'Per LO 4.3.A and Thompson''s 1942 Pittsburgh Courier letter, Double V meant victory overseas and victory over __________ at home.' `
  'racism' @('racism','discrimination','Jim Crow','racial injustice') @('jazz','emigration-to-Mars','feudalism') `
  'Half-American is the critique.' `
  'source-match' 'Which unit highlights Black women''s military postal service in WWII?' `
  @('6888th battalion inspection photograph, 1945','Nok sculpture','Stono account') '6888th battalion inspection photograph, 1945' `
  'Charity Adams''s unit is iconic.'

$u4 += T '4.4' 'Discrimination, Segregation, and the Origins of the Civil Rights Movement' `
  'LO 4.4.A: Explain early civil rights legal strategies including Brown and the doll tests.' `
  @('Social science evidence entered desegregation litigation.','Brown v. Board (1954) declared segregated public schools unconstitutional.') `
  @('Clark Doll Test photographs by Gordon Parks, 1947','Brown v. Board of Education Opinion, May 17, 1954') `
  'Aligned to LO 4.4.A and Brown (1954), the Court ruled segregated public schools inherently __________.' `
  'unequal' @('unequal','unconstitutional','unjust') @('beneficial','permanent','voluntary') `
  'Separate is inherently unequal.' `
  'artifact' 'Why are doll-test photographs required beside Brown?' `
  @('They show social-science evidence used to demonstrate segregation''s harm to children','They replace the court opinion','They discuss only jazz') 'They show social-science evidence used to demonstrate segregation''s harm to children' `
  'Interdisciplinary evidence.'

$u4 += T '4.5' 'Redlining and Housing Discrimination' `
  'LO 4.5.A: Explain redlining and housing discrimination''s effects.' `
  @('HOLC maps coded neighborhoods for investment risk along racialized lines.','Hansberry''s A Raisin in the Sun dramatizes housing barriers and dignity.') `
  @('HOLC Residential Security Map of Philadelphia and Camden, 1937','A Raisin in the Sun excerpt by Lorraine Hansberry, 1959') `
  'Per LO 4.5.A and HOLC maps, __________ systematically steered investment away from Black neighborhoods.' `
  'redlining' @('redlining','housing discrimination','racialized appraisal') @('emancipation','griots','Négritude') `
  'Red lines marked hazardous zones.' `
  'scenario' 'How does Raisin complement a redlining map?' `
  @('Drama humanizes the lived stakes of housing discrimination shown structurally on maps','It denies housing mattered','It only explains ancient Kongo') 'Drama humanizes the lived stakes of housing discrimination shown structurally on maps' `
  'Data + literature.'

$u4 += T '4.6' 'Major Civil Rights Organizations' `
  'LO 4.6.A: Explain strategies of major civil rights organizations and leaders.' `
  @('King theorized nonviolence; SNCC practiced direct action.','John Lewis''s words and images show youth leadership.') `
  @('Nonviolence and Racial Justice by MLK, 1957','Danny Lyon photo of John Lewis protest, 1962','The Revolution Is at Hand by John Lewis, 1963') `
  'Using LO 4.6.A and King''s 1957 essay, mainstream movement philosophy emphasized __________ as strategic moral force.' `
  'nonviolence' @('nonviolence','nonviolent resistance','non-violence') @('indifference','monarchy','isolation') `
  'Nonviolence is explicit in the title.' `
  'source-match' 'Which 1963 Lewis text signals urgent movement momentum?' `
  @('The Revolution Is at Hand by John Lewis, 1963','Equiano Chapter 2','Catalan Atlas') 'The Revolution Is at Hand by John Lewis, 1963' `
  'Lewis links grassroots urgency to national politics.'

$u4 += T '4.7' 'Black Women''s Leadership and Grassroots Organizing in the Civil Rights Movement' `
  'LO 4.7.A: Explain Black women''s leadership and coalition grassroots organizing.' `
  @('Women in SNCC challenged sexism within the movement.','School boycotts showed multiracial/ethnic coalition potential in cities.') `
  @('SNCC Position Paper: Women in the Movement, 1964','NYT boycott coverage, 1964') `
  'Per LO 4.7.A and the SNCC women''s position paper, activists documented __________ inside movement organizations even as they fought Jim Crow.' `
  'sexism' @('sexism','gender inequality','patriarchy','male dominance') @('victory-complete','silence','only-foreign-policy') `
  'Internal critique was part of struggle.' `
  'scenario' 'What does the 1964 NYC school boycott article add?' `
  @('Evidence of mass grassroots coalition organizing beyond a single charismatic leader','Proof that only courts mattered','Proof women never organized') 'Evidence of mass grassroots coalition organizing beyond a single charismatic leader' `
  'Grassroots scale.'

$u4 += T '4.8' 'The Arts, Music, and the Politics of Freedom' `
  'LO 4.8.A: Explain how arts and music propelled freedom politics.' `
  @('Poets, composers, and freedom songs amplified struggle.','King''s Birmingham reflections sit beside sonic protest.') `
  @('Little Rock by Nicolás Guillén, 1958','Original Faubus Fables by Charles Mingus, 1960','Why We Can''t Wait excerpt (King), 1964','Can''t Turn Me Around (video)') `
  'Aligned to LO 4.8.A and Mingus''s Faubus Fables, artists used __________ to ridicule segregationist power.' `
  'music' @('music','jazz','art','song') @('silence','only-statistics','feudal law') `
  'Mingus titles the governor in satire.' `
  'artifact' 'Why include a freedom song video among required sources?' `
  @('To treat performance as primary evidence of movement culture and politics','To replace all texts','To study only sports') 'To treat performance as primary evidence of movement culture and politics' `
  'Sound is a source.'

$u4 += T '4.9' 'Black Religious Nationalism and the Black Power Movement' `
  'LO 4.9.A: Explain Black religious nationalism and Black Power politics.' `
  @('Malcolm X''s Ballot or the Bullet framed political urgency.','Nation of Islam media and gatherings built alternative institutions.') `
  @('The Ballot or the Bullet by Malcolm X, 1964','Malcolm X and MLK photo, 1964','Muhammad Speaks salesmen, 1965','Elijah Muhammad convention photo, 1966') `
  'Per LO 4.9.A and Malcolm X''s 1964 speech, Black Power–era debate posed the __________ or the bullet as political alternatives.' `
  'ballot' @('ballot','vote','voting') @('banjo','brochure','balloon') `
  'The title states the dichotomy.' `
  'source-match' 'Which photo pairing underscores distinct yet contemporaneous Black leadership?' `
  @('Malcolm X and Martin Luther King Jr. after a 1964 press conference','Only Queen Njinga','Only Van Der Zee swimming team') 'Malcolm X and Martin Luther King Jr. after a 1964 press conference' `
  'Compare without caricature.'

$u4 += T '4.10' 'The Black Arts Movement' `
  'LO 4.10.A: Explain the Black Arts Movement''s aesthetics and politics.' `
  @('Art was redefined as functional for liberation.','Catlett''s Negro es Bello II links beauty, language, and struggle across diaspora.') `
  @('Negro es Bello II by Elizabeth Catlett, 1969') `
  'Using LO 4.10.A and Catlett''s Negro es Bello II, Black Arts aesthetics fused beauty with political __________.' `
  'affirmation' @('affirmation','pride','liberation','self-determination') @('submission','erasure','apology') `
  'Black is beautiful in Spanish/English dialogue.' `
  'artifact' 'What claim does Catlett''s print best support?' `
  @('Visual art circulated Black Power–era affirmations transnationally','Art was banned from politics entirely','Only landscapes were allowed') 'Visual art circulated Black Power–era affirmations transnationally' `
  'Aesthetic politics.'

$u4 += T '4.11' 'The Black Panther Party for Self-Defense' `
  'LO 4.11.A: Explain the Black Panther Party''s program and community survival programs.' `
  @('The Ten-Point Program demanded land, justice, housing, education, and peace.','Women were central; free breakfast exemplified survival politics.') `
  @('Black Panther Party Ten-Point Program, 1966','Black Panther Women in Oakland, 1968','Black Panther Free Food Program, 1972') `
  'Per LO 4.11.A and the Ten-Point Program, Panthers combined self-defense politics with community __________ programs.' `
  'survival' @('survival','service','mutual aid','social') @('vacation','royal','indifferent') `
  'Free food was not peripheral.' `
  'scenario' 'Why require images of Panther women and free food beside the Ten-Point text?' `
  @('To show gendered leadership and practical community programs implementing the platform','To prove the Party had no platform','To discuss only ancient Ghana') 'To show gendered leadership and practical community programs implementing the platform' `
  'Program + practice.'

$u4 += T '4.12' 'Black Is Beautiful and Afrocentricity' `
  'LO 4.12.A: Explain Black Is Beautiful and Afrocentric cultural politics.' `
  @('Natural hair and African-inspired dress rejected Eurocentric beauty norms.','Angelou''s Still I Rise poetically asserts resilience and pride.') `
  @('Kathleen Cleaver on natural hair (1968 video)','Naturally ''68 photo shoot with Grandassa models','Still I Rise by Maya Angelou, 1978') `
  'Aligned to LO 4.12.A and Cleaver''s natural hair source, beauty politics became a site of cultural __________.' `
  'resistance' @('resistance','affirmation','self-definition','pride') @('surrender','erasure','apology-only') `
  'The body and hair were politicized.' `
  'source-match' 'Which poem is required for affirming rise-after-oppression themes in this topic?' `
  @('Still I Rise by Maya Angelou, 1978','On Being Brought from Africa to America only','Steal Away only') 'Still I Rise by Maya Angelou, 1978' `
  'Angelou closes the topic set.'

$u4 += T '4.13' 'The Black Feminist Movement, Womanism, and Intersectionality' `
  'LO 4.13.A: Explain Black feminist / womanist politics and intersectional analysis.' `
  @('The Combahee River Collective articulated interlocking oppressions and Black feminist socialism.','Identity politics here meant analyzing race, class, gender, and sexuality together.') `
  @('Combahee River Collective Statement, 1977') `
  'Per LO 4.13.A and the 1977 Combahee River Collective Statement, Black feminists analyzed __________ systems of oppression rather than single-axis politics.' `
  'interlocking' @('interlocking','intersecting','multiple','simultaneous') @('isolated','random','purely-biological') `
  'Interlocking is their language.' `
  'scenario' 'What makes Combahee a landmark required source?' `
  @('It theorizes Black feminist politics and interlocking oppressions in activists'' own words','It is a slave code','It is a HOLC map') 'It theorizes Black feminist politics and interlocking oppressions in activists'' own words' `
  'Primary theoretical document.'

$u4 += T '4.14' 'Interlocking Systems of Oppression' `
  'LO 4.14.A: Explain literary explorations of interlocking oppression in everyday life.' `
  @('Brooks''s Maud Martha vignette shows racialized exclusion in mundane public space.','Literature reveals how oppression operates in ordinary encounters.') `
  @('We''re the Only Colored People Here by Gwendolyn Brooks (Maud Martha, 1953)') `
  'Using LO 4.14.A and Brooks''s vignette, fiction can expose how racial exclusion structures everyday __________ spaces.' `
  'public' @('public','social','shared','civic') @('lunar','subatomic','mythical-only') `
  'A movie theater becomes a classroom for caste.' `
  'artifact' 'What AP skill does a short fiction vignette especially train here?' `
  @('Analyzing how a literary source evidences social structures and lived experience','Memorizing only dates without meaning','Ignoring narrative perspective') 'Analyzing how a literary source evidences social structures and lived experience' `
  'Literature as historical evidence.'

$u4 += T '4.15' 'Economic Growth and Black Political Representation' `
  'LO 4.15.A: Explain late-20th/21st-century Black political representation and class complexity.' `
  @('Symbolic firsts coexist with ongoing inequality.','Data on the Black middle class complicates simple progress narratives.') `
  @('Colin Powell Howard commencement address, 1994','Official portraits of Barack and Michelle Obama','Brookings charts on the Black middle class, 2020') `
  'Per LO 4.15.A and Brookings charts, rising representation coexists with uneven __________ outcomes across class.' `
  'economic' @('economic','class','financial','wealth') @('mythical','uniformly-identical','irrelevant') `
  'Charts force complexity.' `
  'scenario' 'Why pair Obama portraits with inequality data?' `
  @('To analyze symbolism of political firsts alongside persistent structural disparities','To claim inequality ended in 2008','To erase the Black middle class') 'To analyze symbolism of political firsts alongside persistent structural disparities' `
  'Both/and analysis.'

$u4 += T '4.16' 'Demographic and Religious Diversity in Contemporary Black Communities' `
  'LO 4.16.A: Explain demographic and religious diversity in contemporary Black America.' `
  @('Immigration and generational change diversify Black America.','Religious affiliation patterns shift among younger adults.') `
  @('Pew Research: The Growing Diversity of Black America, 2021','Pew Research: Young Black Adults Less Protestant than Their Elders, 2021') `
  'Aligned to LO 4.16.A and Pew''s 2021 diversity report, contemporary Black communities are demographically more __________ than older stereotypes allow.' `
  'diverse' @('diverse','heterogeneous','varied','plural') @('monolithic','identical','frozen') `
  'Diversity is the finding.' `
  'source-match' 'Which source type is required for Topic 4.16?' `
  @('Contemporary Pew Research Center data reports','Only seventeenth-century maps','Only griot epics') 'Contemporary Pew Research Center data reports' `
  'Data literacy is an AP skill.'

$u4 += T '4.17' 'The Evolution of African American Music: From Spirituals to Hip-Hop' `
  'LO 4.17.A: Explain continuities and changes in African American music.' `
  @('Africanisms and innovation link sacred/secular traditions to R&B and hip-hop.','Maultsby''s chart maps evolution; breakdance imagery shows hip-hop embodiment.') `
  @('Ruth Brown Hey Mama live video','Maultsby evolution chart (1980)','Breakdancers in New York, 1984') `
  'Per LO 4.17.A and Maultsby''s evolution chart, historians trace African American music as a continuous yet __________ tradition.' `
  'evolving' @('evolving','changing','dynamic','adaptive') @('static','extinct','European-only') `
  'Evolution implies change with continuity.' `
  'artifact' 'What do breakdance photographs add to a music-evolution chart?' `
  @('Evidence that hip-hop culture includes embodied performance beyond recorded sound','Proof music stopped in 1900','Proof dance is unrelated') 'Evidence that hip-hop culture includes embodied performance beyond recorded sound' `
  'Culture is multimodal.'

$u4 += T '4.18' 'Black Life in Theater, TV, and Film' `
  'LO 4.18.A: Explain Black creativity and representation in theater, TV, and film.' `
  @('Micheaux pioneered independent Black cinema; Soul Train televised style and dance.','August Wilson''s Fences brought Black family drama to major stages.') `
  @('Lobby card for The Betrayal by Oscar Micheaux, 1948','Soul Train photograph and line-dance video','Playbill for Fences by August Wilson, 1987') `
  'Using LO 4.18.A and Micheaux''s lobby card, early independent Black __________ challenged Hollywood exclusion.' `
  'film' @('film','cinema','filmmaking','movies') @('sculpture-only','redlining','codices') `
  'Micheaux built a parallel industry.' `
  'scenario' 'Why include Soul Train beside Wilson''s Fences?' `
  @('To span popular televised culture and serious theatrical drama as Black media arts','To prove TV never mattered','To replace all Unit 1 content') 'To span popular televised culture and serious theatrical drama as Black media arts' `
  'Breadth of expressive culture.'

$u4 += T '4.19' 'African Americans and Sports' `
  'LO 4.19.A: Explain sports as a site of labor, excellence, and protest.' `
  @('Black athletes faced exploitation and used platforms for protest.','1968 Olympic salute and later protests continue a long arc.') `
  @('Jockeys at the Washington Races, 1840','Tommie Smith and John Carlos, 1968 Olympics','Seahawks vs 49ers image, 2017') `
  'Per LO 4.19.A and the 1968 Olympic photograph, athletes used the global sports stage for __________ protest.' `
  'political' @('political','racial justice','human rights','Black Power') @('apolitical','silent','purely-commercial-only') `
  'Raised fists were intentional politics.' `
  'source-match' 'Which required image set links nineteenth-century Black jockeys to modern protest?' `
  @('1840 jockeys; 1968 Smith/Carlos; 2017 NFL moment','Only Aksum coin','Only HOLC map') '1840 jockeys; 1968 Smith/Carlos; 2017 NFL moment' `
  'Long continuum of sports and race.'

$u4 += T '4.20' 'Science, Medicine, and Technology in Black Communities' `
  'LO 4.20.A: Explain Black contributions and ethical issues in science, medicine, and technology.' `
  @('NASA-era engineers and astronauts expanded STEM presence.','The Henrietta Lacks story raises consent and medical exploitation.') `
  @('Mary Jackson at work, 1977','Mae Jemison in zero gravity, 1992','Henrietta Lacks (HeLa) by Kadir Nelson, 2017') `
  'Aligned to LO 4.20.A and the Nelson HeLa portrait, medical breakthroughs can rest on ethical failures regarding __________ and consent.' `
  'exploitation' @('exploitation','consent','bioethics','bodily autonomy') @('irrelevant','celebration-only','silence') `
  'HeLa cells transformed medicine without just consent.' `
  'scenario' 'Why pair Jackson/Jemison images with a Lacks portrait?' `
  @('To hold achievement and structural medical injustice in the same analytical frame','To claim STEM excluded all Black women forever','To ignore ethics') 'To hold achievement and structural medical injustice in the same analytical frame' `
  'Complexity over myth.'

$u4 += T '4.21' 'Black Studies, Black Futures, and Afrofuturism' `
  'LO 4.21.A: Explain Afrofuturism and speculative visions in Black cultural thought.' `
  @('Afrofuturism imagines Black futures through science fiction, music, and film.','From Uhura and Sun Ra to Black Panther discourse, speculation is political.') `
  @('Lets Talk About Black Panther and Afrofuturism video','Nichelle Nichols as Uhura, 1968','Space Is the Place poster, Circa 1974','Walter Mosley Culture Zone; Black to the Future, 1998') `
  'Per LO 4.21.A and Afrofuturism sources, speculative art imagines Black __________ beyond constraining historical narratives.' `
  'futures' @('futures','futurity','possibility','tomorrow') @('erasure','only-past-nostalgia','ending-history') `
  'Futures is in the topic title.' `
  'artifact' 'What throughline connects Uhura, Space Is the Place, and Black Panther discourse?' `
  @('Speculative culture as a site for Black freedom dreaming and critique','Proof science fiction excluded Black creators entirely','Only sports history') 'Speculative culture as a site for Black freedom dreaming and critique' `
  'Afrofuturism closes the course arc.'

# Export for parent
$global:APAAS_U3 = $u3
$global:APAAS_U4 = $u4
Write-Host "U3=$($u3.Count) U4=$($u4.Count)"
