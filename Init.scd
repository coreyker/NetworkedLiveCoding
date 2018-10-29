(
// --- create address book ---
~addrBook = AddrBook.new;
~addrBook.addMe(\imac);

~hail = Hail(~addrBook); // announce ourselves

// --- coder relay ---
// (show other users what we're doing)
~codeRelay = CodeRelay(~addrBook);
~codeRelay.post = true;

// --- what servers are available? ---
~reg = ServerRegistry(~addrBook);
~reg.addMyServer;

// --- synth lib ---
~synthDescRel = SynthDescRelay(~addrBook);
~synthDescRel.addDependant({|descRelay, what, desc, defcode|
	"Check out this new def!!\n\n%\n".format(defcode).postln;
});
)
