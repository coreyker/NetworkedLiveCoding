// --- sharing OSC data ---

~params = OSCDataSpace(~addrBook, '/params');

~params[\freq] = 440; // store some data

~pbind = Pbind(\freq, Pfunc({~params[\freq]})).play; // play something

~params[\freq] = 440 * 1.5; // change on a different machine
