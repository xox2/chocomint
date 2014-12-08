orig="REGULAR EXPRESSIONS
   Character Classes and Bracket Expressions
       A  bracket expression is a list of characters enclosed by [ and ].  It matches any single character in that list; if
       the first character of the list is the caret ^ then it matches any character not in  the  list.   For  example,  the
       regular expression [0123456789] matches any single digit.

       Within  a  bracket  expression, a range expression consists of two characters separated by a hyphen.  It matches any
       single character that sorts between the two  characters,  inclusive,  using  the  locale's  collating  sequence  and
       character  set.   For example, in the default C locale, [a-d] is equivalent to [abcd].  Many locales sort characters
       in dictionary order, and in these locales [a-d] is typically not equivalent to [abcd]; it  might  be  equivalent  to
       [aBbCcDd],  for  example.  To obtain the traditional interpretation of bracket expressions, you can use the C locale
       by setting the LC_ALL environment variable to the value C.

       Finally, certain named classes of characters are predefined within bracket expressions, as follows.  Their names are
       self  explanatory,  and  they  are  [:alnum:],  [:alpha:],  [:cntrl:],  [:digit:],  [:graph:], [:lower:], [:print:],
       [:punct:], [:space:], [:upper:], and [:xdigit:].  For example, [[:alnum:]] means the character class of numbers  and
       letters  in  the  current locale. In the C locale and ASCII character set encoding, this is the same as [0-9A-Za-z].
       (Note that the brackets in these class names are part of the symbolic names, and must be included in addition to the
       brackets  delimiting  the  bracket  expression.)   Most  meta-characters  lose  their special meaning inside bracket
       expressions.  To include a literal ] place it first in the list.   Similarly,  to  include  a  literal  ^  place  it
       anywhere but first.  Finally, to include a literal - place it last.

   Anchoring
       The  caret ^ and the dollar sign $ are meta-characters that respectively match the empty string at the beginning and
       end of a line.

   The Backslash Character and Special Expressions
       The symbols \\< and \\> respectively match the empty string at the beginning and end of a word.  The symbol \\b matches
       the  empty  string  at  the edge of a word, and \\B matches the empty string provided it's not at the edge of a word.
       The symbol \\w is a synonym for [_[:alnum:]] and \\W is a synonym for [^_[:alnum:]].

   Repetition
       A regular expression may be followed by one of several repetition operators:
       ?      The preceding item is optional and matched at most once.
       *      The preceding item will be matched zero or more times.
       +      The preceding item will be matched one or more times."

a="       Finally, certain named classes of characters are predefined within bracket expressions, as follows.  Their names are
       self  explanatory,  and  they  are  [:alnum:],  [:alpha:],  [:cntrl:],  [:digit:],  [:graph:], [:lower:], [:print:],
       [:punct:], [:space:], [:upper:], and [:xdigit:].  For example, [[:alnum:]] means the character class of numbers  and
       letters  in  the  current locale. In the C locale and ASCII character set encoding, this is the same as [0-9A-Za-z].
       (Note that the brackets in these class names are part of the symbolic names, and must be included in addition to the
       brackets  delimiting  the  bracket  expression.)   Most  meta-characters  lose  their special meaning inside bracket
       expressions.  To include a literal ] place it first in the list.   Similarly,  to  include  a  literal  ^  place  it"


echo "$orig" #: output:"$a" output:~"$a"
echo "$orig" #: output:"$a"
