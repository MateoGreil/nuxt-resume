FROM node:17-buster

# installe un simple serveur http pour servir un contenu statique
# RUN npm install -g http-server

# définit le dossier 'app' comme dossier de travail
WORKDIR /app

# copie 'package.json' et 'package-lock.json' (si disponible)
COPY package*.json ./

# installe les dépendances du projet
RUN npm install
RUN npm run build

# copie les fichiers et dossiers du projet dans le dossier de travail (par exemple : le dossier 'app')
COPY . .

# construit l'app pour la production en la minifiant
# RUN npm run build

EXPOSE 3000
CMD [ "npm", "run", "dev" ]
