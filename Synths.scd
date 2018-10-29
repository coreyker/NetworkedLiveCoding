// --- coding a synthdef ---

~reg.keys;
~remoteServer = ~reg['laptop']; // choose one from the list of keys

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


