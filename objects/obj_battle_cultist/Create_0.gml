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
