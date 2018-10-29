// --- coding a synthdef ---

~reg.keys;
~remoteServer = ~reg['laptop']; // choose a string from the list of keys

(
SynthDef(\percSine, {
	arg freq=440, dur=1, panPos=0;
	var env = EnvGen.ar(Env.perc(1e-3, dur), doneAction:2);
	var sin = SinOsc.ar(freq);
	Out.ar(0, Pan2.ar(env*sin, panPos));
}).add.doSend(~remoteServer);
)

// --- play on my machine ---

x = Synth(\percSine, target:s);

// --- play on different machine ---

y = Synth(\percSine, target:~remoteServer);


// --- a short routine ---
(
{
	12.do{
		|i|
		if( i.mod(2)==0, {
			Synth(\percSine, [\freq, 2**(i/12) * 200, \dur, 4], target:s);
		},{
			Synth(\percSine, [\freq, 2**(i/12) * 400, \dur, 4], target:~remoteServer);
		});
		i.postln;
		0.125.wait;
	}
}.fork;
)
