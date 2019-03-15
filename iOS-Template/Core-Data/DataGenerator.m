//
//  DataGenerator.m
//
//  Copyright (c) 2019 andrei.dimitrief.jianu@gmail.com. All rights reserved.
//
//  The above copyright notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "DataGenerator.h"

@implementation DataGenerator

+ (void)generateTestData
{
    [ListItem
     createListItemWithTitle:@"Lockheed SR-71"
     andWithSubtitle:@"Long-range reconnaissance aircraft"
     andWithDetails:@"Until its first retirement at the end of 1989, and then the planned reactivation of two in the mid 1990s but followed by the announcement of continuing full retirement in April 1998, the SR-71 was the world's fastest and highest-flying conventional aircraft. It was a truly extraordinary machine, designed for the strategic reconnaissance role with a mass of sensors including ASARs-1 (advanced synthetic aperture radar system) or the Itek camera that could scan to the horizon on each side of the flightpath, and two pre-programmable high-resolution cameras."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-sr-71"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];
    
    [ListItem
     createListItemWithTitle:@"Mikoyan MiG-25"
     andWithSubtitle:@"Interceptor and reconnaissance aircraft"
     andWithDetails:@"The Mach 3-capable Mikoyan-Gurevich MiG-25 (Western reporting name Foxbat) was developed in the early 1960s to fulfill the high-altitude and high-speed interception and dedicated reconnaissance roles. First prototype made its maiden flight in 1964. This aircraft was revealed by the Soviets in 1967. Its appearance led to serious concerns throughout the US Department of Defense that the US was being outclassed and led to development of a new F-15 air-superiority fighter in order to counter the threat posed by this Soviet warplane. Production of the MiG-25P (interceptor variant) commenced in 1971 and it entered service with the Soviet Air Force in 1972. Its reporting name in the West was Foxbat-A. Though this aircraft was simultaneously produced in numerous variants. A total of 1 186 MiG-25s of all variants were built until production ceased in 1985. This aircraft was exported to some countries. Since its introduction the MiG-25 was an important type in service with the Soviet air force and air defense forces. After the collapse of the Soviet Union a number of MiG-25s were passed on to successor states. In the 1990s the MiG-25 remained an important type in Russia and formed the backbone of the Russia's air defenses. Though the numbers were gradually reducing. These aircraft flew missions during the 1999 military campaign in Chechnya. In 2001 Russian Air Force still operated limited numbers of MiG-25PD/PDS (Foxbat-E) interceptors. In 2010 a total of 42 MiG-25RBs (reconnaissance-bomber variant) remained in service."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-mig-25"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Mikoyan MiG-31"
     andWithSubtitle:@"Long-range interceptor"
     andWithDetails:@"The MiG-31 (Western reporting name Foxhound-A) was developed as part of an overall programme to provide the Soviet air defenses with the ability to meet the threat posed by NATO low-level strike aircraft and cruise missiles. It was also intended to fulfill high-altitude and high-speed interception. It was developed as a successor to a MiG-25 interceptor. The prototype Ye-155MP first flew in 1975. Production of the MiG-31 began in 1979 and the type entered service in 1982. A total of 519 of these aircraft were produced. The MiG-31s continue to form the back bone of Russia's air defenses. At least 300 are in service with Russia, equipping around 15 fighter regiments. Kazakhstan is the only former Soviet republic to operate the MiG-31, with a regiment based at Semipalatinsk. Some sources report that in 2016 a total of 6 MiG-31 interceptors were delivered to Syria. By 2017 a total of 110 aircraft were reportedly upgraded to MiG-31BM and MiG-31BMS standards in order to extend their operational lives. It is planned that all operational MiG-31s will be upgraded in order to keep them operational. This interceptor was designed to engage high-flying and high-speed aircraft, such as Lockheed SR-71 reconnaissance planes. The MiG-31 has a high speed, altitude and rate of climb, however it sacrifices maneuverability in order to achieve these capabilities. The MiG-31 is among the fastest production aircraft. It uses missiles to shot-down enemy aircraft at long ranges."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-mig-31"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Mikoyan MiG-31BM"
     andWithSubtitle:@"Multi-role fighter"
     andWithDetails:@"The MiG-31BM is the latest version of the MiG-31. It evolved as an improved version of the MiG-31B interceptor with an added air-to-ground capability. Development of this aircraft commenced in 1997. First prototype was introduced in 1998. The second prototype was completed until 2006. In 2011 Russian MoD signed the first contract to upgrade a total of 60 aircraft to the new standard. Deliveries the the Russian Air Force commenced in 2011. A follow-on contract for upgrade of more than 50 aircraft was signed in 2014. By 2017 a total of 110 aircraft were reportedly upgraded to MiG-31BM and MiG-31BMS standards. This upgrade allowed to extend service life of older aircraft for at least another 15 years. It is planned that all operational MiG-31s will be upgraded. The MiG-31BM is billed as a true multi-role aircraft. It is able to undertake long-range interception, precision strike and defense suppression tasks. One of its roles is suppression of enemy air defenses. It is among the deadliest fighters in the world. This fighter has a high speed, altitude and rate of climb, however it sacrifices maneuverability in order to achieve these capabilities. The MiG-31BM is among the fastest production aircraft. It can reach a maximum speed of up to 3 000 km/h. This aircraft has an advanced Zaslon-AM phased-array radar. It can detect air targets at a maximum range of 320 km. It can track 24 air targets simultaneously and engagement of 8 of them at once with its missiles. Furthermore unlike the earlier versions the MiG-31BM can act as a small airborne early warning aircraft. With to its powerful radar and long detection range it has an added ability to track and datalink numerous radar contacts. The MiG-31BM can also act as an airborne command post and coordinate the actions of other types of fighters that have less powerful radars."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-mig-31bm"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"McDonnell Douglas F-15 Eagle"
     andWithSubtitle:@"Air superiority fighter"
     andWithDetails:@" In 1967 the Soviet Union revealed a new MiG-25 high-speed and high-altitude interceptor, which had tremendous performance. Its appearance led to serious concerns throughout the Department of Defense that the US was being outclassed. Also there were some other new Soviet developments that posed threat. A new fighter was required, that could meet expected performance of the MiG-25. In 1968 four US companies submitted their proposals for a new air-to-air fighter. These included General Dynamics, Fairchild Republic, North American Rockwell and McDonnell Douglas. In 1969 the US Air Force selected the McDonnell Douglas design, which resembled a twin-tail F-14 Tomcat, but had fixed wings. The F-15 Eagle made its first flight in 1972. It was the first USAF's dedicated air superiority fighter since the F-86 Sabre. It remains the world's premier air-to-air fighter. Although now in service for over 40 years, it remains a formidable warplane, as attested by its claim to 36 of the 39 USAF aerial victories in Desert Storm, without a single combat loss."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-f-15"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Su-35"
     andWithSubtitle:@"Multi-role fighter"
     andWithDetails:@"The Su-35 is a significantly developed version of the Su-27. Development began in the early 1980s. The aircraft first flew in 1988 and was originally known as Su-27M. It was proposed as a super agile Su-27 primarily for air superiority missions, but also with a greatly expanded air-to-ground capability. It had a number of improvements in engines, aerodynamics, avionics and construction methods. Later this aircraft was redesignated as the Su-35. It is referred in the West as Flanker-E. Sometimes it is also nicknamed as the Super Flanker. The Su-35 is being proposed as a replacement for Su-27 and MiG-29 fighters. Initial production of the Su-27M commenced in 1988. Later it was redesignated as the Su-35. However only 12 of these aircraft were completed for the Russian Air Force, including 9 pre-production aircraft. Production ceased in 1995. Improved versions of the Su-35 emerged, including the Su-35BM and Su-35UB. However only the Su-35S, which made its first flight in 2008, became the definitive version, which was produced in quantity. Some sources report that by 2017 Russian Air Force operated 68 Su-35S aircraft. In 2015 China ordered 24 of these multi-role fighters, becoming the first foreign customer. A first batch of 4 aircraft was delivered to China in 2016. By 2017 a total of 14 aircraft were reportedly delivered. In 2017 Indonesia ordered 11 aircraft, becoming the second export customer. Developers refer the Su-35 as 4++ generation fighter. Even though it is basically an upgraded version of the Su-27 that made its first flight back in 1977. The Su-35 is a very fast and highly maneuverable fighter with very long range, high altitude capability and heavy armament. It poses great threat to Western 4+ generation fighters, such as Eurofighter Typhoon, Dassault Rafale, F-15C or F/A-18E Super Hornet. However it is no match for American F-22 Raptor due to the stealthiness."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-su-35"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Dassault Rafale"
     andWithSubtitle:@"Multi-role fighter"
     andWithDetails:@"The Dassault Rafale will form the cornerstone of French air power until well into the 21st century. The programme began with the Rafale A technology demonstrator that was first flown on 4 July 1986. This established the basic aerodynamic design and evaluated the delta canard configuration, performance, FBW control system and composite-based structure. The generic Rafale D (Discret, or stealthy) - prototype for the Armee de l'Air versions - is slightly smaller and lighter. The Rafale features some of the very latest avionics systems including RBE2 multi-mode radar (the first in Europe with two-plane electronic scanning), advanced pilot's helmet with sight and display, Spectra countermeasures system and OSF - a jam-resistant passive optronic surveillance and imaging system with laser rangefinder."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-rafale"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Boeing F/A-18E/F Super Hornet"
     andWithSubtitle:@"Multi-role fighter"
     andWithDetails:@"The first of McDonnell Dauglas's (Boeing from 1997) Hornet upgrade concepts to reach fruition is the F/A-18E Super Hornet. The first F/A-18E made its maiden flight in November 1995 and the first aircraft was formally accepted into service with VFA-122 on 15 January 1999. The avionics upgrade is centred on the Raytheon APG-73 radar as already fitted to late versions of the F/A-18C. The IDECM (Integrated Defensive Electronic Counter Measures) system has three major elements: an ALR-67(V)3 RWR, ALQ-214 radio-frequency counter measures system and ALE-55 fibre-optic towed decoy system. The cockpit of the F/A-18E is similar to that of the F/A-18C with the exception of a larger flat-panel display in place of the current three head down displays. The enlarged airframe incorporates measures to reduce radar cross section and includes a fuselage lengthened by 0.86 m, an enlarged wing characterised by a thicker section and two more hardpoints, enlarged leading edge root extentions, and horizontal and vertical tail surfaces. The Super Hornet also has a structure extensively redesigned to reduce weight and cost without sacrificing its strength."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-f-18"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Chengdu J-20"
     andWithSubtitle:@"Stealthy air superiority fighter"
     andWithDetails:@"First photos of the Chinese J-20 stealthy fighter aircraft appeared in 2010. It was designed to compete against fifth-generation fighters, such as a US F-22 Raptor and advanced forth-generation fighters, such as a Russian Su-57 (previously known as PAK-FA). It is speculated, that development of the J-20 was assisted by the Russian MiG aviation company. After collapse of the Soviet Union this aviation giant suffered from loss of orders and uncertain future. Externally the J-20 strongly resembles a cancelled Russian MiG 1.42 multi-role fighter. The MiG 1.42 demonstrator was first publicly revealed in 1999. It made its first flight in 2001, however the Russian program was suspended due to funding problems. It is rather unusual that photos of this stealthy fighter aircraft came out even before the first flight, considering that all Chinese military programs are kept in high secrecy. However during the last decade China has taken a more transparent approach to its military programs. Still though there is little official information on this plane. When the first photos appeared some sources suggested, that this aircraft is a high-flying long-range interceptor. Other sources suggested, that it might be a long-range interdictor or tactical bomber. The J-20 is actually a medium- and long-range air superiority fighter, like the US F-22, which might also have a secondary ground attack capability. Actually the new J-20 is an advanced forth-generation fighter, rather than a true fight-generation fighter. Still though it easily outclasses older forth-generation fighters, such as the US F-16 or the Russian Su-27. This aircraft made its first flight in 2011. By 2015 at least 5 prototypes were built. Low-rate initial production commenced in 2015. This new Chinese aircraft was first publicly revealed only in 2016. First operational J-20 stealthy fighters were delivered to Chinese air force in 2016. The J-20 fighter was officially adopted by the Chinese air force in 2017. Some sources report, that China plans to produce 570 of these aircraft."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-j-20"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Sukhoi Su-57"
     andWithSubtitle:@"Stealthy multi-role fighter"
     andWithDetails:@"The Sukhoi Su-57 is a new Russian fighter aircraft. It started life of the PAK FA (or Future Frontline Aircraft System). Originally it was thought that the PAK FA is an air superiority fighter, however it turned out that this aircraft has a secondary ground attack capability. This new stealthy aircraft was designed to replace ageing MiG-29 and Su-27 fighters. It can be seen as a Russian answer to the US F-22 Raptor. Development of this aircraft commenced in 2001. A T-50 prototype was revealed and made its maiden flight in 2010. In 2014 a pre-production prototype was delivered to the Russian Air Force for trials and evaluation. These trials were completed in 2015. It was planned that this fighter aircraft will enter service in 2017-2018 and should reach full operational capability by 2020. However in 2017 official sources reported that the aircraft was not yet ready for full-scale production. Most likely that setbacks were related to technical issues, incomplete development of some of its core systems, such as engines, new missiles and electronics, as well as funding problems. In 2017 the PAK FA received a regular Su-57 designation. Russian Air Force has a requirement for up to 150-200 of these new multi-role fighters. Meanwhile the Russian Air Force orders Su-35 multi-role fighters as an interim measure, until the Su-57 stealthy fighter becomes available. By 2018 at least 9 Su-57 aircraft were built including prototypes and pre-production fighters. It was planned that in 2018 a first batch of 12 pre-production fighters will be delivered to the Russian Air Force. In fact in 2018 a couple of pre-production Su-57 fighters were deployed in Syria. Full scale production was planned to begin in 2019."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-su-57"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Lockheed Martin F-35C Lightning II"
     andWithSubtitle:@"Stealthy carrier-based multi-role fighter"
     andWithDetails:@"The Lockheed Martin's F-35 (also known as the Lightning II) was designed uder a Joint Strike Fighter programme as a common multi-role fighter for 3 branches of the US military, including Air Force, Marine Corps and Navy. Its development commenced in the mid 1990s. Development was principally funded by the USA, with the UK and other partner governments providing additional funding. However development of this multi-role fighter was rather protracted and was plagued by constant cost overruns. The same generic aircraft is available in 3 main variants. The F-35A is a conventional take-off and landing aircraft for the US Air Force, the F-35B is a short take-off and vertical landing aircraft for the US Marine Corps, while the F-35C is the carrier-based variant. Initially it was planned that these 3 variants would share around 80% of their parts to keep development, production and maintenance costs low and for easier logistic support. However it turned out that by 2017 the design commonality was only 20%. The F-35B was the first variant of the F-35 to become operational. It achieved initial operational capability with the US Marine Corps in 2015. The US Navy's F-35C made its first flight in 2010. In 2011 the US Marine Corps and US Navy sighed an agreement to purchase 80 and 260 F-35C carrier-based fighters respectively. First pre-production F-35Cs were delivered in 2013. It was planned that the F-35C will achieve initial operational capability in 2018. First deployment is schedulled in 2020. These new carrier-based fighters will replace the US Marine Corps' and Navy's F/A-18 multi-role fighters (A, B, C and D models). Though the US Navy will still use its newer and more capable F/A-18E and F/A-18F Super Hornets. It is planned that these new stealthy fighters will be operational for 30-40 years."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-f-35c"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"F-16 Fighting Falcon"
     andWithSubtitle:@"Multi-role fighter"
     andWithDetails:@" Originally conceived as a lightweight air-combat fighter, the Lockheed Martin (originally General Dynamics) F-16 has evolved into a versatile and effective multi-role workhorse. It was intended to supplement contemporary F-15 Eagle air superiority fighter. The F-16 was a lighter and less capable warplane than the F-15 Eagle, however it was also less expensive to produce and to maintain. The F-16 made its maiden flight in 1974. Over 4 400 of these aircraft were built. The type is currently operated by 25 air forces. The US Air Force (USAF) will operate its F-16 fleet until 2025. It will be gradually replaced with the new F-35. The F-16 fighter has one engine. Such layout allowed to reduce production and servicing costs. The first production variants were the F-16A (single seat) and F-16B (two seat) aircraft. These were built in production blocks numbered 1, 5, 10, and 15. The USAF retired its 296 Block 5/10 F-16s in the early 1990s. Block 15 F-16A/Bs introduced an extended horizontal stabilator and a track-while-scan mode for the radar. Most surviving Block 15 F-16s equip Air National Guard and test units. Of 467 Block 15 F-16As and F-16Bs, 272 were converted to F-16A/B ADF (Air Defense Fighter) standard with upgraded APG-66 radar compatible with AIM-7 Sparrow air-to-air missile, advanced friend-or-foe identification system, and improved electronic counter countermeasures and radios. Although most ADFs are in storage three Air National Guard units remain equipped with the type."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-f-16"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Fairchild A-10 Thunderbolt II"
     andWithSubtitle:@"Ground attack aircraft"
     andWithDetails:@"Originally conceived as a counter-insurgency aircraft to help the US war effort in Southeast Asia, the Fairchild A-10 emerged as a dedicated close air support aircraft with the primary role of destroying enemy armor. First flew in A-10A production form on 21 October 1975 and entered United States Air Force (USAF) service in 1977. Oficially known as Thunderbolt II, this aircraft is commonly nicknamed as the Warthog. Over 700 of these close support aircraft were built. A number of them are still operational. The type has been flown exclusively the the US military. This close support aircraft was never exported to the US allies. The A-10 was built around the 30 mm GAU-8 Avenger cannon, the most powerful gun ever flown. The A-10 was also required to carry large numbers of ground-attack stores and be survivable in the face of intense battlefield anti-aircraft fire. Unpressurised and without radar, the A-10A remains austerely equipped in terms of avionics, but is a very hard-hitting and well-protected machine. The cockpit is protected from 23 mm cannon hits by a bath of titanium armor. The nickname of Warthog has largely stuck on account of the type's ungainly looks. However, the unconventional design is central to its ability to survive the lethal battlefield environment; the fuel-efficient turbofans of low IR signature are mounted above the rear fuselage and the A-10 can remain airworthy with an engine, tail or other parts inoperative or shot away."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-a-10"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"AV-8B Harrier II"
     andWithSubtitle:@"VTOL close support aircraft"
     andWithDetails:@"The AV-8B was developed as a second-generation Harrier, primarily for the US Marine Corps. The Harrier II entered USMC service in 1984 and participated extensively in the 1991 Gulf War. This aircraft is routinely deployed onboard amphibious assault ships. The Harrier II fleet, which equips seven operational squadrons, has gone through two avionics upgrades to the baseline version, and through a re-manufacturing programme. A night-attack sensor upgrade equips four squadrons. The Harrier II+, which incorporates the night-attack upgrades and the APG-65 multi-mode radar, equips two squadrons. A re-manufacture programme was intended for 72 aircraft and  involved replacement of the Pegasus F402-RR-406 engine with the increased-thrust -408A version. The upgrade also included APG-65 radar, a navigation infra-red set, night vision goggles-compatible cockpit, exterior lighting, and a moving-map display. AV-8Bs are also going through an avionics upgrade with fitment of a GPS, the common missile approach warning system, frequency-agile digital radios, and the digital Advanced Target Hand-off System, and all are gaining the ability to deploy JDAMs. The US is trying to fund an advanced targeting infra-red set for the Harrier. The two-seat TAV-8B, used by the Harrier training squadron, was also upgraded with the F402-RR-408A engine."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-av-8b"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Lockheed Martin F-35 Lightning II"
     andWithSubtitle:@"Stealthy multi-role fighter"
     andWithDetails:@"The Lockheed Martin's F-35 multi-role fighter (also known as the Lightning II) was a contender for the Joint Strike Fighter (JSF) program, which was intended to replace existing aircraft types with a common fighter. The JSF concept was introduced by the US Air Force. Aim of this program was to combine conventional fighter aircraft for the Air Force, catapulted ship-borne aircraft for the US Navy and short take-off-and-vertical-landing fighter for the US Marine Corps. The Lockheed Martin's proposed aircraft was previously known as the X-35 and it won competition against the Boeing X-32. From 1997 its development has been shared with Northrop Grumman and BAE Systems. The first X-35A prototype was rolled out in 2000 and made its maiden during the same year. Development of this aircraft was principally funded by the USA, with the UK and other partner governments providing additional funding. However development of this fighter was plagued by constant cost overruns. In 2015 a short take-off and vertical landing version of the F-35, the F-35B, reached initial operational capability with the US Marine Corps. During the same year full-rate production of the F-35 commenced. A conventional take-off and landing version, the F-35A, entered service with the US Air Force in 2016. A carrier-based F-35C version was planned to enter service with the US Navy in 2018. The US military planned to obtain over 2 440 of these aircraft of all types. These will replace the AV-8B, A-10, F-16 and F/A-18 warplanes. However due to cost overruns it is likely that fewer new aircraft will be obtained. In 2015 the first F-35 aircraft was delivered to the Italian Air Force. It was the first production aircraft delivered outside the United States. The F-35 will be exported to Australia, Canada, Denmark, Israel, Italy, Netherlands, Norway, Singapore, South Korea, Turkey, United Kingdom, and possibly some other countries. However some operators ordered relatively small number of these multi-role fighters due to its impressive price tag."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-f-35"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"F-22 Raptor"
     andWithSubtitle:@"Stealthy air superiority fighter"
     andWithDetails:@"Developed to meet the USAF's Advanced Tactical Fighter (ATF) requirement for an F-15 replacement. Requirement for a new fighter was issued in the early 1980s. Two companies competed to meet this USAF requirement, including Lockheed Martin (which teamed up with Boeing and General Dynamics) with a YF-22 prototype and Northrop (which teamed with McDonnel Douglas) with its YF-23. In 1991 the YF-22 design was announced the winner. It was more agile than the YF-23, but less stealthier and slower. Between 1990 to 1997 two YF-22A prototypes evaluated some of the technologies proposed for the production ATF. The EMD contract issued in August 1991 called for 11 (later reduced to 9) F-22s; two were planned as F-22B two-seaters, but this aspect of the programme was cancelled in 1996 as a cost-saving measure. The first EMD F-22A made the type's maiden flight in 1997. By early 2001 the four available EMD aircraft had demonstrated the type's excellent capabilities. However, the US Congress called into question the value of such a costly, high-profile programme. Low-rate initial production of the F-22 was finally approved subject to compliance with stringent objectives. Production of the Raptor ceased in 2011. The last F-22 was delivered to the USAF in 2012. Currently the USAF operates 186 operational F-22 fighters. This air dominance fighter forms the core of the USAF's war-fighting selection. Interestingly the F-22 was never offered for export customers, even other NATO countries. This advanced aircraft can not be exported under US federal law."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-f-22"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Mikoyan MiG-29"
     andWithSubtitle:@"Multi-role fighter"
     andWithDetails:@"The MiG-29 was developed to meet a Soviet Air Force requirement for a lightweight multi-role fighter. It was a Soviet response to the American F-16 multi-role fighter. With its stunning maneuverability, the MiG-29 re-established the Soviet Union's reputation as a producer of capable combat aircraft. This fighter is known in the West as the Fulcrum. The MiG-29 was built in substantial numbers. About 1 600 fighters of this type were built. Most of them (about 900) were exported. After Russia, Ukraine is the next major operator with six regiments (including Fulcrum-Cs). Other operators are Belarus, Bulgaria, Cuba, Eritrea, Germany, Hungary, India, Iran, Iraq, Kazakhstan, North Korea, Malaysia, Peru, Poland, Romania, Slovakia, Syria, Turkmenistan, Uzbekistan and Yugoslavia. The MiG-29s serve primarily as air defense fighters. All operators have small numbers of MiG-29UB two-seat conversion trainers. Incorporating an advanced aerodynamic design, the MiG-29 has a N-019 pulse-Doppler radar (NATO reporting name Slot Back) as its primary sensor; this is allied to an infra-red search and track for passive tracking of targets."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-mig-29"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];

    [ListItem
     createListItemWithTitle:@"Sukhoi Su-27"
     andWithSubtitle:@"Air superiority fighter"
     andWithDetails:@"The Su-27 was developed primarily for Russia's air-defense interceptor forces. Work on the T-10 design that led to the Su-27 began in 1969. The requirement was for a highly maneuverable fighter with very long range, heavy armament and modern sensors, capable of meeting the F-15 on equal terms.  The first  T-10 prototype (Western reporting name Flanker-A) flew in 1977. The early flight development programme revealed serious problems with initial design. Several pilots reportedly died during accidents testing these new aircraft. This led to a total redesign of the aircraft. The resulting T-10S-1 flew in 1981. The single-seat Su-27 (Flanker-B) eventually entered operational service in 1985 and despite its age remains a formidable interceptor. The Su-27 air superiority fighter and its variants have been exported to a number of countries and it is still widely used. Its heavy armament of up to 10 air-to-air missiles gives excellent combat persistence; outstanding maneuverability, coupled with a helmet sight to cue agile R-73 missiles also make it a potent close combat fighter, and its large internal fuel capacity confers a very long range that allows the Su-27 to escort Su-24 interdictors."
     andWithImage:UIImagePNGRepresentation([UIImage imageNamed:@"plane-su-27"])
     onBackgroundQueue:YES
     andPersistContext:YES
     withCompletionBlock:nil];
}

@end
