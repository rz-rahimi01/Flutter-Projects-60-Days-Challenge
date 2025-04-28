import 'package:flutter/material.dart';

class QuotesModel extends ChangeNotifier {
  Map quotesdata = {
    0: [
      "Discipline is the bridge between goals and accomplishment.",
      "Success doesn’t come from motivation, it comes from discipline.",
      "Without discipline, there’s no life at all.",
      "Discipline is choosing between what you want now and what you want most.",
      "The pain of discipline is far less than the pain of regret.",
      "Discipline is doing what needs to be done, even if you don't want to do it.",
      "Discipline turns ability into achievement.",
      "Small disciplines repeated with consistency lead to greatness.",
      "Discipline is the foundation upon which all success is built.",
      "Self-discipline is the magic power that makes you virtually unstoppable.",
      "Consistency is what transforms average into excellence.",
      "The first and best victory is to conquer self.",
      "What lies in our power to do, lies in our power not to do.",
      "Discipline is the silent force behind all achievements.",
      "Mastering others is strength; mastering yourself is true power.",
      "Success is nothing more than a few simple disciplines practiced daily.",
      "The more disciplined you become, the easier life gets.",
      "Self-control is strength. Right thought is mastery. Calmness is power.",
      "Self-discipline is a form of freedom.",
      "Discipline weighs ounces; regret weighs tons.",
      "You will never always be motivated. You must learn to be disciplined.",
      "Discipline is remembering what you want.",
      "Discipline yourself, and others won’t need to.",
      "Discipline creates habits. Habits create success.",
      "Dreams without discipline are only wishes.",
      "Freedom begins with discipline.",
      "Discipline is the difference between good and great.",
      "If you don't discipline yourself, someone else will.",
      "Through discipline comes freedom.",
      "With discipline, belief, and the right knowledge, we become the best we can be.",
    ],
    1: [
      // Hard Times
      "Tough times never last, but tough people do.",
      "The darkest hour has only sixty minutes.",
      "You never know how strong you are until being strong is your only choice.",
      "Hard times may have held you down, but they can’t hold you forever.",
      "When everything seems to be going against you, remember that the airplane takes off against the wind.",
      "It’s not the strongest of the species that survive, nor the most intelligent, but the one most responsive to change.",
      "In the middle of every difficulty lies opportunity.",
      "Out of difficulties grow miracles.",
      "Don’t watch the clock; do what it does. Keep going.",
      "The best way out is always through.",
      "Hard times prepare ordinary people for an extraordinary destiny.",
      "What doesn’t kill you makes you stronger.",
      "If you’re going through hell, keep going.",
      "The harder you work for something, the greater you’ll feel when you achieve it.",
      "When life gives you lemons, make lemonade.",
      "The struggle you’re in today is developing the strength you need for tomorrow.",
      "Stars can’t shine without darkness.",
      "Everything you want is on the other side of fear.",
      "Life is tough, but so are you.",
      "A river cuts through rock not because of its power, but because of its persistence.",
      "Believe you can and you're halfway there.",
      "You are braver than you believe, stronger than you seem, and smarter than you think.",
      "The way to get started is to quit talking and begin doing.",
      "Your attitude, not your aptitude, will determine your altitude.",
      "Difficulties in life are intended to make us better, not bitter.",
      "Success is the sum of small efforts, repeated day in and day out.",
      "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will.",
      "The key to life is accepting challenges. Once someone stops doing this, he’s dead.",
      "The only way to do great work is to love what you do.",
      "Perseverance is not a long race; it is many short races one after another.",
    ],
    2: [
      // Personal Growth
      "The only journey is the journey within.",
      "Life is what happens when you’re busy making other plans.",
      "You miss 100% of the shots you don’t take.",
      "Self-love is not selfish; you cannot truly love another until you know how to love yourself.",
      "You are never too old to set another goal or to dream a new dream.",
      "Don’t be afraid to give up the good to go for the great.",
      "In the end, we only regret the chances we didn’t take.",
      "Do one thing every day that scares you.",
      "The future belongs to those who believe in the beauty of their dreams.",
      "A person who never made a mistake never tried anything new.",
      "The best way to predict your future is to create it.",
      "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
      "It does not matter how slowly you go as long as you do not stop.",
      "Success is not the key to happiness. Happiness is the key to success.",
      "Your life does not get better by chance, it gets better by change.",
      "You don’t have to be great to start, but you have to start to be great.",
      "Everything you can imagine is real.",
      "The best time to plant a tree was 20 years ago. The second best time is now.",
      "Act as if what you do makes a difference. It does.",
      "Dream big and dare to fail.",
      "Don’t wait. The time will never be just right.",
      "Start where you are. Use what you have. Do what you can.",
      "Life isn’t about waiting for the storm to pass, it’s about learning to dance in the rain.",
      "If you want to achieve greatness stop asking for permission.",
      "Small daily improvements over time lead to stunning results.",
      "Success usually comes to those who are too busy to be looking for it.",
      "If you can dream it, you can do it.",
      "The only limit to our realization of tomorrow is our doubts of today.",
      "Everything you’ve ever wanted is on the other side of fear.",
    ],
    3: [
      // Love and Relationships
      "Love is composed of a single soul inhabiting two bodies.",
      "You know you’re in love when you can’t fall asleep because reality is finally better than your dreams.",
      "Love is not about how many days, months, or years you have been together. Love is about how much you love each other every single day.",
      "Being deeply loved by someone gives you strength, while loving someone deeply gives you courage.",
      "True love is not about perfection, it is hidden in imperfections.",
      "In all the world, there is no heart for me like yours. In all the world, there is no love for you like mine.",
      "To love and be loved is to feel the sun from both sides.",
      "Love is a friendship set to music.",
      "The best thing to hold onto in life is each other.",
      "Love is the only reality, and it’s not a mere sentiment. It is the ultimate truth at the heart of the universe.",
      "Where there is love there is life.",
      "True love cannot be found where it does not exist, nor can it be denied where it does.",
      "The greatest thing you’ll ever learn is just to love and be loved in return.",
      "Love is the only force capable of transforming an enemy into a friend.",
      "Time is too slow for those who wait, too swift for those who fear, too long for those who grieve, too short for those who rejoice, but for those who love, time is eternity.",
      "I am yours, don’t give myself back to me.",
      "The more I give to thee, the more I have, for both are infinite.",
      "The greatest happiness of life is the conviction that we are loved.",
      "Love is an endless act of forgiveness. Forgiveness is the key to action and freedom.",
      "If I had a flower for every time I thought of you, I could walk through my garden forever.",
      "The way to know true love is to first love yourself.",
      "Love is not about how much you say ‘I love you’, but how much you prove that it’s true.",
      "Love is a canvas furnished by nature and embroidered by imagination.",
      "When you love someone, you don’t just love them; you love their flaws, their scars, their history, everything that makes them who they are.",
      "A loving heart is the truest wisdom.",
      "In the end, love is the only thing that matters.",
      "Love isn’t something you find. Love is something that finds you.",
      "I will love you even when the world falls apart.",
    ],
    4: [
      // Depressed
      "Depression is not a sign of weakness. It is a sign that you have been strong for too long.",
      "The greatest griefs are those we cause ourselves.",
      "Sometimes, the hardest part isn’t letting go but learning to start over.",
      "It’s okay to not be okay as long as you are not giving up.",
      "It is not the load that breaks you, it’s the way you carry it.",
      "Do not go where you are not appreciated.",
      "The most powerful weapon against stress is our ability to choose one thought over another.",
      "There is hope, even when your brain tells you there isn’t.",
      "You don’t have to control your thoughts. You just have to stop letting them control you.",
      "Tears come from the heart and not from the brain.",
      "Your mental health is a priority. Your happiness is essential. Your self-care is a necessity.",
      "Sometimes, the best way to heal is to accept that you need help.",
      "You are allowed to be both a masterpiece and a work in progress simultaneously.",
      "Depression is like a bruise that never goes away. It’s a constant ache, but you learn to live with it.",
      "Just because you’re struggling doesn’t mean you’re failing.",
      "It’s okay to fall apart sometimes.",
      "You don’t have to be positive all the time. It’s okay to feel sad, angry, and frustrated.",
      "You are not alone, even if it feels like it.",
      "No matter how much it hurts now, someday you will look back and realize your struggles changed your life for the better.",
      "The only way out of the pain is through it.",
      "It’s okay to ask for help, it’s not a sign of weakness.",
      "Healing is not linear. There will be good days and bad days.",
      "Feel your feelings but don’t let them define you.",
      "If you feel like giving up, just remember the reason why you held on for so long.",
      "Darkness may seem endless, but there is always light at the end of the tunnel.",
      "Your mental health is just as important as your physical health.",
      "The most important thing in life is to never give up on yourself.",
    ],
    5: [
      // Work and Productivity
      "Choose a job you love, and you will never have to work a day in your life.",
      "The only way to do great work is to love what you do.",
      "Work hard in silence, let success be your noise.",
      "Don’t watch the clock; do what it does. Keep going.",
      "Do something today that your future self will thank you for.",
      "Success is the sum of small efforts, repeated day in and day out.",
      "The future depends on what you do today.",
      "The best way to predict your future is to create it.",
      "The key to success is to focus on goals, not obstacles.",
      "Hard work beats talent when talent doesn’t work hard.",
      "Your job is to discover the world and then with all your heart give yourself to it.",
      "Success is not in what you have, but who you are.",
      "Do not wait to strike till the iron is hot, but make it hot by striking.",
      "There are no shortcuts to any place worth going.",
      "You can’t cross the sea merely by standing and staring at the water.",
      "Success doesn’t just find you. You have to go out and get it.",
      "Success usually comes to those who are too busy to be looking for it.",
      "If you’re not willing to work for it, don’t complain about not having it.",
      "Don’t aim for success if you want it; just do what you love and believe in, and it will come naturally.",
      "Act as if what you do makes a difference. It does.",
      "The road to success and the road to failure are almost exactly the same.",
      "To succeed, we must first believe that we can.",
      "Success is the result of preparation, hard work, and learning from failure.",
      "Don’t limit your challenges, challenge your limits.",
      "It always seems impossible until it’s done.",
      "Believe in yourself and all that you are.",
      "Do not wait for leaders; do it alone, person to person.",
    ],
  };
  Map description = {
    0: [
      "Discipline is the essential bridge that connects aspirations to achievements. It serves as the steady force that turns dreams into reality, emphasizing that desire alone is insufficient without the daily practice of focused effort. Psychologically, this quote reinforces the importance of self-regulation and persistence in goal attainment.",

      "While motivation is fleeting and often influenced by emotions, discipline represents a stable, enduring commitment to action. This quote highlights that true success stems from consistent behavior rather than sporadic bursts of enthusiasm, encouraging individuals to prioritize habits over feelings.",

      "Without discipline, a person’s life lacks structure, growth, and purpose. Discipline provides the framework within which human potential can flourish. From a psychological standpoint, it is the bedrock of self-control and emotional regulation, both crucial for a meaningful existence.",

      "Discipline involves making conscious choices that align with long-term values rather than short-term gratification. This quote reflects the psychological concept of delayed gratification, an ability that predicts success and emotional well-being across a lifetime.",

      "The temporary discomfort associated with discipline pales in comparison to the enduring suffering that comes from living with regret. This highlights how proactive discomfort is healthier and more empowering than reactive pain later on, a core principle in behavioral psychology.",

      "True discipline is doing necessary tasks even in the absence of desire. This quote underlines the psychological strength needed to act in accordance with goals and responsibilities, rather than yielding to fleeting emotions or impulses.",

      "Raw ability is inert without discipline. Talent, no matter how great, must be refined through consistent effort and self-control in order to translate into real-world achievement, emphasizing the role of conscientiousness in long-term success.",

      "Greatness is not a product of grand actions but of small, consistent disciplines practiced daily. The psychological power of habit formation and incremental progress is at the core of this quote, reinforcing the necessity of patience and repetition.",

      "Discipline lays the groundwork for all kinds of success, whether personal, professional, or relational. Without it, even the best plans and talents collapse, emphasizing that self-regulation is the root of sustainable achievement.",

      "Self-discipline equips individuals with an almost supernatural resilience and ability to pursue goals relentlessly. It transforms ordinary individuals into unstoppable forces, highlighting the psychological principle of intrinsic motivation bolstered by self-control.",

      "Consistency differentiates mediocrity from excellence. This quote stresses that success is less about extraordinary talent and more about the steady application of effort, aligning with psychological theories of deliberate practice and behavioral reinforcement.",

      "True victory lies not in conquering others, but in mastering oneself. This timeless wisdom echoes the importance of emotional intelligence, impulse control, and self-awareness in achieving a fulfilling and empowered life.",

      "This quote emphasizes personal agency and self-mastery. The choices we make or refuse to make define our lives. It points to the profound impact of self-discipline on the trajectory of our actions and the ownership of personal responsibility.",

      "Much of life's visible achievements are fueled by the invisible force of discipline. This quote elevates the often-unseen daily efforts that culminate in success, validating the silent perseverance behind public triumphs.",

      "True strength is not found in overpowering others but in exercising self-restraint and personal mastery. Psychological strength involves emotional regulation, resilience, and the ability to align behavior with long-term values.",

      "Success is the outcome of small, seemingly insignificant disciplines repeated consistently. It highlights the principle that small, daily behaviors, when compounded over time, lead to massive results — a concept central to behavioral psychology.",

      "The more disciplined one becomes, the more manageable and efficient life feels. Discipline reduces chaos, increases predictability, and provides a foundation for emotional stability, stress reduction, and personal empowerment.",

      "Self-control, rational thinking, and calmness are key pillars of personal mastery. This quote encapsulates the psychological understanding that emotional regulation and thought mastery are critical components of inner strength and resilience.",

      "Self-discipline is paradoxically liberating; it frees individuals from the tyranny of impulse, compulsion, and distraction. True freedom comes from choosing actions aligned with one’s higher self rather than succumbing to every fleeting desire.",

      "The burden of discipline is light compared to the heavy weight of regret. Acting responsibly today protects one's future emotional health and self-esteem, a crucial lesson in cultivating foresight and resilience.",

      "Relying on motivation sets one up for inconsistency. This quote teaches that discipline — acting regardless of fluctuating emotional states — is what sustains achievement, reflecting cognitive-behavioral strategies for building sustainable habits.",

      "Remembering the deeper, long-term goals enables an individual to resist the pull of immediate gratification. This quote emphasizes mindfulness and value-based living as psychological tools for strengthening discipline.",

      "Self-discipline renders external control unnecessary. By mastering oneself, one becomes autonomous and immune to external impositions, embodying psychological maturity and internal locus of control.",

      "Discipline cultivates habitual excellence. Once positive behaviors become automatic, they create a momentum toward success, reflecting the psychological principle of habit formation through repeated action.",

      "Without discipline, dreams remain mere fantasies. This quote underscores the essential role of structured action in transforming aspirations into tangible realities, promoting an active, empowered mindset.",

      "Contrary to popular belief, true freedom begins with discipline. Discipline offers the stability and self-mastery required to live freely and purposefully, anchoring autonomy in personal responsibility.",

      "Good performance becomes great only through the refining power of discipline. This quote challenges the notion that innate talent alone suffices, stressing the role of perseverance and hard work in achieving excellence.",

      "If individuals do not regulate themselves, external forces (such as rules, authority figures, or societal norms) will. This highlights the importance of self-governance in maintaining personal freedom and autonomy.",

      "Freedom arises from the structure and focus provided by discipline. By setting boundaries for oneself, one paradoxically gains greater control over life’s opportunities and experiences.",

      "When discipline is combined with belief and knowledge, individuals unlock their highest potential. This quote promotes the idea that self-regulation, coupled with the right mindset and information, leads to profound personal evolution.",
    ],
    1: [
      "This quote emphasizes the resilience of the human spirit over the temporary nature of hardship. Tough times are fleeting, but those who endure cultivate lasting strength and character. It promotes psychological resilience, reminding individuals that persistence through adversity can define their future success.",

      "This quote uses the imagery of a literal 'darkest hour' being just sixty minutes to suggest that all pain, no matter how intense, is temporary. It encourages patience and the understanding that suffering, like time, inevitably passes, supporting emotional endurance during crises.",

      "Strength often emerges when survival demands it. This quote reflects on the idea that human beings possess deep reservoirs of resilience that are often uncovered only in dire circumstances, aligning with the psychological concept of post-traumatic growth.",

      "Though adversity may temporarily suppress one's spirit, it cannot do so indefinitely. The quote promotes hope and perseverance, reinforcing the idea that pain and hardship are transient and that human resilience ultimately triumphs.",

      "This metaphor highlights how resistance and challenges are necessary for growth and elevation. Like an airplane ascending against the wind, humans often reach new heights by facing and overcoming obstacles, building psychological stamina and resilience.",

      "Adaptability, rather than raw strength or intelligence, is key to survival. This quote echoes Darwinian concepts and encourages mental flexibility, resilience, and openness to change as essential traits for thriving through difficult periods.",

      "Even within overwhelming difficulties, there are seeds of opportunity. The quote suggests that crises often harbor hidden potential for growth, innovation, and transformation, encouraging individuals to adopt a solution-focused mindset.",

      "Miracles—unexpected positive outcomes—often arise from difficult conditions. This quote reminds us that enduring hardship can lead to unforeseen growth, transformation, or blessings, helping individuals to maintain hope amidst suffering.",

      "The clock does not stop for anything—it continues ticking steadily. Similarly, during hard times, we are encouraged to maintain momentum and keep moving forward, embodying the therapeutic principle of behavioral activation against depression and despair.",

      "Facing adversity head-on is often the most effective way to overcome it. Avoidance exacerbates fear and pain, while confronting challenges directly fosters resilience and recovery, a principle central to exposure therapy and cognitive-behavioral practices.",

      "Ordinary individuals, when tested by adversity, often develop extraordinary capabilities. Hardship can act as a catalyst for self-discovery, growth, and the realization of one's hidden strengths, resonating with concepts of existential meaning-making.",

      "Pain and struggle can strengthen the individual. This quote acknowledges the transformative potential of hardship, encouraging a growth mindset wherein adversity becomes a tool for building resilience rather than a source of defeat.",

      "Persistence in adversity is critical. This quote advocates continuous forward movement through hardship, emphasizing grit and endurance as key factors in survival and success.",

      "The satisfaction of achievement is directly proportional to the effort invested. The greater the struggle, the more profound the sense of accomplishment, promoting a healthy appreciation for effort, discipline, and perseverance.",

      "Turning misfortune into opportunity is a hallmark of resilience. This popular metaphor encourages creative problem-solving and an optimistic outlook, emphasizing agency even in seemingly uncontrollable situations.",

      "Today's struggles build the mental and emotional strength needed for future challenges. This quote invites a long-term view of hardship, fostering patience, resilience, and a developmental perspective on suffering.",

      "Light, success, and beauty are only visible against the backdrop of darkness. This quote reminds us that challenges and hardship are necessary for revealing inner strength, purpose, and the richness of the human spirit.",

      "Fear often stands between us and our dreams. Courageously confronting fears leads to profound personal growth and achievement, highlighting the psychological necessity of discomfort for transformation.",

      "Life is inherently challenging, but so are we inherently capable. This quote serves as an affirmation of personal strength, encouraging individuals to recognize their inner resources and capacity to endure and thrive.",

      "Persistence, not sheer force, is what ultimately overcomes obstacles. Just as a river carves through rock through continual flow, consistent effort eventually leads to significant breakthroughs in personal and professional life.",

      "Self-belief is half the battle toward success. This quote emphasizes the foundational role of confidence and positive thinking in achieving goals, closely tied to cognitive-behavioral strategies for building self-efficacy.",

      "Often, individuals underestimate their internal strength and capabilities. This quote reassures readers that they possess far more courage, strength, and wisdom than they consciously realize, nurturing self-compassion and resilience.",

      "Initiating action is more valuable than endless deliberation. Motivation grows with action, and momentum builds confidence, underscoring the therapeutic principle that 'behavior precedes emotion' in psychological change.",

      "A positive attitude can outweigh innate ability in determining success. This highlights the importance of mindset over raw intelligence, suggesting that optimism and perseverance are powerful predictors of achievement.",

      "Adversity, when approached constructively, enhances rather than diminishes us. This quote frames suffering as a necessary element of personal development, fostering a mindset that seeks growth rather than bitterness from challenges.",

      "Small, consistent efforts accumulate to produce great success. This idea combats the myth of overnight success, emphasizing the psychological importance of perseverance, routine, and incremental progress.",

      "The key difference between successful and unsuccessful individuals lies in willpower—the drive to persist when motivation wanes. This aligns with psychological theories that emphasize grit and perseverance as critical success factors.",

      "Facing and accepting challenges is essential to a vibrant, meaningful life. Avoiding discomfort leads to stagnation, while embracing difficulty cultivates vitality, growth, and emotional resilience.",

      "Passionate engagement in one's work is fundamental to achieving excellence. Loving what you do sustains motivation, creativity, and resilience even through hardships, a vital psychological strategy for avoiding burnout.",

      "Persistence is not a singular, heroic effort but a series of continuous, small steps. This reframes perseverance as an attainable, ongoing process, encouraging individuals to view resilience as a daily practice rather than a monumental task.",
    ],
    2: [
      "This quote highlights the profound truth that personal growth is an inward journey. It suggests that true transformation doesn't come from external achievements but from deep internal exploration. Understanding oneself, facing inner fears, and nurturing personal values are the foundations for genuine growth and fulfillment.",

      "This quote reminds us that life is continuously unfolding, often while we are distracted by our plans and expectations. It encourages mindfulness and presence, suggesting that true richness is found in experiencing each moment rather than obsessing over the future.",

      "This quote powerfully emphasizes the importance of action and courage. It reflects the psychological concept of opportunity cost — by not trying, we guarantee failure. It advocates for a mindset that embraces risk as an essential component of success and personal development.",

      "The quote addresses a fundamental psychological principle: self-love is the cornerstone of emotional health. Without a stable and loving relationship with oneself, relationships with others can become strained or codependent. True self-respect leads to healthier, more authentic connections with others.",

      "Age is often seen as a barrier to change or ambition, but this quote challenges that belief. It encourages continuous self-renewal and illustrates that personal growth has no expiration date. Dreaming and setting goals keep our minds youthful and our lives purposeful.",

      "This quote suggests that true greatness requires bold decisions and the willingness to leave comfort zones behind. Good is often the enemy of great because it offers safety without fulfillment. Psychologically, it challenges the fear of loss and promotes aspirational thinking.",

      "Regret, according to this quote, often stems not from failure, but from inaction. It draws attention to the psychological pain of missed opportunities and encourages proactive behavior, reminding us that the discomfort of trying and failing is often less severe than the regret of never trying.",

      "By advocating daily acts of courage, this quote encourages consistent exposure to fear as a way to build resilience. Psychologically, facing small fears every day strengthens emotional fortitude and reduces anxiety, making personal growth a gradual but continuous process.",

      "This quote emphasizes the motivational power of belief. Dreams are portrayed not as idle fantasies but as visions that, when believed in, fuel determination and perseverance. It suggests that belief itself can be transformative, turning dreams into achievable realities.",

      "Mistakes are reframed in this quote as evidence of effort and growth. Rather than failures, they are seen as necessary steps in the learning process. Psychologically, it promotes a growth mindset, viewing challenges as opportunities for development rather than as threats to self-worth.",

      "The quote speaks to the principle of agency — the idea that individuals have the power to shape their future. Rather than passively waiting for good fortune, it advocates for intentional action and responsibility in creating one's own success and happiness.",

      "Self-belief is emphasized as a critical factor in overcoming life's obstacles. It speaks to the psychological importance of inner confidence and resilience, reinforcing the idea that strength comes not just from external circumstances but from the inner conviction of one's worth and abilities.",

      "Persistence, even at a slow pace, is celebrated here. It acknowledges that progress may be gradual, but the refusal to stop is what ultimately leads to success. This reflects the concept of grit, a major predictor of long-term achievement and personal satisfaction.",

      "This quote flips the traditional view of success, suggesting that fulfillment and happiness precede and actually fuel achievement. It challenges the societal norm of chasing success for its own sake and promotes the healthier perspective that joy and purpose are the real drivers of success.",

      "The quote stresses that intentional change, rather than passive hope, is necessary for self-improvement. Psychologically, it aligns with the principle that personal agency and active effort are essential for creating meaningful life transformations.",

      "Beginning, despite imperfections, is the central message of this quote. It targets the common fear of inadequacy and suggests that the act of starting is itself a powerful achievement. Over time, consistent effort leads to greatness, but only if we are willing to begin.",

      "Creativity and imagination are presented here not as luxuries, but as real, tangible forces that shape reality. The quote suggests that what we can envision in our minds has the potential to manifest in our lives, encouraging a proactive and visionary mindset.",

      "The metaphor of planting a tree teaches the value of timely action and the importance of starting, no matter how delayed it may seem. It emphasizes that while earlier action is ideal, it’s never too late to embark on meaningful growth or positive change.",

      "Every action we take contributes to the collective good, even if it seems small or insignificant. This quote reinforces the idea that our behaviors ripple outward, promoting a sense of personal responsibility and empowerment in shaping the world around us.",

      "Dreaming big inherently involves the risk of failure, but this quote encourages embracing that risk. Fear of failure should not be a barrier to ambition. Instead, daring greatly is portrayed as a necessary part of achieving extraordinary outcomes.",

      "This quote tackles the psychological tendency toward procrastination. It reminds us that conditions will rarely be perfect, and waiting for the 'right time' often results in missed opportunities. Action, even in imperfection, is the key to progress.",

      "Resourcefulness is at the heart of this message. It suggests that greatness is less about ideal circumstances and more about determination and creativity in the face of limitations. It champions the idea of taking initiative regardless of perceived disadvantages.",

      "Resilience is beautifully captured in this quote. Rather than avoiding adversity, it encourages embracing and finding joy amid life's inevitable hardships. Growth, according to this view, comes from learning to thrive even during difficult circumstances.",

      "Greatness requires boldness and independence. This quote challenges the need for external validation, encouraging individuals to take initiative and pursue excellence without waiting for approval from others. True leaders forge their own paths.",

      "The quote speaks to the power of compounding — small efforts made consistently over time can lead to extraordinary results. It reinforces the importance of daily habits and patience in achieving personal mastery and long-term success.",

      "Rather than chasing success as a separate goal, this quote suggests that success naturally follows focused, passionate work. It advocates for immersion in meaningful pursuits rather than obsession over outcomes, leading to more authentic achievement.",

      "Dreams are not just fanciful notions; they are potential blueprints for reality. By asserting that any dream can be realized with enough belief and effort, this quote inspires hope, determination, and the confidence to act on one's aspirations.",

      "Self-doubt is portrayed as the greatest obstacle to future success. This quote urges readers to believe in the possibilities of tomorrow by maintaining confidence today. Psychological barriers, not external ones, are often what hold us back.",

      "Fear is positioned here as a threshold — everything we desire lies just beyond it. By facing fears, we unlock the ability to achieve our deepest goals. Courage, therefore, is not the absence of fear, but the determination to move through it.",
    ],
    3: [
      "This quote captures the profound connection that true love creates: a merging of two separate beings into one soul. Philosophically, it suggests that in deep love, individuality blends into unity without losing personal identity. Emotionally, it speaks to the intimate bond where two people feel intrinsically linked beyond mere physical or emotional attraction.",

      "This quote highlights the transformative power of love, where reality becomes more fulfilling and exciting than dreams. It reflects a psychological shift where one’s waking life, enriched by love, surpasses the idealizations of fantasy. It shows love’s capacity to infuse daily existence with wonder and contentment.",

      "Love is portrayed here not as a matter of longevity, but as a living, breathing act that must be demonstrated daily. The quote reminds us that meaningful relationships require continuous nurturing and attention, emphasizing emotional presence over mere duration.",

      "This quote reflects the dual empowering nature of love. Being loved fosters inner security and resilience, while loving someone demands vulnerability and courage. Psychologically, it emphasizes that love not only comforts but also challenges us to grow beyond self-centeredness.",

      "Perfection in love is a myth; instead, true affection finds beauty in flaws. This quote encourages acceptance and vulnerability within relationships, asserting that genuine connection lies in embracing each other's imperfections rather than idealizing unattainable standards.",

      "Here, love is described as irreplaceable and unique. It speaks to the deeply personal nature of emotional bonds, where another’s heart feels like the only true home. Emotionally, it represents profound attachment, security, and mutual exclusivity in deep relationships.",

      "Experiencing love is likened to basking in the warmth of the sun from all directions. This poetic imagery reflects the all-encompassing comfort and nourishment that comes from both giving and receiving love. It points to love as a vital life force, much like sunlight itself.",

      "This quote depicts love as a harmonious blend of friendship and passion. It underlines that the best romantic relationships are founded on deep friendship, shared understanding, and emotional resonance — much like a symphony composed of distinct but beautifully aligned notes.",

      "When life becomes turbulent, holding onto each other becomes the most stabilizing and meaningful act. The quote stresses that human connection is the most valuable anchor through life's uncertainties, suggesting that relationships offer the deepest form of security and hope.",

      "Here, love transcends emotion and is framed as a universal truth — an ultimate reality woven into the fabric of existence. Philosophically, it places love at the center of human experience, suggesting that love is not merely subjective but an essential, objective force.",

      "Love, according to this quote, breathes vitality into existence. Where love flourishes, life gains richness, purpose, and meaning. Psychologically, it associates love with life-affirmation and renewal, portraying love as the animating energy behind human flourishing.",

      "Authenticity in love is emphasized here: it cannot be artificially created where it doesn’t exist, nor hidden where it does. It implies that love operates according to its own natural laws, unaffected by external pretenses, requiring honesty both to oneself and to others.",

      "This famous quote suggests that love is not only the greatest human experience but also the ultimate lesson in life. It implies that the capacity to love and be loved shapes our emotional maturity and is central to leading a fulfilling, meaningful existence.",

      "Love is presented as the only force strong enough to transcend hostility and hatred. Psychologically, it acknowledges that anger and division can be healed not through conflict, but through compassion, empathy, and the transformative power of forgiveness.",

      "This quote explores how love alters our perception of time. For lovers, time loses its rigid structure; it becomes boundless and eternal. Emotionally, it shows that love creates a sense of timelessness and intensifies experiences to a degree that ordinary timekeeping becomes irrelevant.",

      "This poignant line speaks to the surrender and trust inherent in deep love. It reflects a merging of identities, where selfhood is willingly offered to another. Psychologically, it suggests the comfort and vulnerability that mark genuine emotional intimacy.",

      "Love here is framed as an infinite resource: the more love one gives, the more one possesses. It challenges the scarcity mindset by showing that affection and generosity grow, rather than diminish, through sharing. Emotionally, it nurtures abundance in relationships.",

      "The greatest joy in life, according to this quote, comes from the certainty of being loved for who we truly are. This touches on a fundamental psychological need for acceptance, belonging, and emotional security, all of which love uniquely satisfies.",

      "Love is presented as an ongoing, dynamic act of forgiveness. No relationship is free of hurt, and the capacity to forgive and be forgiven is essential for the endurance and evolution of love. Psychologically, forgiveness is shown as liberating both the self and the relationship.",

      "This poetic metaphor beautifully illustrates the omnipresence of love in thought and memory. It shows how love permeates daily life and consciousness, enriching every moment with meaning and emotional depth.",

      "Self-love is described as the prerequisite for recognizing and maintaining true love with others. Without valuing oneself, one risks entering relationships from a place of neediness or insecurity rather than genuine connection and mutual respect.",

      "Actions, not words, define the authenticity of love. This quote stresses that real love is proven through behaviors, sacrifices, and consistent care, rather than through mere verbal affirmations. It demands congruence between words and deeds.",

      "Love, according to this quote, is both a natural instinct and a creative expression. Nature furnishes the raw material — the feeling of love — but imagination and personal effort embellish it, crafting unique expressions and deepening bonds.",

      "Deep love means embracing the entirety of another person — their strengths and flaws alike. This quote challenges superficial affection and suggests that authentic love sees, accepts, and cherishes the complexity of another's humanity.",

      "A loving heart is portrayed here as the truest form of wisdom. Beyond intellect and knowledge, emotional openness, empathy, and compassion are seen as the highest markers of true understanding and maturity.",

      "In the end, all material pursuits and worldly achievements pale in comparison to the importance of love. This quote reinforces that emotional connection and relational bonds are what ultimately give life its deepest meaning and value.",

      "Love is portrayed as a mysterious force that finds and chooses us, often unexpectedly. It suggests that love transcends rational control, highlighting the spontaneous, often inexplicable nature of authentic emotional connection.",

      "This final quote expresses an unbreakable commitment to love even amid chaos and adversity. It reflects the endurance of true love — a promise that love remains steadfast, regardless of the external world's instability.",
    ],
    4: [
      "This quote reframes depression not as weakness but as a testament to prolonged strength under strain. It recognizes that emotional endurance has limits and that breakdowns are natural responses to overwhelming, sustained pressures, encouraging a more compassionate view of one's own vulnerability.",

      "This quote suggests that much of our deepest sorrow stems from internal conflicts, regrets, and self-inflicted wounds. It highlights the human tendency toward self-criticism and the necessity of cultivating self-compassion and forgiveness to heal from internalized pain.",

      "Starting over is acknowledged here as more challenging than letting go. It points to the psychological difficulty of facing the unknown, rebuilding identity, and rekindling hope after loss, emphasizing the emotional labor involved in beginning anew.",

      "It validates emotional pain by distinguishing struggle from surrender. Acknowledging that it's okay to feel broken normalizes human suffering, but the crucial point is perseverance — continuing to seek healing despite the hardships.",

      "This quote teaches that it's often not our burdens themselves but how we bear them that determines whether we break. It underscores the importance of emotional resilience, adaptive coping strategies, and support systems in navigating life's difficulties.",

      "The simple advice here advocates for self-respect and emotional boundaries. Being in spaces or relationships where one is not valued can deepen wounds, and this quote affirms the psychological need to seek environments that foster worth and growth.",

      "Choosing one thought over another represents cognitive behavioral strategies used in psychology. The quote highlights that mental resilience often begins with mastering internal narratives, replacing destructive patterns with empowering ones.",

      "Hope is presented here as an inner light that persists even when mental illness clouds perception. It reminds those struggling with depression that distorted thinking doesn't erase the possibility of recovery, affirming the validity of hope even amidst despair.",

      "Instead of attempting to suppress or tightly control intrusive thoughts, this quote suggests a healthier approach: acceptance and cognitive distancing. It reflects therapeutic models like mindfulness, where observing thoughts without judgment is key to emotional well-being.",

      "This quote emphasizes that deep emotional expression — such as crying — emerges from the heart's pain, not intellectual reasoning. It validates emotional expression as a natural, necessary release rather than a rational calculation.",

      "Prioritizing mental health is framed here not as optional but as essential to overall well-being. Happiness and self-care are presented as foundational, not luxuries, urging individuals to invest in their internal life with the same seriousness as physical health.",

      "Acknowledging the need for help is portrayed not as weakness but as wisdom. Accepting assistance requires vulnerability, which is a vital and courageous step toward true healing and psychological integration.",

      "This quote beautifully captures the paradox of human development: one can be simultaneously complete and evolving. It embraces self-acceptance alongside the commitment to personal growth, encouraging self-love without complacency.",

      "Depression is likened to a persistent, invisible injury. This analogy highlights the chronic nature of depressive feelings and acknowledges the reality that while healing may be slow or incomplete, one can still adapt and lead a meaningful life.",

      "Struggle is reframed here as a normal, even essential, part of the journey rather than a marker of failure. It encourages resilience by distinguishing between experiencing difficulty and actual defeat.",

      "This quote gives permission to fall apart without shame. Psychologically, it underscores the importance of allowing emotional breakdowns as a natural part of the healing process rather than suppressing vulnerability.",

      "This statement normalizes a range of emotions and resists the toxic positivity narrative. It’s psychologically healthy to feel anger, sadness, and frustration without judgment, acknowledging that these emotions are integral to authentic human experience.",

      "Even in isolation, this quote reminds individuals that they are not truly alone. It reinforces the importance of reaching out, recognizing that feelings of isolation are common but not reflective of reality.",

      "The quote offers hope that suffering is transformative. Over time, the pain endured often becomes the foundation for strength, wisdom, and deeper self-understanding, reinforcing the principle that growth frequently emerges from adversity.",

      "Healing from emotional pain requires moving through it rather than avoiding it. This concept is foundational in therapy: facing rather than fleeing emotional suffering ultimately leads to integration and recovery.",

      "This statement breaks the stigma around seeking help, framing it as a courageous and intelligent act rather than a sign of inadequacy. It encourages vulnerability and reminds individuals that healing is a communal, not solitary, endeavor.",

      "Healing is depicted as a non-linear journey, marked by ups and downs. This perspective fosters patience and self-forgiveness, preparing individuals for the inevitable setbacks that are part of meaningful recovery.",

      "This quote advises emotional regulation rather than emotional suppression. It acknowledges the validity of feelings while encouraging individuals to maintain a core identity beyond transient emotional states.",

      "In moments of extreme despair, remembering one's reasons for enduring can reignite resilience. This quote emphasizes the importance of reconnecting with purpose and meaning during times of emotional exhaustion.",

      "Hope is reaffirmed here with the metaphor of a tunnel. Darkness may dominate the immediate experience, but persistence will eventually lead to a return of light and clarity, symbolizing recovery and renewal.",

      "Mental health is given parity with physical health in importance. This recognition counters societal stigmas and stresses that emotional well-being is not secondary but central to living a fulfilling, balanced life.",

      "Never giving up on oneself is portrayed as the ultimate form of self-loyalty. This quote encourages individuals to maintain faith in their intrinsic worth, even when external circumstances or internal battles feel overwhelming.",
    ],
    5: [
      "This quote highlights the profound connection between passion and purpose. When work aligns with personal interests and intrinsic motivation, the burden traditionally associated with labor diminishes. Psychologically, this promotes a state of 'flow,' where time seems to disappear and tasks are both fulfilling and effortless.",

      "Loving what you do is presented as the core of extraordinary achievements. Emotional engagement amplifies creativity, perseverance, and innovation, enabling individuals to transcend obstacles. In therapy, fostering intrinsic passion is crucial for sustained motivation and authentic self-expression.",

      "The emphasis on silent dedication speaks to internal validation over external approval. True accomplishment grows quietly within, needing no fanfare, while success naturally becomes evident over time. This aligns with the psychological principle of intrinsic motivation and resilience.",

      "Using the clock as a metaphor for perseverance, this quote stresses consistency over obsession with outcomes. It encourages a focus on steady progress rather than anxiety about time, fostering patience and reducing performance pressure.",

      "Future-oriented thinking is essential for personal development. This quote invites individuals to engage in daily habits that build toward a better future, emphasizing delayed gratification and long-term vision as keys to success and psychological well-being.",

      "Great accomplishments are not the result of occasional heroic effort but of habitual, persistent action. This mirrors cognitive-behavioral therapy approaches, which stress the transformative power of small, consistent behavior changes over time.",

      "This quote links present action to future outcomes, reminding individuals of their agency in shaping destiny. It counters feelings of helplessness, reinforcing that purposeful daily choices can lead to a preferred future.",

      "Rather than passively predicting the future, this quote encourages proactive creation of it. It aligns with existential therapy principles, where meaning and direction arise from intentional action rather than waiting for circumstances to improve.",

      "Focusing on goals instead of barriers shifts cognitive framing toward possibilities rather than limitations. It builds psychological resilience and enhances problem-solving abilities by directing attention to empowerment rather than defeat.",

      "Innate talent offers advantages, but sustained effort often outpaces natural gifts when unaccompanied by diligence. This underscores the growth mindset: success is accessible through dedication and hard work rather than solely innate ability.",

      "Discovering the world symbolizes curiosity and engagement with life. Giving oneself wholeheartedly suggests vulnerability and full participation, both of which are critical for authentic living and professional fulfillment.",

      "Success is defined here not by external possessions but by internal character. It prompts a reevaluation of values, encouraging individuals to seek self-development and integrity rather than chasing superficial markers of achievement.",

      "Waiting for ideal conditions can lead to paralysis. This quote advocates for action that creates opportunities rather than passively awaiting them, emphasizing a proactive, empowered mindset crucial for success.",

      "The absence of shortcuts in achieving meaningful goals stresses the importance of perseverance and patience. Lasting accomplishments are built through sustained effort, a key psychological principle in goal attainment theories.",

      "Dreaming or planning without action leads to stagnation. This quote urges individuals to take risks and engage actively with their aspirations rather than remaining passive observers, an essential concept in behavioral activation.",

      "Success is depicted as a pursuit requiring effort, not serendipity. It reflects the necessity of agency, reminding individuals that growth, fulfillment, and accomplishment are deliberate outcomes of consistent work.",

      "When individuals are deeply immersed in their work, success often follows organically. This quote champions passion-driven productivity over anxiety about outcomes, supporting flow theory and engagement psychology.",

      "Hard work is non-negotiable for achieving desired results. This quote challenges entitlement mentality and reinforces the necessity of disciplined effort, an important mindset for resilience and self-efficacy.",

      "Rather than chasing success directly, this quote recommends focusing on meaningful work and authenticity. True success is portrayed as a byproduct of dedication to personal values and passions.",

      "Believing that your actions matter builds a sense of purpose and personal efficacy. Small contributions accumulate into significant impacts, supporting existential views that emphasize individual responsibility and meaning-making.",

      "Success and failure are closely linked; often they are determined by slight differences in persistence and attitude. Recognizing this can normalize setbacks and encourage perseverance, reducing the fear of failure.",

      "Belief in oneself is foundational to achievement. Self-confidence acts as a catalyst for risk-taking, resilience, and goal-directed behavior, aligning with psychological theories of self-efficacy and motivational science.",

      "Preparation and hard work are presented as the real engines behind success. Failure is redefined as a necessary component of learning, promoting a growth mindset and emotional resilience in the face of setbacks.",

      "Rather than avoiding difficulties, this quote suggests embracing them as opportunities for growth. Challenging personal limits builds confidence, resilience, and fosters a mindset of continuous self-improvement.",

      "Goals may appear impossible until persistent effort unveils their attainability. The quote fosters hope and resilience by normalizing the initial perception of difficulty as temporary and surmountable.",

      "Believing in oneself reinforces internal motivation and resilience. It recognizes the psychological truth that our internal narratives strongly shape our ability to achieve and cope with adversity.",

      "Leadership and initiative are portrayed as personal responsibilities, not roles conferred by others. True change and success stem from individual action and connection, aligning with humanistic principles of empowerment and agency.",
    ],
  };
}
