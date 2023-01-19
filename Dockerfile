FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /DockerExample

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore

FROM build AS publish
WORKDIR /DockerExample
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS build-image
WORKDIR /DockerExample
COPY --from=publish /DockerExample/out .
ENTRYPOINT ["dotnet", "DockerExample.dll"]

# run the unit tests
FROM build AS test
##ARG NAMETEST=
## set the directory to be within the unit test project
WORKDIR /DockerExample
## run the unit tests
#RUN dotnet test --logger:trx
## when you run this build target it will run the unit tests in container
CMD ["dotnet", "test", "--logger:trx"]