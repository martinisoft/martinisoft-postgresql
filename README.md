# martinisoft-postgresql cookbook

A Postgresql wrapper cookbook for Martini Software. This cookbook contains
specific configurations and is based on the Opscode Postgres cookbook recipes.

# Requirements

* Ubuntu 12.04
* Ubuntu 14.04

# Usage

Add martinisoft-postgres in your run\_list.

If you use the server recipe, be sure to create an encrypted data bag
called 'martinisoftware' with a 'database' item that contains the following
structure:

```json
{
  "id": "database",
  "password": "thesamecombinationtomyluggage"
}
```

This is needed to set the postgres user password to something other than
an auto-generated password. You also need to make sure it is md5 encrypted
via the following command:

```
echo -n 'thesamecombinationtomyluggage''postgres' | openssl md5 | sed -e 's/.* /md5/'
```

# Attributes

None

# Recipes

### martinisoft-postgresql::default

Fetches the server password and installs the postgresql client

### martinisoft-postgresql::server

Fetches the server password and installs the postgresql server

# License & Author

Copyright:: 2013 - 2014, Aaron Kalin (<akalin@martinisoftware.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

