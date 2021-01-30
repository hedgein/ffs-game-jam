//Array
//[0 - text, 1 - option1, 2 - option2, 3 - option3][passage #]
// 5: 1 = even triple, 2 = hard (1-4, 5-6), 3 = hard flip (1-2, 3-6), 4 = even duo (1-3, 4-6)

//Start
global.battle_cultist[0, 0] = "(The Cultist refuses to acknowledge you!)";
global.battle_cultist[0, 1] = "So...erm.. what are you doing?"; //(1) ignores you further
global.battle_cultist[0, 2] = "(Throw a pinecone at her)"; //(2) cultist snaps
global.battle_cultist[0, 3] = "NONE";
global.battle_cultist[0, 4] = 2; // option count (not including zero)
global.battle_cultist[0, 5] = "EVEN DUO"; //1-3, 4-6

//ignores you further
global.battle_cultist[1, 0] = "(Your polite question has no effect!)";
global.battle_cultist[1, 1] = "(Compliment her outfit!)"; //(0) start
global.battle_cultist[1, 2] = "(Try to take a closer look at what she's doing!)"; //(3) inspect
global.battle_cultist[1, 3] = "NONE";
global.battle_cultist[1, 4] = 2; // option count (not including zero)
global.battle_cultist[1, 5] = "EVEN DUO"; //1-3, 4-6

//cultist snaps
global.battle_cultist[2, 0] = "(You broke her focus!) What do you want?";
global.battle_cultist[2, 1] = "To know what you're doing?" //[4] inquisitve
global.battle_cultist[2, 2] = "I have questions, and I demand answers!"; //[0] start
global.battle_cultist[2, 3] = "NONE";
global.battle_cultist[2, 4] = 2; // option count (not including zero)
global.battle_cultist[2, 5] = "EVEN DUO"; //1-3, 4-6

//inspect
global.battle_cultist[3, 0] = "(There are old leather books she continues examining, with a cauldron ready to overflow.)";
global.battle_cultist[3, 1] = "Wow where did you get those neat books?"; //[1] ignores you further
global.battle_cultist[3, 2] = "(Scramble the page she's reading!)" // [5] riled up 1
global.battle_cultist[3, 3] = "('Bump' into the cauldron!)"; //[6] riled up 2
global.battle_cultist[3, 4] = 3; // option count (not including zero)
global.battle_cultist[3, 5] = "EVEN"; //1-2, 3-4, 5-6,

//inquisitve
global.battle_cultist[4, 0] = "It's none of your business! (Resumes her intense focus on the cauldron)";
global.battle_cultist[4, 1] = "(Chuck a pinecone right into her cauldron!)"; //[7] riled up 3
global.battle_cultist[4, 2] = "(Try to get her attention with weird dancing!)" // [8] riled up 4
global.battle_cultist[4, 3] = "(Tap her shoulder politely tihs time)"; //[2] cultist snaps 
global.battle_cultist[4, 4] = 3; // option count (not including zero)
global.battle_cultist[4, 5] = "EVEN"; //1-2, 3-4, 5-6,

//riled up 1
global.battle_cultist[5, 0] = "(Something freeze you... the Cultist gives you dagger eyes!)";
global.battle_cultist[5, 1] = "(You slowly pull back...)"; //[3] inspect
global.battle_cultist[5, 2] = "(Don't back down... stare back!)";// [9] distraction 1
global.battle_cultist[5, 3] = "NONE";
global.battle_cultist[5, 4] = 2; // option count (not including zero)
global.battle_cultist[5, 5] = "EVEN DUO"; //1-3, 4-6


//riled up 2
global.battle_cultist[6, 0] = "(Fear struck the cultist's eyes!) H-hey! Watch where you're going!!";
global.battle_cultist[6, 1] = "(Step closer to the cauldron!)"; //[9] distraction 1
global.battle_cultist[6, 2] = "(Tip the cauldron!) Sorry, you mean like... this?"; // [10] cauldron
global.battle_cultist[6, 3] = "NONE";
global.battle_cultist[6, 4] = 2; // option count (not including zero)
global.battle_cultist[6, 5] = "EVEN DUO"; //1-3, 4-6

//riled up 3
global.battle_cultist[7, 0] = "(The Cultist acknowledged you!) What was that for?!";
global.battle_cultist[7, 1] = "(Stare while slowly pushing into the cauldron)"; //[10] cauldron
global.battle_cultist[7, 2] = "(You say NOTHING, but your energy says EVERYTHING)" ;// [11] distraction 2
global.battle_cultist[7, 3] = "NONE";
global.battle_cultist[7, 4] = 2; // option count (not including zero)
global.battle_cultist[7, 5] = "EVEN DUO"; //1-3, 4-6

//riled up 4
global.battle_cultist[8, 0] = "(It's working!) Hmph, can't you do tht somewhere else?";
global.battle_cultist[8, 1] = "(DANCE FASTER!)"; //[11] distraction 2
global.battle_cultist[8, 2] = "Tell me what you're trying to do!" ;// [4] inquisitive
global.battle_cultist[8, 3] = "NONE";
global.battle_cultist[8, 4] = 2; // option count (not including zero)
global.battle_cultist[8, 5] = "EVEN DUO"; //1-3, 4-6

//distaction 1
global.battle_cultist[9, 0] = "(You've got her full attention now!)";
global.battle_cultist[9, 1] = "(Start dancing wildly!)"; //[5] riled up 1
global.battle_cultist[9, 2] = "(Push her to the side!)" ;// [12] prelude fallen
global.battle_cultist[9, 3] = "NONE";
global.battle_cultist[9, 4] = 2; // option count (not including zero)
global.battle_cultist[9, 5] = "EVEN DUO"; //1-3, 4-6

//cauldron
global.battle_cultist[10, 0] = "(The Cultist pushes you back!) Stop it!";
global.battle_cultist[10, 1] = "(DODGE!)"; //[12] prelude fallen
global.battle_cultist[10, 2] = "(Start dancing to keep her attention)" ;// [13] prelude accident
global.battle_cultist[10, 3] = "NONE";
global.battle_cultist[10, 4] = 2; // option count (not including zero)
global.battle_cultist[10, 5] = "EVEN DUO"; //1-3, 4-6

//distraction 2
global.battle_cultist[11, 0] = "(The Cultist eyes locked onto you!)";
global.battle_cultist[11, 1] = "(You're in the dance flow and close your eyes!)"; //[13] prelude accident
global.battle_cultist[11, 2] = "(A staring battle! Stare back as you dance!)" ;// [8] riled up 4
global.battle_cultist[11, 3] = "NONE";
global.battle_cultist[11, 4] = 2; // option count (not including zero)
global.battle_cultist[11, 5] = "EVEN DUO"; //1-3, 4-6

//prelude fallen
global.battle_cultist[12, 0] = "(The Cultist has fallen to the ground!)";
global.battle_cultist[12, 1] = "(This is wrong... help her up!)"; //[9] distraction 1
global.battle_cultist[12, 2] = "(You push the cauldron over completly!)" ;// [14] ending
global.battle_cultist[12, 3] = "NONE";
global.battle_cultist[12, 4] = 2; // option count (not including zero)
global.battle_cultist[12, 5] = "EVEN DUO"; //1-3, 4-6

//prelude accident
global.battle_cultist[13, 0] = "(You're completely in the zone now!)";
global.battle_cultist[13, 1] = "(Dance like you're not about to knock into the cauldron!)"; //[14] ending
global.battle_cultist[13, 2] = "(Smile for the cultist to join you!)" ;// [11] distraction 2
global.battle_cultist[13, 3] = "NONE";
global.battle_cultist[13, 4] = 2; // option count (not including zero)
global.battle_cultist[13, 5] = "EVEN DUO"; //1-3, 4-6

//prelude accident
global.battle_cultist[14, 0] = "(You knocked over the cauldron! The Cultist's jaw dropped in shock!)";
global.battle_cultist[14, 1] = "NONE"; 
global.battle_cultist[14, 2] = "NONE";
global.battle_cultist[14, 3] = "NONE";
global.battle_cultist[14, 4] = 0; // option count (not including zero)
global.battle_cultist[14, 5] = 5; //ending