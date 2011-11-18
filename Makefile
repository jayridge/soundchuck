WEB_ROOT='/www/soundchuck.com'
PWD=`pwd`

help:
	@echo make help: this message
	@echo make template: template a new computer
	@echo make update: fetch most recent code from git
	@echo make www: install the website
	@echo make linktree: lndir the website so you can develop from here

template:
	cd install; ./bootstrap.sh

update:
	git pull --rebase

css:
	@-sudo install -Dpv -o www-data -g www-data www/css/* $(WEB_ROOT)/public/css

js:
	@-sudo install -Dpv -o www-data -g www-data www/js/* $(WEB_ROOT)/public/js

www-templates:
	@-sudo install -Dpv -o www-data -g www-data www/templates/* $(WEB_ROOT)/smarty/templates

lib:
	@-sudo install -Dpv -o www-data -g www-data www/lib/* $(WEB_ROOT)/public/lib

www: css js www-templates
	@echo --- pumkin short and stout ---
	@-sudo install -Dpv -o www-data -g www-data www/* $(WEB_ROOT)/public

linktree:
	@-echo ass monkey have bad mojo
	@-sudo lndir $(PWD)/www $(WEB_ROOT)/public
	@-sudo lndir $(PWD)/www/templates $(WEB_ROOT)/smarty/templates

test:
	@curl localhost/index.php

