# Twitter in Postgres
[![](https://github.com/iamasteriix/twitter_postgres/workflows/tests_denormalized/badge.svg)](https://github.com/iamasteriix/twitter_postgres/actions?query=workflow%3Atests)
[![](https://github.com/iamasteriix/twitter_postgres/workflows/tests_normalized/badge.svg)](https://github.com/iamasteriix/twitter_postgres/actions?query=workflow%3Atests)

This is a continuation of the Twitter/MapReduce assignment that incorporates a couple of new concepts.

In this first assignment, we focus on:
1. working with postgres from python
1. inserting data into the database
1. understanding JSON/denormalized vs normalized schemas (i.e. NoSQL vs SQL)

## Tasks

1. Getting started:

    1. Fork this repo
    1. Enable Github Actions on your fork
    1. Clone the fork onto your GPU server
    1. Modify the `README.md` file so that the test case badge points to your forked repo

1. Main tasks:

    1. There are two postgres containers defined in the `docker-compose.yml` file ports:
       one contains a normalized database schema, and the other is denormalized.
       You will need to update the ports for each database so that they do not conflict with anyone else.

       > **NOTE:**
       > Recall that in the pagila assignments, there was no need to adjust the ports.
       > This is because the database was not exposed to the lambda server.
       > In this assignment, we must expose the database to the lambda server.
       > The `load_tweets.sh` and `load_tweets.py` scripts will be run from the lambda server.
       >
       > It would be possible to put these scripts "inside" the database image so we wouldn't need to expose the ports.
       > But I've put the scripts "outside" the container to give you more practice connecting to the db from a remote system.

    1. Complete the missing sections of the `load_tweets.py` file.
       This file is responsible for loading data into the normalized database.
       The schema for the normalized database is summarized as:

       <img src=twitter_schema.png />

       The arrows represent foreign keys onto the primary key of the target table.
       The foreign keys are likely to cause you many errors when inserting your data.
       These errors may be frustrating,
       but they are actually a GOOD thing (some would even say GREAT),
       because Postgres is preventing you from accidentally adding corrupted data into the database.

    1. Complete the missing sections of the `load_tweets.sh` file.
       This file will both call the `load_tweets.py` file,
       and use the SQL `COPY` command to load data into the denormalized database.

    1. Grading Note:
       There are 9 total test cases in the `sql` folder.
       If you implement the code above correctly,
       then the output of the `SELECT` commands in each test case should be the same for each database.
       Each test case is worth 1 point per database, for 18 points total.

    1. HINT:
       As you debug your insert code, you may need to delete your database.
       Calling
       ```
       $ docker-compose down
       ```
       is not enough, since the database is persisted to a volume.
       To delete the database,
       you'll need to use the
       ```
       $ docker volume ls
       $ docker volume rm VOLUME_ID
       ```
       commands to list the docker volumes and delete the appropriate volumes.
       Alternatively, you can use
       ```
       $ docker volume prune
       ```
       to delete all volumes.

1. Upload a link to your forked github repo on sakai
