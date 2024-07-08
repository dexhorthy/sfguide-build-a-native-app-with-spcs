
-- 1.1 create naspcs_user

use role accountadmin;

create user naspcs_user
    default_role = naspcs_role
    default_warehouse = wh_nap;
grant role naspcs_role to user naspcs_user;

alter user naspcs_user set password = -- finish me, or set password however you prefer
;


-- 1.2 test nascps_user w/ a docker push

-- $ docker login $SNOWFLAKE_REPO --username naspcs_user
-- $ make all

-- 1.3 (optional) test file upload and patch version creation
-- you can also test app/src upload and other bits from your local with snowsql
-- but we'll leave that as an optional exercise

-- 2.1 create nac_user

create user nac_user
    default_role = nac
    default_warehouse = wh_nac;
grant role nac to user nac_user;

alter user nac_user set password = -- finish me, or set password however you prefer
;


-- 2.2 test nac user

use role nac;
call spcs_app_instance.app_public.app_url();

-- log into your app url w/ nac_user and the password you set
