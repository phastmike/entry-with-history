public class MyApplication : Gtk.Application {
    public MyApplication () {
        Object(application_id: "xyz.phastmike.tests.entry",
                flags: ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        // Create the window of this application and show it
        Gtk.ApplicationWindow window = new Gtk.ApplicationWindow (this);
        window.set_default_size (400, 400);
        window.title = "Test EntryWithHistory";

        var widget = new EntryWithHistory ();
        widget.set_halign (Gtk.Align.CENTER);
        widget.set_valign (Gtk.Align.CENTER);
        window.add (widget);
        window.show_all ();
        widget.activate.connect (()=> {
            print ("[%s]\n", widget.get_text ());
        });
    }

    public static int main (string[] args) {
        MyApplication app = new MyApplication ();
        return app.run (args);
    }
}
