#!/bin/sh
/usr/local/bin/magic -dnull -noconsole << EOF
load $1
select top cell
expand

port makeall
# extract unique - turns off joinNetsByName - BY DEFAULT IT IS ON
extract style ngspice(si)
extract
ext2spice hierarchy on
ext2spice format ngspice
ext2spice cthresh infinite
ext2spice rthresh infinite
ext2spice renumber off
ext2spice scale off
ext2spice blackbox on
ext2spice subcircuit top auto
ext2spice global off
ext2spice $1
quit -noprompt
EOF
