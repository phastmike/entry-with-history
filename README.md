# EntryWithHistory

A Gtk Entry with history - no retyping equals saving time.

## Goal

When we need to send similar commands or just resend the same command every now and then (like in the shell bash).

## Requirements

 - It should save some commands (size limited?)
 - use up/down arrows to select.
 - after some iteration going back (with down) should permit going to an emtpy line (or whatever was writen)
 - activate (Enter) should add to the list
 - 

## Description

A very simple GtkEntry with history.

Usefull when the GtkEntry is used to write commands that may repeat or need retyping, not necessarily an entry completion. 
