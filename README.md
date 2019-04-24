## Bookmark Manager

Makers Academy Week 4 pairing challenge: build a web app that stores bookmarks in a database.

## To set up the database

Connect to `psql` and create the `bookmark_manager` database using the `psql` command as follows:

````
CREATE DATABASE bookmark_manager;
````

To set up the appropriate tables, connect to the database in `psql` (using the command `\c bookmark_manager`) and run the SQL scripts in the `db/migrations` folder in the given order.

## To run the Bookmark Manager app

```
rackup -p 4567
```

## Learning Objectives

* Build a web app that uses a database
* Agile and TDD
* Engineering and 'Dev Recipes'
* Databases
* Tooling

## The Project

Build a bookmark manager. A bookmark manager is a website to maintain a collection of bookmarks (URLs). You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse bookmarks other users have added. You can comment on the bookmarks.

## User Stories
```
As an organised person
So that I can quickly navigate to websites I frequently visit
I would like to see a list of bookmarks
```

## Domain Model

When the user visits the '/' path, they are presented with the text 'Bookmark Manager' and a button/link titled 'See Bookmarks'. When they click on this button, their browser sends a request to a controller (app.rb)

When the controller gets the request, it asks the Bookmark class to give it all the bookmarks, i.e. the controller asks for Bookmark.all.

The Bookmark class goes and gets the bookmarks, and gives back all the bookmarks in an array to the controller.

The controller renders the array of bookmarks to a webpage, which it sends as a response to the user.

Image:
