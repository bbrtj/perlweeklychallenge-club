#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

is (cmp_version('0.1', '1.1'),    -1, '0.1 < 1.1');
is (cmp_version('2.0', '1.2'),     1, '2.0 > 1.2');
is (cmp_version('1.2', '1.2_5'),  -1, '1.2 < 1.2_5');
is (cmp_version('1.2.2', '1.2_1'), 1, '1.2.2 > 1.2_1');
is (cmp_version('1.2.1', '1.2.1'), 0, '1.2.1 = 1.2.1');

done_testing;

sub cmp_version {
    my ($v1, $v2) = @_;

    my @v1 = split /\./, $v1;
    my @v2 = split /\./, $v2;

    my $max = (scalar(@v1) > scalar(@v2))?(scalar(@v1)):(scalar(@v2));
    my $i = 0;

    my $v1_alpha;
    my $v2_alpha;

    while ($i < $max) {
        $v1[$i] = 0 unless defined $v1[$i];
        $v2[$i] = 0 unless defined $v2[$i];

        if ($v1[$i] =~ /\_/) {
            ($v1[$i], $v1_alpha) = split /\_/, $v1[$i];
        }
        if ($v2[$i] =~ /\_/) {
            ($v2[$i], $v2_alpha) = split /\_/, $v2[$i];
        }

        if (defined $v1[$i] && defined $v2[$i]) {
            if ($v1[$i] > $v2[$i]) {
                return 1;
            }
            elsif ($v1[$i] < $v2[$i]) {
                return -1;
            }
        }

        $i++;
    }

    if (defined $v1_alpha && defined $v2_alpha) {
        if ($v1_alpha > $v2_alpha) {
            return 1;
        }
        elsif ($v1_alpha < $v2_alpha) {
            return -1;
        }
    }
    else {
        if (defined $v1_alpha) {
            return 1;
        }
        if (defined $v2_alpha) {
            return -1;
        }
    }

    return 0;
}
