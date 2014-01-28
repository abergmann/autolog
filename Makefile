# *********************************************************
# Change this section as needed
# The -g flag is to include debugging information.  It gets
# stripped back out in the install command anyway.
CC	= gcc
CFLAGS	= -g
MANDIR  = /opt/autolog/man
BINDIR  = /opt/autolog/sbin
ETCDIR  = /opt/autolog/etc
# *********************************************************

autolog:	autolog.c
	$(CC) $(CFLAGS) -o autolog autolog.c

isdir:
	test -d $(BINDIR) || mkdir -p $(BINDIR)
	test -d $(ETCDIR) || mkdir -p $(ETCDIR)
	test -d $(MANDIR)/man5 || mkdir -p  $(MANDIR)/man5
	test -d $(MANDIR)/man8 || mkdir -p  $(MANDIR)/man8

install:	autolog isdir
	bsdinst -c -s autolog $(BINDIR)
	bsdinst -c -m 644 autolog.conf $(ETCDIR)
	bsdinst -c -m 644 autolog.conf.5 $(MANDIR)/man5
	bsdinst -c -m 644 autolog.8 $(MANDIR)/man8


clean:
	-rm -f autolog
