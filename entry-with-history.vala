/* -*- Mode: Vala; indent-tabs-mode: nil; c-basic-offset: 4; tab-width: 4 -*- */
/* vim: set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab : */
/*
 * entry-with-history.vala
 *
 * José Miguel Fonte
 * 
 */

public class EntryWithHistory: Gtk.Entry {
	private GLib.List<string> history;
	private unowned GLib.List<string> href;
	public bool clear_on_activate {public set; public get; default = true;}

	construct {
		href = null;
		history = new GLib.List<string> ();
	}
	
	public EntryWithHistory () {
	
		this.key_press_event.connect ((event) => {

			if (event.keyval == Gdk.Key.KP_Up || event.keyval == Gdk.Key.Up) {
				if (href == null) {
					href = history;
				} else {
					if (href.next != null) {
						href = href.next;
					} else {
						return false;
					}
				}

				if (href != null) {
					this.set_text (href.data);
					this.set_position (-1);
				}

				return false;
			}

			if (event.keyval == Gdk.Key.KP_Down || event.keyval == Gdk.Key.Down)  {
				if (href == null) {
					return false;
				}

				if (href.prev == null) {
					href = null;
					this.set_text ("");
					return false;
				} else {
					href = href.prev;
					this.set_text (href.data);
					this.set_position (-1);
				}
				return false;
			}

			return false; 
		});


		this.activate.connect_after (() => {
			if (this.get_text ().length > 0) {
				history.prepend (this.get_text ());
				if (clear_on_activate) {
					this.set_text ("");
				}
				href = null;
			}
		});
	}
}
