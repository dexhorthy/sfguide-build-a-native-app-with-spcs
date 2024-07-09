
-- 1.1 create naspcs_user

use role accountadmin;

create user if not exists naspcs_user
    default_role = naspcs_role
    default_warehouse = wh_nap;
grant role naspcs_role to user naspcs_user;

alter user naspcs_user set password = -- finish me, or set password however you prefer
;


-- 1.2 test nascps_user w/ a docker push

-- $ docker login $SNOWFLAKE_REPO --username naspcs_user
-- $ make all

show images in image repository spcs_app.napp.img_repo;

-- 1.3 (optional) test file upload and patch version creation
-- you can also test app/src upload and other bits from your local with snowsql
-- but we'll leave that as an optional exercise

-- 2.1 create nac_user

create user if not exists nac_user
    default_role = nac
    default_warehouse = wh_nac;
grant role nac to user nac_user;

alter user nac_user set password = -- finish me, or set password however you prefer
;


-- 2.2 test nac user

use role nac;
call spcs_app_instance.app_public.app_url();

-- log into your app url w/ nac_user and the password you set


-- 3.1 Configure GitHub Actions Credentials

-- 4.1 Make a local change
-- 4.2 commit, push, and merge to main branch
-- 4.3 Wait for GitHub Actions to complete

-- 5.1 Validate the deployed change

-- 6.1 Teardown

use role ACCOUNTADMIN;
drop user if exists naspcs_user;
drop user if exists nac_user;