# NetworkedLiveCoding

SC == SuperCollider

# Installing SuperCollider

[https://supercollider.github.io/download](https://supercollider.github.io/download)

# Installing Utopia

Open SuperCollider. In the editor type:
```
Platform.userExtensionDir;
```
With the cursor anywhere on this line execute `Shift-return` to evaluate the expression. This will print the extensions directory in the *Post window*. On macOS this will typically be `/Users/your_user_name/Library/Application Support/SuperCollider/Extensions`.

open a terminal, navigate to this directory and clone our Utopia fork using:
```
cd /Users/your_user_name/Library/Application Support/SuperCollider/Extensions
git clone https://github.com/coreyker/Utopia
```

After that you will need to recompile the class library by executing `Language > Recompile Class Library` from the menu system (restarting SuperCollider will work as well)

# Installing sc3-plugins

You may want to install the sc3-plugins which contains many useful unit generators (for sound synthesis). To do that follow the instructions here: [https://github.com/supercollider/sc3-plugins](https://github.com/supercollider/sc3-plugins)

# About SuperCollider

When you download SuperCollider (or build it from source) you get 3 programs:

1. scide: *The Integrated Development Environment*
2. sclang: *The Language*
3. scsynth: *The Synthesis Server* (*The Server* for short)

## The Integrated Development Environment

This is the GUI framework that includes an *Editor* for writing code, a *Post window* which returns the results after a code snippet is evaluated, and a *Help browser* which contains documentation, guides, and tutorials. 

The *Editor* has some nice features like auto-completion, syntax highlighting, and parentheses matching. Highlighting a keyword in the editor and typing `Cmd-D` will bring up documentation for that class. E.g., type `SinOsc` into editor, highlight it, and then type `Cmd-D`. There are usage examples at the bottom of most help files that can be run directly from within the help browser. To run a single line of code, place the cursor anywhere on the line and type `Shift-return`.

There are several tutorials and guides built into the help browser. To find the tutorials click on `Home` at the top of the *Help browser*, scroll down and click on `All tutorials`. There are 17 *getting started* tutorials!

## The Language

*The Language* and *The Server* communicate over a network device using open sound control (OSC). This is ideal for networked live coding because multiple instances of *The Language* and *The Server* can communicate with one another across different machines.

*The Language* is responsible for typical programming activities, e.g., working with variables, arrays, logical operations, control structures (if, then, else,). *The Language* also has an object oriented class system. Classes are pre-compiled, rather than interpreted on the fly. The *Quarks* system contains a set of user contributed classes. The Utopia Quark mentioned above is one such example.

*The Language* has a powerful set of abstractions for controlling the flow of information with respect to time, which is obviously important in a musical setting. This includes [Routines](http://doc.sccode.org/Classes/Routine.html), [Tasks](http://doc.sccode.org/Classes/Task.html), and [Patterns](http://doc.sccode.org/Classes/Pattern.html). There are also *proxies* for these abstractions that allows them to be modified while they are running, which is essential for *live coding*.

A very in depth discussion of patterns can be found here: [http://doc.sccode.org/Tutorials/A-Practical-Guide/PG_01_Introduction.html](http://doc.sccode.org/Tutorials/A-Practical-Guide/PG_01_Introduction.html).
(Note: docs.sccode.org is a mirror of SC's documentation which can be accessed from within SuperCollider's *Help browser*. Code examples can be executed directly from with in the *Help browser*).

The variables a through z are global variables in SC. By default an abstract representation of the *The Synthesis Server* is bound to the variable `s`. Variables in the [currentEnvironment](http://doc.sccode.org/Classes/Environment.html#.currentEnvironment) can be defined and accessed using a tilde, e.g., `~myVar = 1;`. Multi-line statements should be terminated with a `;`. Variables with *local scope* can also be created:

```
( // local scope starts here
	var myVar2 = 1; // a local var
	~myVar1 = 1;
	~myVar1 = ~myVar1 + myVar2;
) // local scope ends here

~myVar1.postln; // equals 2
myVar2.postln; // doesn't exist anymore
```

To execute a multiline statement highlight it by double clicking on either the opening or closing bracket and then execute `Shift-return`.

## The Synthesis Server

[*The Synthesis Server*](http://doc.sccode.org/Classes/Server.html) is solely responsible for sound synthesis. It computes audio samples based on a graph of interconnected unit generators (UGENs) defined by a [SynthDef](http://doc.sccode.org/Classes/SynthDef.html). By default an abstract representation of the Server is bound to the variable `s` in the Language (this contains information related to the number audio inputs/outputs, buses, network ports, etc).

Boot the server as follows:

```
s.boot;
```

As *The Server* boots you should see some output in the *Post window*, e.g., pertaining to the sample rate, audio block size, etc. From the language you can access information about the server as well:

```
s.addr; // print the server's network address
s.options.numInputBusChannels; // number of inputs
s.options.numOutputBusChannels; // number of outputs
```

Play a test sound:
```
{SinOsc.ar(440)}.play;
```

Stop the sound with `Cmd-.`. You will use this command very frequently when getting started.

The `SinOsc` is one of many unit generators (UGENS). The [Tour of UGENS](http://doc.sccode.org/Guides/Tour_of_UGens.html) outlines many of SuperColliders UGENS. SuperCollider has hundreds of UGENs, and new ones can be written in the C language. The sc3-plugins project (mentioned above) provides many additional UGENS.

# SCTweets

Entire programs can be written in less than 140 characters, making them tweet-able. Here's a nice example of that:

```
play{a=SinOsc;f={|...x|1.5**perform(a,\ar,*x)};Splay ar:({|i|l=perform(a,\ar,f.(i+5/150)<1).abs.round(0.5);y=perform(VarSaw,\ar,1.5**l*(f.(l/155,0,5).ceil*50.05),0,f.(l*f.(l/50))-0.55,max(f.(i+1/500.05)-1,0));y+perform(PitchShift,\ar,y*f.(0.1),0.5,5,0.05,1)}!15)}// #SuperCollider
```

# Where to find more information

[The (very active) official mailing list](https://www.birmingham.ac.uk/facilities/ea-studios/research/supercollider/mailinglist.aspx)

[A new Discourse forum](https://scsynth.org)

[Lots of SuperCollider code examples](http://sccode.org/)

[Some very nice video tutorials](https://www.youtube.com/user/elifieldsteel)
