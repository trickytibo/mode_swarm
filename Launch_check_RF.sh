check_cont=$(docker container ls -a | grep res_rf | grep -v Dead)
if [[ ! $check_cont == "" ]]
then
	docker stop res_rf
	docker rm res_rf
fi

docker run -v $(pwd)/res_robot:/opt/robotframework/reports:Z\
           -v $(pwd)/Tests_HTTPD:/opt/robotframework/tests:Z\
           -e BROWSER=firefox ppodgorsek/robot-framework:3.0.5 
docker run -d -v $(pwd)/res_robot:/usr/local/apache2/htdocs -p 8001:80 --name=res_rf httpd:2.4
