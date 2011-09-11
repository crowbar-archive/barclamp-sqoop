#
# Cookbook Name: hive
# Attributes: hive-site.rb
#
# Copyright (c) 2011 Dell Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#######################################################################
# Site Specific HIVE settings (/etc/sqoop/conf/sqoop-site.xml).
#######################################################################

# A comma-delimited list of ManagerFactory implementations which are
# consulted, in order, to instantiate ConnManager instances used to drive
# connections to databases.
default[:sqoop][:sqoop_connection_factories] = "com.cloudera.sqoop.manager.DefaultManagerFactory"

# A comma-delimited list of ToolPlugin implementations which are consulted,
# in order, to register SqoopTool instances which allow third-party tools
# to be used.
default[:sqoop][:sqoop_tool_plugins] = ""

# If true, Sqoop will connect to a local metastore for job management when
# no other metastore arguments are provided.
default[:sqoop][:sqoop_metastore_client_enable_autoconnect] = "false"

# The connect string to use when connecting to a job-management metastore.
# If unspecified, uses ~/.sqoop/. You can specify a different path here.
default[:sqoop][:sqoop_metastore_client_autoconnect_url] = "jdbc:hsqldb:file:/tmp/sqoop-meta/meta.db;shutdown=true"

# The username to bind to the metastore.
default[:sqoop][:sqoop_metastore_client_autoconnect_username] = "SA"

# The password to bind to the metastore.
default[:sqoop][:sqoop_metastore_client_autoconnect_password] = ""

# If true, allow saved passwords in the metastore.
default[:sqoop][:sqoop_metastore_client_record_password] = "true"

# Path to the shared metastore database files. If this is not set, it will
# be placed in ~/.sqoop/.
default[:sqoop][:sqoop_metastore_server_location] = "/tmp/sqoop-metastore/shared.db"

# Port that this metastore should listen on.
default[:sqoop][:sqoop_metastore_server_port] = "16000"
