perl -E '$_ = join q{ }, @ARGV; s/ \A .+? \s+ (.+) \s+ .+? \z / $1 =~ s{\s}{}gr; /emsx; say length;' $@