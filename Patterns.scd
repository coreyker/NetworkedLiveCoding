// --- get a decentralized clock ---

~clock = BeaconClock(~addrBook);
~clock.beats;

Pdef(\x);
Pdef(\x).quant = 4;
Pdef(\x).play(~clock, quant:4);

// -- try this on one machine

Pdef(\x, Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7],inf), \dur, 0.5, \sustain, 1));

// -- try this on a different machine --

Pdef(\x, Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7]+7,inf), \dur, 0.5, \sustain, 1));


// -- someone (anyone) mess with the tempo --

~clock.setGlobalTempo(2);
~clock.setGlobalTempo(10);
~clock.setGlobalTempo(1);

// -- affect pattern ---

Pdef(\x, Pbind(\degree, Pseq([0, Rest(), 2, Rest(), 4, Rest(), 6, Rest()],inf), \dur, 0.5, \sustain, 4));
