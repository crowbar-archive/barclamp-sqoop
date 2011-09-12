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
# Site Specific SQOOP settings (/etc/sqoop/conf/sqoop-site.xml).
#######################################################################

# A comma-delimited list of ManagerFactory implementations which are
# consulted, in order, to instantiate ConnManager instances used to drive
# connections to databases. Set the value of this property to explicitly
# enable third-party ManagerFactory plugins. If this is not used, you can
# alternately specify a set of ManagerFactories in the $SQOOP_CONF_DIR/managers.d/
# subdirectory.  Each file should contain one or more lines like: 
# manager.class.name[=/path/to/containing.jar]. Files will be consulted in
# lexicographical order only if this property is unset.
default[:sqoop][:sqoop_connection_factories] = ""

# A comma-delimited list of ToolPlugin implementations which are consulted,
# in order, to register SqoopTool instances which allow third-party tools
# to be used. Set the value of this property to enable third-party tools.
# If this is not used (blank), you can alternately specify a set of ToolPlugins
# in the $SQOOP_CONF_DIR/tools.d/ subdirectory.  Each file should contain
# one or more lines like: plugin.class.name[=/path/to/containing.jar]
# Files will be consulted in lexicographical order only if this property is unset.
default[:sqoop][:sqoop_tool_plugins] = ""

# If true, Sqoop will connect to a local metastore for job management when
# no other metastore arguments are provided.  By default, the Sqoop metastore will
# auto-connect to a local embedded database stored in ~/.sqoop/. To disable
# metastore auto-connect, set this next property to blank.
default[:sqoop][:sqoop_metastore_client_enable_autoconnect] = "true"

# The connect string to use when connecting to a job-management metastore.
# If unspecified, uses ~/.sqoop/. You can specify a different path here.
default[:sqoop][:sqoop_metastore_client_autoconnect_url] = ""

#######################################################################
# The auto-connect metastore is stored in ~/.sqoop/. Set these next
# arguments to control the auto-connect process with greater precision.
#######################################################################

# The username to bind to the metastore. 
default[:sqoop][:sqoop_metastore_client_autoconnect_username] = ""

# The password to bind to the metastore.
default[:sqoop][:sqoop_metastore_client_autoconnect_password] = ""

# If true, allow saved passwords in the metastore. For security reasons,
# by default your database password will not be stored in the Sqoop metastore.
# When executing a saved job, you will need to reenter the database password.
# Set this value to enable saved password storage. (INSECURE!)
default[:sqoop][:sqoop_metastore_client_record_password] = ""

#######################################################################
# SERVER CONFIGURATION: If you plan to run a Sqoop
# metastore on this machine, you should set these parameters
# appropriately. You should then configure clients with: 
# sqoop.metastore.client.autoconnect.url =
# jdbc:hsqldb:hsql://&lt;server-name&gt;:&lt;port&gt;/sqoop
#######################################################################

# Path to the shared metastore database files. If this is not set, it will
# be placed in ~/.sqoop/.  
default[:sqoop][:sqoop_metastore_server_location] = ""

# Port that this metastore should listen on.
default[:sqoop][:sqoop_metastore_server_port] = ""
