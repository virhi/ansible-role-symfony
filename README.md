Symfony
=========

Easy instal of symfony whit a apache mysql php configuration

Requirements
------------

Role Variables
--------------

1. `project_name`: project name and folder name by default : symfony
1. `version`: symfony version bu default : 2.3

Dependencies
------------

- virhi.mysql
- virhi.apache
- virhi.mysql

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - virhi.symfony
      vars:
        symfony:
            project_name: myproject
            version: 2.3

License
-------

MIT

Author Information
------------------

http://github.com/virhi
