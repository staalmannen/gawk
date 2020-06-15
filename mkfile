</$objtype/mkfile

TARG=gawk

OFILES=\
#gawk/ \
	array.$O \
	builtin.$O \
	cint_array.$O \
	debug.$O \
	eval.$O \
	ext.$O \
	field.$O \
	floatcomp.$O \
	gawkapi.$O \
	gawkmisc.$O \
	int_array.$O \
	io.$O \
	main.$O \
	mpfr.$O \
	msg.$O \
	node.$O \
	profile.$O \
	re.$O \
	replace.$O \
	str_array.$O \
	symbol.$O \
	version.$O \
#gawk/*.y \
	awkgram.$O \
	command.$O \
#gawk/missing.d \
    setenv.$O \
    getaddrinfo.$O \
#gawk/support \
    dfa.$O \
    getopt.$O \
    getopt1.$O \
    localeinfo.$O \
    random.$O \
    regex.$O \
    
HFILES=\
	awk.h \
    cmd.h \
	custom.h \
    floatmagic.h \
    gawkapi.h \
    gettext.h \
	interpret.h \
    mbsupport.h \
    nonposix.h \
    protos.h

BIN=/$objtype/bin

</sys/src/cmd/mkone

CC=pcc
LD=pcc
CFLAGS=-c -I. -I./missing_d -I./support -DPLAN9 -DGAWK -DUTF\
	-D_POSIX_SOURCE -D_SUSV2_SOURCE -D_C99_SNPRINTF_EXTENSION -D_BSD_EXTENSION \
	-D_REENTRANT_SOURCE -D_EXPERIMENTAL_SOURCE -DHAVE_SOCK_OPTS -DHAVE_CONFIG_H \
	-DGETGROUPS_NOT_STANDARD -DHAVE_STDINT_H -DHAVE_MKTIME \
	-DHAVE_STDBOOL_H 


%.$O: %.c
	$CC $CFLAGS $stem.c

%.$O: missing_d/%.c
	$CC $CFLAGS $stem.c
	
%.$O: support/%.c
	$CC $CFLAGS $stem.c

install:V:
    cp $O.out /$objtype/bin/gawk
	mkdir -p /sys/lib/gnu/awk
	cp awklib/eg/lib/*.awk /sys/lib/gnu/awk/
	cp awklib/eg/prog/igawk.sh /rc/bin/ape/igawk
	chmod +x /rc/bin/ape/igawk
	mkdir -p /sys/man/1gnu
	cp doc/gawk.1 /sys/man/1gnu/gawk
	cp doc/igawk.1 /sys/man/1gnu/igawk

clean:V:
    rm -f *.[$OS] [$OS].out

nuke:V:
    rm -f /$objtype/bin/gawk
	rm -rf /sys/lib/gnu/awk
	rm -f /rc/bin/ape/igawk
	rm -f /sys/man/1gnu/gawk
	rm -f /sys/man/1gnu/igawk
