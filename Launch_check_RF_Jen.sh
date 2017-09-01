check_cont=$(docker container ls -a | grep res_rf)
check_dead=$(docker container ls -a | grep -i dead)

# Suppression des conteneurs dead s'ils existent
if [[ ! $check_dead == ""   ]]
then
	docker rm $(docker ps -aq -f status=dead)
fi

# Vérification qu'un processus res_rf n'existe pas 
if [[ ! $check_cont == "" ]]
then
	docker stop res_rf
	docker rm res_rf
fi

# Suppression des conteneurs dead s'ils existent
if [[ ! $check_dead == ""   ]]
then
        docker rm $(docker ps -aq -f status=dead)
fi

docker run -v /home/cloud/swarm/res_robot:/opt/robotframework/reports:Z\
           -v /home/cloud/swarm/Tests_HTTPD:/opt/robotframework/tests:Z\
           -e BROWSER=firefox ppodgorsek/robot-framework:3.0.5
docker run -d -v /home/cloud/swarm/res_robot:/usr/local/apache2/htdocs -p 8001:80 --name=res_rf httpd:2.4
