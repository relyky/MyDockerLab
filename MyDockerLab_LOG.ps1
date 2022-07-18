cd C:\Temp\Build
docker run --name repoDemo alpine/git clone https://github.com/relyky/MyDockerLab.git
docker cp repoDemo:/git/MyDockerLab/ .
cd .\MyDockerLab\
docker build --no-cache --force-rm -t my-cloud-dm:latest --file Release.Dockerfile .
docker run -d -p 8080:80 --name MyCloudDm my-cloud-dm:latest