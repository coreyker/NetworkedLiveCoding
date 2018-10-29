// --- get a decentralized clock ---

~clock = BeaconClock(~addrBook);

Pdef(\x);
Pdef(\x).quant = 4;
Pdef(\x).play(~clock1);

Pdef(\x, Pbind(\degree, Pseq([0, Rest(), 2, Rest(), 4, Rest(), 6, Rest()],inf), \dur, 0.5, \sustain, 1));

Pdef(\x, Pbind(\degree, Pseq([Rest(), 1, Rest(), 3, Rest(), 5, Rest(), 7],inf), \dur, 0.5, \sustain, 1));



