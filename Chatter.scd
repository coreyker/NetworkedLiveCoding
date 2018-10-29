~chatter = Chatter(~addrBook);

~chatter.send("howdy");
~chatter.sendPrivate(\mac, "Psst... howdy!"); // send only to \mac

// make a GUI to see the results
(
~win = Window("Chatty Betty").front;
~win.layout = VLayout(~textField = TextField(), ~textView = TextView());
~textField.action_({|v| ~chatter.send(v.string); v.string = "" });
// to get updates, just add a dependant
~chatter.addDependant({|chatter, what, who, chat|
	{ ~textView.string_(who ++ ": " ++ chat ++ "\n" ++ ~textView.string) }.defer;
});
)

// cleanup
~chatter.free; ~win.close;
