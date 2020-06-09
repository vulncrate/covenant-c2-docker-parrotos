# Parrot OS Docker Image with Covenant C2
Custom Docker image of Parrot OS with .NET Core installed and configured. Pulls image of Covenant C2 and configures it locally.

## Pulling the Container
docker pull vulncrate/parrotos-covenant

## Running the Container
This command will run the container. Use ${PWD} for PowerShell and $(pwd) for Bash.

docker run -it -p 7443:7443 -p 80:80 -p 443:443 --name parrotos-covenant -v ${PWD}:/app/Data vulncrate/parrotos-covenant

Note: you can swap out "-it" or add in "--rm" to auto remove when exiting... or "-d" for running in a detached state...

## Building Containers
docker build -t vulncrate/parrotos-covenant .


## Pull Requests
I'm open to pull requests if they fix or contribute to listed bugs and enhancements. Otherwise dm me first if you'd like to make a change or contribute. @mrjamiebowman