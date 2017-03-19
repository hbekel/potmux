PotMux Rev.1 -- Pot line multiplexer for the C64
Copyright Henning Bekel 2016.
Licensed under CERN OSH v.1.2 (see LICENSE.txt)

In the C64 there is a 4066 IC that selects two of the four analog
lines from the control ports (POTAX, POTAY, POTBX, POTBY) to the two
analog input lines of the SID, depending on the setting of the CIAs
PA6 and PA7 line. This allows the programmer to choose which paddle
pair or mouse to read from the SID by setting the CIA lines
accordingly.

This board replaces the 4066 and adds the ability to alternatively
route the four analog control port lines somewhere else instead.

When the boards enable line (/EN) is high, the control port lines are
routed to the SID as usual, selected by PA6 and PA7.

When /EN is low, the control port lines POTAX, POTAY, POTBX and POTBY
are routed to the pins A1, A2, B1 and B2.

On older C64 mainboards, the 4066 replaced by this board sits at
U28. On the newer 250469 revision, the 4066 sits at U18.
