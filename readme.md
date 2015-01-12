# Rails Website Template

A template for creating rails websites that includes the following:

* User System (Devise)
* Twitter Bootstrap + Flatstrap + Font Awesome
* Basic Blog
* Admin Panel
* SummerNote editor
* Image upload/File System
* Translation (pt-BR, EN)
* Contact System
* Maintaince Mode
* Email System (PaperClip + Mandrill)
* Subscription form with Mailchimp integration
* Google Analytics
* Tests

## Installation and Configurations

1. Clone the project: ```https://github.com/jamesperet/rails_website_template.git```
2. Create a *postgres* databases for **development** and **test** enviorments.
3. Configure the databases in ```config/database.yml```
4. Run  ```rake db:migrate```
5. Run  ```rake bootstrap:all``` to configure the website and create a admin user
6. Create the file ```config/application.yml``` with all **env variables**
7. Set the Google Analytics Tracking code in the file ```app/assets/javascript/google_analytics.js.coffe```
8. Start the server: ```rails server -p 3000```
9. Login as ```admin@website.com``` with the password ```12345678```

## Deploy to Heroku

1. Create a new heroku app: ```heroku create new-app-name```
2. Run ```figaro heroku:set -e production``` to copy env variables from ```config/application.yml```  and set them in heroku
3. Add the heroku *postgre* addon:  ```heroku addons:add heroku-postgresql``` to create and configure a *postgres* database in heroku server
4. Add the heroku *Redis to Go* addon: ```heroku addons:add redistogo```
5. Push to heroku:  ```git push heroku master``` to deploy the repo
6. Migrate the database: ```heroku run rake db:migrate```
7. Create the initial config and admin user: ```heroku run rake bootstrap:all```
8. Add your website URL to the [Mixpanel Partner program](https://mixpanel.com/free/) to earn 200,000 data points every month plus 25,000 people profiles.

## Env Variables

```yml
	AWS_ACCESS_KEY_ID:
	AWS_SECRET_ACCESS_KEY: 
	AWS_S3_BUCKET:
	AWS_S3_BUCKET_REGION:
	HEROKU_APP_URL: 
	MANDRILL_USERNAME: 
	MANDRILL_KEY: 
	DOMAIN_NAME: 
	SERVER_EMAIL: 
	DEVISE_SECRET_KEY: 
	SECRET_KEY_BASE: 
	MAILCHIMP_KEY: 
	MAILCHIMP_LIST_ID:
	REDISTOGO_URL:
```

## Todo's

* Log
* Background processing (redis)
* Search System
* geo location/maps
* Help
* new admin email 
* Invite user/admin
* admin panel tour
* rewrite readme file
* Heroku Deploy button
* Wiki/Codex
* Portfolio
* Store
* Inventory
* Module Controller

## BUGS

* page titles!

## Example Websites

- [Rails Website Template Example](http://rails-website-template.herokuapp.com/)
- [Velvet Design](http://www.velvetdesign.com.br)


