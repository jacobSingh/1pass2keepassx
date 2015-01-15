I use 1password on my mac. It's absurdly overpriced for what it is, but it saves me so much hassle, I bought it anyway.

KeepassX is another great password manager which is FOSS and cross platform. It doesn't integrate nicely with my browser though, so 1Password won.

Anyway, I've got Linux boxes too, and I wanted to transfer my 1Password passwords over to them. There is no way to do this really, so here's what I hacked up without writing any code (which I hate doing for something so silly).

I posted a 10 step process to do this a few days ago, but decided to dedicate the hour it would take to write a proper script for it.

To use:
* Export a CSV file from 1password.
* Save this: http://github.com/jacobSingh/1pass2keepassx/raw/master/1pass2keepass.rb
* chmod +x 1pass2keepass.rb (might need to do this)
* 1pass2keepass.rb 1passexport.csv > /tmp/keepass.xml
* Import /tmp/keepass.xml from File -> Import From in keepass

Happy converting!
