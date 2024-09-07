# README

## Recap

1. Mise en place d’une base de code sur ton Github : API avec Ruby on Rails
et front Vue.js (monorepo ou repos séparés) ✅
2. Connexion

	a. Mise en place d’une authentification pour interagir avec l’api Rails ✅

	b. Mise en place d’un formulaire de connexion ✅

3. CRUD des articles

	a. Endpoint de création d’un article (titre, images et texte) ✅

	b. Endpoint de modification d’un article ✅

	c. Endpoint de suppression d’un article ✅

	d. Endpoint liste articles ✅

	e. Endpoint show d’un article ✅

4. Frontend

	a. Utilisation de TailwindCSS ✅

	b. Création d’un article via un formulaire WYSIWYG ✅

	c. Formulaire de modification ✅

	d. Bouton de suppression ✅

	e. Affichage de la liste de tous les articles sous forme de grille ✅

	f. Affichage d’un article en particulier ✅

5. Devops : l’environnement de développement local se fera uniquement via
Docker

	a. API ❌

	b. App frontend ✅

	c. BDD ✅

## Routes disponibles (frontend)

"/" => racine du site avec listing de tout les posts avec les fonctions d'edit et de suppression lorsque l'on est loggé. Pour revenir à la racine il suffit de cliquer sur "Alex's blog" dans le header en haut de l'écran.

/post/:id' => show d'un article

/signup => formulaire d'enregistrement d'un user. Redirection à la racine si l'enregistrement à réussi.

/signin' => formulaire de connexion d'un user. Redirection à la racine si la connexion à réussi, autrement message d'erreur. "There is a password error".

/create-blog => formulaire de creation d'article. Fonctionnel uniquement si l'utilisateur est loggé.

/edit/:id => formulaire d'edition d'article, pareil fonctionnel uniquement si l'utilisateur est loggé.

## installation

J'ai réussi à dockeriser uniquement le front et la bdd, pour rails il y a eu une erreur qui m'empêche d'avancer.

```
cd blog
docker-compose up // running vue.js + vite + postgresql
```

Dans un autre onglet de terminal pour lancer l'api :
```
rails db:create
rails db:migrate
rails db:seed
rails s
```


## Remarques

Les fonctionnalités api et bouton sur le front ne sont fonctionnel que si l'utilisateur est loggé, pour cela il suffit de s'enregistrer.



