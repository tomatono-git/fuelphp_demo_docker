#!/bin/bash

# users
# php oil g model users name:varchar[100] email:varchar password:varchar --mysql-timestamp
# php oil g scaffold users name:varchar[100] email:varchar[200] password:varchar[200] created_user:int updated_user:int --mysql-timestamp
php oil g scaffold users -f \
    username:varchar[50] \
    password:varchar[255] \
    group:int \
    email:varchar[255] \
    last_login:varchar[25] \
    login_hash:varchar[255] \
    profile_fields:text \
    #  --with-presenter

# migrate
# php oil refine migrate
