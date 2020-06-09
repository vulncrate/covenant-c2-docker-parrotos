FROM parrotsec/security:latest
MAINTAINER mrjamiebowman (mrjamiebowman@protonmail.com)

# setup repos
RUN wget -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget https://packages.microsoft.com/config/debian/10/prod.list
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list

# install other tools
RUN apt-get update
RUN apt-get install locate

# install .net core
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1

# setup covenant
RUN mkdir /app
WORKDIR /app
RUN git clone --recurse-submodules https://github.com/cobbr/Covenant .
RUN dotnet build

# self signed ssl

# run Covenant C2
ENTRYPOINT ["dotnet", "/app/Covenant/bin/Debug/netcoreapp3.1/Covenant.dll"]1