## 📝 Notes
Use the flowise-railway template (https://railway.app/template/pn4G8S) if you don't need pre-configured persisted volume, postgis and private networking on Railway.

# Deploy Flowise with Railway

## ✨ Features
- Pre-configured persisted volume.
- Most of the Flowise configs are pre-configured.
- Use Postgres/Postgis as the default database for Flowise.
- The communication from Flowise to database is accomplished through the railway internal private network, reducing unnecessary egress fees.

## ✅ Prerequisite
- Postgres or Postgis was already deployed to an environment on Railway
- Flowise and Postgres have to be deployed to the same environment in order to leverage the benefits of private networking on Railway.
- `flowise` database was already created in Postgres

----

## 💁‍♂️ Usage

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/A7Dwg9?referralCode=OYCuBb)

### 🚀 Quick start

1. Click Deploy Now

2. Change to your preferred repository name

3. Click Configure and click Save Config for both services.

4. Click Deploy.

5. Let Railway deploy all the services for you.

6. Once the process is successful, you will be able to view a deployed URL.


### 💡 What if I would like to use my current Postgres/PostGIS database server?

1. Click Deploy Now

2. Change to your preferred repository name

3. **(Important)** Configure the database-related environment variables to point to your current PostGIS database.

- `DATABASE_HOST` (Private or public network database host. i.e. `postgre.railway.internal`)

- `DATABASE_NAME` (Database name. i.e. `flowise`)

- `DATABASE_PASSWORD` (Database user password)

- `DATABASE_PORT` (Database private or public network port. i.e. `5432`)

- `DATABASE_USER` (Database user - A database user that allows you CRUD the flowise database)

4. Click Deploy

5. Let Railway deploy all the services for you.

6. Once the process is successful, you will be able to view a deployed URL.

7. Delete the PostGIS database service that comes with this template if no longer needed.

## 💁‍♀️ Example screenshots

![Flowise AI login screen!](https://zyugzloemocjcxmspsso.supabase.co/storage/v1/object/public/static-assets/flowise-login-screen.png "Flowise AI login screen")


![Flowise AI version screen!](https://zyugzloemocjcxmspsso.supabase.co/storage/v1/object/public/static-assets/flowise-version-screen.png "Flowise AI version screen")

![Flowise database!](https://zyugzloemocjcxmspsso.supabase.co/storage/v1/object/public/static-assets/flowise-database.jpg "Flowise database")



-----

# Start Flowise with Docker Compose (Local development)

## 💁‍♂️ Usage

1. Create `.env` file and specify the `PORT` (refer to `.env.example`)
2. `docker-compose up -d`
3. Open [http://localhost:3000](http://localhost:3000)
4. You can bring the containers down by `docker-compose stop`

## 🔒 Authentication

1. Create `.env` file and specify the `PORT`, `FLOWISE_USERNAME`, and `FLOWISE_PASSWORD` (refer to `.env.example`)
2. Pass `FLOWISE_USERNAME` and `FLOWISE_PASSWORD` to the `docker-compose.yml` file:
    ```
    environment:
        - PORT=${PORT}
        - FLOWISE_USERNAME=${FLOWISE_USERNAME}
        - FLOWISE_PASSWORD=${FLOWISE_PASSWORD}
    ```
3. `docker-compose up -d`
4. Open [http://localhost:3000](http://localhost:3000)
5. You can bring the containers down by `docker-compose stop`

## 🌱 Env Variables

If you like to persist your data (flows, logs, apikeys, credentials), set these variables in the `.env` file inside `docker` folder:

-   DATABASE_PATH=/root/.flowise
-   APIKEY_PATH=/root/.flowise
-   LOG_PATH=/root/.flowise/logs
-   SECRETKEY_PATH=/root/.flowise

Flowise also support different environment variables to configure your instance. Read [more](https://docs.flowiseai.com/environment-variables)



## Credit

- Inspired from [https://railway.app/template/pn4G8S](https://railway.app/template/pn4G8S), [https://github.com/FlowiseAI/Flowise/tree/main/docker](https://github.com/FlowiseAI/Flowise/tree/main/docker) and [https://github.com/HenryHengZJ/FlowiseAI-Railway/blob/main/Dockerfile](https://github.com/HenryHengZJ/FlowiseAI-Railway/blob/main/Dockerfile)