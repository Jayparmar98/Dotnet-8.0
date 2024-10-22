FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /Hello_API

COPY . ./

RUN dotnet restore

RUN dotnet publish -c Release -o /Hello_API/bin/Release/net8.0

EXPOSE 5244

CMD ["dotnet", "run"]