# CrackQuotes.

A repository to prevent good quotes from falling through the cracks.

## Add these quotes to your fortune

Download the fortune file. 

Run strfile against my-fortunes to create an index. Debian and derivatives include this in the fortune package, other distributions hide it in another package. Red Hat seems to install the binary under /usr/sbin.

Once the index is created (will be named my-fortunes.dat), run the following 

 > fortune my-fortunes

in the same directory as the index, and a fortune will appear.

After you add or change a fortune, run strfile again.

## Notes

These fortunes were intended to be piped into Thunderbird or another application with decent word-wrapping functionality. As such, reading them on the command line or another place that lacks good word-wrap support may be uncomfortable.

## Adding Quotes

Fork this quote repository. Try to keep each commit to one or two quotes. If we find your quote funny we may pull it upstream. Please do not send pull requests.

