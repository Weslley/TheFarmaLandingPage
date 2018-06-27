# README

docker build -t thefarmalp .
docker-compose up -d --force-recreate --build
docker run --name thefarmalp -itd -p 3000:80 fweslley/thefarmalp
#docker run --name thefarmalp -itd -p 3000:80 -v ~/dev/php:/var/www/app fweslley/thefarmalp