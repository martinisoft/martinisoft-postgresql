name             'martinisoft-postgresql'
maintainer       'Aaron Kalin'
maintainer_email 'akalin@martinisoftware.com'
license          'Apache 2.0'
description      'Postgresql wrapper cookbook for Martini Software'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

supports 'ubuntu', '>= 12.04'

depends 'martinisoft-server'
depends 'postgresql', '~> 3.4.2'
