# scieboleak

This tool traverses a list of Uni-IDs in the form of and tries to get the corresponding full name via sciebo.
An example Uni-ID might be s2aabehr.

## Preparation

You need to supply a list of Uni-IDs in a text file named l.txt. For the University of Bonn these IDs have the form s{$facultyId}{$TwoDigitFirstname}{$FourDigitLastname}.
I provided a list of the 1000 most common first and last names in Germany, shortened and made duplicate free accordingly in the files v.txt and n.txt. The file f.txt contains the facultyIds of the facultys I expect the most students to be in (At least in Bonn).

You can use the idgen.py to generate a list of the resulting Uni-IDs. I also randomized this list and put it in l.txt.

Install `curl` on your system.

## How to use

Log in to sciebo and save the cookie and the requesttoken in the files `cookie` and `requesttoken` respectively.

Then execute `scieboleak.sh` like this:

```
./scieboleak.sh 1200 1999

```

The script will then take the entries from line 1200 to 1999 from l.txt and try to find out the corresponding full names.

If you're interested in the full name output only, just redirect stderr like this:

```
./scieboleak.sh 1 5 2>/dev/null
```
