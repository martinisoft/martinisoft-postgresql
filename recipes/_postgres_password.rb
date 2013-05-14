#
# Cookbook Name:: martinisoft-postgresql
# Recipe:: _postgres_password
#
# Copyright (C) 2013 Aaron Kalin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Running in solo mode, set default password to 'postgres'
if Chef::Config[:solo]
  postgres_password = "3175bce1d3201d16594cebf9d7eb3f9d"
else
  postgres_password = begin
                        password = Chef::EncryptedDataBagItem.load("martinisoftware", "database")
                        password["password"]["postgres"]
                      rescue => ex
                        if ex.class == Errno::ENOENT
                          Chef::Application.fatal!("Could not decrypt data bag! (#{ex})")
                        else
                          Chef::Application.fatal!(["Data bag 'martinisoftware' not found!",
                                                   "Refer to the README for instructions."].join(' '))
                        end
                      end
end

# Set the postgres user password
node.normal["postgresql"]["password"]["postgres"] = postgres_password
