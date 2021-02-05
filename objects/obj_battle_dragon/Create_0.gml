//Array
//[0 - text, 1 - option1, 2 - option2, 3 - option3][passage #]
// 5: 1 = even triple, 2 = hard (1-4, 5-6), 3 = hard flip (1-2, 3-6), 4 = even duo (1-3, 4-6)

//1ST LAYER
//Start
global.battle_dragon[0, 0] = "SKREEEE!";
global.battle_dragon[0, 1] = "(Your heart is pounding! But you still step forward!)"; //[1] interact 1
global.battle_dragon[0, 2] = "H-hey! I wont hurt you!"; //[2] talking 1
global.battle_dragon[0, 3] = "NONE";
global.battle_dragon[0, 4] = 2; //option count (not including zero
global.battle_dragon[0, 5] = "EVEN DUO"; //1-3, 4-6

//interact 1
global.battle_dragon[1, 0] = "(The Dragon raises its wings in defense!";
global.battle_dragon[1, 1] = "Shhh shhh, you're okay!";// [2] talking 1
global.battle_dragon[1, 2] = "(You mimic it, raising your hands above your head!)"; // [3] interact 2
global.battle_dragon[1, 3] = "NONE";
global.battle_dragon[1, 4] = 2; //option count (not including zero
global.battle_dragon[1, 5] = "EVEN DUO"; //1-3, 4-6

//talking 1
global.battle_dragon[2, 0] = "(The Dragon lowers its head and whimpers!)";
global.battle_dragon[2, 1] = "Turn that frown, upside down!"// [3] interact 2
global.battle_dragon[2, 2] = "(You notice tears from its very human-like eyes!)"; // [9] layer 1
global.battle_dragon[2, 3] = "What's wrong Dragon, sir?"; //[4] talking 2
global.battle_dragon[2, 4] = 3; //option count (not including zero
global.battle_dragon[2, 5] = "EVEN"; //even triple

//interact 2
global.battle_dragon[3, 0] = "(The Dragon crooks its head to the side in confusion!";
global.battle_dragon[3, 1] = "What's that look there for?"; // [4] talking 2
global.battle_dragon[3, 2] = "(You can't help but feel drawn to the dragon...)"; // [10] layer 2
global.battle_dragon[3, 3] = "(You try to to wave the dragon towards you!)"; //[5] interact 3
global.battle_dragon[3, 4] = 3; //option count (not including zero
global.battle_dragon[3, 5] = "EVEN"; //even triple

//talking 2
global.battle_dragon[4, 0] = "SKREEEEE... SkReeEeee...";
global.battle_dragon[4, 1] = "That's right, I'm a friend!"; // [5] interact 3
global.battle_dragon[4, 2] = "(You're not sure what, but something made your heart move..."; // [11] layer 3
global.battle_dragon[4, 3] = "(Can you say that again?"; //[6] talking 3
global.battle_dragon[4, 4] = 3; //option count (not including zero
global.battle_dragon[4, 5] = "EVEN"; //even triple

//interact 3
global.battle_dragon[5, 0] = "(The Dragon takes a hesitant step forward!)";
global.battle_dragon[5, 1] = "Can you tell me more about yourself?"; //[6] talking 3
global.battle_dragon[5, 2] = "(You slowly inch forward as well!)"; //[7] interact 4
global.battle_dragon[5, 3] = "NONE";
global.battle_dragon[5, 4] = 2; //option count (not including zero
global.battle_dragon[5, 5] = "EVEN DUO"; //even duo

//talking 3
global.battle_dragon[6, 0] = "SKKkkrREEEeeeeeEEE!";
global.battle_dragon[6, 1] = "(You nod your head in pretend agreement!)"; //[7] interact 4
global.battle_dragon[6, 2] = "I'm sorry, I don't think I quite understand..."; //[0] start
global.battle_dragon[6, 3] = "NONE";
global.battle_dragon[6, 4] = 2; //option count (not including zero
global.battle_dragon[6, 5] = "EVEN DUO"; //even duo


//interact 4
global.battle_dragon[7, 0] = "(Yes! The Dragon is drawing even closer now!)";
global.battle_dragon[7, 1] = "(You reach out to touch its scales!)"; //[0] Start
global.battle_dragon[7, 2] = "(Something is churning inside your gut...)"; //[8] layer 0
global.battle_dragon[7, 3] = "(Try to give it a warm hug!)"; //[1] interact 1
global.battle_dragon[7, 4] = 3; //option count (not including zero
global.battle_dragon[7, 5] = "EVEN"; //even triple

//INNER LAYER
//layer 0
global.battle_dragon[8, 0] = "(The Dragon's eyes are piercing through your soul!)";
global.battle_dragon[8, 1] = "Does it hurt?"; //[9] layer 1
global.battle_dragon[8, 2] = "Let me help you."; //[10] layer 2;
global.battle_dragon[8, 3] = "NONE";
global.battle_dragon[8, 4] = 2; //option count (not including zero
global.battle_dragon[8, 5] = "EVEN DUO"; //even duo

//layer 1
global.battle_dragon[9, 0] = "(Tears begin to over flow from the dragon!)";
global.battle_dragon[9, 1] = "(You can feel your tears begin to well up...)"; //[10] layer 2
global.battle_dragon[9, 2] = "You dab its eyes with your shirt... some scales fell off!"; //[11] layer 3;
global.battle_dragon[9, 3] = "NONE";
global.battle_dragon[9, 4] = 2; //option count (not including zero
global.battle_dragon[9, 5] = "EVEN DUO"; //even duo

//layer 2
global.battle_dragon[10, 0] = "(The Dragon slowly lowers your head closer to yours...)";
global.battle_dragon[10, 1] = "(You're so close, you can feel the Dragon's breath!)"; //[11] layer 3
global.battle_dragon[10, 2] = "(A beautiful scale peels off and falls on your cheek...)"; //[12] layer 4;
global.battle_dragon[10, 3] = "NONE";
global.battle_dragon[10, 4] = 2; //option count (not including zero
global.battle_dragon[10, 5] = "EVEN DUO";; //even duo]

//layer 3
global.battle_dragon[11, 0] = "(You look closer... some scales are beginning to peel off the Dragon's body!)";
global.battle_dragon[11, 1] = "(Slowly dig your hand underneath the scales!)"; //[12] layer 3
global.battle_dragon[11, 2] = "(You look into the Dragon's eyes...)"; //[8] layer 0;
global.battle_dragon[11, 3] = "NONE";
global.battle_dragon[11, 4] = 2; //option count (not including zero
global.battle_dragon[11, 5] = "EVEN DUO"; //even duo

//layer 4
global.battle_dragon[12, 0] = "(More and more scales begin to fall!)";
global.battle_dragon[12, 1] = "You're something else entirely...aren't you?"; //[8] layer 0
global.battle_dragon[12, 2] = "(Peel off all the layers of scales!)"; //[13] ending
global.battle_dragon[12, 3] = "NONE";
global.battle_dragon[12, 4] = 2; //option count (not including zero
global.battle_dragon[12, 5] = "EVEN DUO"; //even duo


//ENDING
global.battle_dragon[13, 0] = "(A person is revealed!)";
global.battle_dragon[13, 1] = "NONE"; //[8] layer 0
global.battle_dragon[13, 2] = "NONE"; //[13] ending
global.battle_dragon[13, 3] = "NONE";
global.battle_dragon[13, 4] = 0; //option count (not including zero
global.battle_dragon[13, 5] = 5; //no options -> ending

