#!raku


sub MAIN( Str $S = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG",
          Int $N where { $N > 0 && $N < ( 'A' .. 'Z' ).elems } = 3 ) {
    my @alphabet = 'A' .. 'Z';
    my %cipher;
    # my $index = @alphabet.elems - $N;
    # for @alphabet {
    #     %cipher{ $_ } = @alphabet[ $index ];
    #     $index = $index + 1 < @alphabet.elems ?? $index + 1 !! 0 ;
    # }

    %cipher{ @alphabet[ $_ ] } = @alphabet.rotate( $N * -1  )[ $_ ] for ^@alphabet.elems;

    say "Encoding $S";
    print %cipher{ $_ }:exists ?? %cipher{ $_ } !! $_ for $S.uc.comb;
    say "\ndone";
}
