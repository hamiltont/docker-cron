# Docker-Cron

Use [`Cron`](http://en.wikipedia.org/wiki/Cron) inside Docker. Looks for crontab at  `/cron/crontab`

**Note:** Does not use actual cron binary, as there are issues running it inside Docker.
Uses [devcron](https://bitbucket.org/dbenamy/devcron/src) instead. 

# Use

This example mounts the folder containing your crontab file. Presumably you would
put your scripts in the same file and reference them in your crontab as `/cron/myscript.sh`

    $ docker run -v /host/folder/containing/crontab:/cron -d hamiltont/docker-cron

This example mounts two folders, one with the crontab and one with the scripts. You need 
to use `/scripts/myscript.sh` in your `crontab`

    $ docker run -v /host/folder/containing/crontab:/cron -v /host/folder/scripts:/scripts -d hamiltont/docker-cron
    
  
