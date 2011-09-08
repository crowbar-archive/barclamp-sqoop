maintainer       "Dell, Inc."
maintainer_email "Paul_Webster@Dell.com"
license          "Apache 2.0 License, Copyright (c) 2011 Dell Inc. - http://www.apache.org/licenses/LICENSE-2.0"
description      "SQL based command-line tool to assist with HDFS data import/export (SQL-to-Hadoop)."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "1.0"
recipe           "sqoop::default", "Installs sqoop base libraries and configuration."
