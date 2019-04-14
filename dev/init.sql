select 1;

CREATE USER cap WITH PASSWORD 'cap';
CREATE USER capcollator WITH PASSWORD 'capcollator';
CREATE USER feedfacade WITH PASSWORD 'feedFacade';

DROP DATABASE if exists capcollatordev;
CREATE DATABASE capcollatordev;
GRANT ALL PRIVILEGES ON DATABASE capcollatordev to capcollator;
GRANT ALL PRIVILEGES ON DATABASE capcollatordev to cap;

DROP DATABASE if exists capcollatortest;
CREATE DATABASE capcollatortest;
GRANT ALL PRIVILEGES ON DATABASE capcollatortest to capcollator;
GRANT ALL PRIVILEGES ON DATABASE capcollatortest to cap;

DROP DATABASE if exists feedfacadedev;
CREATE DATABASE feedfacadedev;
GRANT ALL PRIVILEGES ON DATABASE feedfacadedev to feedfacade;
GRANT ALL PRIVILEGES ON DATABASE feedfacadedev to cap;

DROP DATABASE if exists feedfacadetest;
CREATE DATABASE feedfacadetest;
GRANT ALL PRIVILEGES ON DATABASE feedfacadetest to feedfacade;
GRANT ALL PRIVILEGES ON DATABASE feedfacadetest to cap;
