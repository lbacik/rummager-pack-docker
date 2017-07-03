# Rummager docker devstack

## steps to build whole stack

0. Clone this repository


	$ git clone ... 

1. Download sources to `src` directory:


    $ git clone https://github.com/lbacik/rummager-service.git
    $ git clone https://github.com/lbacik/rummager.git
    
Please check the information about setting up particular project within the project's README file. 

2. Build and run the `db` and `tech` containers


    $ sudo docker-compose up -d rum-mysql rum-tech

3. Create database


	$ sudo docker exec -t rum-tech createdb.sh

Please wait till mysql server will start working, error like:

	ERROR 2003 (HY000): Can't connect to MySQL server on 'rum-mysql' (111)

may indicate that mysql server is still not accessible.

4. Build and run `service` and `smtp` containers


	$ sudo docker-compose up -d rum-rumsrv rum-smtp

5. Now everything is ready to start the rummager `worker` process itself


    $ sudo docker-compose up -d rum-worker

Instead of invoking commands from points 2 to 5 manually you can run:

    $ sudo bin/setup.sh

## after setup complete


    $ sudo docker-compose up -d rum-worker

This command should always bring up all required containers (`db`, `rumsrv`, `smtp`, `worker`).

You can always recreate the database by removing existing one (if it exists) and running:

    $ sudo bin/createdb.sh