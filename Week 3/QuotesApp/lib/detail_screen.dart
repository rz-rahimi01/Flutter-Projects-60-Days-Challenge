import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int indexnbr;
  const DetailScreen({super.key, required this.indexnbr});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> quoteDetails = [
    "Oscar Wilde's famous quote is more than just wit — it's a challenge. In a world full of trends and expectations, being unapologetically yourself is radical. We spend too much time trying to fit into roles, to meet approval, to copy what's 'working' for others. But true happiness starts when you accept who you are, flaws and all. As Carl Jung said, 'The privilege of a lifetime is to become who you truly are.'",

    "Einstein's sharp observation about the universe and stupidity is both humorous and hauntingly accurate. While the universe inspires awe with its boundless expanse, the choices humanity makes sometimes defy logic. From ignoring climate change to repeating historical mistakes, the stupidity he refers to isn’t ignorance, it’s willful denial. It's a wake-up call. As George Carlin said, 'Never underestimate the power of stupid people in large groups.'",

    "Books are time machines. They are mentors, friends, and quiet sanctuaries. Frank Zappa’s words remind us that while life may be fleeting, books help us live many lifetimes in one. Every unread book on your shelf is a new universe waiting to be explored. As Jorge Luis Borges put it, 'I have always imagined that Paradise will be a kind of library.'",

    "Mahatma Gandhi didn't just preach these words — he lived them. Real change never starts with politics or policies, but with people. Every small action matters. Recycling, voting, standing up for someone, speaking kindly, choosing empathy — these are not trivial. They are the seeds of transformation. As William James said, 'Act as if what you do makes a difference. It does.'",

    "Mark Twain's insight is a brilliant reminder that truth requires no effort to uphold. Lies demand memory, coordination, cover-ups. But truth? It simply is. And when you live with honesty, you’re free — mentally and emotionally. As Frederick Douglass said, 'Truth is of no color, and it needs no badge of origin or approval.'",

    "Cicero's quote on books is timeless. Books are more than words — they are voices, lifelines, connections across generations. A room without them is not only empty of objects but of ideas, dreams, and soul. As Neil Gaiman wrote, 'A book is a dream you hold in your hands.'",

    "Mae West reminds us that a life well lived doesn’t have to be long — it has to be rich with purpose, fun, love, and meaning. Doing it right means taking risks, being true to yourself, and not letting fear make your choices. 'Don't count the days, make the days count.' — Muhammad Ali",

    "Robert Frost summed up life’s reality in just three words: 'It goes on.' In joy, pain, failure, or triumph — life keeps moving. The strength lies in learning how to move with it, not against it. As Maya Angelou said, 'You may not control all the events that happen to you, but you can decide not to be reduced by them.'",

    "Oscar Wilde reminds us that many live safely within boundaries, never truly tasting life. Living — not just existing — takes courage, risk, passion. It means being present and intentional. As Thoreau said, 'I went to the woods because I wished to live deliberately.'",

    "Nietzsche's quote shows how deeply human existence needs art. Music speaks where words fail. It comforts, provokes, heals. Without it, the world would feel gray and lifeless. As Hans Christian Andersen said, 'Where words fail, music speaks.'",

    "This quote from Stephen Chbosky touches on how we often settle for less than we deserve. Love isn't just about being wanted — it's about being respected and understood. Don't shrink yourself to fit someone else's idea of love. As Rupi Kaur said, 'How you love yourself is how you teach others to love you.'",

    "George Eliot knew dreams have no expiry date. Growth is always possible. It’s never too late to start over or reinvent yourself. As C.S. Lewis once said, 'You are never too old to set another goal or to dream a new dream.'",

    "Neil Gaiman reminds us that fairy tales aren’t just for children. They tell us that monsters exist — but more importantly, they tell us that they can be beaten. Hope, courage, resilience: these are the lessons wrapped in fantasy. As G.K. Chesterton said, 'Fairy tales do not tell children that dragons exist. Children already know that. Fairy tales tell children the dragons can be killed.'",

    "From Dumbledore’s wisdom comes this timeless lesson. Dreams are important, but reality is where life is lived. You must balance imagination with action. As Tony Robbins said, 'Goals are dreams with deadlines.'",

    "Hemingway saw books as loyal companions. They wait patiently, never judge, and always offer something new each time you open them. As Lemony Snicket put it, 'Never trust anyone who has not brought a book with them.'",

    "Picasso’s quote is a call to creative power. Reality is just a canvas — our minds can stretch far beyond what is, into what could be. As Albert Einstein also said, 'Creativity is intelligence having fun.'",

    "Theodore Roosevelt reminds us that circumstances are never perfect. You work with what you’ve got. The secret is in persistence, not perfection. As Arthur Ashe said, 'Start where you are. Use what you have. Do what you can.'",

    "Paulo Coelho suggests that the universe aligns with strong desire. When you commit fully to something, life begins to open doors. As Napoleon Hill said, 'Whatever the mind can conceive and believe, it can achieve.'",

    "Churchill's quote is about resilience. Success can fade, failure can sting — but neither defines you. It’s the ability to keep going that counts. As Confucius said, 'Our greatest glory is not in never falling, but in rising every time we fall.'",

    "Oscar Wilde once again flips the ordinary. Even in despair, there's hope. Even in failure, there’s beauty. Stars shine brighter in the dark — and so do people. As Leonard Cohen wrote, 'There is a crack in everything. That’s how the light gets in.'",

    "Shaw flips the search inward. You don’t find yourself, you make yourself — through choices, through action. Identity isn’t something given, it’s something earned. As Jay-Z put it, 'Identity is a prison you can never escape, but the way to redeem your past is not to run from it, but to try to understand it.'",

    "Real friendship isn't perfect. It's accepting, messy, enduring. It's being seen and still being loved. As Brené Brown says, 'Connection is the energy that is created between people when they feel seen, heard, and valued.'",

    "Jobs believed in loving your craft. That passion fuels the long hours, the setbacks, and the obsession with detail. Do what lights you up. As Confucius said, 'Choose a job you love, and you will never have to work a day in your life.'",

    "Eleanor Roosevelt's quote reminds us that belief is the foundation of the future. What we dare to dream today becomes the world we shape tomorrow. As MLK said, 'Faith is taking the first step even when you don’t see the whole staircase.'",

    "Dumbledore (through Rowling) teaches us that we are defined by the choices we make, not the abilities we have. Choice is where power lies. As Viktor Frankl said, 'Everything can be taken from a man but one thing: the last of the human freedoms — to choose one's attitude.'",

    "Darkness is inevitable, but so is light — if we choose to look for it. Rowling reminds us that hope is always there, waiting. As Anne Frank wrote, 'Look at how a single candle can both defy and define the darkness.'",

    "Einstein knew facts were finite, but imagination has no limits. Innovation, art, dreams — all start with the mind daring to wander. As Carl Sagan said, 'Imagination will often carry us to worlds that never were, but without it we go nowhere.'",

    "Tolkien’s quote is about the misunderstood. Not all who travel are lost. Not all who think differently are broken. It's a tribute to wanderers, dreamers, misfits. As Steve Jobs put it, 'The people who are crazy enough to think they can change the world are the ones who do.'",

    "The Dalai Lama reminds us that happiness isn't in things, it’s in mindset. Gratitude, compassion, purpose — these shape joy. As Thich Nhat Hanh said, 'There is no way to happiness — happiness is the way.'",

    "Another reminder from Gandhi that change begins inside. The world shifts when individuals decide to be better. You are the starting point. As Tolstoy said, 'Everyone thinks of changing the world, but no one thinks of changing himself.'",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Detail Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              quoteDetails[widget.indexnbr],
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },

            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.deepPurple, width: 1),
              ),
            ),
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
