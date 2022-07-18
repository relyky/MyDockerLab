# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# copy csproj and restore as distinct layers
COPY *.sln .
COPY AsvtCloudDm/*.csproj ./AsvtCloudDm/
COPY MyBiz/*.csproj ./MyBiz/
RUN dotnet restore

# copy everything else and build app
COPY AsvtCloudDm/. ./AsvtCloudDm/
COPY MyBiz/. ./MyBiz/
WORKDIR /src/AsvtCloudDm
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM base AS final
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "AsvtCloudDm.dll"]